# US Healthcare Insurance Claims Lifecycle

## 1. Overview

A healthcare insurance claim represents a request for payment submitted to an insurance payer for healthcare services provided to an insured member.

The claims lifecycle describes the journey from healthcare service delivery through claim submission, processing, adjudication, payment, and analytics.

For this portfolio project, the lifecycle is represented using synthetic data and simplified business rules.

---

## 2. End-to-End Claims Lifecycle

```text
Member
   ↓
Receives Healthcare Service
   ↓
Provider Creates Claim
   ↓
Claim Submission
   ↓
Claim Validation
   ↓
Claim Adjudication
   ↓
Allowed Amount Determination
   ↓
Claim Decision
   ↓
Payment / Adjustment
   ↓
Claims Data Warehouse
   ↓
Analytics & Dashboard
```

---

## 3. Step 1 — Member Receives Healthcare Service

A member receives a healthcare service from a provider.

Examples include:

* Primary care visit
* Specialist visit
* Emergency room visit
* Diagnostic imaging
* Laboratory test
* Hospital admission
* Outpatient procedure

The service generates information that may later be included in a healthcare insurance claim.

### Example

A synthetic member visits a provider for an outpatient consultation.

```text
Member: M10023
Provider: PRV102
Service: Office Visit
Date: 2026-05-12
```

---

## 4. Step 2 — Provider Creates a Claim

The provider submits information describing the healthcare service.

A simplified claim may contain:

* Claim ID
* Member ID
* Provider ID
* Service date
* Service type
* Diagnosis information
* Procedure/service information
* Claim Amount

### Claim Amount

For this project:

> **Claim Amount represents the amount submitted/billed by the provider for the healthcare service.**

Example:

```text
Claim Amount = $250
```

This is not necessarily the amount the insurer ultimately recognizes or pays.

---

## 5. Step 3 — Claim Submission

The claim is submitted to the insurance payer for processing.

The payer receives the claim and performs validation and processing activities.

For this portfolio model, claim submission is represented as a data event rather than a real-time integration.

---

## 6. Step 4 — Claim Validation

Claims may be evaluated for basic data and processing requirements.

Examples include:

* Required information present
* Member information available
* Provider information available
* Valid service date
* Valid service information
* Duplicate claim checks
* Basic eligibility-related validation

A claim that does not meet required conditions may require correction, rejection, or further processing.

---

## 7. Step 5 — Claim Adjudication

Adjudication is the process of determining how a submitted claim should be handled according to applicable insurance rules, benefits, contractual arrangements, and coverage conditions.

For the portfolio model, adjudication is simplified to produce a claim outcome such as:

* Paid
* Denied
* Pending
* Adjusted

---

## 8. Step 6 — Allowed Amount Determination

The payer determines the amount recognized as payable/allowed for the service based on the applicable insurance and provider arrangement.

For this project:

> **Allowed Amount represents the amount recognized by the payer for the healthcare service after applying the relevant contractual or processing rules represented in the synthetic dataset.**

Example:

```text
Claim Amount   = $250
Allowed Amount = $165
```

Therefore:

```text
Claim Amount ≠ Allowed Amount
```

This distinction is important for our analytics model.

---

## 9. Step 7 — Claim Decision

The claim receives a processing outcome.

### Paid

The claim is approved for payment according to the modeled rules.

### Denied

The claim is not approved for payment under the modeled rules.

### Pending

The claim requires additional processing or information.

### Adjusted

A previously processed claim has been modified or corrected.

---

## 10. Step 8 — Payment / Adjustment

For paid claims, the claim may proceed to payment processing.

Adjustments may occur when claim information or processing results change.

For this portfolio project, payment processing is represented analytically rather than implemented as a real financial transaction.

---

## 11. Step 9 — Data Warehouse / Analytics Layer

Processed claim information is transformed into analytics-ready datasets.

The analytical model can combine:

```text
Members
   +
Providers
   +
Claims
   +
Claim Lines
   +
Services
   +
Dates
   +
Geography
```

These datasets become the foundation for KPI calculations and dashboard analytics.

---

## 12. Step 10 — Dashboard Analytics

The final analytics layer allows stakeholders to monitor:

### Claims

* Claim volume
* Claim status
* Claims trends
* Claim Amount

### Cost

* Allowed Amount
* Healthcare Spend
* Average claim cost
* Spend per member

### Provider

* Provider claims
* Provider spend
* Provider utilization
* Provider comparisons

### Utilization

* Claims per member
* Service frequency
* Service mix

---

## 13. Example Claim Journey

Consider the following synthetic example:

| Attribute      | Value        |
| -------------- | ------------ |
| Claim ID       | CLM10001     |
| Member ID      | M10023       |
| Provider ID    | PRV102       |
| Service        | Office Visit |
| Claim Amount   | $250         |
| Allowed Amount | $165         |
| Status         | Paid         |

The analytical interpretation is:

```text
Provider submits $250
        ↓
Payer processes claim
        ↓
$165 recognized as Allowed Amount
        ↓
Claim status = Paid
        ↓
Claim becomes available for analytics
```

---

## 14. Important Analytics Distinction

The project will maintain separate fields for:

### Claim Amount

Amount submitted/billed by the provider.

### Allowed Amount

Amount recognized/allowed by the payer under the modeled rules.

### Paid Amount

Amount actually represented as paid in the synthetic claims model.

### Spend

A defined analytical measure derived from the project's business rules.

These values should **not automatically be treated as interchangeable**.

The final KPI dictionary will explicitly document the calculation and business meaning of each metric.

---

## 15. Portfolio Simplification

This project does not attempt to reproduce the full complexity of a production US healthcare payer claims platform.

The synthetic model simplifies:

* Eligibility processing
* Benefit calculations
* Contractual rules
* Adjudication logic
* Payment processing
* Claim corrections
* Real-time integrations

The purpose is to demonstrate healthcare insurance analytics and Business Analyst/Product Management capabilities rather than build a production claims-processing system.

---

## 16. Analytics Flow

The overall product flow is:

```text
Healthcare Service
        ↓
Provider Claim
        ↓
Claim Processing
        ↓
Claim Outcome
        ↓
Synthetic Analytics Dataset
        ↓
KPI Calculation
        ↓
Dashboard
        ↓
Business Decision
```

This lifecycle will serve as the foundation for the project's requirements, data model, SQL analysis, KPI definitions, and dashboard UX.
