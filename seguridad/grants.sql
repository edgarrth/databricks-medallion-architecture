-- Ajustar grupos a los nombres reales del workspace
GRANT USE CATALOG ON CATALOG fintech_lakehouse TO `data_engineers`;
GRANT USE SCHEMA ON SCHEMA fintech_lakehouse.gold TO `data_analysts`;
GRANT SELECT ON SCHEMA fintech_lakehouse.gold TO `business_viewers`;
