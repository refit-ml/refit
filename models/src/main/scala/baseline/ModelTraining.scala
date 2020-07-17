package baseline

package baseline

import java.io.File

import javax.xml.transform.stream.StreamResult
import org.apache.spark.SparkConf
import org.apache.spark.ml.{Pipeline, PipelineStage}
import org.apache.spark.ml.classification.RandomForestClassifier
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator
import org.apache.spark.ml.feature.{StringIndexer, Tokenizer, VectorAssembler}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{to_timestamp, _}
import org.apache.spark.sql.types.{BooleanType, DoubleType, IntegerType, LongType, StringType, StructField, StructType}
import org.jpmml.model.JAXBUtil
import org.jpmml.sparkml.PMMLBuilder

import scala.collection.immutable.HashMap
import scala.util.control.Breaks._


object ModelTraining {


  def main(args: Array[String]): Unit = {

    //println("Start here")

    val conf = new SparkConf().setAppName("baselineModel").setMaster("local[2]")
    val spark = SparkSession.builder.config(conf).getOrCreate()
    spark.sql("set spark.sql.legacy.timeParserPolicy=LEGACY")
    //    val struct =
    //      StructType(
    //        StructField("sensor_id", IntegerType, true) ::
    //          StructField("timestamp", StringType, false) ::
    //          StructField("temperature", DoubleType, false) ::
    //          StructField("pressure", DoubleType, false) ::
    //          StructField("wind", DoubleType, false) ::
    //          StructField("operable", BooleanType, false) ::Nil)
    //          StructField("operable", BooleanType, false) ::Nil)

    // CHANGE TO YOUR PATH HERE
    val file_path = s"${System.getProperty("user.dir")}/operable.csv"
    var data = spark.read.format("CSV").option("header", "true").load(file_path)
    data.show(5)
    // extract hour from timestamp
    data = data.select(col("*"), substring(col("timestamp"), 9, 2).as("hour"))
    data = data.withColumn("hour", data("hour").cast(IntegerType))

    data = data.withColumn("temperature", data("temperature").cast(DoubleType))
    data = data.withColumn("pressure", data("pressure").cast(DoubleType))
    data = data.withColumn("wind", data("wind").cast(DoubleType))
    // sanity check
    data = data.withColumn("operable", when(col("temperature") >= 80, 1).otherwise(0))

    val ts = to_timestamp(col("timestamp"), "M/dd/yy HH:mm")
    data = data.withColumn("timestamp", ts).sort("timestamp")


    //data.show(100)

    // select features
    val assembler = new VectorAssembler()
      .setInputCols(Array("hour", "temperature", "pressure", "wind"))
      .setOutputCol("features")
      .setHandleInvalid("skip")

    //    val df1 = assembler.setHandleInvalid("skip").transform(data)
    val labelIndexer = new StringIndexer().setInputCol("operable").setOutputCol("label")


    //    val df2 = labelIndexer.fit(df1).transform(df1)

    //      val output = assembler.transform(data)
    //      println("Assembled columns 'hour','timestamp', 'temperature', 'pressure' ,'wind' to vector column 'features'")
    //      output.select("features", "operable").show(false)
    //      output.select("*")

    // split train and test data
    val cnt = data.count
    val testSize = (0.2 * cnt).toInt
    val trainSize = (cnt - testSize).toInt

    val trainDf = data.sort(monotonically_increasing_id).limit(trainSize)
    val testDf = data.sort(monotonically_increasing_id.desc).limit(testSize)

    val classifier = new RandomForestClassifier()
      .setImpurity("gini")
      .setMaxDepth(3)
      .setNumTrees(20)
      .setFeatureSubsetStrategy("auto")
      .setSeed(813)
    //println("Training!")
    val pipeline = new Pipeline().setStages(Array[PipelineStage](labelIndexer, assembler, classifier))
    val model = pipeline.fit(trainDf)
    //    val model = classifier.fit(trainDf)

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


    val schema = data.schema


    val builder = new PMMLBuilder(schema, model).buildFile(new File(s"${System.getProperty("user.dir")}/model.pmml"))
  }


}
