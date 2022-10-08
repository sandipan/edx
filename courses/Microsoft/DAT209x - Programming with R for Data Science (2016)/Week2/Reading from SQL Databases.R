#Reading from SQL databases}

library(RODBC)

connStr <- paste(
  "Server=msedxeus.database.windows.net",
  "Database=DAT209x01",
  "uid=RLogin",
  "pwd=P@ssw0rd",
  "Driver={SQL Server}",
  sep=";"
)

if(.Platform$OS.type != "windows"){
  connStr <- paste(
    "Server=msedxeus.database.windows.net",
    "Database=DAT205x01",
    "uid=PBIlogin",
    "pwd=P@ssw0rd",
    "Driver=FreeTDS",
    "TDS_Version=8.0",
    "Port=1433",
    sep=";"
  )    
}

conn <- odbcDriverConnect(connStr)

#A first query

tab <- sqlTables(conn)
head(tab)

#Getting a table

mf <- sqlFetch(conn,"bi.manufacturer")
mf

#Submit real SQL

query <- "
SELECT Manufacturer
FROM   bi.manufacturer 
WHERE  ManufacturerID < 10
"
sqlQuery(conn, query)

#Large tables

sqlQuery(conn, "SELECT COUNT(*) FROM bi.salesFact")
sqlColumns(conn,"bi.salesFact")[c("COLUMN_NAME","TYPE_NAME")]
sqlQuery(conn, "SELECT TOP 2 * FROM bi.salesFact")

df <- sqlQuery(conn, "SELECT * FROM bi.salesFact WHERE Zip='30116'")
dim(df)

sapply(df, class)

#SQL summary statistics

df <- sqlQuery(conn,
               "SELECT    AVG(Revenue), STDEV(Revenue), Zip
   FROM      bi.salesFact
   GROUP BY  Zip"
)
colnames(df) <- c("AVG(Revenue)", "STDEV(Revenue)", "Zip")

close(conn)


