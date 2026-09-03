# Synthetic Data

## US Healthcare Insurance Analytics Dashboard

**Data Classification:** Synthetic / Portfolio-Safe  
**Purpose:** Provide artificial healthcare insurance data for SQL analysis, KPI validation, dashboard development, and product analytics.

---

## 1. Purpose

This directory contains synthetic healthcare insurance data created specifically for portfolio demonstration.

The dataset is designed to simulate a simplified US healthcare insurance analytics environment.

It supports:

- Claims analytics
- Financial analytics
- Allowed Amount analysis
- Claim Amount analysis
- Paid Amount analysis
- Spend analysis
- Provider performance
- Member utilization
- Service utilization
- Geographic analysis
- SQL analytics
- KPI validation
- Dashboard development

---

## 2. Data Safety

All data in this directory is artificially generated.

The dataset does not contain:

- Real patient information
- Real member identifiers
- Real claims
- Real medical records
- Real provider financial information
- Real healthcare organization information
- Real addresses
- Real PHI
- Real PII

Identifiers and names are synthetic and created only for portfolio demonstration.

---

## 3. Dataset Components

The synthetic dataset will contain the following core entities:

| Dataset | Purpose | Grain |
|---|---|---|
| members | Member demographics and plan information | One row per member |
| providers | Provider information and performance attributes | One row per provider |
| services | Healthcare service definitions | One row per service |
| claims | Claim-level financial and processing information | One row per claim |
| claim_lines | Service-level claim information | One row per claim line |

---

## 4. Planned Files

The directory will contain:

- `members.csv`
- `providers.csv`
- `services.csv`
- `claims.csv`
- `claim_lines.csv`

Additional validation files may be added later.

---

## 5. Expected Dataset Size

The MVP dataset is designed to be large enough to demonstrate meaningful analytics while remaining easy to understand and process locally.

Target scale:

| Dataset | Approximate Records |
|---|---:|
| Members | 5,000 |
| Providers | 250 |
| Services | 50 |
| Claims | 50,000 |
| Claim Lines | 100,000+ |

The exact record counts may vary slightly depending on synthetic data generation rules.

---

## 6. Members Dataset

### File

`members.csv`

### Grain

One row represents one synthetic member.

### Core Fields

- `member_id`
- `member_age`
- `gender`
- `state`
- `plan_type`
- `enrollment_date`
- `member_status`

### Example Identifier

`MEM-000001`

### Example Plan Types

- PPO
- HMO
- EPO
- POS

---

## 7. Providers Dataset

### File

`providers.csv`

### Grain

One row represents one synthetic provider.

### Core Fields

- `provider_id`
- `provider_name`
- `provider_type`
- `specialty`
- `state`
- `network_status`
- `quality_score`

### Example Identifier

`PRV-000001`

Provider names are synthetic.

---

## 8. Services Dataset

### File

`services.csv`

### Grain

One row represents one synthetic healthcare service.

### Core Fields

- `service_id`
- `service_category`
- `service_name`
- `service_type`
- `specialty`

### Example Identifier

`SRV-000001`

---

## 9. Claims Dataset

### File

`claims.csv`

### Grain

One row represents one unique claim.

### Core Fields

- `claim_id`
- `member_id`
- `provider_id`
- `service_id`
- `service_date`
- `claim_received_date`
- `claim_status`
- `claim_amount`
- `allowed_amount`
- `member_responsibility`
- `paid_amount`
- `spend_amount`
- `place_of_service`
- `geography_id`

### Example Identifier

`CLM-000001`

---

## 10. Claim Lines Dataset

### File

`claim_lines.csv`

### Grain

One row represents one service line within a claim.

A claim may contain multiple claim lines.

### Core Fields

- `claim_line_id`
- `claim_id`
- `service_id`
- `procedure_code`
- `units`
- `line_claim_amount`
- `line_allowed_amount`
- `line_paid_amount`

### Example Identifier

`CL-000001`

---

## 11. Financial Consistency Rules

The synthetic data must follow consistent financial relationships.

### Rule 1

Allowed Amount cannot exceed Claim Amount.

`allowed_amount <= claim_amount`

### Rule 2

Member Responsibility cannot exceed Allowed Amount.

`member_responsibility <= allowed_amount`

### Rule 3

For applicable paid claims:

`paid_amount = allowed_amount - member_responsibility`

### Rule 4

For the MVP:

`spend_amount = paid_amount`

These rules allow financial KPIs to be calculated consistently.

---

## 12. Claim Status Rules

The dataset will contain the following synthetic claim statuses:

| Status | Meaning |
|---|---|
| Paid | Claim has been paid |
| Denied | Claim has been denied |
| Pending | Claim is awaiting processing |
| Adjusted | Claim contains an adjustment scenario |

Status-specific financial behavior will be controlled during data generation.

---

## 13. Referential Integrity

Relationships must remain valid across datasets.

### Member Relationship

`claims.member_id → members.member_id`

### Provider Relationship

`claims.provider_id → providers.provider_id`

### Service Relationship

`claims.service_id → services.service_id`

### Claim Relationship

`claim_lines.claim_id → claims.claim_id`

### Claim-Line Service Relationship

`claim_lines.service_id → services.service_id`

No orphan foreign-key records should exist.

---

## 14. Date Rules

Synthetic service dates will be generated within the defined analytical period.

The dataset will support:

- Monthly analysis
- Quarterly analysis
- Yearly analysis
- Service trends
- Claims trends
- Spend trends

The primary analytical date is:

`service_date`

---

## 15. Geographic Rules

The synthetic dataset will represent multiple US states and geographic regions.

Examples include:

- California
- Texas
- New York
- Florida
- Illinois
- Washington
- Arizona
- Georgia
- Colorado
- North Carolina

State and regional values are synthetic analytical attributes.

---

## 16. Data Quality Requirements

The generated data should pass the following checks:

- Unique primary keys
- Valid foreign keys
- No unexpected null identifiers
- No duplicate claims
- No invalid dates
- No negative financial amounts
- Allowed Amount does not exceed Claim Amount
- Member Responsibility does not exceed Allowed Amount
- Paid Amount follows defined financial logic
- Valid claim statuses
- Valid plan types
- Valid provider relationships
- Valid service relationships

---

## 17. SQL Readiness

The synthetic dataset will be designed for SQL analysis.

Planned SQL analysis includes:

- Total Claims
- Total Claim Amount
- Total Allowed Amount
- Total Paid Amount
- Total Spend
- Average Claim Amount
- Average Allowed Amount
- Claims per Member
- Spend per Member
- Denial Rate
- Provider Spend
- Provider Claim Volume
- Service Utilization
- Geographic Spend
- Monthly Claims Trend
- Monthly Spend Trend

---

## 18. Dashboard Readiness

The dataset will support the dashboard's major analytical areas:

### Executive Overview

- Total Claims
- Total Spend
- Allowed Amount
- Paid Amount
- Unique Members
- Denial Rate

### Claims Analytics

- Claims trend
- Claim status
- Claim volume
- Claim amount
- Allowed amount

### Provider Performance

- Provider claims
- Provider spend
- Average allowed amount
- Network status
- Quality score

### Member Analytics

- Members
- Claims per member
- Spend per member
- Plan type
- Geographic distribution

### Service Analytics

- Service volume
- Service utilization
- Service spend
- Specialty analysis

---

## 19. Dataset Governance

Any change to the synthetic dataset should maintain consistency with:

- Data Dictionary
- Data Model
- BRD
- PRD
- Functional Requirements
- KPI Definitions
- SQL Logic
- Dashboard Requirements

Changes to fields should be documented before implementation.

---

## 20. Portfolio Principle

The dataset is designed to demonstrate realistic analytical thinking without exposing confidential or production healthcare data.

The objective is to demonstrate the ability to:

**Define → Model → Generate → Validate → Analyze → Visualize → Measure**

using a healthcare insurance analytics use case.
