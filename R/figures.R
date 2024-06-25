## carte interactive
plot_ly(data= trafic_airports, x = ~date, y = ~trafic, type="scatter", mode= "lines+markers" )


plot_airport_line <- function(dataframe, airport){
  trafic_airport <- dataframe %>%
    mutate(trafic = apt_pax_dep + apt_pax_tr + apt_pax_arr) %>%
    filter(apt %in% airport) %>%
    mutate(date = as.Date(paste(anmois, "01", sep=""), format="%Y%m%d"))
  plot <- plot_ly(data= trafic_airport,
                  x = ~date, 
                  y = ~trafic, 
                  text = ~apt_nom, 
                  hovertemplate = paste("<i>Aéroport:</i> %{text}<br>Trafic: %{y}"),
                  type="scatter", 
                  mode= "lines+markers" )
  return(plot)
}


palette <- c("green", "blue", "red")


map_leaflet_airport<- function(df, airports_location, month, year){
  trafic_date <- create_data_input(df, year, month)
  trafic_aeroports <- inner_join(airports_location, trafic_date, by = c("Code.OACI" = "apt"))
  
  trafic_aeroports <- trafic_aeroports %>% 
    mutate(volume = ntile(trafic,3)) %>% 
    mutate(color = palette[volume])
  
  icons <- awesomeIcons(
    icon = 'plane',
    iconColor = 'black',
    library = 'fa',
    markerColor = trafic_aeroports$color
  )
  
  carte <- leaflet(trafic_aeroports) %>% 
    addTiles() %>% 
    addAwesomeMarkers(icon = icons[], 
                      label = ~paste0(Nom, "", " (" ,Code.OACI, ") : ", trafic, " voyageurs"))
  return(carte)
}


