# Azure data engineering project

The project simulates a real-world data engineering workflow — from data ingestion to data transformation to data serving — using key Azure services.
The pipeline automates the flow of raw data through a lakehouse architecture, making it analytics-ready for downstream reporting.

## Architecture

The architecture follows the Medallion (Bronze–Silver–Gold) design pattern:
| Layer | Purpose | Azure Component |
|-------|----------|----------------|
| **Bronze (Raw Data)** | Stores raw ingested data directly from source | **Azure Data Lake Gen2 – Bronze Container** |
| **Silver (Transformed Data)** | Cleansed and structured data for analytics | **Azure Databricks + PySpark** |
| **Gold (Serving Layer)** | Aggregated, analytics-ready data | **Azure Synapse Analytics** |

## Services Used

- **Azure Data Factory (ADF)** – For pipeline orchestration and data movement  
- **Azure Data Lake Storage Gen2 (ADLS)** – For storing data in bronze, silver, and gold containers  
- **Azure Databricks** – For data transformation using PySpark  
- **Azure Synapse Analytics** – For creating external tables and serving data for reporting  
- *(Optional)* Power BI – For visualization (not implemented in this project)

## Workflow

### 1️⃣ Data Ingestion – *Bronze Layer*
- Created a **dynamic Azure Data Factory pipeline** to load multiple CSV files from **GitHub** (Kaggle dataset hosted on GitHub).  
- Data is stored in the **Bronze container** of the Azure Data Lake.  
- The pipeline dynamically handles file paths and naming conventions.

### 2️⃣ Data Transformation – *Silver Layer*
- Connected **Azure Databricks** to the Bronze container.  
- Used **PySpark** for cleaning, transforming, and standardizing the dataset.  
- Example transformations:
  - Removing duplicates and nulls  
  - Renaming inconsistent columns  
  - Deriving new calculated fields  
- Saved the cleaned data into the **Silver container** in ADLS.

### 3️⃣ Data Serving – *Gold Layer*
- Created an **Azure Synapse Analytics** workspace connected to the Data Lake.  
- Defined **external tables** and **views** on top of the Silver layer using SQL scripts.  
- Used **CETAS (CREATE EXTERNAL TABLE AS SELECT)** to export views into the **Gold container**, producing ready-to-query, structured data.

