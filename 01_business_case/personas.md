# User Personas

## 1. Persona Overview

The healthcare insurance analytics dashboard is designed for business and analytics stakeholders who need to monitor claims, healthcare spending, utilization, and provider performance.

The primary personas are:

1. Business / Operations Manager
2. Provider Network Manager
3. Healthcare Data Analyst

---

## 2. Persona 1 — Business / Operations Manager

### Role

Business or Operations Manager responsible for monitoring healthcare insurance performance and identifying trends that may require business action.

### Primary Goal

Understand the overall claims and healthcare spending position and identify significant changes or trends.

### Key Questions

* What is our total healthcare spend?
* How many claims are being processed?
* Is healthcare spend increasing or decreasing?
* Which services contribute most to spend?
* Which geographic regions have higher costs?
* How is utilization changing over time?

### Required Information

* Total Claims
* Total Spend
* Total Allowed Amount
* Total Claim Amount
* Unique Members
* Claims per Member
* Spend per Member
* Monthly/quarterly trends
* Service-level breakdown
* Geographic breakdown

### Dashboard Needs

* Executive KPI cards
* Trend charts
* Spend distribution
* Geographic visualization
* Service-level analysis
* Date filters
* Region filters
* Drilldown capabilities

### Key Decision

Determine where further business analysis or operational attention is required.

---

## 3. Persona 2 — Provider Network Manager

### Role

Provider Network Manager responsible for monitoring provider activity, healthcare cost patterns, and utilization across the provider network.

### Primary Goal

Understand provider-level cost and utilization patterns and identify providers requiring deeper investigation.

### Key Questions

* Which providers have the highest claims volume?
* Which providers generate the highest spend?
* Which providers have higher average Allowed Amounts?
* How does provider utilization compare with peers?
* Which services are driving provider costs?
* Are there significant differences between providers in similar categories?

### Required Information

* Provider Name / ID
* Provider Type
* Provider Specialty
* Claims Volume
* Total Claim Amount
* Total Allowed Amount
* Total Spend
* Average Claim Amount
* Average Allowed Amount
* Utilization
* Service Mix

### Dashboard Needs

* Provider ranking
* Provider comparison
* Spend by provider
* Claims by provider
* Average cost metrics
* Specialty filters
* Geographic filters
* Provider drilldowns

### Key Decision

Identify provider-level cost and utilization patterns requiring additional review.

---

## 4. Persona 3 — Healthcare Data Analyst

### Role

Data Analyst responsible for investigating healthcare claims data, validating KPIs, identifying trends, and supporting business stakeholders with detailed analysis.

### Primary Goal

Investigate the underlying drivers behind changes in healthcare claims and spending metrics.

### Key Questions

* Why did total spend change?
* Which claims are driving the change?
* Which providers contributed to the increase?
* Which services have the highest Allowed Amount?
* Are there duplicate or inconsistent records?
* Do dashboard KPIs reconcile with source data?

### Required Information

* Claim-level records
* Member-level information
* Provider information
* Service information
* Claim status
* Claim Amount
* Allowed Amount
* Dates
* Geography
* Service categories

### Dashboard Needs

* Detailed tables
* Advanced filters
* Drilldowns
* Export capability
* Claim-level views
* Provider-level views
* Data validation indicators

### Key Decision

Determine the underlying drivers of KPI changes and provide evidence-based analysis to business stakeholders.

---

## 5. Persona Comparison

| Persona                       | Primary Focus          | Key Metrics                            | Main Decision                            |
| ----------------------------- | ---------------------- | -------------------------------------- | ---------------------------------------- |
| Business / Operations Manager | Overall performance    | Spend, Claims, Utilization             | Where should the business focus?         |
| Provider Network Manager      | Provider performance   | Provider Spend, Allowed Amount, Claims | Which providers require deeper analysis? |
| Healthcare Data Analyst       | Detailed investigation | Claim-level and provider-level metrics | What is driving the change?              |

---

## 6. Persona-to-Product Mapping

The dashboard should provide different levels of information based on user needs.

### Business / Operations Manager

**Summary → Trend → Breakdown → Decision**

### Provider Network Manager

**Provider Ranking → Comparison → Trend → Investigation**

### Healthcare Data Analyst

**KPI → Drilldown → Claim Detail → Validation**

This hierarchy will be used later when designing the dashboard information architecture and UX.

---

## 7. Portfolio Note

These personas represent synthetic stakeholder profiles created for this portfolio case study. They are not based on identifiable individuals or confidential organizational information.
