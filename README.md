# IMDB--SQL-PowerBI-Project.
This project explores the historical box office performance, critical reception, and genre trends of the top 1,000 highest-rated movies on IMDb. Built with PostgreSQL for data engineering and Power BI for interactive visualization, this dashboard uncovers the directors, actors, and genres that historically drive cinematic success.


# 🎬 IMDb Top 1000: The Economics of Cinema

## 📌 Problem Statement
The film industry is a high-risk, high-reward business. While thousands of movies are released every decade, only a select few achieve both critical acclaim and massive box office success. 

**The objective of this project is to decode the anatomy of a "Top 1000" movie.** By analyzing historical IMDb data, this project seeks to answer key business questions for producers, casting directors, and studio executives:
* **Who are the most "bankable" lead actors and directors?**
* **Which genres guarantee the highest volume of top-tier ratings versus the highest financial returns?**
* **How do movie runtimes and age certificates impact overall gross revenue?**

## 🛠️ Tech Stack
* **Database & Analysis:** PostgreSQL
* **Data Visualization & UI:** Microsoft Power BI
* **Data Domain:** Entertainment, Box Office Economics

---

## 🚀 Project Workflow

### 1. Data Extraction & Profiling
The raw data consisted of the IMDb Top 1000 highest-rated movies. Before any analysis could begin, the data required profiling to understand its limitations:
* **Extracted Attributes:** Series_Title, Released_Year, Certificate, Runtime, Genre, IMDB_Rating, Meta_score, Director, Star1, No_of_Votes, and Gross.
* **Challenges Identified:** Gross revenue contained null values and was stored as text with commas. Runtime was stored as a string (e.g., "142 min") instead of an integer. 

### 2. Data Engineering & Cleaning (PostgreSQL)
A robust backend was built using SQL to clean the data and engineer new metrics for the dashboard.
* **Data Cleansing:** * Converted Gross revenue from string format to numeric values, handling NULL records to prevent skewed averages.
  * Stripped text characters from the Runtime column and cast it as an integer.
* **Aggregations & CTEs:** * Grouped total box office gross by Director and Star1 to evaluate individual "star power."
  * Mapped average IMDb ratings against gross revenue by Released_Year to track historical industry shifts.

### 3. Data Visualization (Power BI)
The cleaned dataset was ingested into Power BI to build an interactive, management-ready dashboard.
* **UI/UX Design:** Engineered a cinematic "dark-mode" theme with gold accents to mimic a premium web application. 
* **Interactive Control Panel:** Built a dedicated left-hand navigation pane featuring searchable dropdown slicers, allowing users to instantly filter the 1,000-movie database by specific Director or Series_Title.
* **Dynamic Media Rendering:** Configured the dataset's Poster_Link column as Image URLs, allowing high-resolution movie posters to render dynamically inside the Matrix table based on slicer selections.

---

## 📊 Dashboard Features & Architecture
*(Note: Upload your final dashboard screenshot to your GitHub repo and replace the link below)*
![IMDb Dashboard Final View](link-to-your-image.png)

### Macro-Level Analytics (Top Row):
* **KPI Ribbon:** Tracks total database scope: 1000 Movies, $56.54bn Gross Revenue, 7.95 Avg Rating, and 122.89 Min Avg Runtime.
* **Timeline of Movies:** A time-series line chart tracking the production volume of top-rated movies from 1950 to the present day.
* **Top Movies by Genre:** A horizontal bar chart identifying the most frequently produced top-tier genres.
* **Certificate Economics:** A combo chart plotting Total Gross Revenue against Average IMDb Rating broken down by age certification.

### Micro-Level Drill Downs (Bottom Row):
* **Star Power Treemap:** A dynamic, size-weighted Treemap showcasing the Top 10 Lead Actors by total revenue generated.
* **Movie Catalog Matrix:** A granular table displaying movie posters, Titles, Actors, Directors, Release Years, and Gross Revenue, allowing for row-level exploration.

---

## 💡 Key Insights Extracted

**1. The "Volume vs. Value" Genre Disconnect**
While pure **Drama** is the most frequently produced top-tier genre, it does not guarantee the highest box office returns. Composite genres (such as Action, Adventure, Sci-Fi) require higher budgets but historically yield exponentially higher average revenue per film.

**2. The Concentration of Star Power**
The Box Office Treemap reveals a heavy concentration of wealth at the very top. Out of thousands of actors, a highly select fraction of leads command a disproportionately massive share of the **$56.54 billion** total gross. Casting a proven "bankable" star heavily mitigates financial risk.

**3. The Run-Time Evolution**
The global average runtime for a top 1000 movie is **122.89 minutes**. The timeline analysis indicates a steady historical trend: modern audiences and critics are increasingly willing to tolerate films pushing closer to the 2.5-hour to 3-hour mark.

**4. The "PG-13 / UA" Sweet Spot**
While 'R' or 'A' (Adult) rated movies frequently achieve high critical acclaim, movies rated for broader audiences consistently generate the highest massive spikes in Total Gross Revenue by capturing the crucial teenage and family demographics.
