# -*- coding: utf-8 -*-
# # Oppgaver 1

# ## Åpne RStudio. Hva er konsollen og hva er miljøvinduet? Bruk  konsollen som kalkulator og gjør noen regnestykker. 

1+1

# ## I konsollen: definer objektet `mitt_tall` hvor du lagrer yndlingstallet ditt. Hva skjer i miljøvinduet når du gjør dette? 

mitt_tall <- 1

# ## Skriv `mitt_tall` i konsollen. Hva skjer?

mitt_tall

# ## Definer et annet objekt (finn på navnet selv) og gjør noen regnestykker med de to objektene du nå har definert.

# +
nytt_tall <- 2

mitt_tall+nytt_tall
# -

# ## Definer et tredje objekt som summen av de to første objektene. 

sum_tall <- mitt_tall+nytt_tall

# ## Trykk på feiekosten i miljøvinduet. Hva skjer? 



# ## Skriv `mitt_tall` i konsollen nå. Hva skjer?  

mitt_tall

# ## Opprett et nytt R skript fra nedtrekksmenyen. 



# ## I skriptet definerer du de samme objektene som i oppgavene 2-4 (`mitt_tall` + egendefinert objekt). Kjør skriptet. Hva skjer? 



# ## Lagre skriptet som `my_first_Rskript.R` eller noe lignende. 



# ## Lukk skriptet, trykk på feiekosten i miljøvinduet. Kall på de definerte objektene i konsolen. Hva skjer?  



# ## Åpne skriptet du nettopp lagde og kjør det på nytt.



# ## Definer et objekt med fire desimaler.

tall_desimaler <- 1.2345

# ## Bruk funksjonen `round()` til å runde av dette objektet til ingen, én og to desimaler

round(tall_desimaler, digits = 0)
round(tall_desimaler, digits = 1)
round(tall_desimaler, digits = 2)

# ## Hva skjer hvis du skriver og kjører `3 > 2` i scriptet? Hva med `3 == 2`? Og `3 < 2`?  Hvilken type objekt har disse? (`class()`)

# +
3 > 2
3 == 2
3 < 2

class(3 > 2)
# -

# ## Hva skjer hvis du skriver `3 = 2`?

# +
# 3 = 2
# -

# ## Definer et objekt (`vektor_tall`) som er en vektor med tre tall. 

vektor_tall <- c(1, 2, 3)

# ## Hent det tredje elementet i vektoren (`vektor_tall`). 

vektor_tall[3]

# ## Finn lengden på vektoren (`vektor_tall`) ved å bruke funksjonen `length()`

length(vektor_tall)

# ## Hva skjer hvis du anvender funksjonen `sum()`  på vektoren `vektor_tall`? 

sum(vektor_tall)

# ## Opprett en annen vektor, også denne med tre tall. 

vektor_tall_2 <- c(4, 5, 6)

# ## Gjør noen regneoperasjoner med vektoren. Hva skjer? 

# +
vektor_tall_2+1
vektor_tall_2*2

sum(vektor_tall_2)+1

vektor_tall+vektor_tall_2
# -

# ## Definer en vektor med fire tall (`vektor_tall_4`). Hva skjer hvis du prøver å summere vektoren med fire tall med en av vektorene med tre tall?

# +
vektor_tall_4 <- 1:4

# vektor_tall_4+vektor_tall_2
# -

# ## Kombiner de to vektorer til én vektor (vektor_tall_7). Dvs. slå sammen `vektor_tall` og `vektor_tall_4` slik at du får én vektor med length() = 7.

c(vektor_tall_2, vektor_tall_4)

# ## Opprett vektoren `statsminister` med koden nedenfor. Bruk deretter funksjonene `class()`, `length()`, `unique()` og `table()` på dette objektet. Hva forteller disse? 

# +
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

class(statsminister)
length(statsminister)
unique(statsminister)
table(statsminister)
# -

# ## Hva forteller denne? `length(unique())` 

length(unique(statsminister))

# ## Definer en vektor som heter `vektor` med seks tall du velger. Hva gjør koden `vektor > 5`? Lagre resultatet i et objekt som du kaller `vektor_sjekk`

vektor <- 1:6
vektor_sjekk <- vektor > 5
vektor_sjekk

# ## Ofte kan det være lurt å gjøre om boolske verdier til tall. F.eks. `1*(vektor_sjekk)`. Hva forteller `sum(1*vektor_sjekk)` deg?

1*(vektor_sjekk)
sum(1*(vektor_sjekk))

# ## Sjekk om Vedum har vært statsminister ved å bruke `%in%` 

"Vedum" %in% vektor_sjekk

# ## Tell antall statsministerperioder Gro Harlem Brundtland hadde ved `sum(1*...)`

sum(1*(statsminister == "Brundtland"))

# ## Sett sammen vektorene `parti`, `kvinne` og `statsminister` til en data.frame og gi denne et passende navn.

parti <- c("AP", "H", "Ap", "H", "Ap", "Ap", "Krf", "Ap", "KrF", "Ap", "H", "Ap")
kvinne <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE)

statsminister_kjonn <- data.frame(parti, kvinne, statsminister)

# ## Print ut, sjekk hvordan ser ut (kan bruke `View()` også). Hvordan ser du hva slags objekttype de ulike kolonnene er? 

statsminister_kjonn

# ## Hent ut kolonnene fra data framen ved hjelp av `$`. Bruk funksjonene `nrow()` og `ncol()` for å telle antall rader og kolonner i datasettet.

# +
statsminister_kjonn$parti
statsminister_kjonn$kvinne
statsminister_kjonn$statsminister

nrow(statsminister_kjonn)
ncol(statsminister_kjonn)
