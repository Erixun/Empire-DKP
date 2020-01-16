
#setwd("~/Documents/R stuff/empire-dkp")

library(shiny)
library(readr)
library(DT)

df_dkp <- as.data.frame(read_csv("dkp.csv"))

ui <- fluidPage(id="page",
                
  tags$style(type = "text/css", "h2 {margin: 0; !important;}",
  "div#col1 {margin: 0; min-height: 1000px; border: 4px; border-top-style: solid; border-right-style:solid; border-color: black; padding-left: 0px; padding-right: 0px; !important;}",
  "div#page.container-fluid::before {display: none; !important;}",
  "div#page.container-fluid {margin: 0; padding: 0; !important;}",
  "div.row {margin: 0px 10px 0px 10px; !important;}",
  "#DataTables_Table_0_filter {float: left;}"),
  
  column(6, id = "col1", #left column w table
    titlePanel(
      div(
        h6(strong("DKP status for members of"), align="center",
           img(src="Alliance_icon.svg", height=88, width=80, style={'margin-left: 20px;float:left;'}),
           img(src="Alliance_icon.svg", height=88, width=80, style={'margin-right: 20px;float:right;'}), 
           style={'margin:0px;float:center; padding-bottom:0px;padding-top:6px;'}), 
          h1("EMPIRE", align="center", 
           style={'font-size:55px; font-weight: bold; -webkit-text-stroke-width: 3px; -webkit-text-stroke-color: black;
      -webkit-font-smoothing: antialiased; color:darkred; margin-top:-1px; margin-bottom:-7px; padding-top:0px;'}), 
          em(h6("Bloodfang EU", align="center", 
                style={'margin-top:1px; margin-bottom: 5px; padding-top: 3px;'})), #align="center",
          style={'height: 95px; width: auto; margin-top: 10px; margin-left: 10px; margin-right: 10px; padding: 0; background-color:lightblue;'}
          ),
      windowTitle = "Empire DKP"
    ),
    br(),
    fluidRow(
      dataTableOutput("dtbl")
    ),
    style={"margin-top: 0px;"}
  ),
  
  column(6, id="col2",#right column w bgimage
    div(
      img(src="Ragnaros_original2.jpg", height="100%", width="50%", style={"margin-top:0px; margin-left: -15px; position: fixed;"}) 
       ) 
      )
)

server <- function(input,output) {
  
  output$dtbl <- renderDataTable(
    options = list(
      paging = FALSE,
      #pageLength = 20,
      searching = TRUE
      ),
    rownames = FALSE,
    df_dkp
  )
  
}


shinyApp(ui, server)
