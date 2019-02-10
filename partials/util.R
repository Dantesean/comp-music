setspotify <- function(){
#Load libraries
library(tidyverse)
library(spotifyr)

#Set Environment Variables
Sys.setenv(SPOTIFY_CLIENT_ID = "557ece0477ae4ea5807f7a809a85a597")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "24684514c966448b87e8809c1c5a4156")
}