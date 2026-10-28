# Model Risk & EU AI Act Register Pipeline

An end-to-end Analytics Engineering and GRC pipeline that simulates a financial institution's model risk management framework, enforcing ECB model change deadlines and EU AI Act (Article 17) validation evidence requirements.

## The Problem
In 2025, the ECB fined Belfius Bank €6.94 million for failing to implement an approved model change on time and lacking independent validation evidence. Simultaneously, the EU AI Act classifies credit scoring as a High-Risk AI System (Annex III), requiring strict documentation and risk management (Article 17).

## The Solution
This project builds a pipeline that:
1. Models the lifecycle of AI/ML models (Approvals, Deadlines, Implementation Dates) in PostgreSQL.
2. Uses **dbt Core** to enforce automated compliance controls.
3. Includes custom SQL tests that fail the pipeline if:
   - A model is implemented *after* its regulatory deadline (The Belfius Control).
   - A High-Risk AI system is deployed without validation evidence linked to it (The EU AI Act Control).
4. Uses **Python** to export a clean Model Risk Register CSV for the Chief Risk Officer.

## Tech Stack
- **Database:** PostgreSQL
- **Transformation:** dbt Core
- **Data Quality:** dbt schema tests, custom SQL assertions
- **Scripting:** Python (Pandas, SQLAlchemy)
- **Security:** python-dotenv
