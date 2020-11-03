# Eksempler kode for R Introduksjonskurs - DAG 2

#### Lage nye variabler ####
library(tidyverse)

# Les inn datasett med komma skilletegn
kommunedata <- read_csv("./data/kommunedata.csv")
glimpse(kommunedata)

# Lage en ny variabel og log bruttointekt
kommunedata %>%
  mutate(log_bruttoinnt = log(bruttoinnt + 1))

glimpse(kommunedata)

kommunedata <- kommunedata %>%
  mutate(log_bruttoinnt = log(bruttoinnt + 1))
glimpse(kommunedata)

# Lage en variabel med ifelse
kommunedata <- kommunedata %>%
  mutate(region_type = ifelse(nchar(region) == 4, "kommune", "andre"))

# Endre variabeltype for tid
kommunedata <- kommunedata %>%
  mutate(tid = as.character(tid),
         kjonn = as.character(kjonn))



#### Velge ut noen rader ####
# ser på data fra hele Norge
kommunedata %>%
  filter(region == "0")

# Ser på data fra årene 2016 og 2017
kommunedata %>%
  filter(tid %in% c("2016", "2017"))

# Ser på data fra hele Norge for 2018
kommunedata %>%
  filter(region == "0", tid == "2017")




#### Velg ut noen variabler ####
kommunedata %>%
  select(region, kjonn, tid, folkemengde)


kommunedata %>%
  filter(region == "0", kjonn == 2) %>%
  select(tid, bruttoinnt)



#### Oppsummering/aggreging ####
kommunedata %>%
  summarise(mean(folkemengde))

kommunedata %>%
  filter(region_type == "kommune", kjonn == 1) %>%
  summarise(ave_bruttoinnt = mean(bruttoinnt), antall = n())

# NB: dette er gjennomsnitt og antall for alle årene!



#### Gruppering ####
kommunedata %>%
  filter(region_type == "kommune", kjonn == 1) %>%
  group_by(tid) %>%
  summarise(ave_bruttoinnt = mean(bruttoinnt), antall = n())

# antall kommune etter år og kjønn
kommunedata %>%
  filter(region_type == "kommune") %>%
  group_by(tid, kjonn) %>%
  summarise(antall = n()) 

kommunedata %>%
  filter(region_type == "kommune") %>%
  group_by(tid, kjonn) %>%
  summarise(antall = n()) %>%
  spread(tid, antall)


#### Endre variabelnavn ####
kommunedata %>%
  rename(aar = tid)




#### Kobler datasett ####
library(haven)
trygd <- read_sas("./data/trygd.sas7bdat")


# Endrenavn i trygd datasett
names(trygd)
trygd <- trygd %>%
  rename(region = Region,
         kjonn = Kjonn,
         tid = Tid
  )
glimpse(trygd)

# koble
kommunedata <- left_join(kommunedata, trygd, by = c("region", "tid", "kjonn")) 
glimpse(kommunedata)








#### Søylediagram ####
kommunedata %>% ggplot(aes(kjonn)) + 
  geom_bar()

# Antall uforetrygd etter kjønn
kommunedata %>%
  ggplot(aes(x = kjonn, y = UforetygdPers)) +
  geom_bar(stat = "identity")

# Endre format på y-aksen
kommunedata %>%
  ggplot(aes(x = kjonn, y = UforetygdPers)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::comma)

# Vise forskjellige år
kommunedata %>%
  ggplot(aes(x = kjonn, y = UforetygdPers, fill = tid)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::comma) 

# Vise forskjellige år ved siden
kommunedata %>%
  ggplot(aes(x = kjonn, y = UforetygdPers, fill = tid)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_y_continuous(labels = scales::comma) 

# Filter for Kongsvinger
kommunedata %>%
  filter(region == "0402") %>% 
  ggplot(aes(x = kjonn, y = UforetygdPers, fill = tid)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_y_continuous(labels = scales::comma) 



#### Punktdiagram ####
kommunedata %>%
  ggplot(aes(x = folkemengde, y = bruttoinnt)) + 
  geom_point() + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(labels = scales::comma) 

# Filter for kun kommune-nivå data
kommunedata %>%
  filter(region_type == "kommune") %>%
  ggplot(aes(x = folkemengde, y = bruttoinnt)) + 
  geom_point() + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(labels = scales::comma) 

# Legg til regresjonslinje med geom_smotth
kommunedata %>%
  filter(region_type == "kommune") %>%
  ggplot(aes(x = folkemengde, y = bruttoinnt)) + 
  geom_point() + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(labels = scales::comma) +
  geom_smooth(method = "lm")

# Farge etter kjønn
kommunedata %>%
  filter(region_type == "kommune") %>% 
  ggplot(aes(x = folkemengde, y = bruttoinnt)) + 
  geom_point(aes(color = kjonn)) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(labels = scales::comma)


#### Lagre figur ####
png(file = "folkemengde_inntekt.png")

kommunedata %>%
  filter(region_type == "kommune") %>% 
  ggplot(aes(x = folkemengde, y = bruttoinnt)) + 
  geom_point(aes(color = kjonn)) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(labels = scales::comma)

dev.off()




#### Eksportere data/en tabell til excel ####
library(openxlsx)
write.xlsx(kommunedata, file = "kommune_data.xlsx")

