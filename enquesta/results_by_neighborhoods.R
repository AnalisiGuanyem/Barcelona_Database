
rawdata <- read.csv("/home/jose/Documents/GitHub/AnalisiGuanyem/Barcelona_Database/enquesta/Survey_28_01_15.csv", header = F, sep = ",", dec = ".")

# rawdata[,61] <- gsub(" ","_",rawdata[,61], perl=T)
# rawdata[,61] <- gsub("__","_",rawdata[,61], perl=T)
# rawdata[,61] <- gsub("__","_",rawdata[,61], perl=T)

# for  (i in 1:ncol(rawdata)){
#   colnames(rawdata)[i] <- paste(colnames(rawdata)[i], rawdata[1,i], rawdata[2,i])
#   colnames(rawdata)[i] <- gsub(" ","_",colnames(rawdata)[i], perl=T)
#   colnames(rawdata)[i] <- gsub("__","_",colnames(rawdata)[i], perl=T)
#   colnames(rawdata)[i] <- gsub("__","_",colnames(rawdata)[i], perl=T)
# }

# with_titles <- rawdata 
rawdata <- rawdata[-1,]
rawdata <- rawdata[-1,]
rownames(rawdata) <- rawdata$V1
rawdata$V1 <- as.character(rawdata$V1)
rawdata$V5 <- as.character(rawdata$V5)

ips_equiv <- data.frame(NA,NA)
colnames(ips_equiv) <- c("ip","equiv")
for  (i in 1:length(unique(rawdata[,5]))) {
  ips_equiv[i,1] <- unique(rawdata[,5])[i]
  ips_equiv[i,2] <- paste("ip_number_",i, sep="")
}
for (i in 1:nrow(rawdata)) {
  rawdata[i,1] <- as.character(subset(ips_equiv, ip==as.character(rawdata[i,5]), select=c("equiv"))[1,])
}
rawdata <- rawdata[,-5]
for (i in 1:ncol(rawdata)) {
  colnames(rawdata)[i] <- paste("V", i, sep="")
}

# for  (i in 1:nrow(rawdata)){
#   rawdata[i,"barri2"] <- paste(rawdata[i,60], rawdata[i,61])
# }

rawdata$V57 <- as.numeric(as.character(rawdata$V57))

#unique(rawdata[,60])
barris <- data.frame(NA)

for (i in 1:length(unique(rawdata[,60]))) {
  if (i>1) {
    barris <- rbind(barris,rep(NA,ncol(barris)))
  }
  # rownames(barris)[i] <- as.character(unique(rawdata[,60])[i])
  barris[i,"enq1_barri"] <- as.character(unique(rawdata[,60])[i])
  barris[i,"enq1_respostes"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i]))
  barris[i,"enq1_ips_unicas"] <- nrow(unique(subset(rawdata,V60==unique(rawdata[,60])[i],select=V1)))
  barris[i,"enq1_edats_<15"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V57>0 & V57<15))
  barris[i,"enq1_edats_15_24"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V57>14 & V57<25))
  barris[i,"enq1_edats_25_39"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V57>24 & V57<40))
  barris[i,"enq1_edats_40_64"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V57>39 & V57<65))
  barris[i,"enq1_edats_>64"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V57>64))
  barris[i,"enq1_edats_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & is.na(V57)))
  
  barris[i,"enq1_dones"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V58=="Dona"))
  barris[i,"enq1_homes"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V58=="Home"))
  barris[i,"enq1_altre_genere"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V58==""))
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V58==""))) {
    barris[i,"enq1_altre_genere_text"] <- paste(barris[i,"enq1_altre_genere_text"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V58=="", select=V59)[j,]),sep=" / ")
  }
  barris[i,"enq1_altre_genere_text"] <- gsub("NA / ","",barris[i,"enq1_altre_genere_text"],perl=T)
  barris[i,"enq1_altre_genere_text"] <- gsub(" /  / ","",barris[i,"enq1_altre_genere_text"],perl=T)
  barris[i,"enq1_altre_genere_text"] <- gsub("^ / ","",barris[i,"enq1_altre_genere_text"],perl=T)
  
  barris[i,"enq1_edu_prim"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V63=="Primària"))
  barris[i,"enq1_edu_secu"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V63=="Secundària"))
  barris[i,"enq1_edu_univ"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V63=="Universitària"))
  barris[i,"enq1_edu_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V63==""))
  
  barris[i,"enq1_treball_alie"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Treballador per compte aliè"))
  barris[i,"enq1_treball_propi"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Treballador per compte propi"))
  barris[i,"enq1_estudiant"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Estudiant"))
  barris[i,"enq1_inactiu"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Inactiu (no treballa fora de casa ni busca feina)"))
  barris[i,"enq1_aturat"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Aturat"))
  barris[i,"enq1_jubilat"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Jubilat / Pensionista"))
  barris[i,"enq1_altre_situa"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Altres (especifiqueu)"))
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Altres (especifiqueu)"))) {
    barris[i,"enq1_altre_situa_text"] <- paste(barris[i,"enq1_altre_situa_text"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V64=="Altres (especifiqueu)", select=V65)[j,]),sep=" / ")
  }
  barris[i,"enq1_altre_situa_text"] <- gsub("NA / ","",barris[i,"enq1_altre_situa_text"],perl=T)
  barris[i,"enq1_altre_situa_text"] <- gsub(" /  / ","",barris[i,"enq1_altre_situa_text"],perl=T)
  barris[i,"enq1_altre_situa_text"] <- gsub("^ / ","",barris[i,"enq1_altre_situa_text"],perl=T)
  
  barris[i,"enq1_associ_si"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V66=="Sí"))
  barris[i,"enq1_associ_no"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V66=="No"))
  barris[i,"enq1_associ_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V66==""))
  
  barris[i,"enq1_vivenda_problem_no"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V9=="No hi ha problemes importants"))
  barris[i,"enq1_vivenda_problem_alguns"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V9=="Hi ha alguns problemes"))
  barris[i,"enq1_vivenda_problem_greus"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V9=="Hi ha greus problemes"))
  barris[i,"enq1_vivenda_problem_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V9==""))
  
  barris[i,"enq1_vivenda_prob_preu"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V10=="Relació qualitat-preu del lloguer / compra"))
  barris[i,"enq1_vivenda_prob_oferta"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V11=="Manca d'oferta de lloguer / compra"))
  barris[i,"enq1_vivenda_prob_oferta_pub"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V12=="Manca d'oferta pública / cooperativa"))
  barris[i,"enq1_vivenda_prob_credit"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V13=="Dificultats accés als crèdits"))
  barris[i,"enq1_vivenda_prob_condicions"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V14=="Condicions dels habitatges"))
  barris[i,"enq1_vivenda_prob_desnona"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V15=="Desnonaments"))
  barris[i,"enq1_vivenda_prob_buits"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V16=="Excés de pisos buits"))
  barris[i,"enq1_vivenda_prob_altres"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V17!=""))) {
    barris[i,"enq1_vivenda_prob_altres"] <- paste(barris[i,"enq1_vivenda_prob_altres"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V17!="", select=V17)[j,]),sep=" / ")
  }
  barris[i,"enq1_vivenda_prob_altres"] <- gsub("NA / ","",barris[i,"enq1_vivenda_prob_altres"],perl=T)
  barris[i,"enq1_vivenda_prob_altres"] <- gsub(" /  / ","",barris[i,"enq1_vivenda_prob_altres"],perl=T)
  barris[i,"enq1_vivenda_prob_altres"] <- gsub("^ / ","",barris[i,"enq1_vivenda_prob_altres"],perl=T)
  
  barris[i,"enq1_enseny_molt_do"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18=="Molt dolenta"))
  barris[i,"enq1_enseny_dolenta"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18=="Dolenta"))
  barris[i,"enq1_enseny_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18=="Adequada"))
  barris[i,"enq1_enseny_bona"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18=="Bona"))
  barris[i,"enq1_enseny_molt_bo"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18=="Molt bona"))
  barris[i,"enq1_enseny_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V18==""))
   
  barris[i,"enq1_enseny_prob_places"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V19=="Poques places"))
  barris[i,"enq1_enseny_prob_lluny"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V20=="Lluny de casa"))
  barris[i,"enq1_enseny_prob_estat"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V21=="Estat dels edificis i instal·lacions"))
  barris[i,"enq1_enseny_prob_qualitat"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V22=="Mala qualitat de l'ensenyament"))
  barris[i,"enq1_enseny_prob_desigual"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V23=="Desigualtat entre escoles"))
  barris[i,"enq1_enseny_prob_altres"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V24!=""))) {
    barris[i,"enq1_enseny_prob_altres"] <- paste(barris[i,"enq1_enseny_prob_altres"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V24!="", select=V24)[j,]),sep=" / ")
  } 
  barris[i,"enq1_enseny_prob_altres"] <- gsub("NA / ","",barris[i,"enq1_enseny_prob_altres"],perl=T)
  barris[i,"enq1_enseny_prob_altres"] <- gsub(" /  / ","",barris[i,"enq1_enseny_prob_altres"],perl=T)
  barris[i,"enq1_enseny_prob_altres"] <- gsub("^ / ","",barris[i,"enq1_enseny_prob_altres"],perl=T)
  
  barris[i,"enq1_sanitat_molt_do"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25=="Molt dolenta"))
  barris[i,"enq1_sanitat_dolenta"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25=="Dolenta"))
  barris[i,"enq1_sanitat_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25=="Adequada"))
  barris[i,"enq1_sanitat_bona"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25=="Bona"))
  barris[i,"enq1_sanitat_molt_bo"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25=="Molt bona"))
  barris[i,"enq1_sanitat_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V25==""))
  
  barris[i,"enq1_sanitat_prob_prim"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V26=="Manca de centres d'atenció primària"))
  barris[i,"enq1_sanitat_prob_hosp"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V27=="Manca de places/serveis hospitalaris"))
  barris[i,"enq1_sanitat_prob_urge"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V28=="Manca de serveis d'urgències"))
  barris[i,"enq1_sanitat_prob_espera"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V29=="Durada dels temps d'espera"))
  barris[i,"enq1_sanitat_prob_tracte"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V30=="Problemes d'atenció / tracte"))
  barris[i,"enq1_sanitat_prob_qualit"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V31=="Problemes de qualitat"))
  barris[i,"enq1_sanitat_prob_altres"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V32!=""))) {
    barris[i,"enq1_sanitat_prob_altres"] <- paste(barris[i,"enq1_sanitat_prob_altres"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V32!="", select=V32)[j,]),sep=" / ")
  } 
  barris[i,"enq1_sanitat_prob_altres"] <- gsub("NA / ","",barris[i,"enq1_sanitat_prob_altres"],perl=T)
  barris[i,"enq1_sanitat_prob_altres"] <- gsub(" /  / ","",barris[i,"enq1_sanitat_prob_altres"],perl=T)
  barris[i,"enq1_sanitat_prob_altres"] <- gsub("^ / ","",barris[i,"enq1_sanitat_prob_altres"],perl=T)
  
  barris[i,"enq1_transport_molt_ele"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33=="Massa elevades"))
  barris[i,"enq1_transport_elevat"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33=="Elevades"))
  barris[i,"enq1_transport_preu_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33=="Adequades"))
  barris[i,"enq1_transport_baix"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33=="Baixes"))
  barris[i,"enq1_transport_molt_baix"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33=="Molt baixes"))
  barris[i,"enq1_transport_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V33==""))
  
  barris[i,"enq1_aire_molt_do"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34=="Molt dolenta"))
  barris[i,"enq1_aire_dolenta"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34=="Dolenta"))
  barris[i,"enq1_aire_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34=="Adequada"))
  barris[i,"enq1_aire_bona"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34=="Bona"))
  barris[i,"enq1_aire_molt_bo"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34=="Molt bona"))
  barris[i,"enq1_aire_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V34==""))
  
  barris[i,"enq1_soroll_molt_alt"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35=="Molt alt"))
  barris[i,"enq1_soroll_alt"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35=="Alt"))
  barris[i,"enq1_soroll_normal"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35=="Normal"))
  barris[i,"enq1_soroll_baix"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35=="Baix"))
  barris[i,"enq1_soroll_molt_baix"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35=="Molt baix"))
  barris[i,"enq1_soroll_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V35==""))
  
  barris[i,"enq1_turisme_perju"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V36=="Perjudicial"))
  barris[i,"enq1_turisme_res"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V36=="Ni perjudicial ni beneficiós"))
  barris[i,"enq1_turisme_benef"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V36=="Beneficiós"))
  barris[i,"enq1_turisme_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V36==""))
  
  barris[i,"enq1_turis_prob_exces"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V37=="Nivell excessiu"))
  barris[i,"enq1_turis_prob_insuf"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V38=="Nivell insuficient"))
  barris[i,"enq1_turis_prob_preus"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V39=="Encariment dels preus (aliments, oci, habitatge, etc.)"))
  barris[i,"enq1_turis_prob_espai"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V40=="Saturació dels espais públics"))
  barris[i,"enq1_turis_prob_soroll"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V41=="Sorolls"))
  barris[i,"enq1_turis_prob_brutic"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V42=="Augment de les escombraries, brutícia"))
  barris[i,"enq1_turis_prob_cap"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V43=="Cap"))
  barris[i,"enq1_turis_prob_altres"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V44!=""))) {
    barris[i,"enq1_turis_prob_altres"] <- paste(barris[i,"enq1_turis_prob_altres"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V44!="", select=V44)[j,]),sep=" / ")
  } 
  barris[i,"enq1_turis_prob_altres"] <- gsub("NA / ","",barris[i,"enq1_turis_prob_altres"],perl=T)
  barris[i,"enq1_turis_prob_altres"] <- gsub(" /  / ","",barris[i,"enq1_turis_prob_altres"],perl=T)
  barris[i,"enq1_turis_prob_altres"] <- gsub("^ / ","",barris[i,"enq1_turis_prob_altres"],perl=T)
  
  barris[i,"enq1_espai_manc_parcs"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V45=="Parcs / zones verdes"))
  barris[i,"enq1_espai_manc_bibli"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V46=="Biblioteques"))
  barris[i,"enq1_espai_manc_civic"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V47=="Centres Civics"))
  barris[i,"enq1_espai_manc_espor"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V48=="Zones per a esports"))
  barris[i,"enq1_espai_manc_zjocs"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V49=="Zones de jocs per a nens"))
  barris[i,"enq1_espai_manc_place"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V50=="Places"))
  barris[i,"enq1_espai_manc_altres"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V51!=""))) {
    barris[i,"enq1_espai_manc_altres"] <- paste(barris[i,"enq1_espai_manc_altres"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V51!="", select=V51)[j,]),sep=" / ")
  } 
  barris[i,"enq1_espai_manc_altres"] <- gsub("NA / ","",barris[i,"enq1_espai_manc_altres"],perl=T)
  barris[i,"enq1_espai_manc_altres"] <- gsub(" /  / ","",barris[i,"enq1_espai_manc_altres"],perl=T)
  barris[i,"enq1_espai_manc_altres"] <- gsub("^ / ","",barris[i,"enq1_espai_manc_altres"],perl=T)
  
  barris[i,"enq1_opinar_molt_ins"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V52=="Molt insuficients"))
  barris[i,"enq1_opinar_insufici"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V52=="Insuficients"))
  barris[i,"enq1_opinar_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V52=="Adequades"))
  barris[i,"enq1_opinar_excessiv"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V52=="Excessives"))
  barris[i,"enq1_opinar_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V52==""))
  
  barris[i,"enq1_vida_asso_molt_ins"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V53=="Molt insuficients"))
  barris[i,"enq1_vida_asso_insufici"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V53=="Insuficients"))
  barris[i,"enq1_vida_asso_ok"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V53=="Adequades"))
  barris[i,"enq1_vida_asso_excessiv"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V53=="Excessives"))
  barris[i,"enq1_vida_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V53==""))
  
  barris[i,"enq1_regidor_si"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V54=="Sí"))
  barris[i,"enq1_regidor_no"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V54=="No"))
  barris[i,"enq1_regidor_nose"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V54=="No ho sé"))
  barris[i,"enq1_regidor_NA"] <- nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V54==""))
  
  barris[i,"enq1_altres_probl"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V55!=""))) {
    barris[i,"enq1_altres_probl"] <- paste(barris[i,"enq1_altres_probl"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V55!="", select=V55)[j,]),sep=" / ")
  } 
  barris[i,"enq1_altres_probl"] <- gsub("NA / ","",barris[i,"enq1_altres_probl"],perl=T)
  barris[i,"enq1_altres_probl"] <- gsub(" /  / ","",barris[i,"enq1_altres_probl"],perl=T)
  barris[i,"enq1_altres_probl"] <- gsub("^ / ","",barris[i,"enq1_altres_probl"],perl=T)
  
  barris[i,"enq1_propostes"] <- ""
  for (j in 1:nrow(subset(rawdata,V60==unique(rawdata[,60])[i] & V56!=""))) {
    barris[i,"enq1_propostes"] <- paste(barris[i,"enq1_propostes"],tolower(subset(rawdata,V60==unique(rawdata[,60])[i] & V56!="", select=V56)[j,]),sep=" / ")
  } 
  barris[i,"enq1_propostes"] <- gsub("NA / ","",barris[i,"enq1_propostes"],perl=T)
  barris[i,"enq1_propostes"] <- gsub(" /  / ","",barris[i,"enq1_propostes"],perl=T)
  barris[i,"enq1_propostes"] <- gsub("^ / ","",barris[i,"enq1_propostes"],perl=T)
  
  
}
barris <- barris[-1]

write.table(barris, file="Survey_28_01_15_by_neighborhoods.csv", sep="\t",row.names=F,quote=F)

# Checking:
# ----------
if (sum(barris$enq1_respostes)==nrow(rawdata)) {
  cat("EVERYTHING OK!")
} else {
  cat("THERE IS A PROBLEM WITH THE NUMBER OF CASES")
}
