## fonction pour importer les données des aéroports 
import_airport_data <- function(list_files){
  dataframe <- read_csv2(list_files, col_types = cols(
    ANMOIS = col_character(),
    APT = col_character(),
    APT_NOM = col_character(),
    APT_ZON = col_character(),
    .default = col_double()
  ))
  dataframe_cleaned <- clean_dataframe(dataframe)
  return(dataframe_cleaned)
}

## fonction pour importer les données des compagnies 
import_compagnies_data <- function(list_files){
  dataframe <- read_csv2(list_files, col_types = cols(
    ANMOIS = col_character(),
    CIE = col_character(),
    CIE_NOM = col_character(),
    CIE_NAT = col_character(),
    CIE_PAYS = col_character(),
    .default = col_double()
  ))
  dataframe_cleaned <- clean_dataframe(dataframe)
  return(dataframe_cleaned)
}

## fonction pour importer les données des liaisons
import_liaisons_data <- function(list_files){
  dataframe <- read_csv2(list_files, col_types = cols(
    ANMOIS = col_character(),
    LSN = col_character(),
    LSN_DEP_NOM = col_character(),
    LSN_ARR_NOM = col_character(),
    LSN_SCT = col_character(),
    LSN_FSC = col_character(),
    .default = col_double()
  ))
  dataframe_cleaned <- clean_dataframe(dataframe)
  return(dataframe_cleaned)
}