# Install/update tidyverse and devtools (one time)

# Install spotifyr (one time)

devtools::install_github('charlie86/spotifyr')

# Load libraries (every time)

library(tidyverse)
library(spotifyr)

# Set Spotify access variables (every time)

Sys.setenv(SPOTIFY_CLIENT_ID = "557ece0477ae4ea5807f7a809a85a597")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "24684514c966448b87e8809c1c5a4156")

# Work with spotifyr. Note that playlists also require a username.

juditha <-
    get_track_audio_features(
        c('2M5b9YLAgFroqWzeaZf86e', '3DBKc4ioGnMQLlbGQcFDIO'))
# alla <- get_album_tracks('7oI0E3DdTbD85rhMg19GSU')
# gilberto <- get_artist_audio_features('gilberto gil')
# disney <- get_playlist_audio_features('128899670', '5NtjgKz4doejP5HJtKXFcS')
doubled <- get_playlist_audio_features('hylke.de.vries', '0TLbyXNc8i4tyBSXTwQj8U')

# Summarise key patterns

# gilberto %>% summarise(M = mean(danceability), SE = sd(danceability))
# disney %>% summarise(M = mean(danceability), SD = sd(danceability))
doubled %>% summarise(M = mean(danceability), SD = sd(danceability))