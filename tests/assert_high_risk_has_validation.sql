-- EU AI Act Article 17: High-Risk AI systems MUST have validation evidence.
SELECT 
    c.change_id,
    c.model_name
FROM {{ ref('stg_model_changes') }} c
LEFT JOIN {{ ref('stg_validation_evidence') }} v
    ON c.change_id = v.change_id
WHERE c.is_high_risk_ai = TRUE 
  AND v.validation_id IS NULL