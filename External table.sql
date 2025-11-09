create DATABASE SCOPED CREDENTIAL credkhushi
with 
    IDENTITY = 'Managed identity'

CREATE EXTERNAL DATA SOURCE silver_source
with (
    LOCATION = 'https://storagedatalakekhushi.blob.core.windows.net/silver',
    CREDENTIAL = credkhushi
)
CREATE EXTERNAL DATA SOURCE gold_source
with (
    LOCATION = 'https://storagedatalakekhushi.blob.core.windows.net/gold',
    CREDENTIAL = credkhushi
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL TABLE gold.extcust
WITH (
    LOCATION = 'extcust',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
) 
AS
SELECT * from gold.customer --using view