# US Healthcare Insurance: Key Terms

## 1. Overview

This glossary defines the key US healthcare insurance and claims terminology used throughout this portfolio project.

The definitions are simplified for analytics and product documentation purposes and are not intended to represent legal, clinical, or payer-specific policy definitions.

---

# 2. Core Healthcare Insurance Entities

## Payer

The organization responsible for administering health insurance benefits and processing eligible healthcare claims.

**Example in this project:** The payer is the organization whose claims and spending data is being analyzed.

---

## Member

An individual enrolled in a healthcare insurance plan.

A member may receive healthcare services and generate claims that are processed by the payer.

**Key analytics use:** Member count, claims per member, and spend per member.

---

## Provider

A healthcare professional or organization that delivers healthcare services.

Examples include:

* Physicians
* Hospitals
* Clinics
* Laboratories
* Imaging centers

**Key analytics use:** Provider performance, provider spend, and provider utilization.

---

## Provider Network

A group of providers associated with a healthcare insurance plan.

Providers may be classified as:

* In-network
* Out-of-network

Network status can affect how healthcare services and claims are processed.

---

# 3. Claims Terms

## Claim

A request for payment submitted for a healthcare service.

A claim typically contains information about:

* Member
* Provider
* Date of service
* Service or procedure
* Diagnosis
* Submitted amount
* Processing status

---

## Claim ID

A unique identifier assigned to a claim.

**Example:**

```text
CLM10001
```

---

## Claim Line

An individual service or charge within a healthcare claim.

A single claim may contain one or more claim lines.

**Example:**

```text
Claim: CLM10001

Line 1 → Office Visit
Line 2 → Laboratory Test
```

---

## Claim Amount

For this portfolio project:

> The amount submitted or billed by the provider for a healthcare service.

This amount does not necessarily equal the Allowed Amount or Paid Amount.

---

## Allowed Amount

The amount recognized or allowed by the payer for a healthcare service based on the rules represented in the synthetic model.

**Example:**

```text
Claim Amount:   $500
Allowed Amount: $350
```

---

## Paid Amount

The amount represented as paid for an approved claim in the synthetic data model.

Depending on the analytical scenario, Paid Amount may differ from:

* Claim Amount
* Allowed Amount
* Member responsibility

---

## Claim Status

The processing state of a claim.

For this project, the primary statuses are:

| Status   | Description                                      |
| -------- | ------------------------------------------------ |
| Paid     | Claim approved for payment                       |
| Denied   | Claim not approved under modeled rules           |
| Pending  | Claim still undergoing processing                |
| Adjusted | Previously processed claim modified or corrected |

---

## Adjudication

The process used to evaluate and determine how a healthcare claim should be handled according to applicable coverage and processing rules.

For this project, adjudication is represented through the final claim status and financial fields.

---

## Denial

A claim outcome where payment is not approved under the modeled rules.

**Analytics example:**

```text
Denial Rate =
Denied Claims / Total Submitted Claims × 100
```

---

# 4. Cost & Member Responsibility Terms

## Premium

The amount paid to maintain health insurance coverage.

Premiums are generally separate from the healthcare claims analyzed in this dashboard.

---

## Deductible

The amount a member may need to pay before certain insurance benefits apply, depending on the plan.

---

## Copayment (Copay)

A fixed amount a member may pay for a covered healthcare service.

---

## Coinsurance

A percentage of an eligible healthcare cost that may be the member's responsibility after applicable plan rules.

---

## Member Responsibility

The portion of the healthcare cost represented as the member's responsibility in the synthetic model.

It may include modeled components such as:

* Deductible
* Copayment
* Coinsurance

---

# 5. Provider & Network Terms

## In-Network Provider

A provider participating in the health plan's provider network.

For the portfolio dataset, network status may be used as a dimension for cost and utilization analysis.

---

## Out-of-Network Provider

A provider outside the modeled health plan network.

Out-of-network services may have different cost-sharing or processing characteristics.

---

## Provider Specialty

The medical specialty associated with a provider.

Examples:

* Primary Care
* Cardiology
* Orthopedics
* Radiology
* Emergency Medicine

---

# 6. Healthcare Coding Terms

## CPT

**Current Procedural Terminology** codes are used to identify medical procedures and services.

**Portfolio use:** A synthetic or simplified procedure/service code may be included for service-level analytics.

---

## ICD-10

A coding system used to classify diagnoses.

**Portfolio use:** Synthetic diagnosis categories or simplified ICD-10 representations may be included for analytics.

---

## NPI

**National Provider Identifier** is a unique identifier used for healthcare providers in the United States.

**Portfolio use:** This project will use synthetic provider identifiers rather than real provider identifiers.

---

# 7. Analytics Terms

## Utilization

The frequency or level of healthcare service use.

For this project, utilization may be measured using metrics such as:

* Claims per member
* Services per member
* Service frequency

---

## Healthcare Spend

For this project, Spend will be a specifically defined analytical measure.

It will not automatically be assumed to equal Claim Amount, Allowed Amount, or Paid Amount.

The KPI dictionary will define the exact formula used.

---

## Spend per Member

A cost-efficiency metric calculated as:

```text
Total Spend / Unique Members
```

---

## Claims per Member

A utilization metric calculated as:

```text
Total Claims / Unique Members
```

---

## Average Claim Amount

Calculated as:

```text
Total Claim Amount / Number of Claims
```

---

## Average Allowed Amount

Calculated as:

```text
Total Allowed Amount / Number of Claims
```

---

# 8. Explanation of Benefits (EOB)

A document that explains how a healthcare insurance claim was processed.

An EOB may show:

* Healthcare service
* Amount billed
* Amount allowed
* Amount paid
* Member responsibility

An EOB is not necessarily a bill.

For this portfolio project, EOB documents will not be generated.

---

# 9. Key Terms Relationship

```text
Member
   ↓ receives care from
Provider
   ↓ submits
Claim
   ↓ contains
Claim Amount
   ↓ processed through
Adjudication
   ↓ determines
Allowed Amount + Claim Status
   ↓ may result in
Paid Amount + Member Responsibility
   ↓ analyzed through
Healthcare Analytics Dashboard
```

---

# 10. Terms Used in This Project

The following terms will be core to the data model and dashboard:

| Term               | Portfolio Analytics Role            |
| ------------------ | ----------------------------------- |
| Member             | Population and utilization analysis |
| Provider           | Provider performance analysis       |
| Claim              | Core analytical transaction         |
| Claim Line         | Service-level analysis              |
| Claim Amount       | Submitted cost analysis             |
| Allowed Amount     | Recognized cost analysis            |
| Paid Amount        | Payment analysis                    |
| Spend              | Defined KPI measure                 |
| Claim Status       | Processing outcome analysis         |
| Utilization        | Healthcare service usage analysis   |
| Provider Specialty | Provider segmentation               |
| Service Category   | Cost and utilization segmentation   |

---

# 11. Portfolio Note

All examples, identifiers, providers, members, claims, services, and financial values used in this project are synthetic.

This glossary is intended to establish consistent terminology across the project's business requirements, product requirements, data model, SQL queries, KPIs, and dashboard design.
