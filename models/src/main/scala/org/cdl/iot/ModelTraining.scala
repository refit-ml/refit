package org.cdl.iot

import java.io.File
import org.apache.spark.SparkConf
import org.apache.spark.ml.{Pipeline, PipelineStage}
import org.apache.spark.ml.classification.RandomForestClassifier
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator
import org.apache.spark.ml.feature.{StringIndexer, VectorAssembler}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{to_timestamp, _}
import org.apache.spark.sql.types.{DoubleType}
import org.jpmml.sparkml.PMMLBuilder


object ModelTraining {


  def main(args: Array[String]): Unit = {

    val conf = new SparkConf()
      .setAppName("baselineModel")
      .set("spark.cassandra.connection.host", "127.0.0.1")
      .set("spark.cassandra.auth.username", "cassandra")
      .set("spark.cassandra.auth.password", "cassandra")
      .setMaster("local[2]")
    val spark = SparkSession.builder.config(conf).getOrCreate()
    spark.sparkContext.setLogLevel("ERROR")

    val file_path = s"${System.getProperty("user.dir")}/data/operable.csv"
    val time_path = s"${System.getProperty("user.dir")}/data/time.csv"


    var data = spark.read.format("CSV").option("header", "true").load(file_path)
    var time = spark.read.format("CSV").option("header", "true").load(time_path)


    val ts = to_timestamp(col("timestamp"), "M/dd/yy HH:mm")
    data = data.withColumn("timestamp", ts).sort("timestamp")
    val time_from = to_timestamp(col("from"), "M/dd/yy HH:mm")
    val time_to = to_timestamp(col("to"), "M/dd/yy HH:mm")
    time = time.withColumn("from", time_from).sort("from")
    time = time.withColumn("to", time_to)

    // compare time intervals
    val transformed = data
      .withColumn("end_hour", col("timestamp") + expr("INTERVAL 30 minutes"))
      .join(time,
        col("end_hour") > time("from")
          && col("end_hour") < time("to"),
        "left"
      )


    val operableEntries = transformed.filter(isnull(col("from")) && isnull(col("to"))).withColumn("operable", lit(0))
    val ineropableEntries = transformed.filter(not(isnull(col("from")) && isnull(col("to")))).withColumn("operable", lit(1))
    var transformedDataSet = operableEntries.union(ineropableEntries)
    transformedDataSet.sort("timestamp")


    transformedDataSet = transformedDataSet.withColumn("temperature", transformedDataSet("temperature").cast(DoubleType))
    transformedDataSet = transformedDataSet.withColumn("pressure", transformedDataSet("pressure").cast(DoubleType))
    transformedDataSet = transformedDataSet.withColumn("wind", transformedDataSet("wind").cast(DoubleType))
    transformedDataSet = transformedDataSet.drop("from")
    transformedDataSet = transformedDataSet.drop("to")

    // select features
    val assembler = new VectorAssembler()
      .setInputCols(Array("temperature", "pressure", "wind"))
      .setOutputCol("features")
      .setHandleInvalid("skip")

    val labelIndexer = new StringIndexer().setInputCol("operable").setOutputCol("label")


    // split train and test data
    val cnt = transformedDataSet.count
    val testSize = (0.2 * cnt).toInt
    val trainSize = (cnt - testSize).toInt

    val trainDf = transformedDataSet.sort(monotonically_increasing_id).limit(trainSize)
    val testDf = transformedDataSet.sort(monotonically_increasing_id.desc).limit(testSize)

    val classifier = new RandomForestClassifier()
      .setImpurity("gini")
      .setMaxDepth(3)
      .setNumTrees(20)
      .setFeatureSubsetStrategy("auto")
      .setSeed(813)

    val pipeline = new Pipeline().setStages(Array[PipelineStage](labelIndexer, assembler, classifier))
    val model = pipeline.fit(trainDf)

    val predictions = model.transform(testDf)
    predictions.select("sensor_id", "label", "prediction").show(5)

    val evaluator = new MulticlassClassificationEvaluator()
      .setLabelCol("label")
      .setPredictionCol("prediction")
      .setMetricName("accuracy")
    val accuracy = evaluator.evaluate(predictions)
    val evaluator2 = new MulticlassClassificationEvaluator()
      .setLabelCol("label")
      .setPredictionCol("prediction")
      .setMetricName("f1")

    val f1 = evaluator2.evaluate(predictions)
    println("F1 score = " + f1)
    println("Test Accuracy = " + accuracy)

    val schema = transformedDataSet.schema
    new PMMLBuilder(schema, model).buildFile(new File(s"${System.getProperty("user.dir")}/model.pmml"))
  }


}
