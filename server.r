# Load mysql connection package
library(RMySQL)
# hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")

function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    con <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
   
    # query HInv table
     data <- dbReadTable(con, "HInv")
    dbDisconnect(con)
    data
  }))
  
}