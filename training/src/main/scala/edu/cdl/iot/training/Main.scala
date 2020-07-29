package edu.cdl.iot.training

import java.util.UUID

import com.google.protobuf.ByteString
import edu.cdl.iot.protocol.Model.Model
import org.apache.spark.SparkConf
import org.apache.spark.ml.{Pipeline, PipelineStage}
import org.apache.spark.ml.classification.RandomForestClassifier
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator
import org.apache.spark.ml.feature.{StringIndexer, VectorAssembler}
import org.apache.spark.sql.{Encoders, SaveMode, SparkSession}
import org.apache.spark.sql.functions.{to_timestamp, _}
import org.apache.spark.sql.types.DoubleType
import org.jpmml.sparkml.PMMLBuilder


case class ModelDto(
                     key: String,
                     model: Array[Byte]
                   )

case class OperableDataRDD(
                            key: String,
                            sensor_id: String,
                            start: String,
                            end: String
                          )

object Main {

  def env_var(name: String, defaultValue: String): String =
    if (sys.env.contains(name)) sys.env(name)
    else defaultValue

  def main(args: Array[String]): Unit = {

    val conf = new SparkConf()
      .setAppName("baselineModel")
      .set("spark.cassandra.connection.host", env_var("CASSANDRA_HOST", "127.0.0.1"))
      .set("spark.cassandra.auth.username", "cassandra")
      .set("spark.cassandra.auth.password", "cassandra")
      .setMaster("local[2]")
    val spark = SparkSession.builder.config(conf).getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")

    val data = spark
      .read
      .format("org.apache.spark.sql.cassandra")
      .options(Map("table" -> "sensor_data", "keyspace" -> "iot_prototype_training"))
      .load()
      .map(d => {
        val sensorId = d(3).toString
        val timestamp = d(4).toString
        val m = d(1).asInstanceOf[Map[String, String]]
        (
          UUID.randomUUID().toString,
          sensorId,
          timestamp,
          m("temperature").toDouble,
          m("pressure").toDouble,
          m("wind").toDouble
        )

      })(Encoders.product[(String, String, String, Double, Double, Double)])
      .toDF(Seq("guid", "sensor_id", "timestamp", "temperature", "pressure", "wind"): _ *)


    val time = spark
      .read
      .format("org.apache.spark.sql.cassandra")
      .options(Map("table" -> "in_operable_entry", "keyspace" -> "iot_prototype_training"))
      .load()
    (Encoders.product[OperableDataRDD])


    data.show(5)
    time.show(5)


    // compare time intervals
    val transformed = data
      .withColumn("end_hour", col("timestamp") + expr("INTERVAL 30 minutes"))
      .join(time,
        col("end_hour") > time("start")
          && col("end_hour") < time("end"),
        "left"
      )
      .withColumn("operable", when(isnull(col("start")), 1).otherwise(0))

    // Interesting data (this will train the model to flag entries over 70 degrees in temp - For DEMO)
    //    val transformed = data
    //      .withColumn("end_hour", col("timestamp") + expr("INTERVAL 30 minutes"))
    //      .withColumn("operable", when(col("temperature") > 70, 0).otherwise(1))


    val transformedDataSet = transformed
      .sort("timestamp")
      .withColumn("temperature", col("temperature").cast(DoubleType))
      .withColumn("pressure", col("pressure").cast(DoubleType))
      .withColumn("wind", col("wind").cast(DoubleType))
      .drop("start")
      .drop("end")

    val operable = transformedDataSet.filter(col("operable") === 1)
    val inoperable = transformedDataSet.filter(col("operable") === 0)

    println("Data set")
    transformedDataSet.show(5)

    println("Operable")
    operable.show(10)
    println("Inoperable")
    inoperable.show(10)

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

    import spark.implicits._
    val export = ModelDto(
      UUID.randomUUID.toString,
      new PMMLBuilder(schema, model).buildByteArray()
    )

    println(s"Exporting Model - UUID: '${`export`.key}'")
    Seq(
      export,
      ModelDto("__latest__", export.model)
    )
      .toDS
      .write
      .format("org.apache.spark.sql.cassandra")
      .options(
        Map(
          "keyspace" -> "iot_prototype_training",
          "table" -> "models")
      )
      .mode(SaveMode.Append)
      .save

    actions.Pulsar.sendModel(env_var("PULSAR_HOST", "127.0.0.1"), Model(export.key, ByteString.copyFrom(export.model)))
  }
}