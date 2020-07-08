package baseline
import org.apache.spark.SparkConf
import org.apache.spark.ml.classification.RandomForestClassifier
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator
import org.apache.spark.ml.feature.{StringIndexer, VectorAssembler}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{DoubleType, IntegerType}



object baseline_model {
    def main(args: Array[String]): Unit = {

      //println("Start here")

      val conf = new SparkConf().setAppName("baselineModel").setMaster("local[2]")
      val spark = SparkSession.builder.config(conf).getOrCreate()

      // CHANGE TO YOUR PATH HERE
      val file_path = "/Users/nancy/Desktop/iot/operable.csv"
      var data = spark.read.format("CSV").option("header","true").load(file_path)
      data.show(5)
      // extract hour from timestamp
      data = data.select(col("*"), substring(col("timestamp"), 9, 2).as("hour"))
      data = data.withColumn("hour", data("hour").cast(IntegerType))

      data = data.withColumn("temperature", data("temperature").cast(DoubleType))
      data = data.withColumn("pressure", data("pressure").cast(DoubleType))
      data = data.withColumn("wind", data("wind").cast(DoubleType))

      val ts = to_timestamp(col("timestamp"), "M/dd/yy HH:mm")
      data = data.withColumn("timestamp", ts).sort("timestamp")

      data.show(100)

      // select features
      val assembler = new VectorAssembler()
        .setInputCols(Array("hour","temperature","pressure","wind"))
        .setOutputCol("features")

      val df1 = assembler.setHandleInvalid("skip").transform(data)

      val labelIndexer = new StringIndexer().setInputCol("operable").setOutputCol("label")
      val df2 = labelIndexer.fit(df1).transform(df1)

//      val output = assembler.transform(data)
//      println("Assembled columns 'hour','timestamp', 'temperature', 'pressure' ,'wind' to vector column 'features'")
//      output.select("features", "operable").show(false)
//      output.select("*")

      // split train and test data
      val cnt = df2.count
      val testSize = (0.2 * cnt).toInt
      val trainSize = (cnt - testSize).toInt

      val trainDf = df2.sort(monotonically_increasing_id).limit(trainSize)
      val testDf = df2.sort(monotonically_increasing_id.desc).limit(testSize)

      val classifier = new RandomForestClassifier()
        .setImpurity("gini")
        .setMaxDepth(3)
        .setNumTrees(20)
        .setFeatureSubsetStrategy("auto")
        .setSeed(813)
      //println("Training!")
      val model = classifier.fit(trainDf)
      val predictions = model.transform(testDf)
      predictions.select("sensor_id", "label", "prediction").show(5)

      val evaluator = new MulticlassClassificationEvaluator()
        .setLabelCol("label")
        .setPredictionCol("prediction")
        .setMetricName("accuracy")
      val accuracy = evaluator.evaluate(predictions)
      //println("Test Accuracy = " + accuracy)
      //println("Finish!")
    }

}
