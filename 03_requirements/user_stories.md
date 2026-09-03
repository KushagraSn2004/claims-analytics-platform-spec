# User Stories

## US Healthcare Insurance Analytics Dashboard

**Document Version:** 1.0  
**Status:** Draft  
**Data Classification:** Synthetic / Portfolio-Safe

---

# 1. Purpose

This document translates functional requirements into Agile user stories that can be used for product backlog management, development, QA, and UAT.

Each story contains:

- Story ID
- User Persona
- User Story
- Business Value
- Acceptance Criteria
- Priority
- Story Points
- Related Requirement

---

# 2. User Story Format

Each user story follows:

> **As a [user], I want [capability], so that [business value].**

Acceptance criteria define when the story can be considered complete.

---

# 3. Epic Structure

| Epic | Description |
|---|---|
| EPIC-01 | Executive Analytics |
| EPIC-02 | Claims Analytics |
| EPIC-03 | Financial Analytics |
| EPIC-04 | Provider Performance |
| EPIC-05 | Utilization Analytics |
| EPIC-06 | Dashboard Filtering |
| EPIC-07 | Drilldown & Detail |
| EPIC-08 | Data Quality & Validation |

---

# EPIC-01 — Executive Analytics

## US-001 — View Executive KPIs

**Persona:** Business / Operations Manager

### User Story

> As a Business Manager, I want to see key healthcare insurance KPIs in one place, so that I can quickly understand overall business performance.

### Acceptance Criteria

- [ ] Total Claims is displayed.
- [ ] Total Claim Amount is displayed.
- [ ] Total Allowed Amount is displayed.
- [ ] Total Spend is displayed.
- [ ] Unique Members is displayed.
- [ ] Claims per Member is displayed.
- [ ] Spend per Member is displayed.
- [ ] KPI values reconcile with SQL calculations.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirements:** FR-001 to FR-004

---

## US-002 — View Claims Trend

**Persona:** Business / Operations Manager

### User Story

> As a Business Manager, I want to view claims trends over time, so that I can identify increases or decreases in claims activity.

### Acceptance Criteria

- [ ] Claims can be viewed by month.
- [ ] User can select a date range.
- [ ] Trend updates when filters are applied.
- [ ] Values match the underlying analytical data.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-005

---

# EPIC-02 — Claims Analytics

## US-003 — Analyze Claim Status

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to analyze claims by status, so that I can understand the distribution of paid, denied, pending, and adjusted claims.

### Acceptance Criteria

- [ ] Paid claims are displayed.
- [ ] Denied claims are displayed.
- [ ] Pending claims are displayed.
- [ ] Adjusted claims are displayed.
- [ ] Claim counts are accurate.
- [ ] Status percentages are calculated correctly.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-006

---

## US-004 — Analyze Denial Rate

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to see the claim denial rate, so that I can monitor potential changes in claim processing outcomes.

### Acceptance Criteria

- [ ] Denied claims are correctly identified.
- [ ] Denial Rate uses the approved denominator.
- [ ] Result is displayed as a percentage.
- [ ] Result responds to applicable filters.
- [ ] Result reconciles with SQL.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-007

---

# EPIC-03 — Financial Analytics

## US-005 — Analyze Claim Amount

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to analyze Claim Amount, so that I can understand the amount submitted by providers.

### Acceptance Criteria

- [ ] Total Claim Amount is available.
- [ ] Claim Amount can be analyzed over time.
- [ ] Claim Amount can be analyzed by provider.
- [ ] Claim Amount can be analyzed by service.
- [ ] Values reconcile with SQL.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-002

---

## US-006 — Analyze Allowed Amount

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to analyze Allowed Amount separately from Claim Amount, so that I can understand the amount recognized under the modeled payer rules.

### Acceptance Criteria

- [ ] Total Allowed Amount is displayed.
- [ ] Average Allowed Amount is available.
- [ ] Allowed Amount can be analyzed over time.
- [ ] Allowed Amount can be analyzed by provider.
- [ ] Allowed Amount can be analyzed by service.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-003

---

## US-007 — Compare Claim and Allowed Amount

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to compare Claim Amount and Allowed Amount, so that I can investigate differences between submitted and recognized amounts.

### Acceptance Criteria

- [ ] Claim Amount is displayed.
- [ ] Allowed Amount is displayed.
- [ ] Both metrics use the same analytical context.
- [ ] User can compare them over time.
- [ ] User can compare them by provider or service.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-008

---

## US-008 — Analyze Healthcare Spend

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to analyze healthcare spend, so that I can understand where payer-recognized spending is concentrated.

### Acceptance Criteria

- [ ] Total Spend is displayed.
- [ ] Spend trend is available.
- [ ] Spend can be analyzed by provider.
- [ ] Spend can be analyzed by service.
- [ ] Spend can be analyzed geographically.
- [ ] Spend uses the approved Spend definition.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirements:** FR-004, FR-009 to FR-011

---

# EPIC-04 — Provider Performance

## US-009 — Rank Providers

**Persona:** Provider Network Manager

### User Story

> As a Provider Network Manager, I want to rank providers by performance metrics, so that I can identify high-cost or high-utilization providers for further analysis.

### Acceptance Criteria

- [ ] Providers can be ranked by claims.
- [ ] Providers can be ranked by spend.
- [ ] Providers can be ranked by Allowed Amount.
- [ ] Providers can be ranked by average cost.
- [ ] Ranking responds to filters.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-011

---

## US-010 — Compare Providers

**Persona:** Provider Network Manager

### User Story

> As a Provider Network Manager, I want to compare providers across common KPIs, so that I can understand differences in provider cost and utilization.

### Acceptance Criteria

- [ ] At least two providers can be selected.
- [ ] Providers use the same analytical period.
- [ ] Claims can be compared.
- [ ] Spend can be compared.
- [ ] Allowed Amount can be compared.
- [ ] Average Allowed Amount can be compared.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-012

---

## US-011 — View Provider Details

**Persona:** Provider Network Manager

### User Story

> As a Provider Network Manager, I want to drill into an individual provider, so that I can investigate the provider's claims, spending, services, and utilization.

### Acceptance Criteria

- [ ] Provider details are displayed.
- [ ] Provider claims are displayed.
- [ ] Provider spend is displayed.
- [ ] Provider Allowed Amount is displayed.
- [ ] Provider services are displayed.
- [ ] Provider utilization is displayed.
- [ ] Active filters remain applicable.

**Priority:** Must Have  
**Story Points:** 8  
**Related Requirement:** FR-013

---

# EPIC-05 — Utilization Analytics

## US-012 — Analyze Claims per Member

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to view claims per member, so that I can understand claim utilization across the member population.

### Acceptance Criteria

- [ ] Unique members are calculated correctly.
- [ ] Unique claims are calculated correctly.
- [ ] Formula is applied correctly.
- [ ] Result responds to filters.
- [ ] Division by zero is prevented.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-014

---

## US-013 — Analyze Spend per Member

**Persona:** Business / Operations Manager

### User Story

> As an Operations Manager, I want to view spend per member, so that I can understand average payer spend across the selected member population.

### Acceptance Criteria

- [ ] Unique members are used as denominator.
- [ ] Spend uses the approved Spend definition.
- [ ] Result responds to filters.
- [ ] Division by zero is handled.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-015

---

## US-014 — Analyze Service Utilization

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to analyze utilization by service category, so that I can identify frequently used healthcare services.

### Acceptance Criteria

- [ ] Service categories are displayed.
- [ ] Utilization can be ranked.
- [ ] Results respond to filters.
- [ ] Unknown service categories are handled.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-016

---

# EPIC-06 — Dashboard Filtering

## US-015 — Filter by Date

**Persona:** All Users

### User Story

> As a dashboard user, I want to filter the dashboard by date range, so that I can analyze a specific period.

### Acceptance Criteria

- [ ] User can select a start date.
- [ ] User can select an end date.
- [ ] Dashboard KPIs update.
- [ ] Visualizations update.
- [ ] Active date range is visible.
- [ ] Reset returns to the default period.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-017

---

## US-016 — Filter by Business Dimensions

**Persona:** All Users

### User Story

> As a dashboard user, I want to filter analytics by provider, service, claim status, and geography, so that I can investigate specific segments.

### Acceptance Criteria

- [ ] Provider filter is available.
- [ ] Service filter is available.
- [ ] Claim Status filter is available.
- [ ] Geographic filter is available where supported.
- [ ] Filters update applicable visuals.

**Priority:** Must Have  
**Story Points:** 8  
**Related Requirements:** FR-018 to FR-021

---

## US-017 — Reset Filters

**Persona:** All Users

### User Story

> As a dashboard user, I want to reset all filters, so that I can quickly return to the default dashboard state.

### Acceptance Criteria

- [ ] Reset control is clearly visible.
- [ ] All filters return to default.
- [ ] KPI values return to default.
- [ ] Visualizations return to default.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-022

---

# EPIC-07 — Drilldown & Detail

## US-018 — Drill Down from KPI

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to drill from a high-level KPI into supporting dimensions, so that I can identify the drivers behind changes.

### Acceptance Criteria

- [ ] User can select a KPI or visualization.
- [ ] Drilldown preserves analytical context.
- [ ] User can move from summary to dimension.
- [ ] User can continue to provider or claim detail.
- [ ] User can return to the previous level.

**Priority:** Must Have  
**Story Points:** 8  
**Related Requirement:** FR-023

---

## US-019 — View Claim Details

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to view claim-level details, so that I can investigate the records underlying an analytical result.

### Acceptance Criteria

- [ ] Claim ID is displayed.
- [ ] Member ID is displayed.
- [ ] Provider ID is displayed.
- [ ] Service Date is displayed.
- [ ] Service Category is displayed.
- [ ] Claim Amount is displayed.
- [ ] Allowed Amount is displayed.
- [ ] Paid Amount is displayed.
- [ ] Spend Amount is displayed.
- [ ] Claim Status is displayed.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-024

---

# EPIC-08 — Data Quality & Validation

## US-020 — Detect Duplicate Claims

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to identify duplicate Claim IDs, so that duplicate records do not distort analytical results.

### Acceptance Criteria

- [ ] Duplicate Claim IDs can be identified.
- [ ] Duplicate records are reported.
- [ ] Records are not silently removed.
- [ ] Data-quality results are documented.

**Priority:** Must Have  
**Story Points:** 3  
**Related Requirement:** FR-025

---

## US-021 — Validate Financial Relationships

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to validate financial relationships between Claim Amount, Allowed Amount, Paid Amount, and Member Responsibility, so that financial KPIs remain reliable.

### Acceptance Criteria

- [ ] Allowed Amount <= Claim Amount is validated.
- [ ] Paid Amount <= Allowed Amount is validated.
- [ ] Member Responsibility <= Allowed Amount is validated.
- [ ] Paid Amount + Member Responsibility = Allowed Amount is validated.
- [ ] Spend Amount = Paid Amount is validated.

**Priority:** Must Have  
**Story Points:** 5  
**Related Requirement:** FR-027

---

## US-022 — Reconcile Dashboard KPIs

**Persona:** Healthcare Data Analyst

### User Story

> As a Data Analyst, I want to reconcile dashboard KPIs against SQL calculations, so that I can confirm dashboard accuracy before UAT.

### Acceptance Criteria

- [ ] Total Claims reconciles.
- [ ] Total Claim Amount reconciles.
- [ ] Total Allowed Amount reconciles.
- [ ] Total Paid Amount reconciles.
- [ ] Total Spend reconciles.
- [ ] Unique Members reconciles.
- [ ] Claims per Member reconciles.
- [ ] Spend per Member reconciles.
- [ ] Denial Rate reconciles.

**Priority:** Must Have  
**Story Points:** 8  
**Related Requirement:** FR-028

---

# 4. User Story Prioritization

## Must Have — MVP

US-001  
US-002  
US-003  
US-004  
US-005  
US-006  
US-007  
US-008  
US-009  
US-010  
US-011  
US-012  
US-013  
US-014  
US-015  
US-016  
US-017  
US-018  
US-019  
US-020  
US-021  
US-022

---

# 5. Story Point Summary

| Story Points | Approximate Complexity |
|---:|---|
| 3 | Small |
| 5 | Medium |
| 8 | Large |

Story points represent relative complexity, not hours.

---

# 6. Definition of Ready

A user story is Ready for development when:

- [ ] Business value is clear.
- [ ] User persona is identified.
- [ ] Acceptance criteria are defined.
- [ ] Required data is identified.
- [ ] Dependencies are understood.
- [ ] KPI definitions are available where applicable.
- [ ] UX expectations are understood.
- [ ] Story is small enough to estimate.

---

# 7. Definition of Done

A user story is Done when:

- [ ] Functionality is implemented.
- [ ] Acceptance criteria pass.
- [ ] SQL/data validation is complete where applicable.
- [ ] Dashboard behavior is tested.
- [ ] Edge cases are tested.
- [ ] UAT criteria are satisfied.
- [ ] Documentation is updated.
- [ ] Requirement traceability is maintained.

---

# 8. Traceability

The delivery chain for this project is:

```text
Business Objective
       ↓
BRD
       ↓
PRD
       ↓
Functional Requirement
       ↓
User Story
       ↓
Acceptance Criteria
       ↓
SQL / Data Model
       ↓
Dashboard
       ↓
QA / UAT
