
-- Advanced SQL Analysis

-- CTE: Average ratings by education level
WITH education_avg AS (
    SELECT education_level,
           AVG(big_data_usage_rating) AS avg_big_data,
           AVG(faculty_interaction_rating) AS avg_faculty,
           AVG(career_dev_rating) AS avg_career
    FROM survey_results_full
    GROUP BY education_level
)
SELECT * FROM education_avg;

-- CASE Statement: Classify career rating
SELECT id, education_level, career_dev_rating,
  CASE
    WHEN career_dev_rating >= 4 THEN 'High'
    WHEN career_dev_rating = 3 THEN 'Medium'
    ELSE 'Low'
  END AS rating_level
FROM survey_results_full;

-- Window Function: Rank education levels by career_dev_rating
SELECT education_level,
       AVG(career_dev_rating) AS avg_rating,
       RANK() OVER (ORDER BY AVG(career_dev_rating) DESC) AS rank_order
FROM survey_results_full
GROUP BY education_level;
