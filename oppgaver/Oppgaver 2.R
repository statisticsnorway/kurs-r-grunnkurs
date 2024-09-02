# -*- coding: utf-8 -*-
# # Oppgaver 2

# ## Hent inn pakken `tidyverse` som skal brukes i oppgavene med funksjonen `library()`



# ## Lag et objekt `teller` som inneholder den numeriske verdien 10 og et objekt `nevner` som inneholder den numeriske verdien 15. Bruk disse objektene til beregne andelen i prosent og lagre resultatet i objektet `andel`.



# ## Bruk objektet `andel` og rund av til én desimal med funksjonen `round()`.



# ## Bruk objektet `andel` og rund av til null desimaler med funksjonen `round()` og gjør deretter om til et heltall med funksjonen `as.integer()`. Se om resultatet blir ulikt om du kun endrer variabeltypen til heltall uten å avrunde først.  



# ## Lag et objekt med navnet ditt (karakter) og et objekt med alderen din (numerisk) og skriv det ut i konsollen. Kall objektene for `navn` og `alder`



# ## Bruk funksjonen `class()` på objektene `navn` og `alder`. Hva forteller denne?



# ## Hva skjer hvis du ikke har fnutter (`""`) omkring navnet ditt når du definerer objektet `navn`? 



# ## Bruk funksjonen `nchar()` for å se hvor mange bokstaver navnet ditt innholder



# ## Bruk funksjonen `substr()` for å hente ut den andre bokstaven i navnet ditt.



# ## Bruk funksjonen `substr()` for å hente ut de to første bokstavene i navnet ditt.



# ## Bruk funksjonen `substr()` for å hente ut det første sifferet i `alder` og lagre resultatet i et nytt objekt som heter `alder_1`.



# ## Lag en kode som øker verdien til objektet `alder` med 1 hver gang koden kjøres. Hint: bruk sjekk variabeltypen til `alder_1`.



# ## Bruk funksjonen `paste()` til å lime sammen objektene `navn` og `alder` til en setning (f.eks. "NAVN er ALDER år gammel"). Prøv deretter å endre fra funksjonen `paste()` til `paste0()` og se hvordan setningen endrer seg. Juster koden slik at den blir lik som den første. 


# ## Opprett følgende objekter:
# - Sett `navn` til en kort tekst som forklarer innholdet i et datasett.
# - Sett `aargang` til et valgfritt år.
# - Sett `versjon` til et helt tall.
#  
# Ifølge den nye navnestandarden på Dapla, skal en fil være på følgende form:
#  
# > `flygende_objekter_p2019_v1.parquet`
#  
# Sett sammen `navn`, `aargang` og `versjon` og sett resultatet til `filnavn`, slik at filnavnet stemmer med navnestandarden.



# ## Lag objektet `aargang` og erstatt alle årstall i denne filstien med verdien fra `aargang`: 
#
# > `/data/prosjekt/2023/årsrapport_2023/backup_2023_rapport.csv`
#
# Lagre filstien i objektet `filsti`. Sjekk at filstien blir oppdatert riktig når du endrer årstallet i `aargang` og kjører koden på nytt.



# ## Bruk funksjonen `gsub()` til å erstatte endelsen ".csv" med ".parquet" i objektet `filsti`



# ## Norske kommunenummer er firesifrede på formen FFKK, der FF er fylkesnummeret og KK er et løpenummer innenfor fylket.
#  
# Lag et objekt `kommunenummer` med et valgfritt kommunenummer og bruk R til å hente ut det korresponderende fylkesnummeret `fylkesnummer` til kommunen. Print ut en passende tekst som inneholder `kommunenummer` og `fylkesnummer`. Oppdater `kommunenummer` med ulike kommunenumre og sjekk at koden din stemmer.



# ## Bruk funksjonen `str_pad()` til å omgjøre `kommunenummer` og `fylkesnummer` til å bestå av 8 tegn. Fyll inn med 0.



# ## Bruk funksjonen `str_extract()` for å hente kommunenummeret fra denne tekststrengen: "Oslo har kommunenummer 0301"



# ## Gjør det samme som i forrige oppgave, men lag en test om strengen inneholder tall (`TRUE`/`FALSE`)



# ## Lag en karaktervektor som heter `handleliste` som inneholder de fem elementene: Banan, Eple, Melk, Brød og Tannpasta



# ## Lag en test for å sjekke hvor mange elementer som finnes i `handleliste`



# ## Hent ut det tredje elementet i `handleliste`.



# ## Lag en test for å sjekke om "Melk" finnes i `handleliste`.



# ## Omgjør `handleliste` til en data frame og hent ut den fjerde raden.



# ## Lag en heltallsvariabel som heter `aar` og sett den til et fødselsår. Lag en if-setning som sjekker om fødselsåret er før 1990. Lag en passende tekst som skrives til skjerm med `print()` dersom kritteriet er oppfylt. Test at logikken stemmer med ulike verdier for `aar`.



# ## Kopier if-setningen din i cellen under og utvid den med en `else` (dersom betingelsen ikke er oppfylt). Skriv en passende melding til skjerm.



# ## Gjør det samme som i oppgaven over, men endre sjekken for om fødselsåret er på 1990-tallet.



# ## Lag en ny variabel, `alder`, som er alderen til en person født i `aar` (se bort i fra fødselsdato). Bruk `alder` i en if-setning for å sjekke om en person med dette fødselsåret er myndig eller ikke. Oppdater `aar` med ulike verdier og se at logikken stemmer.



# ## Lag et objekt med et årstall som heter `aargang` og bruk funksjonen `paste0()` til å lage en filsti til en mappe der du har filer med flere årganger. Dersom du ikke har et eget egnet eksempel lager du en fiktiv filsti. Endre årstallet og se at filstien oppdaterer seg riktig. Prøv gjerne også å lese inn filen som filstien peker til. 



# ## Lag din egen data frame ved å bruke det du har lært om vektorer. Lag deg en miniversjon med fiktive data av et datasett du jobber med. Pass på at det er like mange elementer i hver vektor/kolonne.
#
# Eksempel:

# +
data <- data.frame(AARGANG = 2024,
                   KOMMUNE = c('0301', '0301', '0301', '5001', '4601'),
                   SYKEHUS = c('Ullevål', 'Rikshospitalet', 'Aker', 'St. Olavs', 'Haukeland'),
                   PLASS = c(120, 150, 89, 41, 64))

summary(data)
