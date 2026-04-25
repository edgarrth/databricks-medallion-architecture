# Resumen de validación

Se realizaron 3 corridas de validación local sobre la lógica equivalente del ETL.

Importante: este entorno no tiene PySpark ni un runtime Databricks disponible, por lo que no se pudo ejecutar un cluster real de Databricks.  
La validación realizada cubre:

1. Apertura y parseo JSON de todos los notebooks `.ipynb`.
2. Compilación sintáctica de celdas Python, excluyendo magics propios de Databricks.
3. Ejecución local equivalente con pandas de las reglas Bronze/Silver/Gold usando los datasets incluidos.

## Resultado

| Corrida | Estado | Clientes | Transacciones enriquecidas | Alertas | Gold daily | Gold segment | Gold customer |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | OK | 6000 | 25000 | 7000 | 365 | 60 | 5901 |
| 2 | OK | 6000 | 25000 | 7000 | 365 | 60 | 5901 |
| 3 | OK | 6000 | 25000 | 7000 | 365 | 60 | 5901 |
