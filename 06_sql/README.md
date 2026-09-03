# SQL Analytics

## US Healthcare Insurance Analytics Dashboard

**Document Version:** 1.0  
**Data Classification:** Synthetic / Portfolio-Safe  
**Purpose:** Define the SQL analytics layer used to transform synthetic healthcare insurance data into business insights and dashboard-ready metrics.

---

# 1. Purpose

The SQL analytics layer provides the analytical foundation for the US Healthcare Insurance Analytics Dashboard.

The SQL queries are designed to support:

- Claims analytics
- Financial analytics
- Allowed Amount analysis
- Claim Amount analysis
- Paid Amount analysis
- Spend analysis
- Provider performance
- Member utilization
- Service utilization
- Claims trends
- Denial analysis
- KPI reporting
- Dashboard datasets
- Data-quality validation

All queries operate on synthetic, portfolio-safe healthcare insurance data.

No real patient, provider, payer, claims, or healthcare organization data is used.

---

# 2. Analytical Objectives

The SQL layer should answer the following business questions:

### Claims

- How many claims were submitted?
- How many claims were paid?
- How many claims were denied?
- How many claims are pending?
- How are claims trending over time?

### Financial

- What is the total Claim Amount?
- What is the total Allowed Amount?
- What is the total Paid Amount?
- What is the total Spend?
- How does Spend vary by month?
- Which services generate the highest Spend?

### Provider

- Which providers have the highest claim volume?
- Which providers generate the highest Spend?
- What is the average Allowed Amount by provider?
- How does provider performance vary by specialty?
- Which providers have higher utilization?

### Member

- How many unique members generated claims?
- What is the average Spend per Member?
- How many claims are generated per member?
- How does utilization vary by plan type?

### Service

- Which services are most frequently used?
- Which services generate the highest Spend?
- What is the average Allowed Amount by service?
- How does utilization vary by service category?

---

# 3. Source Data Model

The SQL layer is based on the analytical model defined in:

```text
04_data/data_dictionary.md
04_data/data_model.md
The primary analytical tables are:

fact_claims
fact_claim_lines
dim_member
dim_provider
dim_service
dim_date
dim_geography
4. Fact Table Grain

The primary financial fact table is:

fact_claims
Grain

One row represents one unique claim.

This grain must be preserved when calculating claim-level KPIs.

Examples:

Total Claims
Claim Amount
Allowed Amount
Paid Amount
Spend
Denial Rate
5. Claim Line Grain

The secondary fact table is:

fact_claim_lines
Grain

One row represents one claim service line.

A single claim can contain multiple claim lines.

Example:

Claim CLM-000001
│
├── Line 1
├── Line 2
└── Line 3

Therefore:

COUNT(claim_id)

on the claim-line table may overcount claims.

For claim-level KPIs:

COUNT(DISTINCT claim_id)

should be used when analysis requires claim-level counting from claim lines.

6. Financial Metric Definitions

The SQL layer follows the business definitions established in the data dictionary.

Claim Amount

Provider-submitted amount.

Claim Amount = SUM(claim_amount)
Allowed Amount

Amount recognized as allowed under the synthetic payer model.

Allowed Amount = SUM(allowed_amount)

Business rule:

Allowed Amount <= Claim Amount
Member Responsibility

Synthetic portion of the Allowed Amount assigned to the member.

Member Responsibility =
SUM(member_responsibility)
Paid Amount

Synthetic payer payment.

Paid Amount =
SUM(paid_amount)

For applicable paid claims:

Paid Amount =
Allowed Amount - Member Responsibility
Spend

The MVP defines Spend as:

Spend = Paid Amount

Therefore:

Total Spend =
SUM(spend_amount)

This definition remains consistent across SQL and dashboard calculations.

7. Core KPI Definitions
KPI	Definition
Total Claims	COUNT(DISTINCT claim_id)
Unique Members	COUNT(DISTINCT member_id)
Claim Amount	SUM(claim_amount)
Allowed Amount	SUM(allowed_amount)
Paid Amount	SUM(paid_amount)
Spend	SUM(spend_amount)
Claims per Member	Total Claims / Unique Members
Spend per Member	Total Spend / Unique Members
Average Claim Amount	Claim Amount / Total Claims
Average Allowed Amount	Allowed Amount / Total Claims
Denial Rate	Denied Claims / Total Claims
Provider Spend	SUM(spend_amount) grouped by provider
Service Spend	SUM(spend_amount) grouped by service
8. Claim Status Logic

The synthetic dataset supports the following statuses:

Paid
Denied
Pending
Adjusted

Status-based analytics should use:

COUNT(DISTINCT claim_id)

with appropriate filtering.

Example:

SELECT
    claim_status,
    COUNT(DISTINCT claim_id) AS claim_count
FROM fact_claims
GROUP BY claim_status;
9. Denial Rate

Denial Rate is defined as:

Denied Claims / Total Claims

Example SQL pattern:

SELECT
    COUNT(DISTINCT CASE
        WHEN claim_status = 'Denied'
        THEN claim_id
    END) * 100.0
    / COUNT(DISTINCT claim_id) AS denial_rate
FROM fact_claims;

The calculation should be performed at claim grain.

10. Time-Based Analytics

The primary analytical date is:

service_date

The date dimension provides:

Day
Month
Quarter
Year
Week
Day of Week

Typical time-based analysis includes:

Monthly claims
Monthly Spend
Monthly Allowed Amount
Monthly Paid Amount
Monthly denial rate
Year-over-year trends
Quarterly trends
11. Provider Analytics

Provider analysis will use:

dim_provider
        ↓
fact_claims

Primary provider metrics include:

Claim Volume
Claim Amount
Allowed Amount
Paid Amount
Spend
Average Allowed Amount
Average Spend
Denial Rate
Utilization

Provider analysis may be grouped by:

Provider
Provider Type
Specialty
State
Network Status
12. Member Analytics

Member analytics will use:

dim_member
        ↓
fact_claims

Primary metrics include:

Unique Members
Claims per Member
Spend per Member
Allowed Amount per Member
Utilization by Plan Type
Utilization by State
13. Service Analytics

Service analysis will use:

dim_service
        ↓
fact_claims

Metrics include:

Service Volume
Claim Volume
Allowed Amount
Paid Amount
Spend
Average Allowed Amount
Average Spend

Analysis can be grouped by:

Service Category
Service Name
Service Type
Specialty
14. SQL Folder Structure

The SQL implementation is organized into the following areas:

06_sql/
│
├── README.md
│
├── 01_data_quality/
│
├── 02_claims_analytics/
│
├── 03_financial_analytics/
│
├── 04_provider_analytics/
│
├── 05_member_analytics/
│
├── 06_service_analytics/
│
└── 07_kpi_queries/
15. Data Quality SQL

The data-quality SQL layer validates:

Duplicate primary keys
Missing identifiers
Invalid foreign keys
Invalid financial relationships
Negative amounts
Invalid claim statuses
Invalid dates
Claim-line integrity

These checks complement:

05_synthetic_data/validate_data.py
16. Financial Analytics SQL

Financial queries will analyze:

Claim Amount
Allowed Amount
Member Responsibility
Paid Amount
Spend

Typical analysis includes:

Total financial exposure
Monthly financial trends
Provider Spend
Service Spend
Spend per Member
Average Allowed Amount
Allowed-to-Claim ratio
17. Provider Performance SQL

Provider analytics will combine:

dim_provider
+
fact_claims

Example dimensions:

provider_name
specialty
provider_type
state
network_status

Example measures:

claim_count
allowed_amount
paid_amount
spend_amount
denial_rate
average_allowed_amount

The synthetic:

quality_score

is an analytical portfolio metric and should not be interpreted as a real clinical quality rating.

18. Double-Counting Prevention

A major analytical risk is incorrect aggregation caused by mixing claim-level and claim-line-level data.

Example:

1 Claim
   ↓
3 Claim Lines

If Claim Amount is stored at claim grain and joined directly to three claim lines, the Claim Amount may be repeated three times.

Therefore:

Claim-level financial metrics

Use:

fact_claims
Line-level metrics

Use:

fact_claim_lines
Claim counts from claim lines

Use:

COUNT(DISTINCT claim_id)

when the analysis requires claim-level counting.

19. SQL Standards

Queries should follow these principles:

Use explicit column names
Avoid SELECT *
Use meaningful aliases
Use COUNT(DISTINCT claim_id) when appropriate
Preserve analytical grain
Avoid unnecessary joins
Use NULL-safe calculations
Avoid divide-by-zero errors
Use consistent KPI definitions
Document complex business logic
Format queries for readability
20. Divide-by-Zero Protection

Ratio metrics should protect against zero denominators.

Example:

CASE
    WHEN COUNT(DISTINCT claim_id) = 0
    THEN 0
    ELSE
        SUM(allowed_amount)
        / COUNT(DISTINCT claim_id)
END

For percentage metrics:

CASE
    WHEN COUNT(DISTINCT claim_id) = 0
    THEN 0
    ELSE
        COUNT(
            DISTINCT CASE
                WHEN claim_status = 'Denied'
                THEN claim_id
            END
        ) * 100.0
        / COUNT(DISTINCT claim_id)
END
21. Dashboard Readiness

SQL outputs should be structured so they can directly support dashboard components.

Example dashboard datasets:

Executive KPI Dataset
Monthly Trend Dataset
Provider Performance Dataset
Service Performance Dataset
Member Utilization Dataset
Geographic Analysis Dataset
Claims Status Dataset
22. SQL → Dashboard Flow

The analytical flow is:

Synthetic CSV Data
        ↓
Validated Dataset
        ↓
Analytical Data Model
        ↓
SQL Queries
        ↓
KPI / Analytical Datasets
        ↓
Dashboard
        ↓
Business Insights
23. Traceability

Every dashboard KPI should be traceable through:

Business Requirement
        ↓
KPI Definition
        ↓
Data Dictionary
        ↓
Data Model
        ↓
SQL Query
        ↓
Dashboard Visualization

This ensures consistency between product requirements, data, analytics, and reporting.

24. Portfolio Safety

All SQL analytics are based on synthetic data.

The project does not use:

Real patient information
Protected Health Information (PHI)
Real insurance member identifiers
Real claims
Real provider financial data
Real healthcare organization data
Real payer contracts

All identifiers and analytical values are artificially generated.

25. Future SQL Enhancements

Potential future enhancements include:

Advanced provider benchmarking
Risk-adjusted utilization
Cost trend forecasting
Cohort analysis
Year-over-year variance analysis
Network performance analysis
Specialty benchmarking
Geographic benchmarking
Window functions
Common Table Expressions
Stored analytical views
Dashboard-specific SQL views
Automated data-quality monitoring
26. Design Principle

The SQL layer follows one core principle:

Every business metric must be calculated from the correct data grain using a clearly defined business rule.

The analytical chain is:

Business Need
      ↓
KPI Definition
      ↓
Data Model
      ↓
SQL Logic
      ↓
Analytical Dataset
      ↓
Dashboard
      ↓
Business Decision

This ensures that the healthcare insurance analytics dashboard remains accurate, consistent, explainable, and portfolio-safe.
