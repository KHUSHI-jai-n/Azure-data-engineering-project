create view gold.calender
AS
select * from OPENROWSET(
    BULK 'https://storagedatalakekhushi.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) as query1

create view gold.customer
AS
select * from OPENROWSET(
    BULK 'https://storagedatalakekhushi.dfs.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) as query2

create view gold.returns
AS
select * from OPENROWSET(
    BULK 'https://storagedatalakekhushi.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) as query3

create view gold.subcategory
AS
select * from OPENROWSET(
    BULK 'https://storagedatalakekhushi.dfs.core.windows.net/silver/Product_Subcategories/',
    FORMAT = 'PARQUET'
) as query4