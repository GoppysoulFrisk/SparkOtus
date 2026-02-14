name := "SparkOtusProducer"

ThisBuild / organization := "ru.otus.spark"
ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.12"

lazy val sparkVersion = "3.5.7"
lazy val circeVersion = "0.14.9"
lazy val kafkaVersion = "3.9.1"

ThisBuild / libraryDependencies ++= Seq(
  "com.typesafe" % "config" % "1.4.2",
  "org.apache.spark" %% "spark-core"    % sparkVersion % "provided",
  "org.apache.spark" %% "spark-sql"     % sparkVersion % "provided",
  "org.apache.spark" % "spark-sql-kafka-0-10_2.12" % sparkVersion % "provided",
  // "org.apache.kafka" % "kafka-clients" % kafkaVersion,
  // "io.circe"         %% "circe-core"    % circeVersion,
  // "io.circe"         %% "circe-generic" % circeVersion,
  // "io.circe"         %% "circe-parser"  % circeVersion
)

Compile / mainClass := Some("ru.otus.spark.KafkaBooksProducer")

javaOptions += "-Dhadoop.security.authentication=none"