
setwd("~/Documents/R stuff/Empire-DKP")

library(dplyr)
library(xml2)
library(rvest)
library(readr)

# DKP table
rel_nodes <- read_html("dkp.html", encoding = "UTF-8") %>% 
  html_nodes("div#DKP.tab") %>% 
  html_nodes("div.divTableBody") %>% 
  html_nodes("div.divTableRow")
Player <- rel_nodes %>% 
  html_nodes("div.divPlayer") %>% 
  html_text()
DKP <- rel_nodes %>% 
  html_nodes("div.divDKP") %>% 
  html_text() %>% as.integer()
class_text <- rel_nodes %>% 
  html_nodes("div.divClass") %>%
  as.character() %>%
  substring(111) %>%
  sapply(strsplit, "\\.") %>%
  unlist() %>% unname()

.simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2),
        sep = "", collapse = " ")
}

Class <- class_text[seq(1,length(class_text), by=2)] %>%
  sapply(.simpleCap) %>% unname()

#Player[grep("Britn", Player)] <- "Britnéyfears"

data.frame(Player, Class, DKP) %>% 
  write_csv("dkp.csv")

# Loot history
# rel_nodes2 <- read_html("dkp.html", encoding = "UTF-8") %>% 
#   html_nodes("div#LootHistory.tab") %>% 
#   html_nodes("div.divTableBody") %>% 
#   html_nodes("div.divTableRow")
# Player <- rel_nodes2 %>% 
#   html_nodes("div.divClass") %>% 
#   html_text()
# DKPchange <- rel_nodes2 %>% 
#   html_nodes("div.divPlayer") %>%
#   #html_nodes("a") %>%
#   as.character()
# # %>% 
#   #html_text()
# RaidBoss <- rel_nodes2 %>% 
#   html_nodes("div.divDKP") %>% 
#   html_text()
# as.character(read_html("dkp copy.html"))
# read_html(DKPchange)
# DT::datatable(data.frame(DKPchange), escape=F)
