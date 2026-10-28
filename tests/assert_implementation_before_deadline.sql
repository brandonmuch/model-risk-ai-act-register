-- ECB Model Risk Control: Models must be implemented by the approved deadline.
SELECT 
    change_id,
    model_name,
    deadline_date,
    implementation_date
FROM {{ ref('stg_model_changes') }}
WHERE implementation_date > deadline_date