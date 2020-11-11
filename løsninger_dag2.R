## Introduksjon til R kurs
## Dag 2: Øvelser 3


# 1) Les inn "ytelser.csv" som ligger i data-mappen
library(tidyverse)
ytelser <- read_csv2("./data/ytelser.csv")


# 2) Lage en ny variabel med kommune nummer (4 siffer)
# Sjekk at den er lagret på datasett med glimpse()
# Hint: kommunenummer er de første 4 siffene i variabel kommune_nr_navn
ytelser <- ytelser %>%
  mutate(kommune_nr = substr(kommune_nr_navn, 1, 4))

glimpse(ytelser)
 

# 3) Lage en ny variabel med fylkesnummer. 
# Hint: fylkenummer er de første 2 siffer i variabel fylke_nr_navn
ytelser <- ytelser %>%
  mutate(fylke_nr = substr(fylke_nr_navn, 1, 2))

glimpse(ytelser)


# 4 ) Bruk filter for å se hvor mye barnetrygd ble utbetalt i 2015 for Kongvinger 
# Hint: Gammel kommunenummer var 0402
# Hint: Variabel utbetalt_mill_kr gis utbetalt verdi
ytelser %>%
  filter(kommune_nr == "0402", 
         stoenadsomraade == "Barnetrygd",
         aar == 2015
         ) %>%
  select(utbetalt_mill_kr)


# 5) Hva er summen av alle ytelsene for Kongsvinger?
ytelser %>% 
  filter(kommune_nr == "0402") %>%
  summarise(belop_mrd = sum(utbetalt_mill_kr)) 


# 6) Hva er summen av alle ytelsene for Oslo per år?
# Hint: Kommmunenummer for Oslo er 0301
ytelser %>% 
  filter(kommune_nr == "0301") %>%
  group_by(aar) %>% 
  summarise(belop_mrd = sum(utbetalt_mill_kr))


# 7) Hvor mange forsekjllige type ytelser ble utbetalt i Oslo i 2014? (Som er i datasett)
# Hint: bruk funksjon n() innen summarise() for å teller antall rader
ytelser %>% 
  filter(kommune_nr == "0301", aar == "2014") %>%
  summarise(antall = n())




#########################################################################################

## Dag 2: Øvelser 4

### Kobling av data

# 1) Les inn filen befolkning.csv som ligger i data-mappe
# Dette innholder befolking per kommune etter aldersgrupper
befolkning <- read_csv2('./data/befolkning.csv')


# 2) Filter datasett så at det kun inneholder antall som er 65+ år per kommune
# Bruk select for å kun beholde variabler Region, value og Tid
# Hint: aldergruppe for de 65+ år heter "F65+"
befolkning <- befolkning %>%
  filter(Alder == "F65+") %>%
  select(Region, value, Tid)

# 3) Endre navn til variabel "value" til "befolk65"
befolkning <- befolkning %>%
  rename(befolk65 = value)


# 4) Koble ytelser og befolkning datasett sammen ved kommunenummer og år som nøkkelvariabel
# Behold kun alle rader i ytelserdatasett
ytelser <- left_join(ytelser, befolkning, by = c("kommune_nr" = "Region", "aar" = "Tid"))
summary(ytelser)


### Figurer

# 5) Lage en linjediagram av total ytelser per år.
# Hint: linjedigarm er samme som punktdiagram men med geom_smooth()
# Hint: Gruppere først, deretter summere, og deretter plott
ytelser %>% 
  group_by(aar) %>% 
  summarise(ytelser = sum(utbetalt_mill_kr)) %>% 
  ggplot(aes(x= aar, y = ytelser)) + 
    geom_line()

# 6) Lage samme plott av ytelser men i milliarder (istedenfor millioner)
# Bruk + ylim(0,500) for å spesifisere y-akser skal være mellom 0 og 500
ytelser %>% 
  group_by(aar) %>% 
  summarise(ytelser = sum(utbetalt_mill_kr)/1000) %>% 
  ggplot(aes(x= aar, y = ytelser)) + 
  geom_line() +
  ylim(0, 500)

# 7) Lage samme plott av ytelser men legg til akse-navn som er mer meningsfult
# Hint: bruk scale_x_coninuous og tilsvarende for y
# Hint: skriv ?scale_x_continuous for hjelpfil
ytelser %>% 
  group_by(aar) %>% 
  summarise(ytelser = sum(utbetalt_mill_kr)/1000) %>% 
  ggplot(aes(x = aar, y = ytelser)) + 
  geom_line() +
  xlab("år") +
  ylab("utbetalt ytelser (milliarder)") + 
  ylim(0, 500)


# 8) Lage en ny linjediagram for ytelser per år farget etter stønadsområde.
# Lage det for Kongvinger 
# Hint: siden datasett innholde utbetalt verdier per stønadsområde, trenger
#       du ikke å oppsummere. Bruk aes(color = ) innen geom_line() til farger
ytelser %>% 
  filter(kommune_nr == "0402")%>%
  group_by(aar) %>% 
  ggplot(aes(x = aar, y = utbetalt_mill_kr)) + 
  geom_line(aes(color = stoenadsomraade))


# 9) lage en punktdiagram av antall 65+ og utbetalt for stønadsområde "Alderspensjon" for 2015
# Legg på en regresjonlinje
ytelser %>%
  filter(aar == 2015, stoenadsomraade == "Alderspensjon") %>%
  ggplot(aes(x = befolk65_2015, y = utbetalt_mill_kr)) + 
  geom_point() + 
  geom_smooth(method = "lm")

