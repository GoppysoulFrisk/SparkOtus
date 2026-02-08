import org.apache.log4j.{Level, Logger}
import org.apache.spark._

object Main extends App {
val conf = new SparkConf().setAppName("RDD").setMaster("local[*]").set("spark.log.level", "WARN")
val sc = new SparkContext(conf)

val tripRaw = sc.textFile("lesson-10/src/main/resources/tripdata.csv")
val taxiRaw = sc.textFile("lesson-10/src/main/resources/taxi_zone_lookup.csv")

val tripHeader = tripRaw.first()
val taxiHeader = taxiRaw.first()

val trip = tripRaw.filter(_ != tripHeader)
val taxi = taxiRaw.filter(_ != taxiHeader)

val tripParsed = trip.map { line =>
  val arr = line.split(",")
  val hour = arr(1).substring(11,13).toInt
  val puLocationId = arr(7).toInt
  (puLocationId, hour)
}

val taxiParsed = taxi.map { line =>
  val arr = line.split(",")
  (arr(0).toInt, arr(1))
}

val joined = tripParsed.join(taxiParsed)

val ordersByBoroughHour = joined
  .map { case (_, (hour, borough)) => ((borough, hour), 1) }
  .reduceByKey(_ + _)

val result = ordersByBoroughHour.map {
  case ((borough, hour), count) => s"$borough,$hour,$count"
}

// сохраняем
result.saveAsTextFile("lesson-10/src/main/resources/output/orders_by_borough_hour")

  sc.stop()
}
