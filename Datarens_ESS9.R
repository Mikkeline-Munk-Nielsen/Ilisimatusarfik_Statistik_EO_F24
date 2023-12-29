
################################################################################
#                    RENSNING AF ESS RUNDE 9 DATASÆT
################################################################################

pacman::p_load(tidyverse, dplyr, tidyr, haven, ggplot2)


library(haven)
ESS <- read_dta("Data/ESS9.dta")

# Lav datasættet til en tible dataframe, fordi de er mere overskuelige at arbejde med. 
ESS <- as_tibble(ESS)

######## UDVÆLG VARIABLE TIL ANALYSE 

names(ESS)

ESS <- dplyr::select(ESS, cntry, trstprl, trstlgl, trstplc, trstplt, trstprt, trstep, trstun, vote, lrscale, gincdif, euftf, evpdemp, gndr, hhmmb, agea, 
                     eisced, eduyrs, pdwrk, edctn, uempla, uempli, dsbld, rtrd, emplrel, wkhtot, isco08, mbtru, hinctnta, eiscedp, 
                     eiscedf, eiscedm, ifrjob, netinum, netifr, wltdffr, recskil, recexp, recknow, pspwght)



######## UDVÆLG LANDE TIL ANALYSE

library(janitor)
tabyl(ESS$cntry)

class(ESS$cntry)

ESS <- ESS %>%
  filter(cntry %in% c("DK", "FI", "SE", "GB", "DE", "FR", "PL", "IS"))


############ Rename variabler


ESS <- rename(ESS, 
              land = cntry,
              tillid_parlament = trstprl, 
              tillid_retssystem = trstlgl,
              tillid_politi = trstplc,
              tillid_politikere = trstplt,
              tillid_partier = trstprt,
              tillid_EU = trstep, 
              tillid_FN = trstun,
              stemte_valg = vote, 
              politisk_skala = lrscale, 
              mindske_ekon_ulig = gincdif, 
              EU_skala = euftf, 
              job = evpdemp, 
              koen = gndr, 
              antal_husstand = hhmmb, 
              alder = agea, 
              udd_ISCED = eisced, 
              udd_aar = eduyrs, 
              beskaeft_job = pdwrk, 
              beskaeft_udd = edctn, 
              beskaeft_ledig = uempla,
              beskeaft_hjemmegaaende = uempli, 
              beskaeft_syg = dsbld, 
              beskaeft_pension = rtrd, 
              ansaettelse_type = emplrel, 
              antal_timer_arb = wkhtot, 
              stilling_ISCO = isco08, 
              fagforeningsmedlem = mbtru, 
              indkomst_husholdning = hinctnta, 
              udd_ISCED_p = eiscedp,
              udd_ISCED_f = eiscedf,
              udd_ISCED_m = eiscedm,
              fair_chance_job = ifrjob,
              net_indkomst = netinum, 
              unfair_indkomst = netifr,
              fair_ekon_ulighed = wltdffr, 
              erfaring_vigtig_job = recskil,
              bekendt_vigtig_job = recknow,
              vaegt = pspwght)




names(ESS)


########### Gem datasæt med alle lande og missingværdier

write_dta(ESS, "Data/ESS.dta")
# read_dta("Data/ESS.dta")



