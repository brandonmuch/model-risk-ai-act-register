WITH source_data AS (
    -- Model 1: Approved and implemented ON TIME (Compliant)
    SELECT 
        'CHG-001' AS raw_change_id,
        'MOD-100' AS raw_model_id,
        'Credit Scoring Model V2' AS raw_model_name,
        TRUE AS raw_is_high_risk,        -- EU AI Act Annex III High-Risk
        '2025-01-01' AS raw_approval_date,
        '2025-03-01' AS raw_deadline_date,
        '2025-02-15' AS raw_implementation_date
    UNION ALL
    -- Model 2: The Belfius Failure (Implemented LATE)
    SELECT 
        'CHG-002' AS raw_change_id,
        'MOD-200' AS raw_model_id,
        'Fraud Detection Model V3' AS raw_model_name,
        FALSE AS raw_is_high_risk,       -- Not high-risk under AI Act
        '2024-01-01' AS raw_approval_date,
        '2024-06-01' AS raw_deadline_date,
        '2024-09-15' AS raw_implementation_date -- BREACH: 3.5 months late!
)

SELECT 
    raw_change_id AS change_id,
    raw_model_id AS model_id,
    raw_model_name AS model_name,
    raw_is_high_risk AS is_high_risk_ai,
    CAST(raw_approval_date AS DATE) AS approval_date,
    CAST(raw_deadline_date AS DATE) AS deadline_date,
    CAST(raw_implementation_date AS DATE) AS implementation_date
FROM source_data