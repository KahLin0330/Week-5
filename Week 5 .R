download.file(url = "https://projects.fivethirtyeight.com/soccer-api/international/2022/wc_matches.csv", destfile = "WorldCup.csv")

WorldCup<- read.csv("WorldCup.csv")

install.packages("dplyr")
library(dplyr)

mysample<-sample_n(WorldCup, size=15, replace = FALSE, weight = NULL, .env = NULL)

piping<-mysample %>% 
rename(SoccerPowerIndex = spi1) %>%
subset(SoccerPowerIndex >60) %>%
dim()%>%
print()

mysample2<-mysample 
arrange(mysample2, date)
mysample2<-filter(mysample2, spi1<80)
mysample2<-rename(mysample2, Index1 = spi1, Index2 = spi2)
mysample3<-select(mysample2, Index1, Index2, team1, team2 )
mysample4<-summary(mysample3)
print(mysample4)


pipingdf1<-mysample2%>% 
  arrange(date) %>%
  subset(spi1 < 80) %>%
  rename(Index1 = spi1, Index2 = spi2) %>%
  select(Index1, Index2, team1, team2) %>%
  dim() %>%
  print()





