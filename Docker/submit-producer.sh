spark-submit \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  --class ru.otus.spark.Main \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.7 \
  /opt/spark-apps/sparkotusproducer_2.12-1.0.jar