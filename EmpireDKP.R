
library(shiny)
#library(shinyWidgets)
#library(dplyr)
#library(xml2)
#library(rvest)
library(readr)
library(DT)

df_dkp <- as.data.frame(read_csv("dkp.csv"))

ui <- fluidPage( 
  
  titlePanel(
    div(h6("DKP status for members of the guild",img(src="https://gamepedia.cursecdn.com/wowpedia/6/60/AllianceLogo.png?version=5a03696dc7259ecc5cc6d97ec98ee8ea", height=80, width=70, style={'margin-right:10px;float:left;'}), style={'margin:0px; padding-bottom:0px;padding-top:5px;'}), 
        h1("Empire", style={'font-family:copperplate; font-size:50px; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black;
    -webkit-font-smoothing: antialiased; color:darkred; margin-top:0px; margin-bottom:0px; padding-top:0px;'}), 
        em(h6("Bloodfang EU", style={'margin-top:0px;'})), 
        style={'height:90px; width:49%; padding-left:10px; background-color:lightblue;'}
        ),
    windowTitle = "Empire DKP"
  ),
  br(),
      fluidRow(
        column(6, 
               dataTableOutput("dtbl")
        )
      )

)

server <- function(input,output) {
  
  output$dtbl <- renderDataTable(
    options = list(
      pageLength = 50
    ),
    rownames = FALSE,
    df_dkp
  )
  
}


shinyApp(ui, server)