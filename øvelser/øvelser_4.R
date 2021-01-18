## Introduksjon til R kurs

## Dag 2: Øvelser 4

### Kobling av data

# 1) Les inn filen befolkning.csv som ligger i data-mappe
# Dette innholder befolking per kommune etter aldersgrupper og år



# 2) Filter datasett så at det kun inneholder antall som er 65+ år per kommune for 2015
# Bruk select for å kun beholde variabler Region, value og Tid
# Hint: aldergruppe for de 65+ år heter "F65+"





# 3) Endre navn til variabel value til "befolk65_2015"




# 4) Koble ytelser og befolkning datasett sammen ved kommunenummer og år som nøkkelvariabel
# Behold alle rader/observasjoner i ytelserdatasett





### Figurer

# 5) Lage en linjediagram av total ytelser per år.
# Hint: linjedigarm er samme som punktdiagram men med geom_smooth()
# Hint: Gruppere først, deretter summere, og deretter plott






# 6) Lage samme plott av ytelser men i milliarder (istedenfor millioner)
# Bruk + ylim(0,500) for å spesifisere y-akser skal være mellom 0 og 500








# 7) Lage samme plott av ytelser men legg til akse-navn som er mer meningsfult
# Hint: bruk xlab og ylab eller scale_x_coninuous og scale_y_continuous






# 8) Lage en ny linjediagram for ytelser per år farget etter stønadsområde.
# Lage det for Kongvinger 
# Hint: siden datasett innholde utbetalt verdier per stønadsområde, trenger
#       du ikke å oppsummere. Bruk aes(color = ) innen geom_line() til farger






# 9) lage en punktdiagram av antall 65+ og utbetalt for stønadsområde "Alderspensjon" for 2015
# Legg på en regresjonlinje






