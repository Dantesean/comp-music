# Load required libraries, credentials and dataframes
if(!exists("utilize", mode="function")){ 
  source("./partials/util.R")
  utilize()
}

# Filtering the data
## For Pharrell
pharrell_danceability_by_year <- pharrell %>%
  mutate(year = format(release_date, "%Y")) %>%
  group_by(year) %>% 
  filter(year >= 1992) %>%
  summarise(dance = mean(danceability)*100, pop = mean(track_popularity), songs = n())

pharrell_danceability_popularity <- pharrell %>%
  mutate(track_popularity = track_popularity/max(track_popularity)*100) %>% 
  mutate(year = format(release_date, "%Y")) %>%
  group_by(year) %>% filter(year >= 1992)

## For Pop2000
pop2000_danceability_by_year <- pop2000 %>%
  mutate(year = format(release_date, "%Y")) %>%
  group_by(year) %>%
  summarise(dance = mean(danceability)*100, pop = mean(track_popularity), songs = n())

pop2000_danceability_popularity <- pop2000 %>%
  mutate(track_popularity = track_popularity/max(track_popularity)*100) %>% 
  mutate(year = format(release_date, "%Y")) %>%
  group_by(year) %>% filter(year >= 1992)

# Plotting the graphs
## For Pharrell
ggplot(pharrell_danceability_by_year, aes(year, dance, group=1)) +
  geom_point(aes(size = songs, color = pop)) +
  scale_color_distiller(palette = "Spectral") +
  xlab("Year") +
  ylab("Dancebility") +
  labs(size="Amount of Songs", colour = "Popularity") +
  scale_x_discrete(breaks = scales::pretty_breaks(n = 5))

ggplot(pharrell_danceability_popularity, aes(danceability, track_popularity)) +
  geom_point() +
  geom_smooth(method=lm)

## For Pop2000
ggplot(pop2000_danceability_by_year, aes(year, dance, group=1)) +
  geom_point(aes(size = songs, color = pop)) +
  scale_color_distiller(palette = "Spectral") +
  xlab("Year") +
  ylab("Dancebility") +
  labs(size="Amount of Songs", colour = "Popularity") +
  scale_x_discrete(breaks = scales::pretty_breaks(n = 5))

ggplot(pop2000_danceability_popularity, aes(danceability, track_popularity)) +
  geom_point() +
  geom_smooth(method=lm)