from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *
from datetime import datetime
from pyspark.sql import DataFrame
from typing import Optional


spark = SparkSession.builder \
    .appName("Movies-Data-Analysis") \
    .config("spark.sql.adaptive.enabled","false") \
    .getOrCreate()
    
# read data

movies = spark.read.format('csv').option('header', 'true').option('inferSchema', 'true').load("/tmp/input_data/movies.csv")
print("movies_schema ::", movies.printSchema())
print("movies_partitions ::",movies.rdd.getNumPartitions())

ratings = spark.read.format('csv').option('header', 'true').option('inferSchema', 'true').load("/tmp/input_data/ratings.csv")
print("ratings_schema ::", ratings.printSchema())
print("ratings_partitions ::",ratings.rdd.getNumPartitions())

tags = spark.read.format('csv').option('header', 'true').option('inferSchema', 'true').load("/tmp/input_data/tags.csv")
print("tags_schema ::", tags.printSchema())
print("tags_partitions ::",tags.rdd.getNumPartitions())

def write_to_hdfs(
        df: DataFrame,
        destination: str,
        partition_columns: Optional[list] = None,
        num_partitions: Optional[int] = None,
        compression: str = 'none'
    ) -> None:
    """
    Writes a Spark DataFrame to HDFS with configurable partitioning and compression.
    
    Args:
        df: Spark DataFrame to write
        destination: HDFS path to write to
        partition_columns: List of columns to partition by (optional)
        num_partitions: Number of output partitions (optional)
        compression: Compression codec ('none', 'gzip', 'snappy', etc.)
    """
    writer = df.write.format('csv')\
        .mode('overwrite')\
        .option('compression', compression)
    
    if num_partitions:
        df = df.repartition(num_partitions)
    else:
        df = df.coalesce(1)
    

    if partition_columns:
        writer = writer.partitionBy(partition_columns)
    
    # Write to HDFS
    writer = writer.option("header", "true")
    writer.save(destination)

# Show the aggregated number of ratings per year
new_ratings = ratings.withColumn("date", from_unixtime(col("timestamp"))).withColumn("year", year(col("date")))
ratings_per_year = new_ratings.groupby('year').agg(count("*").alias("num_of_comments"))
print("aggregated number of ratings per year :: \n",ratings_per_year.show())
write_to_hdfs(ratings_per_year, '/analysis_reports/ratings_per_year/')

# Show the average monthly number of ratings
ratings_per_month = new_ratings.withColumn("month", month(col("date"))).groupby("month").agg(count("*").alias("num_of_comments")).orderBy(col("month"))
print("average monthly number of ratings ::\n",ratings_per_month.show())
write_to_hdfs(ratings_per_month, '/analysis_reports/ratings_per_month/')

 # Show the rating levels distribution
ratings_distribution = ratings.withColumn("rating_levels", when(col("rating") >= 4, "Best")
                                       .when((col("rating") < 4) & (col("rating") >= 2), "recommended")
                                       .otherwise("not recommended")).groupBy("rating_levels").agg(count("*").alias("num_of_movies"))
print("rating levels distribution :: \n",ratings_distribution.show())
write_to_hdfs(ratings_distribution, '/analysis_reports/ratings_distribution/')

# Show the 18 movies that are tagged but not rated
tagged_movies = tags.select('movieId').distinct()
rated_movies = ratings.select('movieId').distinct()
result = tagged_movies.join(movies, on = 'movieId', how='left')\
            .join(rated_movies, 'movieId', how='left_anti')\
            .select("movieId","title", "genres")
# Uses left anti join to keep only movies that don't exist in ratings
print("18 movies that are tagged but not rated ::\n",result.show())
write_to_hdfs(result, '/analysis_reports/tagged_not_rated/')


# Show the movies that have rating but no tag
result = rated_movies.join(tagged_movies, 'movieId', 'left_anti').join(movies, 'movieId', 'left').select('movieId', 'title', 'genres')
print("he movies that have rating but no tag :: \n",result.show())
write_to_hdfs(result,'/analysis_reports/rated_not_tagged/')
# left anti join fetches all the rated movies that are not in tagged_movies.


# Focusing on the rated untagged movies with more than 30 user ratings,
#  show the top 10 movies in terms of average rating and number of
#  ratings

result = ratings.join(tagged_movies, 'movieId', 'left_anti')\
        .join(movies, 'movieId', 'left')\
        .groupBy('movieId').agg(count("*").alias("user_counts"), avg('rating').alias("average_rating"))\
        .filter(col("user_counts") > 30)\
        .orderBy(col("average_rating").desc()).limit(10)
print("top 10 movies in terms of average rating and number of ratings ::\n", result.show())
write_to_hdfs(result, '/analysis_reports/top_movies_by_ratings/')


# what is the predominant (frequency based) genre per rating level?
result = movies.join(ratings, 'movieId', 'left').groupby('rating').agg(concat_ws("|", collect_list("genres")).alias("merged_genres")).orderBy(col("rating").desc())
print("the predominant (frequency based) genre per rating level ::\n", result.show())
write_to_hdfs(result, '/analysis_reports/genres_based_on_ratings/')