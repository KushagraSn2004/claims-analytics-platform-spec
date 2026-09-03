# Data Dictionary

## US Healthcare Insurance Analytics Dashboard

**Document Version:** 1.0  
**Data Classification:** Synthetic / Portfolio-Safe

---

## 1. Purpose

This document defines the fields used in the synthetic US healthcare insurance analytics dataset.

The dataset supports:

- Claims analytics
- Financial analytics
- Provider performance
- Member utilization
- Service analytics
- KPI calculations
- SQL analysis
- Dashboard reporting
- Data-quality validation

No real patient, provider, payer, or healthcare organization data is used.

---

## 2. Core Tables

The MVP contains five core tables:

| Table | Grain | Purpose |
|---|---|---|
| `members` | One row per member | Member demographics and plan information |
| `providers` | One row per provider | Provider attributes and performance |
| `services` | One row per service | Healthcare service definitions |
| `claims` | One row per claim | Claim-level financial and status data |
| `claim_lines` | One row per claim line | Detailed service-line information |

---

## 3. Members

**Table:** `members`

**Grain:** One row per synthetic member.

| Field | Type | Key | Description |
|---|---|---|---|
| `member_id` | VARCHAR | PK | Unique synthetic member identifier |
| `member_age` | INTEGER | | Member age |
| `gender` | VARCHAR | | Synthetic gender category |
| `state` | VARCHAR | | Member state |
| `plan_type` | VARCHAR | | Insurance plan category |
| `enrollment_date` | DATE | | Synthetic enrollment date |
| `member_status` | VARCHAR | | Active or inactive status |

Example member ID:

`MEM-000001`

---

## 4. Providers

**Table:** `providers`

**Grain:** One row per synthetic provider.

| Field | Type | Key | Description |
|---|---|---|---|
| `provider_id` | VARCHAR | PK | Unique synthetic provider identifier |
| `provider_name` | VARCHAR | | Synthetic provider name |
| `provider_type` | VARCHAR | | Provider category |
| `specialty` | VARCHAR | | Provider specialty |
| `state` | VARCHAR | | Provider state |
| `network_status` | VARCHAR | | In-Network or Out-of-Network |
| `quality_score` | DECIMAL | | Synthetic analytical performance score |

Example provider ID:

`PRV-000001`

Quality score range:

`0–100`

This is a portfolio analytics metric and not a clinical quality rating.

---

## 5. Services

**Table:** `services`

**Grain:** One row per synthetic service type.

| Field | Type | Key | Description |
|---|---|---|---|
| `service_id` | VARCHAR | PK | Unique service identifier |
| `service_category` | VARCHAR | | High-level service category |
| `service_name` | VARCHAR | | Service description |
| `service_type` | VARCHAR | | Professional, outpatient, or inpatient |
| `specialty` | VARCHAR | | Associated specialty |

Example service ID:

`SRV-000001`

Example categories:

- Primary Care
- Specialist
- Emergency
- Inpatient
- Outpatient
- Laboratory
- Imaging
- Pharmacy
- Surgery

---

## 6. Claims

**Table:** `claims`

**Grain:** One row per unique claim.

| Field | Type | Key | Description |
|---|---|---|---|
| `claim_id` | VARCHAR | PK | Unique claim identifier |
| `member_id` | VARCHAR | FK | Member associated with claim |
| `provider_id` | VARCHAR | FK | Provider associated with claim |
| `service_date` | DATE | | Date healthcare service occurred |
| `claim_received_date` | DATE | | Date claim was received |
| `service_id` | VARCHAR | FK | Service associated with claim |
| `claim_status` | VARCHAR | | Claim processing status |
| `claim_amount` | DECIMAL | | Provider-submitted amount |
| `allowed_amount` | DECIMAL | | Payer-recognized allowed amount |
| `member_responsibility` | DECIMAL | | Member responsibility |
| `paid_amount` | DECIMAL | | Payer-paid amount |
| `spend_amount` | DECIMAL | | Analytical payer spend |
| `place_of_service` | VARCHAR | | Simplified service location |

---

## 7. Claim Financial Definitions

### Claim Amount

The provider-submitted amount represented in the synthetic claim.

Example:

`$500.00`

### Allowed Amount

The amount recognized as allowed under the simplified analytical payer model.

Business rule:

`allowed_amount <= claim_amount`

### Member Responsibility

The synthetic portion of the Allowed Amount assigned to the member.

Business rule:

`member_responsibility <= allowed_amount`

### Paid Amount

The synthetic payer payment amount.

Business rule:

`paid_amount = allowed_amount - member_responsibility`

### Spend

For this portfolio:

`spend_amount = paid_amount`

This definition is fixed for the MVP.

---

## 8. Claim Status

| Status | Description |
|---|---|
| Paid | Claim represented as paid |
| Denied | Claim represented as denied |
| Pending | Claim remains pending |
| Adjusted | Claim has an adjustment scenario |

---

## 9. Claim Lines

**Table:** `claim_lines`

**Grain:** One row per claim service line.

| Field | Type | Key | Description |
|---|---|---|---|
| `claim_line_id` | VARCHAR | PK | Unique claim-line identifier |
| `claim_id` | VARCHAR | FK | Parent claim |
| `service_id` | VARCHAR | FK | Service represented by line |
| `procedure_code` | VARCHAR | | Synthetic procedure code |
| `units` | INTEGER | | Number of service units |
| `line_claim_amount` | DECIMAL | | Line-level submitted amount |
| `line_allowed_amount` | DECIMAL | | Line-level allowed amount |
| `line_paid_amount` | DECIMAL | | Line-level paid amount |

---

## 10. Claim vs Claim Line

A claim can contain multiple claim lines.

Example:

| Claim ID | Claim Line |
|---|---|
| CLM-000001 | Line 1 |
| CLM-000001 | Line 2 |
| CLM-000001 | Line 3 |

Therefore, querying claim lines using:

`COUNT(claim_id)`

can overcount claims.

For claim-level KPIs, use:

`COUNT(DISTINCT claim_id)`

---

## 11. Key Relationships

```text
members
   │
   │ member_id
   ↓
claims
   │
   ├── provider_id ──→ providers
   │
   └── service_id ───→ services
   │
   │ claim_id
   ↓
claim_lines
```

---

## 12. Core KPI Mapping

| KPI | Source |
|---|---|
| Total Claims | `claims` |
| Claim Amount | `claims.claim_amount` |
| Allowed Amount | `claims.allowed_amount` |
| Paid Amount | `claims.paid_amount` |
| Spend | `claims.spend_amount` |
| Unique Members | `claims.member_id` |
| Claims per Member | `claims` |
| Spend per Member | `claims` |
| Denial Rate | `claims.claim_status` |
| Provider Claims | `claims.provider_id` |
| Provider Spend | `claims.spend_amount` |
| Service Utilization | `claims.service_id` |

---

## 13. Data Quality Rules

The dataset must support validation for:

- Duplicate Claim IDs
- Missing Member IDs
- Missing Provider IDs
- Missing Service IDs
- Invalid dates
- Negative financial amounts
- Invalid claim statuses
- Invalid financial relationships
- Referential integrity

---

## 14. Synthetic Data Rules

All data must be:

- Artificially generated
- Non-identifiable
- Portfolio-safe
- Internally consistent
- Reproducible
- Suitable for SQL analysis

The dataset must not contain:

- Real patient names
- Real member identifiers
- Real addresses
- Real medical records
- Real claims
- Real provider financial information

---

## 15. Future Extensions

Potential future fields include:

- Diagnosis category
- Procedure category
- Synthetic CPT-like code
- Synthetic ICD-like code
- Network tier
- Benefit plan
- Deductible status
- Copay
- Coinsurance
- Facility type
- Region
- Risk category

These are outside the initial MVP.

---

## Document Status

**Status:** Approved for MVP Data Modeling

**Next Artifact:** Data Model & Star Schema
