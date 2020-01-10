
library(shiny)
library(readr)
library(DT)

df_dkp <- as.data.frame(read_csv("dkp.csv"))

ui <- fluidPage(id="page",
                
                tags$style(type = "text/css", "h2 {margin: 0; !important;}"),
                tags$style(type = "text/css", "div.col-sm-6 {margin: 0; padding-left: 0px; padding-right: 0px; !important;}"),
                tags$style(type = "text/css", "div#page.container-fluid::before {display: none; !important;}"),
                tags$style(type = "text/css", "div#page.container-fluid {margin: 0; padding: 0; !important;}"),
                tags$style(type = "text/css", "div.row {margin: 0px 10px 0px 10px; !important;}"),
                tags$style(tupe = "text/css", "#DataTables_Table_0_filter {float: left;}"),
  column(6, 
         titlePanel(
    div(
      h6("DKP status for members of", align="center",
         img(src="Alliance_icon.svg", height=88, width=80, style={'margin-left: 20px;float:left;'}),
         img(src="Alliance_icon.svg", height=88, width=80, style={'margin-right: 20px;float:right;'}), 
         style={'margin:0px;float:center; padding-bottom:0px;padding-top:5px;'}), 
        h1("Empire", align="center", 
         style={'font-family:copperplate; font-size:50px; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black;
    -webkit-font-smoothing: antialiased; color:darkred; margin-top:0px; margin-bottom:0px; padding-top:0px;'}), 
        em(h6("Bloodfang EU", align="center", 
              style={'margin-top:0px; margin-bottom: 5px;'})), #align="center",
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
  column(6,
         div(img(src="Ragnaros_original2.jpg", height="640px", width="740px", style={"margin-top:0px; position: fixed;"}) ) 
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
