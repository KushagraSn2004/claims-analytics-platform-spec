-- ============================================================================
-- HEALTHCARE CLAIMS ANALYTICS ENGINE - 25 BUSINESS QUERIES
-- Data Model: fact_claims, fact_claim_lines, dim_member, dim_provider, dim_service, dim_date, dim_geography
-- ============================================================================


-- ============================================================================
-- CATEGORY 1: DATA INTEGRITY & PIPELINE QUALITY (Queries 1 - 4)
-- ============================================================================

-- Q1: Check for duplicate primary keys in fact_claims
SELECT 
    claim_id, 
    COUNT(*) AS record_count
FROM fact_claims
GROUP BY claim_id
HAVING COUNT(*) > 1;

-- Q2: Validate financial hierarchy (Allowed Amount <= Claim Amount, No Negatives)
SELECT 
    claim_id,
    claim_amount,
    allowed_amount,
    paid_amount
FROM fact_claims
WHERE allowed_amount > claim_amount
   OR claim_amount < 0
   OR allowed_amount < 0
   OR paid_amount < 0;

-- Q3: Detect orphan claim lines with no parent claim record
SELECT 
    cl.claim_line_id,
    cl.claim_id
FROM fact_claim_lines cl
LEFT JOIN fact_claims c 
    ON cl.claim_id = c.claim_id
WHERE c.claim_id IS NULL;

-- Q4: Verify Member Responsibility & Payer Payment Integrity
-- Rule: Paid Amount + Member Responsibility = Allowed Amount
SELECT 
    claim_id,
    allowed_amount,
    member_responsibility,
    paid_amount,
    (allowed_amount - (member_responsibility + paid_amount)) AS variance
FROM fact_claims
WHERE claim_status = 'Paid'
  AND ABS(allowed_amount - (member_responsibility + paid_amount)) > 0.01;


-- ============================================================================
-- CATEGORY 2: EXECUTIVE SUMMARY & CORE KPIS (Queries 5 - 8)
-- ============================================================================

-- Q5: Executive Enterprise Dashboard Metric Card
SELECT
    COUNT(DISTINCT claim_id) AS total_claims,
    COUNT(DISTINCT member_id) AS total_unique_members,
    SUM(claim_amount) AS total_billed_amount,
    SUM(allowed_amount) AS total_allowed_amount,
    SUM(paid_amount) AS total_paid_amount,
    SUM(spend_amount) AS total_spend
FROM fact_claims;

-- Q6: Claims Adjudication Ratios (Clean Claim vs Denial Rate)
SELECT
    COUNT(DISTINCT claim_id) AS total_claims,
    ROUND(
        COUNT(DISTINCT CASE WHEN claim_status = 'Paid' THEN claim_id END) * 100.0 
        / NULLIF(COUNT(DISTINCT claim_id), 0), 2
    ) AS clean_claim_rate,
    ROUND(
        COUNT(DISTINCT CASE WHEN claim_status = 'Denied' THEN claim_id END) * 100.0 
        / NULLIF(COUNT(DISTINCT claim_id), 0), 2
    ) AS denial_rate
FROM fact_claims;

-- Q7: Average Financial Exposure per Claim
SELECT
    ROUND(SUM(claim_amount) * 1.0 / NULLIF(COUNT(DISTINCT claim_id), 0), 2) AS avg_claim_amount,
    ROUND(SUM(allowed_amount) * 1.0 / NULLIF(COUNT(DISTINCT claim_id), 0), 2) AS avg_allowed_amount,
    ROUND(SUM(paid_amount) * 1.0 / NULLIF(COUNT(DISTINCT claim_id), 0), 2) AS avg_paid_amount
FROM fact_claims;

-- Q8: Contractual Payer Discount Rate
-- Measure of savings achieved from provider-billed charges to allowed rates
SELECT
    SUM(claim_amount) AS total_billed,
    SUM(allowed_amount) AS total_allowed,
    SUM(claim_amount) - SUM(allowed_amount) AS total_discount,
    ROUND(
        (SUM(claim_amount) - SUM(allowed_amount)) * 100.0 / NULLIF(SUM(claim_amount), 0), 
        2
    ) AS discount_savings_percentage
FROM fact_claims;


-- ============================================================================
-- CATEGORY 3: TIME-SERIES & TREND ANALYTICS (Queries 9 - 12)
-- ============================================================================

-- Q9: Monthly Claim Volume by Adjudication Status
SELECT
    d.year,
    d.month,
    d.year_month,
    COUNT(DISTINCT c.claim_id) AS total_claims,
    COUNT(DISTINCT CASE WHEN c.claim_status = 'Paid' THEN c.claim_id END) AS paid_claims,
    COUNT(DISTINCT CASE WHEN c.claim_status = 'Denied' THEN c.claim_id END) AS denied_claims,
    COUNT(DISTINCT CASE WHEN c.claim_status = 'Pending' THEN c.claim_id END) AS pending_claims
FROM fact_claims c
JOIN dim_date d 
    ON c.service_date = d.date
GROUP BY d.year, d.month, d.year_month
ORDER BY d.year, d.month;

-- Q10: Monthly Financial Spend & Payer Exposure
SELECT
    d.year_month,
    SUM(c.claim_amount) AS billed_spend,
    SUM(c.allowed_amount) AS allowed_spend,
    SUM(c.paid_amount) AS net_payer_spend
FROM fact_claims c
JOIN dim_date d 
    ON c.service_date = d.date
GROUP BY d.year_month
ORDER BY d.year_month;

-- Q11: Monthly Denial Rate Tracking (Trend Analysis)
SELECT
    d.year_month,
    COUNT(DISTINCT c.claim_id) AS total_volume,
    COUNT(DISTINCT CASE WHEN c.claim_status = 'Denied' THEN c.claim_id END) AS total_denied,
    ROUND(
        COUNT(DISTINCT CASE WHEN c.claim_status = 'Denied' THEN c.claim_id END) * 100.0 
        / NULLIF(COUNT(DISTINCT c.claim_id), 0), 2
    ) AS monthly_denial_rate
FROM fact_claims c
JOIN dim_date d 
    ON c.service_date = d.date
GROUP BY d.year_month
ORDER BY d.year_month;

-- Q12: Quarterly Financial Variance (QoQ Growth via Window Functions)
WITH quarterly_spend AS (
    SELECT
        d.year,
        d.quarter,
        SUM(c.spend_amount) AS current_spend
    FROM fact_claims c
    JOIN dim_date d 
        ON c.service_date = d.date
    GROUP BY d.year, d.quarter
)
SELECT
    year,
    quarter,
    current_spend,
    LAG(current_spend) OVER (ORDER BY year, quarter) AS previous_quarter_spend,
    ROUND(
        (current_spend - LAG(current_spend) OVER (ORDER BY year, quarter)) * 100.0 
        / NULLIF(LAG(current_spend) OVER (ORDER BY year, quarter), 0), 
        2
    ) AS qoq_growth_percentage
FROM quarterly_spend;


-- ============================================================================
-- CATEGORY 4: PROVIDER PERFORMANCE & BENCHMARKING (Queries 13 - 16)
-- ============================================================================

-- Q13: Top Providers by Total Claim Volume
SELECT
    p.provider_id,
    p.provider_name,
    p.specialty,
    COUNT(DISTINCT c.claim_id) AS total_claims_billed
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.provider_id, p.provider_name, p.specialty
ORDER BY total_claims_billed DESC
LIMIT 10;

-- Q14: Top Providers by Total Financial Spend
SELECT
    p.provider_id,
    p.provider_name,
    p.provider_type,
    SUM(c.spend_amount) AS total_spend_amount
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.provider_id, p.provider_name, p.provider_type
ORDER BY total_spend_amount DESC
LIMIT 10;

-- Q15: Provider Denial Rate Benchmarking
SELECT
    p.provider_id,
    p.provider_name,
    p.network_status,
    COUNT(DISTINCT c.claim_id) AS total_submitted_claims,
    COUNT(DISTINCT CASE WHEN c.claim_status = 'Denied' THEN c.claim_id END) AS denied_count,
    ROUND(
        COUNT(DISTINCT CASE WHEN c.claim_status = 'Denied' THEN c.claim_id END) * 100.0 
        / NULLIF(COUNT(DISTINCT c.claim_id), 0), 2
    ) AS provider_denial_rate
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.provider_id, p.provider_name, p.network_status
HAVING COUNT(DISTINCT c.claim_id) >= 20
ORDER BY provider_denial_rate DESC;

-- Q16: Provider Performance by Medical Specialty
SELECT
    p.specialty,
    COUNT(DISTINCT p.provider_id) AS provider_count,
    COUNT(DISTINCT c.claim_id) AS total_claims,
    SUM(c.spend_amount) AS total_specialty_spend,
    ROUND(SUM(c.allowed_amount) * 1.0 / NULLIF(COUNT(DISTINCT c.claim_id), 0), 2) AS avg_allowed_per_claim
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.specialty
ORDER BY total_specialty_spend DESC;


-- ============================================================================
-- CATEGORY 5: MEMBER UTILIZATION & RISK PROFILING (Queries 17 - 20)
-- ============================================================================

-- Q17: Member Utilization Metrics Across Health Plan Types
SELECT
    m.plan_type,
    COUNT(DISTINCT m.member_id) AS active_claimants,
    COUNT(DISTINCT c.claim_id) AS total_claims,
    ROUND(COUNT(DISTINCT c.claim_id) * 1.0 / NULLIF(COUNT(DISTINCT m.member_id), 0), 2) AS claims_per_member,
    ROUND(SUM(c.spend_amount) * 1.0 / NULLIF(COUNT(DISTINCT m.member_id), 0), 2) AS spend_per_member
FROM fact_claims c
JOIN dim_member m 
    ON c.member_id = m.member_id
GROUP BY m.plan_type
ORDER BY spend_per_member DESC;

-- Q18: High-Cost Claimants (Top 1% Spend Analysis)
SELECT
    c.member_id,
    m.gender,
    COUNT(DISTINCT c.claim_id) AS claim_frequency,
    SUM(c.claim_amount) AS total_billed,
    SUM(c.spend_amount) AS total_payer_spend
FROM fact_claims c
JOIN dim_member m 
    ON c.member_id = m.member_id
GROUP BY c.member_id, m.gender
ORDER BY total_payer_spend DESC
LIMIT 50;

-- Q19: Utilization & Financial Exposure by Demographic Age Band
SELECT
    CASE 
        WHEN m.age < 18 THEN '0-17'
        WHEN m.age BETWEEN 18 AND 34 THEN '18-34'
        WHEN m.age BETWEEN 35 AND 49 THEN '35-49'
        WHEN m.age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+' 
    END AS age_cohort,
    COUNT(DISTINCT m.member_id) AS unique_members,
    COUNT(DISTINCT c.claim_id) AS total_claims,
    SUM(c.spend_amount) AS total_cohort_spend,
    ROUND(SUM(c.spend_amount) * 1.0 / NULLIF(COUNT(DISTINCT m.member_id), 0), 2) AS spend_per_member
FROM fact_claims c
JOIN dim_member m 
    ON c.member_id = m.member_id
GROUP BY 
    CASE 
        WHEN m.age < 18 THEN '0-17'
        WHEN m.age BETWEEN 18 AND 34 THEN '18-34'
        WHEN m.age BETWEEN 35 AND 49 THEN '35-49'
        WHEN m.age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+' 
    END
ORDER BY total_cohort_spend DESC;

-- Q20: In-Network vs. Out-of-Network Financial Leakage
SELECT
    p.network_status,
    COUNT(DISTINCT c.claim_id) AS claim_count,
    SUM(c.claim_amount) AS total_billed,
    SUM(c.allowed_amount) AS total_allowed,
    SUM(c.member_responsibility) AS member_cost_share,
    SUM(c.spend_amount) AS payer_spend,
    ROUND(SUM(c.allowed_amount) * 100.0 / NULLIF(SUM(c.claim_amount), 0), 2) AS allowed_ratio
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.network_status;


-- ============================================================================
-- CATEGORY 6: SERVICE LINE & CLINICAL UTILIZATION (Queries 21 - 23)
-- ============================================================================

-- Q21: Service Categories by Total Spend & Claim Volume
SELECT
    s.service_category,
    COUNT(DISTINCT c.claim_id) AS claim_volume,
    SUM(c.spend_amount) AS total_spend,
    ROUND(SUM(c.allowed_amount) * 1.0 / NULLIF(COUNT(DISTINCT c.claim_id), 0), 2) AS avg_allowed_per_service
FROM fact_claims c
JOIN dim_service s 
    ON c.service_id = s.service_id
GROUP BY s.service_category
ORDER BY total_spend DESC;

-- Q22: Most Frequently Utilized Medical Services (Top Volume Drivers)
SELECT
    s.service_name,
    s.service_category,
    COUNT(DISTINCT c.claim_id) AS service_occurrence_count,
    SUM(c.spend_amount) AS total_service_spend
FROM fact_claims c
JOIN dim_service s 
    ON c.service_id = s.service_id
GROUP BY s.service_name, s.service_category
ORDER BY service_occurrence_count DESC
LIMIT 15;

-- Q23: Claim Line Level Service Breakdown (Preserving Line Grain)
-- Rule: Analysis done on fact_claim_lines to capture multi-procedure lines
SELECT
    s.service_name,
    COUNT(cl.claim_line_id) AS procedure_line_count,
    COUNT(DISTINCT cl.claim_id) AS distinct_claims_impacted,
    SUM(cl.line_paid_amount) AS total_procedure_paid_amount
FROM fact_claim_lines cl
JOIN dim_service s 
    ON cl.service_id = s.service_id
GROUP BY s.service_name
ORDER BY procedure_line_count DESC;


-- ============================================================================
-- CATEGORY 7: GEOGRAPHY & ADJUDICATION CYCLE TIME (Queries 24 - 25)
-- ============================================================================

-- Q24: Geographic Spend & Claims by State
SELECT
    g.state,
    COUNT(DISTINCT c.claim_id) AS total_claims,
    COUNT(DISTINCT c.member_id) AS member_volume,
    SUM(c.spend_amount) AS total_state_spend,
    ROUND(SUM(c.spend_amount) * 1.0 / NULLIF(COUNT(DISTINCT c.member_id), 0), 2) AS state_spend_per_member
FROM fact_claims c
JOIN dim_geography g 
    ON c.geography_id = g.geography_id
GROUP BY g.state
ORDER BY total_state_spend DESC;

-- Q25: Claims Turnaround Time (TAT) / Adjudication Lag Analysis
-- Measures elapsed business days from date of service to claim settlement
SELECT
    c.claim_status,
    COUNT(DISTINCT c.claim_id) AS resolved_claims,
    ROUND(AVG(JULIANDAY(c.adjudication_date) - JULIANDAY(c.service_date)), 1) AS avg_turnaround_days,
    MIN(JULIANDAY(c.adjudication_date) - JULIANDAY(c.service_date)) AS min_turnaround_days,
    MAX(JULIANDAY(c.adjudication_date) - JULIANDAY(c.service_date)) AS max_turnaround_days
FROM fact_claims c
WHERE c.adjudication_date IS NOT NULL
GROUP BY c.claim_status;

-- Q26: Memberr Geographic Distribution & State Utilization
SELECT
    m.state AS member_state,
    COUNT(DISTINCT m.member_id) AS enrolled_members,
    COUNT(DISTINCT c.claim_id) AS claims_count,
    SUM(c.spend_amount) AS total_state_spend,
    ROUND(SUM(c.spend_amount) * 1.0 / NULLIF(COUNT(DISTINCT m.member_id), 0), 2) AS spend_per_resident_member
FROM fact_claims c
JOIN dim_member m 
    ON c.member_id = m.member_id
GROUP BY m.state
ORDER BY total_state_spend DESC;

-- Q27: Provider State-Level Distribution & Local Spend
SELECT
    p.state AS provider_practice_state,
    COUNT(DISTINCT p.provider_id) AS active_providers,
    COUNT(DISTINCT c.claim_id) AS claims_serviced,
    SUM(c.spend_amount) AS total_provider_spend
FROM fact_claims c
JOIN dim_provider p 
    ON c.provider_id = p.provider_id
GROUP BY p.state
ORDER BY total_provider_spend DESC;