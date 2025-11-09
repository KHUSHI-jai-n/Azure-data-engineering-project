# Azure data engineering project

The project simulates a real-world data engineering workflow — from data ingestion to data transformation to data serving — using key Azure services.
The pipeline automates the flow of raw data through a lakehouse architecture, making it analytics-ready for downstream reporting.

## Architecture

The architecture follows the Medallion (Bronze–Silver–Gold) design pattern:
- Bronze (Raw Data)	: Stores ingested raw data from source systems (Azure Data Lake Gen2)
- Silver (Transformed Data) :	Cleansed and structured data for analysis	(Azure Databricks (PySpark))
- Gold (Serving Layer) :	Ready-to-consume, aggregated data for reporting	(Azure Synapse Analytics)

## Services Used

1. Azure Data Factory (ADF) – for orchestrating and automating data pipelines.
2. Azure Data Lake Storage Gen2 (ADLS) – for storing raw and transformed data.
3. Azure Databricks – for data transformation using PySpark.
4. Azure Synapse Analytics – for serving the transformed data and enabling SQL-based analytics.

## Project Workflow

1. Data Ingestion (ADF):
- Extracts data from external sources (HTTP, CSV, APIs, etc.).
- Loads the raw files into the Bronze layer (Data Lake).
2. Data Transformation (Databricks + PySpark):
- Reads the raw data from ADLS.
- Performs aggregations, and transformations.
- Writes transformed data to the Silver layer in ADLS.
3. Data Serving (Synapse Analytics):
- The cleansed data is loaded into dedicated Synapse tables.
- Data is ready for SQL querying or integration with Power BI.
Data is ready for SQL querying or integration with Power BI.

