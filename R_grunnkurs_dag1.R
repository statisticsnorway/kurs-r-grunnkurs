# Eksempler kode for R Introduksjonskurs - DAG 1

#### Beregninger ####
2 + 2
5 - 2
25 * 4
5 ^ 2

# Et lite tall
3E-2

# Et stort tall
3E7

# log av et tall (natural)
log(10)

# exponential tall (e)
exp(2)

# en string
"Hello, world!"

# lim ting sammen til en string
paste("Hello", "Susie")
paste("Hello", "Susie", sep = ", ")
paste("Susie er", 39, "år gammel")

# Plukk ut noen character i en string
substr("Susie liker kake", 1, 2)
substr("Susie liker kake", 13, 16)



#### Objekter ####
grunnlagt <- 1669
grunnlagt

sted <- "Kongsvinger Festning"
sted

# Objekter kan overskrives
grunnlagt <- gunnlagt + 1
grunnlagt

sted <- "Oslo"
sted



# Objekttype
str(sted)
str(grunnlagt)



#### Vektorer ####
# Eksempel på en numerisk vector 
aar <- c(2018, 2019, 2020)
aar

# Eksempel på en kategoriske vektor
flere_sted <- c("Oslo","Kongsvinger", "Rogaland")
flere_sted

# Hvor mange er i vektoren
length(flere_sted)





#### Logiske setninger ####
grunnlagt == 1668
grunnlagt == 1669
aar == 2018

#test for motsetninger
2 != 3

# test for innhold
2018 %in% aar
2015 %in% aar

ifelse(sted == "Oslo", "0301", "3401")




#### lage en datasett ####
steddata <- data.frame(flere_sted, aar)
steddata
View(steddata)

fylkedata <- data.frame(fylke = c("Viken",  "Innlandet"), innbyggere = c(1241000, 371000))
View(fylkedata)




#### Les inn csv fil ####
library(tidyverse)

# Datasett med komma skilletegn
kommunedata <- read_csv("./data/kommunedata.csv")
kommunedata

# Datasett med ; skilletegn
sykemeldingdata_feil <- read_csv("./data/sykemelding.csv")
View(sykemeldingdata_feil)

sykemeldingdata <- read_csv2("./data/sykemelding.csv")
View(sykemeldingdata)




#### Les inn SAS-fil ####
library(haven)
trygd <- read_sas("./data/trygd.sas7bdat")
View(trygd)

?read_sas



#### Les inn fra Statbanken ####
# KPI
# https://www.ssb.no/statbank/table/03013/
library(PxWebApiData)
kpi <- ApiData(03013)
kpi[[2]]

kpi <- ApiData(03013, ContentsCode = "KpiIndMnd", 
               Konsumgrp = "TOTAL",
               Tid = "2020M08")
kpi[[2]]




#### Ser næremere på data ####
glimpse(kommunedata)
summary(kommunedata)
names(kommunedata)


