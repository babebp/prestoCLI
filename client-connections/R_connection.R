unavailable_packages <- setdiff(c("RPresto"),  rownames(installed.packages())) 
if (length(unavailable_packages)>0){ 
  install.packages(unavailable_packages) 
}

library('DBI')

connection <- dbConnect(RPresto::Presto(),
                        host='http://localhost',
                        port=8080,
                        user='teacher',
                        schema='information_schema',
                        catalog = 'system'
)

dbListTables(connection)
dbListFields(connection, 'tables')
dbGetQuery(connection, 'SELECT * from tables Limit 20')
