clean_dataframe <- function(dataframe){
  dataframe_cleaned <- dataframe %>% 
    mutate(an = str_sub(ANMOIS, start = 1, end = 4),
           mois = str_sub(ANMOIS, start= 5, end = 6)) %>% 
    mutate(mois = str_remove(mois, "^0+"))
  colnames(dataframe_cleaned) <- tolower(colnames(dataframe_cleaned))
  return(dataframe_cleaned)
}



