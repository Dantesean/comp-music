# Load required libraries, credentials and dataframes
if(!exists("utilize", mode="function")){ 
  source("./partials/util.R")
  utilize()
}

ggplot(pharrell, aes(release_date, danceability)) + geom_point()