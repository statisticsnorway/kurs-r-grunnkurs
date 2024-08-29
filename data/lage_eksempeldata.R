# -*- coding: utf-8 -*-
# +
aargang <- 2024

library(tidyverse)

# getwd()

mappe <- "../data/"
# -

# ## Kodelister fra KLASS

# +
fylkesinndeling <- klassR::GetKlass(104, date = paste0(aargang, "-01-01")) %>%
  rename(fylkesnummer = code, 
         fylkesnavn = name) %>%
  select(fylkesnummer, fylkesnavn)

# write.csv2(fylkesinndeling, paste0(mappe, "fylkesinndeling.csv"), row.names = FALSE, header = FALSE)
write.table(fylkesinndeling, paste0(mappe, "fylkesinndeling.csv"), sep = ";", row.names = FALSE, col.names = FALSE, dec = ",")

kommuneinndeling <- klassR::GetKlass(131, date =  paste0(aargang, "-01-01")) %>%
  rename(kommunenummer = code, 
         kommunenavn = name) %>%
  select(kommunenummer, kommunenavn)

write.csv(kommuneinndeling, paste0(mappe, "kommuneinndeling.csv"), row.names = FALSE)
# -

openxlsx::write.xlsx(fylkesinndeling, file = paste0(mappe, "fylkesinndeling.xlsx"),
                    rowNames = FALSE,
                    showNA = FALSE,
                    overwrite=T)

# ## Befolkning

# +
befolkning <- PxWebApiData::ApiData(07459, 
                                    ContentsCode = T, 
                                    Region = T,
                                    Kjonn = T,     
                                    Alder = T,                 
                                    Tid = as.character(aargang))[[2]]

befolkning_t1 <- PxWebApiData::ApiData(07459, 
                                    ContentsCode = T, 
                                    Region = T,
                                    Kjonn = T,     
                                    Alder = T,                 
                                    Tid = as.character(aargang-1))[[2]]

# +
# befolkning %>%
# filter(Region == 0)

# +
befolkning_per_fylke <- befolkning %>%
  filter(nchar(Region) == 2) %>%
  group_by(Region, Tid) %>%
  summarise(value = sum(value)) %>%
  filter(value > 0) %>%
ungroup() %>%
add_row(Region = "99", 
        Tid = as.character(aargang), 
        value = NA)

arrow::write_parquet(befolkning_per_fylke, paste0(mappe, "befolkning_per_fylke.parquet"))

# +
befolkning_per_fylke_t1 <- befolkning_t1 %>%
  filter(nchar(Region) == 2) %>%
  group_by(Region, Tid) %>%
  summarise(value = sum(value)) %>%
  filter(value > 0) %>%
ungroup()

arrow::write_parquet(befolkning_per_fylke_t1, paste0(mappe, "befolkning_per_fylke_t1.parquet"))

# +
befolkning_per_kommune <- befolkning %>%
  filter(nchar(Region) == 4) %>%
  group_by(Region) %>%
  summarise(value = sum(value)) %>%
  filter(value > 0) %>%
  left_join(kommuneinndeling, by = c("Region" = "kommunenummer"))

arrow::write_parquet(befolkning_per_kommune, paste0(mappe, "befolkning_per_kommune.parquet"))

# +
befolkning_per_kjonn_fylke <- befolkning %>%
  filter(nchar(Region) == 2) %>%
  # mutate(Alder_num = as.numeric(Alder)) %>%
  # filter(Alder_num %in% 18:30) %>%
  group_by(Tid, Region, Kjonn) %>%
  summarise(personer = sum(value)) %>%
  filter(personer != 0) %>%
 mutate(Kjonn = case_when(Kjonn == 1 ~ "Menn", 
                           Kjonn == 2 ~ "Kvinner"))


# befolkning_per_kjonn_fylke

arrow::write_parquet(befolkning_per_kjonn_fylke, paste0(mappe, "befolkning_per_kjonn_fylke.parquet"))
# -






#




# ### Uføretrygdede

# +
trygd <- PxWebApiData::ApiData(11695, 
                                    ContentsCode = T, 
                                    Region = T,
                                    Kjonn = T,     
                                    Tid = as.character(aargang-1))[[2]]

befolkning_18_67_per_fylke <- befolkning %>%
mutate(Alder_num = as.numeric(gsub("\\+", "", Alder)), 
       Region = case_when(Region %in% c("31", "32", "33") ~ "30", 
                          Region %in% c("39", "40") ~ "38", 
                          Region %in% c("55", "56") ~ "54", 
                         TRUE ~ Region)) %>%
filter(nchar(Region)==2, 
       Alder_num %in% 18:67) %>%
group_by(Region) %>%
summarise(personer = sum(value)) %>%
filter(personer != 0)

trygd_pros <- trygd %>%
filter(nchar(Region) == 2, 
       ContentsCode == "UforetygdPers",
       Kjonn == 0,
       value != 0) %>%
left_join(befolkning_18_67_per_fylke, by = "Region") %>%
mutate(andel = round(value/personer*100, digits = 1))

trygd_pros_statbank <- trygd %>%
filter(nchar(Region) == 2, 
       ContentsCode == "UforetrygdPros",
       Kjonn == 0,
       value != 0) %>%
select(Region, value) %>%
rename(UforetrygdPros = value)

trygd_pros %>%
left_join(trygd_pros_statbank, by = "Region") %>%
mutate(diff = andel-UforetrygdPros)
# -

# ### Barnevern

# +
barnevern <- PxWebApiData::ApiData(10673, 
                                    ContentsCode = T, 
                                    Region = T,
                                    Kjonn = T, 
                                    Alder = T,
                                    Tid = as.character(aargang-1))[[2]]

befolkning_per_fylke <- befolkning %>%
mutate(Alder_num = as.numeric(gsub("\\+", "", Alder)), 
       Region = case_when(Region %in% c("31", "32", "33") ~ "30", 
                          Region %in% c("39", "40") ~ "38", 
                          Region %in% c("55", "56") ~ "54", 
                         TRUE ~ Region)) %>%
filter(nchar(Region)==2, 
        Alder_num %in% 0:24) %>%
group_by(Region) %>%
summarise(personer = sum(value)) %>%
filter(personer != 0)

barnevern_per_1000_statbank <- barnevern %>%
filter(ContentsCode == "MeldingPer1000", 
       str_detect(Region, "^[0-9]{2}$"),
       Konklusjon == "0m",
       Alder == "999",
       # Alder == "18-24",
       Kjonn == "Total", 
       !is.na(value)) %>%
select(Region, value) %>%
rename(MeldingPer1000 = value)

barnevern_per_1000 <- barnevern %>%
filter(ContentsCode == "Melding", 
       str_detect(Region, "^[0-9]{2}$"),
       Konklusjon == "0m",
       Alder == "999",
       # Alder == "18-24",
       Kjonn == "Total", 
       !is.na(value)) %>%
left_join(befolkning_per_fylke, by = "Region") %>%
mutate(melding_per_1000 = round(value/(personer/1000), digits = 1))

barnevern_per_1000 %>%
left_join(barnevern_per_1000_statbank, by = "Region") %>%
mutate(diff = melding_per_1000-MeldingPer1000)
