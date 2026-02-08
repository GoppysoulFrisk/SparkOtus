name := "SparkOtus"

ThisBuild / organization := "ru.otus.spark"
ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.18"

val sparkVersion = "3.5.7"
val circeVersion = "0.14.9"

ThisBuild / libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core"    % sparkVersion,
  "org.apache.spark" %% "spark-sql" % sparkVersion,
  "io.circe"         %% "circe-core"    % circeVersion,
  "io.circe"         %% "circe-generic" % circeVersion,
  "io.circe"         %% "circe-parser"  % circeVersion
)

javaOptions += "-Dhadoop.security.authentication=none"

// lazy val root = (project in file("."))
//   .settings(name := "SparkRDDAPI")
//   .settings(assembly / mainClass := Some("ru.otus.spark.SparkRDDAPI"))
//   .settings(assembly / assemblyJarName := "SparkRDDAPI.jar")
