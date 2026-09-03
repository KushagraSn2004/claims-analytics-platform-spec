# Business Requirements Document (BRD)

## US Healthcare Insurance Analytics Dashboard

**Document Version:** 1.0
**Status:** Draft
**Project Type:** Healthcare Insurance Analytics
**Data Classification:** Synthetic / Portfolio-Safe
**Prepared By:** Business Analyst / Product Portfolio Project

---

## 1. Purpose

The purpose of this Business Requirements Document (BRD) is to define the business needs, objectives, scope, stakeholders, and high-level requirements for the US Healthcare Insurance Analytics Dashboard.

The dashboard is intended to provide a centralized analytics experience for monitoring healthcare insurance claims, financial performance, utilization, and provider performance.

This document establishes the business foundation for subsequent product requirements, functional requirements, KPI definitions, data requirements, SQL analysis, and dashboard design.

---

## 2. Business Problem

Healthcare insurance stakeholders need timely and consistent visibility into claims activity, healthcare costs, utilization, and provider performance.

When analytical information is fragmented across multiple reports or datasets, stakeholders may experience:

* Limited visibility into overall healthcare spend
* Inconsistent KPI definitions
* Time-consuming manual analysis
* Difficulty comparing provider performance
* Limited ability to investigate claims trends
* Slower identification of cost and utilization changes

A centralized analytics solution is required to provide standardized KPIs and support self-service analysis.

---

## 3. Business Objective

The primary objective is to develop a centralized healthcare insurance analytics dashboard that enables business, operations, provider-network, and analytics teams to monitor and analyze:

* Claims activity
* Claim Amount
* Allowed Amount
* Healthcare Spend
* Claim status
* Member utilization
* Provider performance
* Service-level trends
* Geographic patterns

The solution should support faster, more consistent, and data-driven business decisions.

---

## 4. Background

Healthcare insurance claims generate significant volumes of transactional and financial data. To derive meaningful insights, stakeholders need the ability to view this data at multiple levels, including:

* Executive level
* Provider level
* Service level
* Geographic level
* Claim level

The proposed dashboard will consolidate analytics from synthetic claims-related datasets into a consistent reporting experience.

The solution will follow the analytical workflow:

```text
Healthcare Service
        ↓
Provider Claim
        ↓
Claim Processing
        ↓
Financial Determination
        ↓
Analytics Data Processing
        ↓
KPI Calculation
        ↓
Dashboard
        ↓
Business Decision
```

---

## 5. Business Goals

The solution should support the following business goals:

### BG-01: Centralize Healthcare Analytics

Provide a unified view of healthcare insurance claims and financial performance.

### BG-02: Standardize KPI Definitions

Establish consistent definitions and calculation logic for claims, financial, utilization, and provider metrics.

### BG-03: Improve Spend Visibility

Enable stakeholders to identify healthcare spending trends and major cost drivers.

### BG-04: Support Provider Analysis

Enable provider-network teams to compare providers based on claims activity, costs, and utilization.

### BG-05: Enable Self-Service Analytics

Reduce dependency on manual reporting by enabling users to explore data through filters, drilldowns, and detailed views.

### BG-06: Improve Decision Support

Provide timely analytics that help stakeholders identify areas requiring further investigation.
## 6. Stakeholders

The following stakeholders are represented in this portfolio project.

| Stakeholder                     | Role                           | Primary Responsibility                                  | Key Interest                              |
| ------------------------------- | ------------------------------ | ------------------------------------------------------- | ----------------------------------------- |
| Business Sponsor                | Executive Business Stakeholder | Defines strategic goals and expected business value     | Overall performance and business outcomes |
| Business / Operations Manager   | Primary Business User          | Monitors claims, spend, and utilization                 | Cost trends and operational performance   |
| Provider Network Manager        | Business User                  | Monitors provider performance and network activity      | Provider costs and utilization            |
| Healthcare Data Analyst         | Analytics User                 | Investigates trends and validates data                  | Detailed analysis and KPI accuracy        |
| Business Analyst                | Requirements Owner             | Elicits, documents, and validates business requirements | Requirement clarity and traceability      |
| Product Manager / Product Owner | Product Owner                  | Prioritizes requirements and defines product direction  | Product value and adoption                |
| Data Engineering Team           | Technical Stakeholder          | Prepares and transforms analytics data                  | Reliable and scalable data pipelines      |
| BI / Analytics Team             | Technical Stakeholder          | Develops dashboards and analytical models               | Accurate visualization and KPI reporting  |

---

## 7. Stakeholder Needs

### 7.1 Business Sponsor

The Business Sponsor needs:

* Visibility into overall business performance
* Consistent executive KPIs
* Clear trends and major cost drivers
* Confidence in the accuracy of reported metrics

### 7.2 Business / Operations Manager

The Business / Operations Manager needs:

* Centralized claims analytics
* Healthcare spend visibility
* Utilization trends
* Service-level analysis
* Geographic analysis
* Interactive filtering and drilldowns

### 7.3 Provider Network Manager

The Provider Network Manager needs:

* Provider performance comparisons
* Provider claims volume
* Provider spend
* Allowed Amount analysis
* Utilization indicators
* Provider-level drilldowns

### 7.4 Healthcare Data Analyst

The Healthcare Data Analyst needs:

* Detailed analytical views
* Claim-level information
* Advanced filtering
* Data validation capability
* Consistent KPI logic
* Ability to investigate KPI changes

### 7.5 Product Manager / Product Owner

The Product Manager / Product Owner needs:

* Clear business objectives
* Prioritized requirements
* Defined MVP scope
* Measurable success criteria
* User feedback and adoption metrics

### 7.6 Data and BI Teams

The Data and BI teams need:

* Clearly defined data requirements
* Consistent KPI calculation rules
* Defined data sources and relationships
* Data-quality requirements
* Clear acceptance criteria for dashboard functionality

---

## 8. Stakeholder Communication Principles

The project will use the following principles when managing stakeholders:

1. **Shared KPI Definitions**
   Business and technical teams must agree on metric definitions before dashboard development.

2. **Traceable Requirements**
   Business requirements should be traceable to functional requirements, data fields, KPIs, and dashboard features.

3. **Regular Validation**
   Stakeholders should validate requirements and KPI outputs throughout the development lifecycle.

4. **Business-First Communication**
   Technical concepts should be translated into business outcomes when communicating with non-technical stakeholders.

5. **Data Transparency**
   Any data limitations, assumptions, or quality issues should be documented clearly.

---

## 9. RACI Summary

| Activity                   | Business Sponsor | Operations Manager | Provider Network Manager | Data Analyst | Business Analyst | Product Manager | Data / BI Team |
| -------------------------- | ---------------- | ------------------ | ------------------------ | ------------ | ---------------- | --------------- | -------------- |
| Define business objectives | A                | C                  | C                        | C            | R                | R               | I              |
| Gather requirements        | I                | C                  | C                        | C            | R                | A               | C              |
| Define KPIs                | C                | C                  | C                        | R            | R                | A               | C              |
| Define data requirements   | I                | C                  | C                        | R            | R                | A               | R              |
| Prioritize features        | A                | C                  | C                        | C            | R                | R               | I              |
| Validate dashboard         | I                | A                  | A                        | R            | R                | C               | C              |
| Approve MVP                | A                | C                  | C                        | I            | R                | R               | I              |

### RACI Key

* **R — Responsible:** Performs the work
* **A — Accountable:** Owns the final decision
* **C — Consulted:** Provides input
* **I — Informed:** Kept updated
## 10. Business Requirements

### BR-01 — Executive Performance Visibility

**Requirement:**
The solution shall provide a centralized executive view of healthcare insurance claims and financial performance.

**Business Need:**
Business stakeholders need a quick understanding of the current healthcare cost and claims position.

**Expected Outcome:**
Users can quickly assess overall performance without manually combining multiple reports.

**Priority:** Must Have

---

### BR-02 — Claims Analytics

**Requirement:**
The solution shall enable users to analyze healthcare claims volume, status, trends, and financial amounts.

**Business Need:**
Stakeholders need visibility into claim activity and changes over time.

**Expected Outcome:**
Users can identify changes in claims volume, status distribution, and claim costs.

**Priority:** Must Have

---

### BR-03 — Healthcare Spend Analytics

**Requirement:**
The solution shall provide visibility into healthcare spending across time, services, providers, and geographic regions.

**Business Need:**
Stakeholders need to understand where healthcare spending is concentrated and how it changes over time.

**Expected Outcome:**
Users can identify major spending categories and potential cost drivers.

**Priority:** Must Have

---

### BR-04 — Allowed Amount Analysis

**Requirement:**
The solution shall provide visibility into Allowed Amount independently from Claim Amount.

**Business Need:**
Stakeholders need to distinguish between the amount submitted by providers and the amount recognized/allowed under the modeled insurance rules.

**Expected Outcome:**
Users can analyze differences between submitted and allowed healthcare costs.

**Priority:** Must Have

---

### BR-05 — Provider Performance Analytics

**Requirement:**
The solution shall allow users to analyze and compare provider-level claims, spending, and utilization.

**Business Need:**
Provider-network teams need visibility into provider cost and utilization patterns.

**Expected Outcome:**
Users can identify providers requiring additional analysis.

**Priority:** Must Have

---

### BR-06 — Utilization Analytics

**Requirement:**
The solution shall provide analytics for healthcare service utilization.

**Business Need:**
Stakeholders need to understand how frequently healthcare services are being used.

**Expected Outcome:**
Users can identify utilization trends across members, providers, services, and time periods.

**Priority:** Must Have

---

### BR-07 — Geographic Analysis

**Requirement:**
The solution shall allow healthcare claims and spending to be analyzed by geographic dimensions represented in the synthetic dataset.

**Business Need:**
Healthcare cost and utilization may vary across geographic markets.

**Expected Outcome:**
Users can identify geographic variations in claims, spend, and utilization.

**Priority:** Should Have

---

### BR-08 — Interactive Filtering

**Requirement:**
The dashboard shall allow users to filter analytics by relevant dimensions.

**Potential Filters:**

* Date
* Provider
* Provider specialty
* Service category
* Claim status
* Geography
* Network status

**Business Need:**
Users need to narrow analysis to specific populations or business segments.

**Expected Outcome:**
Users can perform targeted analysis without requiring separate reports.

**Priority:** Must Have

---

### BR-09 — Drilldown Analysis

**Requirement:**
The solution shall allow users to move from high-level KPIs to increasingly detailed levels of analysis.

**Example:**

```text
Total Spend
    ↓
Service Category
    ↓
Provider
    ↓
Claim
```

**Business Need:**
Users need to understand the underlying drivers behind KPI changes.

**Expected Outcome:**
Users can investigate potential causes of changes without switching between disconnected reports.

**Priority:** Must Have

---

### BR-10 — Standardized KPI Definitions

**Requirement:**
All dashboard KPIs shall have documented business definitions and calculation logic.

**Business Need:**
Different interpretations of metrics can create inconsistent reporting.

**Expected Outcome:**
Business and technical teams use a consistent definition for each KPI.

**Priority:** Must Have

---

### BR-11 — Data Validation

**Requirement:**
Dashboard metrics shall be validated against analytical SQL calculations and underlying synthetic datasets.

**Business Need:**
Incorrect healthcare analytics can result in misleading business decisions.

**Expected Outcome:**
Dashboard metrics reconcile with validated analytical queries within defined tolerances.

**Priority:** Must Have

---

### BR-12 — Data Quality Monitoring

**Requirement:**
The analytical solution shall support identification of common data-quality issues.

**Examples:**

* Missing required fields
* Duplicate claim records
* Invalid dates
* Invalid financial amounts
* Unmatched member/provider records

**Business Need:**
Data-quality issues can affect KPI accuracy.

**Expected Outcome:**
Analysts can identify and investigate data-quality exceptions.

**Priority:** Should Have

---

### BR-13 — Role-Relevant Analytics

**Requirement:**
The dashboard shall provide analytics relevant to different stakeholder groups.

**Business / Operations Manager:**

* Executive KPIs
* Spend trends
* Claims trends
* Utilization

**Provider Network Manager:**

* Provider ranking
* Provider spend
* Provider utilization
* Provider comparison

**Healthcare Data Analyst:**

* Detailed records
* Drilldowns
* Data validation

**Priority:** Must Have

---

### BR-14 — Synthetic Data & Portfolio Safety

**Requirement:**
The portfolio implementation shall use synthetic data and shall not contain real member, provider, claim, PHI, or confidential organizational information.

**Business Need:**
Healthcare information requires appropriate privacy and security considerations.

**Expected Outcome:**
The project can be publicly shared as a portfolio artifact without exposing sensitive information.

**Priority:** Must Have

---

## 11. Business Requirement Prioritization

| Requirement | Description                       | Priority    |
| ----------- | --------------------------------- | ----------- |
| BR-01       | Executive performance visibility  | Must Have   |
| BR-02       | Claims analytics                  | Must Have   |
| BR-03       | Healthcare spend analytics        | Must Have   |
| BR-04       | Allowed Amount analysis           | Must Have   |
| BR-05       | Provider performance              | Must Have   |
| BR-06       | Utilization analytics             | Must Have   |
| BR-07       | Geographic analysis               | Should Have |
| BR-08       | Interactive filtering             | Must Have   |
| BR-09       | Drilldown analysis                | Must Have   |
| BR-10       | KPI standardization               | Must Have   |
| BR-11       | Data validation                   | Must Have   |
| BR-12       | Data quality monitoring           | Should Have |
| BR-13       | Role-relevant analytics           | Must Have   |
| BR-14       | Synthetic data / portfolio safety | Must Have   |
## 12. Business Rules

The following business rules will govern the analytics solution.

### BR-ULE-01 — Claim Amount

Claim Amount represents the amount submitted or billed by the provider for a healthcare service.

It must be stored separately from Allowed Amount and Paid Amount.

---

### BR-ULE-02 — Allowed Amount

Allowed Amount represents the amount recognized or allowed by the payer under the rules represented in the synthetic dataset.

Allowed Amount must not be automatically interpreted as Paid Amount.

---

### BR-ULE-03 — Claim Status

Each claim shall have a defined processing status.

The initial synthetic model will support:

* Paid
* Denied
* Pending
* Adjusted

---

### BR-ULE-04 — Unique Claims

Each claim must have a unique Claim ID.

Duplicate Claim IDs should be identified during data validation.

---

### BR-ULE-05 — Member Relationship

Each claim must reference a valid Member ID in the member dataset.

Unmatched member references should be flagged as data-quality exceptions.

---

### BR-ULE-06 — Provider Relationship

Each claim must reference a valid Provider ID.

Unmatched provider references should be flagged for investigation.

---

### BR-ULE-07 — Financial Amounts

Financial amounts should not contain invalid negative values unless explicitly supported by an adjustment scenario.

---

### BR-ULE-08 — Date Validation

Service dates must contain valid dates and should fall within the analytical period represented by the synthetic dataset.

---

### BR-ULE-09 — KPI Consistency

The same KPI definition must be used across SQL analysis and dashboard reporting.

Any change to a KPI definition must be documented and version-controlled.

---

### BR-ULE-10 — Spend Definition

Spend must have a documented business definition before being used as an executive KPI.

The project will not assume that:

```text id="ly6w4d"
Spend = Claim Amount
```

or

```text id="0lknp4"
Spend = Allowed Amount
```

without an explicit business rule.

---

### BR-ULE-11 — Denial Rate

For the portfolio model:

```text id="fqv1de"
Denial Rate =
Denied Claims / Total Claims × 100
```

The KPI documentation will specify whether the denominator includes all submitted claims or only claims reaching a defined adjudication state.

---

### BR-ULE-12 — Aggregation

Dashboard KPIs must aggregate data at the appropriate grain.

Claim-level metrics must not be incorrectly multiplied by the number of claim lines.

---

## 13. Assumptions

The project is based on the following assumptions:

1. All data is synthetic.
2. The dataset represents a simplified US healthcare insurance environment.
3. Claims contain sufficient information for the defined analytics use cases.
4. Members, providers, services, and claims can be related using unique identifiers.
5. Claim Amount represents submitted/billed value.
6. Allowed Amount represents the recognized/allowed value in the synthetic model.
7. Paid Amount is modeled separately where required.
8. Healthcare Spend will be explicitly defined in the KPI framework.
9. Claims can contain multiple claim lines.
10. The dashboard is designed primarily for analytical and decision-support purposes.
11. Real-time claims processing is outside project scope.
12. Real PHI and confidential organizational information will not be used.

---

## 14. Dependencies

The solution depends on:

### Data Dependencies

* Members dataset
* Providers dataset
* Claims dataset
* Claim lines dataset
* Services dataset
* Geography dataset
* Date/calendar dataset

### Technical Dependencies

* SQL-compatible analytical environment
* BI/dashboard platform
* Data transformation layer
* Analytics-ready data model

### Business Dependencies

* Agreement on KPI definitions
* Agreement on analytical scope
* Stakeholder validation of requirements
* Validation of dashboard outputs

---

## 15. Constraints

The portfolio project has the following constraints:

* Synthetic rather than production data
* Simplified claims processing logic
* No real payer integrations
* No real-time claims feeds
* No PHI
* No production healthcare infrastructure
* Limited representation of complex insurance benefit rules

These constraints are intentional to keep the project portfolio-safe and focused on analytics and product management.

---

## 16. Success Criteria

The solution will be considered successful when:

### Business

* Stakeholders can access core claims and spend KPIs from one dashboard.
* Users can analyze healthcare spending across relevant dimensions.
* Provider performance can be compared using standardized metrics.
* Users can investigate major changes in claims or spend.

### Data

* Dashboard KPIs reconcile with SQL calculations.
* Required relationships between members, providers, claims, and services are valid.
* Major data-quality issues can be identified.
* KPI definitions are documented and traceable.

### Product

* Each core user persona has relevant analytical capabilities.
* Users can filter and drill down into analytics.
* MVP functionality directly supports defined business questions.
* Requirements can be traced from business needs to implementation.

---

## 17. Requirement Traceability

The project will maintain traceability between business needs, KPIs, data, and dashboard capabilities.

| Business Requirement       | KPI / Analysis                 | Data                      | Dashboard Capability     |
| -------------------------- | ------------------------------ | ------------------------- | ------------------------ |
| BR-01 Executive visibility | Core KPI set                   | Claims, Members           | Executive dashboard      |
| BR-02 Claims analytics     | Claims, Claim Status           | Claims                    | Claims dashboard         |
| BR-03 Spend analytics      | Total Spend                    | Claims / Claim Lines      | Spend analysis           |
| BR-04 Allowed Amount       | Total / Average Allowed Amount | Claims                    | Cost analysis            |
| BR-05 Provider performance | Provider Spend, Claims         | Claims + Providers        | Provider dashboard       |
| BR-06 Utilization          | Claims per Member              | Claims + Members          | Utilization analysis     |
| BR-07 Geographic analysis  | Spend by Region                | Claims + Geography        | Geographic view          |
| BR-08 Filtering            | Filtered KPIs                  | All analytical dimensions | Interactive filters      |
| BR-09 Drilldown            | KPI → Detail                   | Claims + Dimensions       | Drilldown                |
| BR-10 KPI consistency      | KPI definitions                | Analytical model          | KPI layer                |
| BR-11 Data validation      | Reconciliation checks          | Source + SQL              | Validation process       |
| BR-12 Data quality         | Quality indicators             | All datasets              | Data-quality analysis    |
| BR-13 Role relevance       | Persona-specific KPIs          | Analytical model          | Role-oriented views      |
| BR-14 Portfolio safety     | Synthetic data                 | Synthetic datasets        | Public GitHub repository |

---

## 18. Definition of Done — Business Requirements

The business requirements phase will be considered complete when:

* Business objectives are documented.
* Stakeholders are identified.
* Business requirements are approved conceptually.
* Business rules are documented.
* Assumptions and dependencies are identified.
* MVP scope is defined.
* Requirements have traceability to KPIs and dashboard capabilities.
* Data and privacy constraints are documented.
