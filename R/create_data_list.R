#' Crée une liste imbriquée en partant d'un fichier yaml
#' 
#' @param source_file : lien du fichier yalm contenant les liens URL
#' @return le fichier en liste imbriquée
#' @examples
#' create_data_list("sources.yml")
create_data_list <- function(source_file){
  source_list <- yaml::read_yaml(source_file)
  return(source_list)
}

