/* =========================================================
   ADTECH CAMPAIGN PERFORMANCE & CONVERSION ANALYTICS
   MySQL 8.x
   ========================================================= */


/* 1. DATA EXPLORATION */

SELECT *
FROM adtech.kag_conversion_data;

DESCRIBE adtech.kag_conversion_data;


/* 2. DATA QUALITY */

/* Missing values */

SELECT
    SUM(ad_id IS NULL) AS missing_ad_id,
    SUM(campaign_id IS NULL) AS missing_campaign_id,
    SUM(age IS NULL) AS missing_age,
    SUM(gender IS NULL) AS missing_gender,
    SUM(interest IS NULL) AS missing_interest
FROM adtech.kag_conversion_data;


/* Duplicate Ad IDs */

SELECT
    ad_id,
    COUNT(*) AS record_count
FROM adtech.kag_conversion_data
GROUP BY ad_id
HAVING COUNT(*) > 1;


/* 3. OVERALL KPIs */

/* CTR */

SELECT
    ROUND(
        SUM(Clicks) / NULLIF(SUM(Impressions),0) * 100,
        2
    ) AS CTR
FROM adtech.kag_conversion_data;


/* CPC */

SELECT
    ROUND(
        SUM(Spent) / NULLIF(SUM(Clicks),0),
        2
    ) AS CPC
FROM adtech.kag_conversion_data;


/* Conversion Rate */

SELECT
    ROUND(
        SUM(Approved_Conversion) /
        NULLIF(SUM(Clicks),0) * 100,
        2
    ) AS conversion_rate
FROM adtech.kag_conversion_data;


/* CPA */

SELECT
    ROUND(
        SUM(Spent) /
        NULLIF(SUM(Approved_Conversion),0),
        2
    ) AS CPA
FROM adtech.kag_conversion_data;


/* 4. CAMPAIGN PERFORMANCE */

SELECT
    CASE
        WHEN campaign_id = 916 THEN 1
        WHEN campaign_id = 936 THEN 2
        WHEN campaign_id = 1178 THEN 3
    END AS campaign_level,

    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    SUM(Total_Conversion) AS conversions,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent),2) AS spend,

    ROUND(
        SUM(Clicks) /
        NULLIF(SUM(Impressions),0) * 100, 2
    ) AS CTR,

    ROUND(
        SUM(Spent) /
        NULLIF(SUM(Approved_Conversion),0), 2
    ) AS CPA

FROM adtech.kag_conversion_data
GROUP BY campaign_id
ORDER BY approved_conversions DESC;


/* 5. AGE × CAMPAIGN */

SELECT
    age,
    campaign_id,

    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent),2) AS spend,

    RANK() OVER (
        PARTITION BY age
        ORDER BY SUM(Approved_Conversion) DESC
    ) AS campaign_rank

FROM adtech.kag_conversion_data
GROUP BY age, campaign_id
ORDER BY age, campaign_rank;


/* 6. GENDER × CAMPAIGN */

SELECT
    gender,
    campaign_id,

    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    SUM(Total_Conversion) AS conversions,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent),2) AS spend,

    RANK() OVER (
        PARTITION BY gender
        ORDER BY SUM(Approved_Conversion) DESC
    ) AS campaign_rank

FROM adtech.kag_conversion_data
GROUP BY gender, campaign_id
ORDER BY gender, campaign_rank;


/* 7. INTEREST SEGMENTATION */

SELECT
    CONCAT(
        FLOOR(interest / 25) * 25 + 1,
        '-',
        FLOOR(interest / 25) * 25 + 25
    ) AS interest_bin,

    COUNT(*) AS records,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent),2) AS spend,

    ROUND(
        SUM(Spent) /
        NULLIF(SUM(Approved_Conversion),0),
        2
    ) AS CPA

FROM adtech.kag_conversion_data
GROUP BY FLOOR(interest / 25)
ORDER BY approved_conversions DESC;


/* 8. ADVANCED ANALYSIS
   Identify campaigns with high impressions
   but relatively low CTR.
*/

WITH campaign_metrics AS (

    SELECT
        campaign_id,
        SUM(Impressions) AS impressions,
        SUM(Clicks) AS clicks,
        SUM(Approved_Conversion) AS approved_conversions,

        ROUND(
            SUM(Clicks) /
            NULLIF(SUM(Impressions),0) * 100,
            2
        ) AS CTR

    FROM adtech.kag_conversion_data
    GROUP BY campaign_id
)

SELECT
    campaign_id,
    impressions,
    clicks,
    approved_conversions,
    CTR

FROM campaign_metrics
ORDER BY impressions DESC;
