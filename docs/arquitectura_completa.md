# Arquitectura completa

## Vista lógica

```mermaid
flowchart LR
    A[ADLS Gen2 RAW\nManaged Identity] --> B[Databricks Bronze\nDelta Tables]
    B --> C[Databricks Silver\nClean + Join + Quality]
    C --> D[Databricks Gold\nAnalytical Marts]
    D --> E[Power BI / Databricks SQL Dashboard]
```

## Capas

### RAW
Fuente externa en ADLS Gen2. La conexión se realiza con Managed Identity mediante Access Connector y Unity Catalog External Location.

### Bronze
Copia técnica en Delta Lake con columnas de trazabilidad:
- `_source_file`
- `_ingestion_ts`

### Silver
Datos confiables:
- Tipado correcto.
- Eliminación de duplicados.
- Normalización de textos.
- Reglas de calidad.
- Join de clientes, transacciones y alertas.

### Gold
Marts analíticos:
- KPIs diarios de transacciones.
- Fraude por segmento y canal.
- Perfil de riesgo por cliente.

## Modelo de datos

```mermaid
erDiagram
    CUSTOMERS ||--o{ TRANSACTIONS : has
    TRANSACTIONS ||--o{ FRAUD_ALERTS : triggers

    CUSTOMERS {
      string customer_id
      string segment
      string kyc_status
      string risk_level
      decimal monthly_income_pen
    }

    TRANSACTIONS {
      string transaction_id
      string customer_id
      timestamp transaction_ts
      string channel
      decimal amount_pen
      int is_fraud_confirmed
    }

    FRAUD_ALERTS {
      string alert_id
      string transaction_id
      string alert_rule
      double score
      string alert_status
    }
```
