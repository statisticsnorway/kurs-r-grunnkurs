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
write.table(fylkesinndeling, paste0(mappe, "fylkesinndeling.csv"), sep = ";", row.names = FALSE, col.names = FALSE, dec = ",", fileEncoding = "latin1")

# kommuneinndeling <- klassR::GetKlass(131, date =  paste0(aargang, "-01-01")) %>%
#   rename(kommunenummer = code, 
#          kommunenavn = name) %>%
#   select(kommunenummer, kommunenavn)

# write.csv2(kommuneinndeling, paste0(mappe, "kommuneinndeling.csv"), row.names = FALSE, fileEncoding = "latin1")
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
