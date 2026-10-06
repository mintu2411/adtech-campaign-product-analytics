# AdTech Campaign Performance & Conversion Analytics

## Overview

This project analyzes advertising campaign performance using **MySQL 8.x**.

The analysis focuses on campaign performance, advertising funnel conversion,
audience segmentation, and cost efficiency to identify data-driven
opportunities for campaign optimization.

## Dataset

The dataset contains **1,143 advertising records** with information about:

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
- Which campaigns have the strongest engagement?
- How does performance vary across age and gender?
- Which interest segments perform better?
- Which campaigns have high impressions but low engagement?
- Which campaigns have high clicks but weak conversion?
- How efficiently is advertising spend converted into clicks and conversions?

## Advertising Funnel

The analysis follows the advertising funnel:

**Impressions → Clicks → Total Conversions → Approved Conversions**

This helps identify where performance drops between stages of the funnel.

## Key Metrics

### CTR — Click-Through Rate

Measures the percentage of impressions that result in clicks.

`CTR = Clicks / Impressions × 100`

### CPC — Cost Per Click

Measures the average advertising spend required to generate a click.

`CPC = Spend / Clicks`

### Conversion Rate

Measures the percentage of clicks that result in approved conversions.

`Conversion Rate = Approved Conversions / Clicks × 100`

### CPA — Cost Per Acquisition

Measures the advertising spend required per approved conversion.

`CPA = Spend / Approved Conversions`

## SQL Analysis

The project uses MySQL 8.x for:

- Data-quality checks
- Campaign-level performance analysis
- Funnel analysis
- KPI calculation
- Age and gender segmentation
- Interest-level segmentation
- Campaign and segment ranking
- Performance-gap identification
- Cost-efficiency analysis

Advanced SQL techniques include:

- Common Table Expressions (CTEs)
- Window functions
- `RANK()`
- `ROW_NUMBER()`
- Conditional aggregation
- `CASE WHEN`
- Aggregations and grouping
- `NULLIF()` for safe metric calculations

## Performance Gap Analysis

The analysis identifies cases such as:

- High impressions with low CTR
- High clicks with low conversion rate
- Strong engagement but poor downstream conversion efficiency

These gaps can be used to generate hypotheses around audience targeting,
creative relevance, and campaign optimization.

## Product Analytics Perspective

The project is structured around turning campaign data into actionable
insights rather than only reporting raw metrics.

The analysis connects:

**Data → Metrics → Segments → Performance Gaps → Optimization Opportunities**

This approach can help product and advertising teams prioritize areas
for further investigation and experimentation.

## Tools

- SQL
- MySQL 8.x
- GitHub

## Project Structure

```text
adtech-campaign-product-analytics/
│
├── README.md
├── ad_campaign_data.csv
└── adtech_campaign_analysis.sql
