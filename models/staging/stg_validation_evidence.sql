WITH source_data AS (
    -- Evidence exists for Model 1
    SELECT 
        'VAL-001' AS raw_validation_id,
        'CHG-001' AS raw_change_id,
        '2025-01-15' AS raw_validation_date,
        'https://bank.com/audit/val-001.pdf' AS raw_evidence_url
    UNION ALL
    -- Model 2 has NO validation evidence
    SELECT 
        'VAL-002' AS raw_validation_id,
        'CHG-999' AS raw_change_id, -- Orphaned/dummy record
        '2024-05-01' AS raw_validation_date,
        NULL AS raw_evidence_url
)

SELECT 
    raw_validation_id AS validation_id,
    raw_change_id AS change_id,
    CAST(raw_validation_date AS DATE) AS validation_date,
    raw_evidence_url AS evidence_url
FROM source_data