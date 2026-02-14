import org.apache.log4j.{Level, Logger}
import org.apache.spark._
import org.apache.spark.sql._
import org.apache.spark.sql.types.{IntegerType, DoubleType, StringType, StructField, StructType}
import org.apache.spark.sql.functions._

object Main extends App {

val spark = SparkSession
                .builder()
                .appName("KafkaCsvProducer")
                .getOrCreate()

  spark.sparkContext.setLogLevel("WARN")
  import spark.implicits._

  val schema = StructType(List(
    StructField("Name", StringType, nullable = true),
    StructField("Author", StringType, nullable = true),
    StructField("UserRating", DoubleType, nullable = true),
    StructField("Reviews", IntegerType, nullable = true),
    StructField("Price", DoubleType, nullable = true),
    StructField("Year", IntegerType, nullable = true),
    StructField("Genre", StringType, nullable = true)
  ))
  val inputPath = "/opt/spark-data/input"
  val kafkaBootstrap = "kafka:9092"
  val topic = "books"

  val lines = spark.readStream
    .format("csv")
    .option("header", "true")
    .schema(schema)
    .load(inputPath)

  val kafkaDf = lines
    .withColumn("value", to_json(struct(lines.columns.map(col): _*))) 
    .selectExpr("CAST(null AS STRING) as key", "CAST(value AS STRING)")

  val query = kafkaDf.writeStream
    .format("kafka")
    .option("kafka.bootstrap.servers", kafkaBootstrap)
    .option("topic", topic)
    .option("checkpointLocation", "/opt/spark-data/checkpoint/producer")
    .start()

  query.awaitTermination()
}
