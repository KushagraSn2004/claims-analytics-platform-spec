<div align="center">

# 🏥 US Healthcare Insurance Analytics Dashboard

**A portfolio-grade US healthcare insurance analytics project demonstrating end-to-end claims analytics, KPI design, SQL analysis, dashboard UX, and product requirements using synthetic data.**

---

[![Role](https://img.shields.io/badge/Role-Product_Management_%7C_Business_Analysis-0284c7?style=for-the-badge)](#)
[![Domain](https://img.shields.io/badge/Domain-US_Healthcare_Insurance-10b981?style=for-the-badge)](#)
[![Analytics](https://img.shields.io/badge/Stack-SQL_%7C_Data_Modeling_%7C_KPI_Design-f59e0b?style=for-the-badge)](#)
[![Compliance](https://img.shields.io/badge/Data-100%25_Synthetic_%7C_No_PHI-gray?style=for-the-badge)](#)

</div>

---

## 📌 Project Overview

This project demonstrates the end-to-end analysis and product design of a **US Healthcare Insurance Analytics Dashboard**. 

The solution is designed to help healthcare insurance business, operations, provider-network, and analytics teams monitor claims, healthcare spending, allowed amounts, utilization, and provider performance through a centralized analytics experience.

The project covers the complete **Business Analyst / Product Management (BA/PM) Lifecycle**:
- Business problem definition and requirements gathering (BRD & PRD)
- Healthcare KPI design and metric standardization
- Relational data architecture and data dictionary design
- Reproducible synthetic data modeling
- In-depth SQL-based claims analysis
- Dashboard UX and product decision-making

> **🛡️ Portfolio Disclaimer:** This project uses entirely synthetic data generated for portfolio and demonstration purposes. It contains zero confidential, proprietary, Protected Health Information (PHI), or real member/provider records.

---

## 🎯 Project Objectives

* **Centralize Healthcare Insurance Claims Analytics:** Unified analytics layer for header and line-level claims.
* **Standardize Key Healthcare KPIs:** Defined standard metrics across allowed amounts, denial rates, paid ratios, and turnaround times.
* **Analyze Healthcare Spending & Utilization:** Track procedure volume, cost leakage, and network efficiency.
* **Evaluate Provider Performance:** Compare in-network vs. out-of-network costs, volume drivers, and specialty billing patterns.
* **Demonstrate SQL-Based Healthcare Analytics:** Production-ready analytical queries targeting operational bottlenecks and fraud anomalies.
* **Bridge Requirements to Product UX:** Translate raw operational and business pain points into structured user stories, functional requirements, and dashboard designs.
* **Design Scalable Analytics Data Architecture:** Relational data schemas optimized for reporting and reporting pipelines.

---

## 🏗️ Repository Architecture

```text
claims-analytics-platform-spec/
├── 01_business_case/               # Business context, ROI, and scoping
│   ├── business_problem.md         # Industry cost drivers & operational bottlenecks
│   ├── objectives.md               # OKRs, KPIs, and measurable milestones
│   ├── personas.md                 # Payers, claim adjudicators, analysts, providers
│   └── scope.md                    # In-scope vs. out-of-scope boundaries
│
├── 02_healthcare_domain/           # Payer domain primers
│   ├── claims_lifecycle.md         # Submission to final settlement lifecycle
│   ├── healthcare_insurance_terms.md # Lexicon (CPT, ICD, deductible, coinsurance)
│   └── workflow.md                 # Adjudication decision engine sequence
│
├── 03_requirements/                # Product management specifications
│   ├── BRD.md                      # Business Requirements Document
│   ├── PRD.md                      # Product Requirements Document
│   ├── functional_requirements.md  # Detailed technical & business logic
│   └── user_stories.md             # Developer-ready backlog with acceptance criteria
│
├── 04_data/                        # Data governance & schema mapping
│   ├── data_dictionary.md          # Table attributes, types, and constraints
│   └── data_model.md               # Conceptual & physical relational data model
│
├── 05_synthetic_data/              # Data generation pipeline & mock datasets
│   ├── generate_data.py            # Reproducible synthetic generator script
│   ├── members.csv                 # Patient enrollment data
│   ├── providers.csv               # Healthcare facilities and physicians
│   ├── services.csv                # CPT / procedural medical charge catalog
│   ├── claims.csv                  # Claim header records
│   └── claim_lines.csv             # Procedural line-item billing records
│
└── 06_sql/                         # Analytical engine & reporting
    ├── README.md                   # Query documentation & execution guide
    └── claims_analytical_queries.sql # Performance, denial, leakage, and fraud analytics
