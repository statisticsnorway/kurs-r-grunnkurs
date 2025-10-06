# -*- coding: utf-8 -*-
# # Oppgaver 1

# ## Åpne RStudio. Hva er konsollen og hva er miljøvinduet? Bruk  konsollen som kalkulator og gjør noen regnestykker. 



# ## I konsollen: definer objektet `mitt_tall` hvor du lagrer yndlingstallet ditt. Hva skjer i miljøvinduet når du gjør dette? 



# ## Skriv `mitt_tall` i konsollen. Hva skjer?



# ## Definer et annet objekt (finn på navnet selv) og gjør noen regnestykker med de to objektene du nå har definert.



# ## Definer et tredje objekt som summen av de to første objektene. 



# ## Trykk på feiekosten i miljøvinduet. Hva skjer? 



# ## Skriv `mitt_tall` i konsollen nå. Hva skjer?  



# ## Opprett et nytt R skript fra nedtrekksmenyen. 



# ## I skriptet definerer du de samme objektene som i oppgavene 2-4 (`mitt_tall` + egendefinert objekt). Kjør skriptet. Hva skjer? 



# ## Lagre skriptet som `my_first_Rskript.R` eller noe lignende. 



# ## Lukk skriptet, trykk på feiekosten i miljøvinduet. Kall på de definerte objektene i konsolen. Hva skjer?  



# ## Åpne skriptet du nettopp lagde og kjør det på nytt.



# ## Lag et objekt som inneholder et tall med fire desimaler.



# ## Bruk funksjonen `round()` til å runde av dette objektet til ingen, én og to desimaler



# ## Hva skjer hvis du skriver og kjører `3 > 2` i scriptet? Hva med `3 == 2`? Og `3 < 2`?  Hvilken type objekt har disse? (`class()`)



# ## Hva skjer hvis du skriver `3 = 2`?



# ## Definer et objekt (`vektor_tall`) som er en vektor med tre tall. 



# ## Hent det tredje elementet i vektoren (`vektor_tall`). 



# ## Finn lengden på vektoren (`vektor_tall`) ved å bruke funksjonen `length()`



# ## Hva skjer hvis du anvender funksjonen `sum()`  på vektoren `vektor_tall`? 



# ## Opprett en annen vektor, også denne med tre tall. 



# ## Gjør noen regneoperasjoner med vektoren. Hva skjer? 



# ## Definer en vektor med fire tall (`vektor_tall_4`). Hva skjer hvis du prøver å summere vektoren med fire tall med en av vektorene med tre tall?



# ## Kombiner de to vektorer til én vektor (vektor_tall_7). Dvs. slå sammen `vektor_tall` og `vektor_tall_4` slik at du får én vektor med length() = 7.



# ## Opprett vektoren `statsminister` med koden nedenfor. Bruk deretter funksjonene `class()`, `length()`, `unique()` og `table()` på dette objektet. Hva forteller disse? 

statsminister <- c("Brundtland", 
                   "Willoch", 
                   "Brundtland", 
                   "Syse", 
                   "Brundtland", 
                   "Jagland", 
                   "Bondevik", 
                   "Stoltenberg", 
                   "Bondevik", 
                   "Stoltenberg", 
                   "Solberg", 
                   "Støre")



# ## Hva forteller denne? `length(unique())` 



# ## Definer en vektor som heter `vektor` med seks tall du velger. Hva gjør koden `vektor > 5`? Lagre resultatet i et objekt som du kaller `vektor_sjekk`



# ## Ofte kan det være lurt å gjøre om boolske verdier til tall. F.eks. `1*(vektor_sjekk)`. Hva forteller `sum(1*vektor_sjekk)` deg?



# ## Sjekk om Vedum har vært statsminister ved å bruke `%in%` 



# ## Tell antall statsministerperioder Gro Harlem Brundtland hadde ved `sum(1*...)`



# ## Sett sammen vektorene `parti`, `kvinne` og `statsminister` til en data.frame og gi denne et passende navn.

parti <- c("AP", "H", "Ap", "H", "Ap", "Ap", "Krf", "Ap", "KrF", "Ap", "H", "Ap")
kvinne <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE)



# ## Print ut, sjekk hvordan ser ut (kan bruke `View()` også). Hvordan ser du hva slags objekttype de ulike kolonnene er? 



# ## Hent ut kolonnene fra data framen ved hjelp av `$`. Bruk funksjonene `nrow()` og `ncol()` for å telle antall rader og kolonner i datasettet.


