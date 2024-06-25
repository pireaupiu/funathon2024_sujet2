create_table_airports <- function(stats_aeroports){
  table_aeroports <- gt(stats_aeroports_table) %>% 
    cols_hide(columns = starts_with("apt")) %>% 
    fmt_number(columns = starts_with("pax"), suffixing = TRUE) %>% 
    fmt_markdown(columns = name_clean) %>% 
    cols_label(name_clean = md("**Aéroport**"), 
               paxdepart = md("**Départ**"),
               paxarrivee = md("**Arrivée**"), 
               paxtransit =md("**En transit**"), 
               paxtotal = md("**Total**")) %>% 
    tab_header(
      title = md("**Statistiques de fréquentation**"),
      subtitle = md("Classement des aéroports")) %>%
    tab_style(
      style = cell_fill(color = "powderblue"),
      locations = cells_title()
    ) %>%
    tab_source_note(source_note = md("_Source: DGAC, à partir des données sur data.gouv.fr_"))%>%
    opt_interactive()
  return(table_aeroports)
}