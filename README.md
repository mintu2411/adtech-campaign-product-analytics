@"
# AdTech Campaign Performance & Conversion Analytics

## Overview

This project analyzes advertising campaign performance using SQL and
exploratory data analysis.

The analysis focuses on campaign engagement, conversion performance,
audience segmentation, and advertising cost efficiency.

## Dataset

The dataset contains 1,143 advertising records with information about:

- Ad and campaign IDs
- Age
- Gender
- Interest category
- Impressions
- Clicks
- Advertising spend
- Total conversions
- Approved conversions

Source: Kaggle — Facebook Ad Campaign / Sales Conversion Optimization dataset.

## Business Questions

- Which campaigns generate the most conversions?
- Which audience segments show stronger engagement?
- How does campaign performance vary by age and gender?
- Which interest groups have higher conversion activity?
- How efficiently is advertising spend converted into clicks and conversions?

## Key Metrics

### CTR

Click-through rate:

Clicks / Impressions

### CPC

Cost per click:

Spend / Clicks

### Conversion Rate

Approved Conversions / Clicks

### Cost per Conversion

Spend / Approved Conversions

## SQL Analysis

The project uses SQL for:

- Data-quality checks
- Aggregation and grouping
- Campaign-level analysis
- Age and gender segmentation
- Interest-level analysis
- Ranking campaigns and segments
- Cost-efficiency analysis
- Window functions such as RANK() and ROW_NUMBER()

## Product Analytics Perspective

The analysis is structured around the advertising funnel:

Impressions → Clicks → Conversions → Approved Conversions

The goal is to identify segments where advertising engagement and
conversion efficiency differ and generate data-driven hypotheses for
campaign optimization.

## Tools

- SQL
- Python
- Pandas
- Data Visualization

## Future Improvements

- Add CTE-based product analytics queries
- Add month-over-month performance analysis
- Add additional conversion-efficiency metrics
- Build an interactive dashboard
- Perform deeper campaign and audience segmentation
"@ | Set-Content -Path ".\README.md" -Encoding UTF8