create_data_input <- function(df,year, month){
  df <- pax_apt_all %>% 
    filter(mois %in% month) %>% 
    filter(an %in% year)
  return(df)
}


summary_stat_airport <- function(df){
  stats <- df %>% 
    group_by(apt, apt_nom) %>% 
    summarize(paxdepart = sum(apt_pax_dep), 
              paxarrivee = sum(apt_pax_arr), 
              paxtransit = sum(apt_pax_tr), 
              paxtotal = paxdepart + paxarrivee + paxtransit) %>% 
    arrange(desc(paxtotal))
  return(stats)
}

