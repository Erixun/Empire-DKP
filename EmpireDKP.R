
library(shiny)
library(readr)
library(DT)

df_dkp <- as.data.frame(read_csv("dkp.csv"))

ui <- fluidPage( 
  
  
  column(6, 
         titlePanel(
    div(
      h6("DKP status for members of", align="center",
         img(src="AllianceLogo.png", height=80, width=70, style={'margin-right:10px;float:left;'}),
         img(src="AllianceLogo.png", height=80, width=70, style={'margin-right:10px;float:right;'}), 
         style={'margin:0px;float:center; padding-bottom:0px;padding-top:5px;'}), 
        h1("Empire", align="center", 
         style={'font-family:copperplate; font-size:50px; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black;
    -webkit-font-smoothing: antialiased; color:darkred; margin-top:0px; margin-bottom:0px; padding-top:0px;'}), 
        em(h6("Bloodfang EU", align="center", 
              style={'margin-top:0px;'})), align="center",
        style={'height:92px; width:100%; padding-left:10px; background-color:lightblue;'}
        ),
    windowTitle = "Empire DKP"
  ),
  br(),
      fluidRow(
               dataTableOutput("dtbl")
      )
  ),
  column(6,
         div(img(src="Ragnaros.jpg", height="980px", width="630px", style={"margin-top:20px;"}) ) 
         )
)

server <- function(input,output) {
  
  output$dtbl <- renderDataTable(
    options = list(
      paging = TRUE,
      pageLength = 20,
      searching = TRUE
      ),
    rownames = FALSE,
    df_dkp
  )
  
}


shinyApp(ui, server)