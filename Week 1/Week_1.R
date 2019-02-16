# Load required libraries, credentials and dataframes
if(!exists("utilize", mode="function")){ 
  source("./partials/util.R")
  utilize()
}

# Summarise key patterns

pharrell %>% summarise(M = mean(danceability), SD = sd(danceability))
pharrell %>% summarise(M = mean(energy), SD = sd(energy))
pharrell %>% summarise(M = mean(valence), SD = sd(valence))

pop2000 %>% summarise(M = mean(danceability), SD = sd(danceability))
pop2000 %>% summarise(M = mean(energy), SD = sd(energy))
pop2000 %>% summarise(M = mean(valence), SD = sd(valence))