# Load required libraries and set Spotify credentials

if(!exists("setspotify", mode="function")) source("./partials/util.R")
setspotify()

# Load required playlist

pharrell <- get_playlist_audio_features('dantesean', '37LPgjZWSjykXkrhHYzPcR')
pop2000 <- get_playlist_audio_features('11123270324', '2n8WeZO6kAku8y4FNpDEka')

# Summarise key patterns

pharrell %>% summarise(M = mean(valence), SD = sd(valence))