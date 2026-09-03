# Product Requirements Document (PRD)

## US Healthcare Insurance Analytics Dashboard

**Document Version:** 1.0
**Status:** Draft
**Product Type:** Healthcare Insurance Analytics & Decision-Support Product
**Data Classification:** Synthetic / Portfolio-Safe
**Primary Users:** Business / Operations Managers, Provider Network Managers, Healthcare Data Analysts

---

# 1. Product Overview

The **US Healthcare Insurance Analytics Dashboard** is an analytics and decision-support product designed to provide a centralized view of healthcare insurance claims, spending, utilization, and provider performance.

The product transforms synthetic healthcare insurance data into standardized KPIs, interactive visualizations, and drilldown analytics that enable stakeholders to understand trends and investigate potential cost and utilization drivers.

The product follows the analytical flow:

```text
Synthetic Healthcare Data
        ↓
Data Transformation
        ↓
Analytics Data Model
        ↓
KPI / Semantic Layer
        ↓
Dashboard
        ↓
Insights
        ↓
Business Decisions
```

---

# 2. Product Vision

> **Enable healthcare insurance stakeholders to understand claims, costs, utilization, and provider performance through a trusted, centralized, and easy-to-use analytics experience.**

---

# 3. Product Goal

The product will provide a single analytical experience where users can:

* Monitor healthcare insurance KPIs
* Analyze claims trends
* Understand healthcare spending
* Compare Claim Amount and Allowed Amount
* Analyze provider performance
* Monitor utilization
* Explore geographic patterns
* Drill from high-level metrics into detailed data
* Identify areas requiring further investigation

---

# 4. Target Users

## 4.1 Business / Operations Manager

### Goal

Monitor overall healthcare insurance performance.

### Primary Tasks

* Review executive KPIs
* Monitor claims trends
* Analyze healthcare spend
* Identify cost drivers
* Review utilization trends
* Compare geographic performance

### Primary Dashboard

**Executive Overview**

---

## 4.2 Provider Network Manager

### Goal

Understand provider-level cost and utilization patterns.

### Primary Tasks

* Compare providers
* Review provider claims
* Analyze provider spend
* Review Allowed Amount
* Compare utilization
* Investigate provider-level trends

### Primary Dashboard

**Provider Performance**

---

## 4.3 Healthcare Data Analyst

### Goal

Investigate KPI changes and validate analytical results.

### Primary Tasks

* Drill into KPIs
* Analyze claim-level information
* Validate calculations
* Investigate trends
* Identify data-quality issues
* Export or review detailed data

### Primary Dashboard

**Claims & Detailed Analytics**

---

# 5. Product Value Proposition

The dashboard provides value by combining:

### Centralization

One analytical experience for claims, spending, utilization, and provider analytics.

### Standardization

Consistent KPI definitions across business and technical teams.

### Self-Service

Users can investigate trends without requiring a separate report for every analytical question.

### Transparency

Users can drill from summary KPIs to underlying dimensions and claim-level details.

### Data-Driven Decision Support

The product helps users identify trends and areas requiring further investigation.

---

# 6. Product Principles

The product will follow these principles:

### 6.1 Business-First

Every KPI and visualization should answer a meaningful business question.

### 6.2 KPI Consistency

A KPI must have one documented business definition and calculation logic.

### 6.3 Progressive Detail

Users should be able to move from:

```text
Summary → Trend → Breakdown → Detail
```

without unnecessary complexity.

### 6.4 Data Trust

Dashboard outputs should be validated against SQL calculations and underlying datasets.

### 6.5 Role Relevance

Each user persona should see information relevant to their decisions.

### 6.6 Privacy by Design

The portfolio implementation must use synthetic data and avoid exposing PHI or confidential information.

### 6.7 Actionable Analytics

Visualizations should help users understand what changed, where it changed, and what may require further investigation.

---

# 7. Product Scope

## MVP

The MVP will contain four core analytical areas:

### 1. Executive Overview

* Total Claims
* Total Spend
* Total Allowed Amount
* Total Claim Amount
* Unique Members
* Claims per Member
* Spend per Member
* Claims and spend trends

### 2. Claims Analytics

* Claims by status
* Claims trends
* Claim Amount
* Allowed Amount
* Average Claim Amount
* Average Allowed Amount
* Claims by service

### 3. Provider Performance

* Provider claims
* Provider spend
* Provider Allowed Amount
* Average cost
* Provider utilization
* Provider comparison

### 4. Utilization & Geographic Analytics

* Claims per Member
* Services per Member
* Spend by geography
* Claims by geography
* Service utilization

---

# 8. Out of Scope

The MVP will not include:

* Real-time claims processing
* Real payer integrations
* Real PHI
* Clinical decision support
* Medical recommendations
* Real payment processing
* Production claims adjudication
* Automated fraud determination
* Production deployment

Potential advanced capabilities may be considered for future phases.

---

# 9. Primary User Journey

The core product journey is:

```text
Login / Access Dashboard
        ↓
Executive Overview
        ↓
Identify KPI / Trend
        ↓
Select Dimension
        ↓
Drilldown
        ↓
Analyze Provider / Service / Geography
        ↓
Review Detailed Claims
        ↓
Identify Potential Driver
        ↓
Business Investigation / Decision
```

---

# 10. Core Product Questions

The product must help users answer:

### Claims

* How many claims are being processed?
* How are claims changing over time?
* What is the current claim status distribution?
* Which services contribute most to claims volume?

### Cost

* What is total healthcare spend?
* How is spend changing?
* Which services drive spend?
* How does Claim Amount compare with Allowed Amount?

### Providers

* Which providers have the highest spend?
* Which providers have the highest claims volume?
* How does provider utilization compare?
* Which providers require deeper analysis?

### Utilization

* How many claims occur per member?
* Which services are used most frequently?
* Which regions show higher utilization?

---

# 11. MVP Product Outcome

The MVP should allow a business user to move from:

> **"Something changed."**

to:

> **"What changed?"**

to:

> **"Where did it change?"**

to:

> **"What appears to be driving the change?"**

This progression will be central to the dashboard UX and drilldown design.
# 12. Feature Requirements

## 12.1 Feature Area A — Executive Overview

### FR-01 — KPI Summary Cards

The dashboard shall display a set of high-level healthcare insurance KPIs.

### Required KPIs

* Total Claims
* Total Claim Amount
* Total Allowed Amount
* Total Spend
* Unique Members
* Claims per Member
* Spend per Member

### User Value

Users can understand the current overall performance without reviewing detailed reports.

**Priority:** Must Have

---

### FR-02 — KPI Trend Analysis

The dashboard shall provide time-based trends for selected financial and claims KPIs.

Users should be able to view trends by:

* Month
* Quarter
* Year

**Priority:** Must Have

---

### FR-03 — KPI Comparison

Where appropriate, users shall be able to compare the current analytical period against a previous period.

Examples:

```text
Current Month vs Previous Month
Current Quarter vs Previous Quarter
Current Year vs Previous Year
```

**Priority:** Should Have

---

# 12.2 Feature Area B — Claims Analytics

## FR-04 — Claims Volume Analysis

Users shall be able to analyze the number of claims across time and relevant dimensions.

### Dimensions

* Date
* Claim Status
* Service Category
* Provider
* Geography

**Priority:** Must Have

---

## FR-05 — Claim Status Analysis

Users shall be able to view the distribution of claims by:

* Paid
* Denied
* Pending
* Adjusted

The dashboard should provide both counts and percentages where applicable.

**Priority:** Must Have

---

## FR-06 — Claim Amount Analysis

Users shall be able to analyze Claim Amount by:

* Time
* Service
* Provider
* Geography

**Priority:** Must Have

---

## FR-07 — Allowed Amount Analysis

Users shall be able to analyze Allowed Amount independently from Claim Amount.

The dashboard should support:

* Total Allowed Amount
* Average Allowed Amount
* Allowed Amount by service
* Allowed Amount by provider
* Allowed Amount trend

**Priority:** Must Have

---

## FR-08 — Claim vs Allowed Comparison

The dashboard should allow users to compare:

```text
Claim Amount
        vs
Allowed Amount
```

This comparison should help users understand differences between submitted and allowed values.

**Priority:** Must Have

---

# 12.3 Feature Area C — Spend Analytics

## FR-09 — Spend Trend

Users shall be able to view healthcare spend trends over time.

**Visualization:** Line chart

**Priority:** Must Have

---

## FR-10 — Spend by Service

Users shall be able to identify healthcare service categories contributing to total spend.

**Visualization Options:**

* Bar chart
* Ranked table

**Priority:** Must Have

---

## FR-11 — Spend by Provider

Users shall be able to rank providers by spend.

The view should support:

* Highest-spend providers
* Lowest-spend providers
* Provider comparison

**Priority:** Must Have

---

## FR-12 — Spend by Geography

Users shall be able to analyze spend across geographic dimensions available in the synthetic dataset.

**Priority:** Should Have

---

# 12.4 Feature Area D — Provider Performance

## FR-13 — Provider Ranking

Users shall be able to rank providers based on:

* Claims
* Spend
* Allowed Amount
* Average cost
* Utilization

**Priority:** Must Have

---

## FR-14 — Provider Comparison

Users shall be able to compare selected providers across common KPIs.

### Example

| KPI            | Provider A | Provider B |
| -------------- | ---------: | ---------: |
| Claims         |      1,250 |        980 |
| Spend          |      $450K |      $380K |
| Allowed Amount |      $410K |      $350K |
| Avg. Allowed   |       $328 |       $357 |

**Priority:** Must Have

---

## FR-15 — Provider Drilldown

Users shall be able to select a provider and view:

* Provider details
* Claims
* Spend
* Allowed Amount
* Services
* Utilization
* Geographic information

**Priority:** Must Have

---

# 12.5 Feature Area E — Utilization Analytics

## FR-16 — Claims per Member

The dashboard shall display:

```text
Claims per Member =
Total Claims / Unique Members
```

The metric should respond dynamically to applicable filters.

**Priority:** Must Have

---

## FR-17 — Service Utilization

Users shall be able to identify frequently used service categories.

**Priority:** Must Have

---

## FR-18 — Utilization Trend

Users shall be able to monitor changes in utilization over time.

**Priority:** Should Have

---

# 12.6 Feature Area F — Filtering

## FR-19 — Global Filters

The dashboard shall provide common filters including:

* Date / Date Range
* Provider
* Provider Specialty
* Service Category
* Claim Status
* Geography
* Network Status

Filters should apply consistently to relevant dashboard components.

**Priority:** Must Have

---

## FR-20 — Filter Reset

Users shall be able to reset filters and return to the default dashboard view.

**Priority:** Must Have

---

## FR-21 — Filter Visibility

The dashboard shall clearly indicate active filters.

Example:

```text
Filters Applied:
Date: Jan–Jun 2026
Service: Cardiology
Region: Northeast
```

**Priority:** Should Have

---

# 12.7 Feature Area G — Drilldown & Detail

## FR-22 — KPI Drilldown

Users shall be able to select a KPI or visualization and move into a more detailed analytical view.

Example:

```text
Total Spend
    ↓
Service Category
    ↓
Provider
    ↓
Claim
```

**Priority:** Must Have

---

## FR-23 — Claim Detail View

The dashboard shall provide a detailed claim-level view containing relevant fields such as:

* Claim ID
* Member ID
* Provider ID
* Service Date
* Service Category
* Claim Amount
* Allowed Amount
* Paid Amount
* Claim Status

**Priority:** Must Have

---

## FR-24 — Detail Search

Users should be able to search or filter claim-level records using supported identifiers and dimensions.

**Priority:** Should Have

---

# 12.8 Feature Area H — Data Validation

## FR-25 — KPI Reconciliation

Dashboard KPI values shall be validated against independently executed SQL calculations.

Example:

```text
Dashboard Total Claims
        =
SQL Total Claims
```

**Priority:** Must Have

---

## FR-26 — Data Quality Checks

The analytical process shall identify:

* Duplicate Claim IDs
* Missing Member IDs
* Missing Provider IDs
* Invalid dates
* Invalid financial amounts
* Unmatched dimension records

**Priority:** Must Have

---

# 12.9 Feature Area I — Export

## FR-27 — Data Export

Users should be able to export relevant detailed analytical data where supported by the dashboard platform.

Potential formats:

* CSV
* Excel

**Priority:** Could Have

---

# 13. Feature Prioritization

| Feature               | Priority    | MVP       |
| --------------------- | ----------- | --------- |
| KPI Summary           | Must Have   | Yes       |
| KPI Trends            | Must Have   | Yes       |
| Claims Analytics      | Must Have   | Yes       |
| Claim Status          | Must Have   | Yes       |
| Claim vs Allowed      | Must Have   | Yes       |
| Spend Analytics       | Must Have   | Yes       |
| Provider Ranking      | Must Have   | Yes       |
| Provider Comparison   | Must Have   | Yes       |
| Provider Drilldown    | Must Have   | Yes       |
| Utilization Analytics | Must Have   | Yes       |
| Global Filters        | Must Have   | Yes       |
| Drilldown             | Must Have   | Yes       |
| Claim Detail          | Must Have   | Yes       |
| KPI Reconciliation    | Must Have   | Yes       |
| Data Quality          | Must Have   | Yes       |
| Period Comparison     | Should Have | Later MVP |
| Geographic Analysis   | Should Have | Later MVP |
| Filter Visibility     | Should Have | Later MVP |
| Detail Search         | Should Have | Later MVP |
| Export                | Could Have  | Future    |

---

# 14. Product Acceptance Principles

A feature should not be considered complete simply because the visualization exists.

A feature is considered complete when:

1. The business requirement is understood.
2. The KPI definition is documented.
3. Required data fields are available.
4. The calculation has been validated.
5. The visualization accurately represents the metric.
6. Filters behave consistently.
7. Drilldowns provide the expected level of detail.
8. Relevant users can interpret the output.
9. QA/UAT acceptance criteria are satisfied.

---

# 15. Product Success Definition

The MVP will be considered successful when a target user can:

```text
Open Dashboard
      ↓
Understand Overall Performance
      ↓
Identify an Important Change
      ↓
Filter the Data
      ↓
Drill Down
      ↓
Identify Major Drivers
      ↓
Use the Analysis for Business Investigation
```

This represents the core value proposition of the product.
# 16. KPI & Metric Requirements

## 16.1 KPI Governance Principle

Every KPI displayed in the dashboard must have:

* A clear business definition
* A documented calculation
* A defined data source
* A defined grain
* Defined filter behavior
* Validation against SQL
* A designated business owner

The dashboard must not use ambiguous financial terminology.

---

## 16.2 KPI Catalog

| KPI ID | KPI                             | Category    | Priority    |
| ------ | ------------------------------- | ----------- | ----------- |
| KPI-01 | Total Claims                    | Claims      | Must Have   |
| KPI-02 | Total Claim Amount              | Financial   | Must Have   |
| KPI-03 | Total Allowed Amount            | Financial   | Must Have   |
| KPI-04 | Total Paid Amount               | Financial   | Must Have   |
| KPI-05 | Total Spend                     | Financial   | Must Have   |
| KPI-06 | Unique Members                  | Population  | Must Have   |
| KPI-07 | Claims per Member               | Utilization | Must Have   |
| KPI-08 | Spend per Member                | Financial   | Must Have   |
| KPI-09 | Average Claim Amount            | Financial   | Must Have   |
| KPI-10 | Average Allowed Amount          | Financial   | Must Have   |
| KPI-11 | Denial Rate                     | Claims      | Must Have   |
| KPI-12 | Provider Claims                 | Provider    | Must Have   |
| KPI-13 | Provider Spend                  | Provider    | Must Have   |
| KPI-14 | Provider Average Allowed Amount | Provider    | Should Have |

---

# 16.3 KPI-01 — Total Claims

### Definition

Total number of unique claims within the selected analytical context.

### Formula

```text id="uwt3cr"
COUNT(DISTINCT Claim ID)
```

### Grain

Claim.

### Dimensions

The KPI can be analyzed by:

* Date
* Provider
* Service
* Geography
* Claim Status

### Business Question

> How many claims are being processed?

### Validation

The dashboard value must reconcile with the SQL calculation.

---

# 16.4 KPI-02 — Total Claim Amount

### Definition

Total amount submitted or billed by providers across the selected claims.

### Formula

```text id="0v1db0"
SUM(Claim Amount)
```

### Business Question

> What is the total amount submitted by providers?

### Important Note

Claim Amount should not automatically be interpreted as healthcare Spend.

---

# 16.5 KPI-03 — Total Allowed Amount

### Definition

Total amount recognized or allowed by the payer under the rules represented in the synthetic dataset.

### Formula

```text id="6m6f47"
SUM(Allowed Amount)
```

### Business Question

> What amount has been recognized as allowed across the selected claims?

### Important Distinction

```text id="a5s4cl"
Claim Amount ≠ Allowed Amount
```

---

# 16.6 KPI-04 — Total Paid Amount

### Definition

Total amount represented as paid for claims in the synthetic model.

### Formula

```text id="1q5u4y"
SUM(Paid Amount)
```

### Business Question

> How much has been represented as paid?

### Important Note

Paid Amount is maintained separately from Allowed Amount to prevent incorrect assumptions about financial relationships.

---

# 16.7 KPI-05 — Total Spend

### Definition

Total healthcare spending represented by the project's defined analytical spend measure.

For the initial portfolio model, Spend will be explicitly mapped to the selected financial field and documented in the final KPI dictionary.

### Formula

```text id="8vlm3b"
SUM(Spend Amount)
```

### Business Question

> What is the total healthcare spend for the selected population and period?

### Governance Rule

The project must not use the word "Spend" interchangeably with Claim Amount, Allowed Amount, or Paid Amount without an explicit business definition.

---

# 16.8 KPI-06 — Unique Members

### Definition

Number of distinct members represented in the selected claims population.

### Formula

```text id="o4v4z3"
COUNT(DISTINCT Member ID)
```

### Business Question

> How many members are represented in the selected analytical population?

---

# 16.9 KPI-07 — Claims per Member

### Definition

Average number of claims per unique member.

### Formula

```text id="u5g4tj"
Total Claims / Unique Members
```

### Business Question

> How frequently are members generating claims?

### Example

```text id="6pwhfg"
Total Claims = 10,000
Unique Members = 2,500

Claims per Member = 4.0
```

---

# 16.10 KPI-08 — Spend per Member

### Definition

Average healthcare spend represented per unique member.

### Formula

```text id="0wby3r"
Total Spend / Unique Members
```

### Business Question

> What is the average healthcare spend per member?

### Important Rule

The denominator must be clearly defined.

The project will use unique members within the selected analytical context.

---

# 16.11 KPI-09 — Average Claim Amount

### Definition

Average submitted/billed Claim Amount per unique claim.

### Formula

```text id="v2pk3k"
Total Claim Amount / Total Claims
```

### Business Question

> What is the average submitted amount per claim?

---

# 16.12 KPI-10 — Average Allowed Amount

### Definition

Average Allowed Amount per unique claim.

### Formula

```text id="3ckq2p"
Total Allowed Amount / Total Claims
```

### Business Question

> What is the average allowed amount per claim?

---

# 16.13 KPI-11 — Denial Rate

### Definition

Percentage of claims with a Denied status within the defined claim population.

### Formula

```text id="4j7c6e"
Denied Claims / Total Claims × 100
```

### Business Question

> What percentage of claims are denied?

### Governance Note

The project must explicitly document the denominator and claim population used for this calculation.

---

# 16.14 KPI-12 — Provider Claims

### Definition

Number of unique claims associated with a provider.

### Formula

```text id="ukr5v5"
COUNT(DISTINCT Claim ID)
```

Grouped by:

```text id="5buh31"
Provider ID
```

### Business Question

> How many claims are associated with each provider?

---

# 16.15 KPI-13 — Provider Spend

### Definition

Total defined Spend associated with a provider.

### Formula

```text id="2p9a1c"
SUM(Spend Amount)
```

Grouped by:

```text id="p5yl2y"
Provider ID
```

### Business Question

> Which providers contribute the most to healthcare spend?

---

# 16.16 KPI-14 — Provider Average Allowed Amount

### Definition

Average Allowed Amount per unique claim for a provider.

### Formula

```text id="2rxp5q"
Provider Allowed Amount / Provider Claims
```

### Business Question

> How does the average allowed cost vary across providers?

---

# 17. KPI Filter Behavior

KPIs should dynamically respond to applicable dashboard filters.

### Example

If a user selects:

```text id="5x6l1d"
Service Category = Cardiology
Region = Northeast
Date = Jan–Jun 2026
```

the KPI cards should recalculate based on the filtered analytical population.

---

# 18. KPI Data Grain

KPI calculations must account for the underlying data grain.

The project will distinguish between:

```text id="m1z5wo"
Claim Level
    ↓
Claim Line Level
    ↓
Service Level
```

A claim containing multiple claim lines must not cause claim-level KPIs to be incorrectly duplicated.

### Example

If:

```text id="y8g1w5"
1 Claim
3 Claim Lines
```

then:

```text id="8o9t7h"
COUNT(Claim ID)
```

must return:

```text
1
```

when calculated at the unique-claim level.

---

# 19. KPI Validation Requirements

Each KPI must be independently validated using SQL.

Validation should include:

### Record Count Validation

```text id="6j9td5"
Dashboard Total Claims
=
SQL Total Claims
```

### Financial Validation

```text id="h6apji"
Dashboard Total Allowed Amount
=
SQL SUM(Allowed Amount)
```

### Ratio Validation

```text id="br5w4p"
Dashboard Claims per Member
=
SQL Total Claims / SQL Unique Members
```

### Filter Validation

The same KPI calculation must return consistent results when dashboard filters are applied.

---

# 20. KPI Formatting Requirements

Financial KPIs should use appropriate currency formatting.

Examples:

```text id="4c8q0j"
$1,250
$125.4K
$2.8M
```

Percentages should be displayed consistently.

Example:

```text id="0s7v2b"
12.5%
```

Ratios should use appropriate decimal precision.

Example:

```text id="5i4y8s"
Claims per Member = 3.8
```

The final formatting rules will be defined during dashboard UX design.

---

# 21. KPI Ownership

| KPI Category | Primary Business Owner        | Validation Owner |
| ------------ | ----------------------------- | ---------------- |
| Claims       | Operations Manager            | Data Analyst     |
| Financial    | Business Sponsor / Operations | Data Analyst     |
| Provider     | Provider Network Manager      | Data Analyst     |
| Utilization  | Operations Manager            | Data Analyst     |
| Data Quality | Data Analyst                  | Data / BI Team   |

---

# 22. KPI Governance

Any future KPI change must document:

1. Previous definition
2. New definition
3. Reason for change
4. Business impact
5. Data impact
6. Dashboard impact
7. SQL impact
8. Validation results

This ensures KPI definitions remain controlled and traceable.
# 23. Financial Model

## 23.1 Purpose

The financial model defines how claim-level financial fields relate to each other in the synthetic healthcare insurance dataset.

The model is intentionally simplified for portfolio purposes while preserving realistic analytical relationships.

---

## 23.2 Core Financial Fields

Each claim may contain the following financial fields:

| Field | Business Meaning |
|---|---|
| Claim Amount | Amount submitted/billed by provider |
| Allowed Amount | Amount recognized/allowed under modeled payer rules |
| Member Responsibility | Amount represented as member responsibility |
| Paid Amount | Amount represented as paid by the payer |
| Spend Amount | Analytical spending measure used by the dashboard |

---

## 23.3 Financial Relationship

For the portfolio model, the primary relationship will be:

Claim Amount
        ↓
Allowed Amount
        ↓
Member Responsibility + Paid Amount

Conceptually:

Allowed Amount = Paid Amount + Member Responsibility

This relationship will be applied to paid/processed claims where the synthetic data supports the calculation.

---

## 23.4 Claim Amount

Claim Amount represents the amount submitted or billed by the provider.

Example:

Claim Amount = $500

This represents the provider-submitted amount and should not automatically be treated as the amount recognized or paid.

---

## 23.5 Allowed Amount

Allowed Amount represents the amount recognized by the payer under the modeled rules.

Example:

Claim Amount = $500
Allowed Amount = $350

Therefore:

Allowed Amount < Claim Amount

The synthetic dataset will generally model Allowed Amount as less than or equal to Claim Amount for standard positive claims.

---

## 23.6 Member Responsibility

Member Responsibility represents the portion of the Allowed Amount assigned to the member under the simplified synthetic financial model.

Example:

Allowed Amount = $350
Member Responsibility = $70

---

## 23.7 Paid Amount

Paid Amount represents the portion of the Allowed Amount represented as paid by the payer.

Using the simplified model:

Paid Amount = Allowed Amount - Member Responsibility

Example:

Allowed Amount = $350
Member Responsibility = $70

Paid Amount = $280

Therefore:

Allowed Amount = Paid Amount + Member Responsibility

---

## 23.8 Spend Amount

For this portfolio project:

> Spend Amount will represent the payer-recognized healthcare cost used for dashboard spending analytics.

For the initial MVP, Spend Amount will be defined as:

Spend Amount = Paid Amount

This allows the dashboard to distinguish between:

- Provider-submitted cost
- Payer-allowed cost
- Payer-paid spend
- Member responsibility

The definition will be explicitly documented in the KPI dictionary and data dictionary.

---

## 23.9 Example Financial Scenario

Consider the following synthetic claim:

| Metric | Amount |
|---|---:|
| Claim Amount | $500 |
| Allowed Amount | $350 |
| Member Responsibility | $70 |
| Paid Amount | $280 |
| Spend Amount | $280 |

Relationship:

Allowed Amount = Paid Amount + Member Responsibility

$350 = $280 + $70

And:

Spend Amount = Paid Amount

$280 = $280

---

## 23.10 Financial Business Rules

### FIN-01

Allowed Amount must not exceed Claim Amount for standard positive claims.

### FIN-02

Paid Amount must not exceed Allowed Amount.

### FIN-03

Member Responsibility must not exceed Allowed Amount.

### FIN-04

For paid claims:

Paid Amount + Member Responsibility = Allowed Amount

subject to any explicitly modeled adjustment scenarios.

### FIN-05

Spend Amount must follow the documented Spend definition.

### FIN-06

Claim Amount, Allowed Amount, Paid Amount, and Spend Amount must be stored as separate fields.

### FIN-07

Financial amounts should use a consistent currency representation.

### FIN-08

Negative financial values will not be used for standard claims.

Negative values may be introduced later only if adjustment scenarios are explicitly modeled.

---

# 24. Claim Status & Financial Behavior

The synthetic dataset will support the following simplified statuses:

| Status | Allowed Amount | Paid Amount | Spend |
|---|---|---|---|
| Paid | Yes | Yes | Yes |
| Denied | Typically 0 | 0 | 0 |
| Pending | May be populated | Typically 0 | 0 |
| Adjusted | May be populated | May be populated | Based on final modeled value |

The exact behavior of Pending and Adjusted claims will be documented in the synthetic data specification.

---

# 25. Financial Analytics

The dashboard will provide the following financial perspectives:

## Submitted Cost

Total Claim Amount

Answers:

> How much was submitted/billed by providers?

## Allowed Cost

Total Allowed Amount

Answers:

> How much was recognized/allowed?

## Payer Spend

Total Spend

Answers:

> How much payer spend is represented in the analytical model?

## Member Responsibility

Total Member Responsibility

Answers:

> How much of the allowed amount is represented as member responsibility?

---

# 26. Financial KPI Relationships

The dashboard should allow users to understand:

Claim Amount
        ↓
Allowed Amount
        ↓
├── Paid Amount
└── Member Responsibility

And:

Spend Amount = Paid Amount

This relationship will be reflected in the dashboard UX.

---

# 27. Financial Data Validation

The following checks will be implemented during SQL/data-quality analysis:

### Check 1 — Allowed Amount

Allowed Amount <= Claim Amount

### Check 2 — Paid Amount

Paid Amount <= Allowed Amount

### Check 3 — Member Responsibility

Member Responsibility <= Allowed Amount

### Check 4 — Financial Reconciliation

Paid Amount + Member Responsibility = Allowed Amount

### Check 5 — Spend

Spend Amount = Paid Amount

Exceptions will be identified and investigated rather than silently ignored.

---

# 28. Portfolio Disclaimer

The financial model is a simplified analytical representation designed for portfolio demonstration.

Actual healthcare insurance financial calculations may involve significantly more complex:

- Benefit rules
- Deductibles
- Copayments
- Coinsurance
- Contractual arrangements
- Coordination of benefits
- Adjustments
- Recoveries
- Other payer rules

This project does not attempt to reproduce the complete financial complexity of a production payer claims platform.
