package baseline

import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{to_timestamp, _}
import org.apache.spark.sql.types.{DoubleType, IntegerType}

import scala.collection.immutable.HashMap
import scala.util.control.Breaks._


object baseline_model {


  def main(args: Array[String]): Unit = {

    //println("Start here")

    val conf = new SparkConf().setAppName("baselineModel").setMaster("local[2]")
    val spark = SparkSession.builder.config(conf).getOrCreate()
    spark.sparkContext.setLogLevel("ERROR")

    // CHANGE TO YOUR PATH HERE
    val file_path = s"${System.getProperty("user.dir")}/operable.csv"
    val time_path = s"${System.getProperty("user.dir")}/time.csv"

    var data = spark.read.format("CSV").option("header", "true").load(file_path)
    var time = spark.read.format("CSV").option("header", "true").load(time_path)
    data.show(5)
    time.show()
    val count_data = (data.count).toInt
    val count_time = (time.count).toInt

    // extract hour from timestamp
    data = data.select(col("*"), substring(col("timestamp"), 9, 2).as("hour"))
    data = data.withColumn("hour", data("hour").cast(IntegerType))

    val ts = to_timestamp(col("timestamp"), "M/dd/yy HH:mm")
    data = data.withColumn("timestamp", ts).sort("timestamp")
    val time_from = to_timestamp(col("from"), "M/dd/yy HH:mm")
    val time_to = to_timestamp(col("to"), "M/dd/yy HH:mm")
    time = time.withColumn("from", time_from).sort("from")
    time = time.withColumn("to", time_to)

    val transformed = data
      .withColumn("end_hour", col("timestamp") + expr("INTERVAL 30 minutes"))
      .join(time,
        col("end_hour") > time("from")
          && col("end_hour") < time("to"),
        "left"
      )

    // This is an example of showing the operable data set
    transformed.filter(isnull(col("from")) && isnull(col("to"))).show(20)
    // this is an example of showing the ineropable data set
    transformed.filter(not(isnull(col("from")) && isnull(col("to")))).show(20)
    return


    val dataIndex = data.rdd.zipWithIndex
    val dataindexKey = dataIndex.map { case (k, v) => (v, k) }
    val timeIndex = time.rdd.zipWithIndex
    val timeindexKey = timeIndex.map { case (k, v) => (v, k) }






    //    val operableEntries = data.filter(/* Filter to see if they are in the oerable-1 */).map( /* Add operable flag */)
    //    val ineropableEntries = data.filter(/* filter to see if they are in the operable-o */).map(/* Add operable flag */)
    //
    //    val transformedDataSet = operableEntries.union(ineropableEntries)

    for (i <- 1 to 2) {
      for (j <- 1 to count_time - 1) {
        breakable {
          var d_from = (dataindexKey.lookup(i)) (0).getTimestamp(2)
          var d_to = (dataindexKey.lookup(i)) (0).getTimestamp(7)
          var t_from = (timeindexKey.lookup(j)) (0).getTimestamp(0)
          var t_to = (timeindexKey.lookup(j)) (0).getTimestamp(1)
          var flag = (dataindexKey.lookup(i)) (0).get(8)

          //var flag = data.rdd.take(i).last.getInt(8)
          //            if (d_from.after(t_from) && d_to.before(t_to)) {
          //              data.rdd.take(i).last.apply()
          //              break
          //            }
          //            if (d_from.before(t_from) && d_to.before(t_to)) {
          //              data.rdd.take(i).indexOf(7) = 1
          //              break
          //            }
          //data = data.withColumn("operable", when((col("timestamp") > t_from && col("end_hour")<t_to)
          //|| (col("timestamp")<t_from && col("end_hour")<t_to),1))
          if (d_to.before(t_from)) {
            //var sub = Seq(dataindexKey.lookup(i))(0).toDF()
          }
        }
      }
    }

    data = data.withColumn("temperature", data("temperature").cast(DoubleType))
    data = data.withColumn("pressure", data("pressure").cast(DoubleType))
    data = data.withColumn("wind", data("wind").cast(DoubleType))
    // sanity check
    //data = data.withColumn("operable",when(col("temperature")>= 80, 1).otherwise(0))

    data.show(20)

    // select features
    /*val assembler = new VectorAssembler()
      .setInputCols(Array("hour","temperature","pressure","wind"))
      .setOutputCol("features")

    val df1 = assembler.setHandleInvalid("skip").transform(data)

    val labelIndexer = new StringIndexer().setInputCol("operable").setOutputCol("label")
    val df2 = labelIndexer.fit(df1).transform(df1)*/

    //      val output = assembler.transform(data)
    //      println("Assembled columns 'hour','timestamp', 'temperature', 'pressure' ,'wind' to vector column 'features'")
    //      output.select("features", "operable").show(false)
    //      output.select("*")

    // split train and test data
    /*val cnt = df2.count
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
    val evaluator2 = new MulticlassClassificationEvaluator()
      .setLabelCol("label")
      .setPredictionCol("prediction")
      .setMetricName("f1")
    val f1 = evaluator2.evaluate(predictions)
    println("F1 score = " + f1)
    println("Test Accuracy = " + accuracy)*/
    //println("Finish!")
  }

}
