# Load required libraries, credentials and dataframes
if(!exists("utilize", mode="function")){ 
  source("./partials/util.R")
  utilize()
}

library(anytime)
pharrell$release_date <- anytime(pharrell$release_date)

pharrell_danceability_by_year <- pharrell %>%
  mutate(year = format(release_date, "%Y")) %>%
  group_by(year) %>% filter(year >= 1992) %>%
  summarise(dance = sum(danceability), pop = sum(track_popularity), songs = n())

ggplot(pharrell_danceability_by_year, aes(year, dance)) + geom_point(aes(size = songs, color = pop)) + scale_color_distiller(palette = "Spectral") + xlab("Year") + ylab("Dancebility") + labs(size="Amount of Songs", colour = "Popularity") + scale_x_discrete(breaks = scales::pretty_breaks(n = 5))