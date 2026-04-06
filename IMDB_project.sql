CREATE TABLE imdb(
    Poster_Link TEXT,
    Series_Title TEXT,
    Released_Year INT,
    Certificate VARCHAR(50),
    Runtime INT,
    Genre VARCHAR(100),
    IMDB_Rating NUMERIC(3,1),
    Overview TEXT,
    Meta_score NUMERIC(4,1),
    Director VARCHAR(100),
    Star1 VARCHAR(100),
    Star2 VARCHAR(100),
    Star3 VARCHAR(100),
    Star4 VARCHAR(100),
    No_of_Votes INT,
    Gross NUMERIC
);



-- 1.	Which movies released before 1990 have an IMDb rating of 8.5 or higher?
SELECT series_title, released_year, imdb_rating
FROM imdb
WHERE released_year < 1990 AND imdb_rating >= 8.5;

-- 2.	Which 5 movies have the longest runtime, and who directed them?
SELECT series_title, runtime, director
FROM imdb
ORDER BY runtime DESC
LIMIT 5;

-- 3.	What are all the movies directed by Christopher Nolan, ordered from highest to lowest gross revenue?
SELECT series_title, director, gross
FROM imdb
WHERE director = 'Christopher Nolan'
ORDER BY gross DESC;

-- 4.	Who are the top 10 directors based on their average IMDb rating, considering only those who have directed at least 3 movies?
SELECT director, ROUND(AVG(imdb_rating),2) AS avg_imdb_rating, COUNT(series_title) AS total_movies
FROM imdb
GROUP BY director
HAVING COUNT(series_title) >=3
ORDER BY ROUND(AVG(imdb_rating),2) DESC
LIMIT 10;

-- 5.	What is the total box office gross for movies released in each decade, and which decade generated the most revenue overall?
SELECT 
    (released_year / 10) * 10 AS decade,
    SUM(gross) AS total_decade_revenue
FROM imdb
GROUP BY (released_year / 10) * 10
ORDER BY total_decade_revenue DESC;

-- 6.	Which 5 movies have the largest gap between their audience rating (scaled to 100) and their critic score (Meta_score)?
SELECT series_title, (imdb_rating * 10) AS audience_score, meta_score AS critic_score, 
ABS((imdb_rating * 10) - meta_score) AS score_gap
FROM imdb
WHERE meta_score IS NOT NULL -- This ensures we don't calculate gaps for movies missing a critic score
ORDER BY score_gap DESC
LIMIT 5;

-- 7.	What is the single highest-grossing movie for each specific release year?
WITH ranked_movies AS(
SELECT released_year, series_title, gross,
DENSE_RANK() OVER(PARTITION BY released_year ORDER BY gross DESC) AS rank
FROM imdb
)
SELECT released_year, series_title, gross,rank
FROM ranked_movies
WHERE rank = 1
ORDER BY released_year DESC;

-- 8.	Which top 5 lead actors (based on the Star1 column) have generated the highest total gross revenue across all their movies combined?
SELECT star1, SUM(gross) AS total_revenue
FROM imdb
GROUP BY star1
ORDER BY SUM(gross) DESC
LIMIT 5;

-- 9.	Which movies rank in the top 10% for both gross revenue and IMDb rating across the entire dataset?
WITH MoviePercentiles AS (
SELECT series_title,gross,imdb_rating,
NTILE(10) OVER(ORDER BY gross DESC) AS revenue_bucket,
NTILE(10) OVER(ORDER BY imdb_rating DESC) AS rating_bucket
FROM imdb
)
SELECT series_title, gross, imdb_rating
FROM MoviePercentiles
WHERE revenue_bucket = 1 AND rating_bucket = 1;
