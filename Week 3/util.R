utilize <- function(){
  # Load libraries
  library(tidyverse)
  library(spotifyr)
  library(ggplot2)
  library(anytime)
  if(!exists("get_release_date", mode="function")){ 
    source("./get_release_date.R")
  }
  
  # Set Environment Variables
  Sys.setenv(SPOTIFY_CLIENT_ID = "557ece0477ae4ea5807f7a809a85a597")
  Sys.setenv(SPOTIFY_CLIENT_SECRET = "24684514c966448b87e8809c1c5a4156")
  
  
  # Load Playlists for project
  pharrell_unfiltered <- get_playlist_audio_features('dantesean', '37LPgjZWSjykXkrhHYzPcR')
  pop2000 <- get_playlist_audio_features('11123270324', '2n8WeZO6kAku8y4FNpDEka')
  
  # Clean the Pharrell playlist for duplicates due to different album versions
  
  pharrell <- pharrell_unfiltered[!duplicated(pharrell_unfiltered$track_name), ]
  
  # Delete first 6 columns containing only info on the playlist and the 12th containing the date the song was added
  pop2000[, c((1:6), 12)] <- list(NULL)
  pharrell[, c((1:6), 12)] <- list(NULL)
  
  # Get the specific release dates for each song
  ## First for Pop2000 Playlist
  pop2000$release_date <- rep(0, nrow(pop2000))
  for(i in 1:nrow(pop2000)) {
    tryCatch({
    pop2000$release_date[i] <- get_release_date(pop2000[i, ]$track_name, pop2000[i, ]$artist_name, pop2000[i, ]$album_name)
    }, error=function(e){})
  }
  
  ## Then for the Pharrell playlist
  for(i in 1:nrow(pharrell)) {
    tryCatch({
      pharrell$release_date[i] <- get_release_date(pharrell[i, ]$track_name, pharrell[i, ]$artist_name, pharrell[i, ]$album_name)
    }, error=function(e){})
  }
  
  pharrell$release_date <- anytime(pharrell$release_date)
  pop2000$release_date <- anytime(pop2000$release_date)
  
  # Assign variables to global evironment
  assign("pop2000", pop2000 , envir = .GlobalEnv)
  assign("pharrell", pharrell , envir = .GlobalEnv)
}