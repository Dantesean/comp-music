# Load required libraries and set Spotify credentials

if(!exists("setspotify", mode="function")) source("./partials/util.R")
setspotify()

# Load required playlist

pharrell_unfiltered <- get_playlist_audio_features('dantesean', '37LPgjZWSjykXkrhHYzPcR')
pop2000 <- get_playlist_audio_features('11123270324', '2n8WeZO6kAku8y4FNpDEka')

# Clean the Pharrell playlist for duplicates due to different album versions

pharrell <- pharrell_unfiltered[!duplicated(pharrell_unfiltered$track_name), ]

# Summarise key patterns

pharrell %>% summarise(M = mean(danceability), SD = sd(danceability))
pharrell %>% summarise(M = mean(energy), SD = sd(energy))
pharrell %>% summarise(M = mean(valence), SD = sd(valence))

pop2000 %>% summarise(M = mean(danceability), SD = sd(danceability))
pop2000 %>% summarise(M = mean(energy), SD = sd(energy))
pop2000 %>% summarise(M = mean(valence), SD = sd(valence))