# Introduksjon til R kurs
# Dag 1: Øvelser 1


# 1) Hva er produkt av 4499 og 35?
4499 * 35


# 2) Lage et objekt med navnet ditt og skriv det ut på console.
navn <- "Susie"
navn


# 3) Slå opp hjelpfilen for funksjonen nchar
?nchar


# 4) Bruk funksjonen nchar for å se hvor mange bokstaver navnet ditt innholder
nchar(navn)







#################################################################################
#### Dag 1: Øvelser 2 ####

### Logiske setninger
# 1) Lage en vektor som inneholder tre forskjellige tall. Kalle listen antall_ansatte
antall_ansatte <- c(11, 35, 4)


# 2) Skrive en test for å se hvilken i listen antall_ansatte er mindre enn 5.
antall_ansatte < 5


# 3) Skrive en test for å se om nummer 9 er i listen antall_ansatte
9 %in% antall_ansatte




### Les inn datasett

# 4) Hente inn biblioteket tidyverse
library(tidyverse)


# 5) Åpne datasett "ytelser.csv" uten å lese det inn. Hvilken skilletegn og desimaltegn brukes? 



# 6) Les inn datasett "ytelser.csv"
ytelser <- read_csv2("data/ytelser.csv")


# 7) Se på datasett. Hvor mange variabler har det?
glimpse(ytelser)


# 8) Hva slags type variabel er kommune_nr_navn?
glimpse(ytelser)


# 9) Hva er gjennomsnittsverdi av variabel utbetalt_mill_kr?
summary(ytelser)


