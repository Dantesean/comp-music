# Assignment Week 2
## First things first
So, I really wanted to see how some things progressed over years. For that reason, I needed all release dates of the songs used in my corpus. SpotifyR does not incorperate any functionalities regardings this. For that reason, I spent some hours on finding out how to handle this and wrote my own function.
The process is as follows: first you need the song name, the artist and the album that it's on. Using that, you can search for the closest matching album (yes, there is truly no way to get the album_uri from the get_playlist_audio_features), use the found album ID to find the true album and then from that output get the release date. After all, I found it, and put the code in the discussion board.

## New Outliers
Using this new column "release_dates", we can easily spot that 2 observations are not representative (eventhough they are real songs): Nas' Angels is supposedly from 1975, and pop2000 made a remix on a A Tribe Called Quest song, which was originally released in 1990 (which is before The Neptunes started). To get over this, all observations prior to 01/01/1992 are dropped.

## Graphs
### Neptunes Playlist
[[https://github.com/dantesean/comp-music/tree/master/images/Week2_Pharrell_1.png|alt=Pic1]]
Plotting the Danceability on a year-to-year basis, we can see the danceability increasing in the first years, and more or less jumping between 0.7 and 0.75. An interesting fact one can find from the fact that colors are incorporated into the graph to represent the popularity, is that it's nicely spread over the years. The danceability index is scaled with 100 to better present the danceability index.

[[https://github.com/dantesean/comp-music/tree/master/images/Week2_Pharrell_2.png|alt=Pic2]]
When reorderning the variable for popularity to range within the dataset, so that the popularity = 100 for the most popular song, there is no clear correlation between popularity and danceability (in this dataset). The points are everywhere. 

### Pop2000 Playlist
[[https://github.com/dantesean/comp-music/tree/master/images/Week2_Pop2000_1.png|alt=Pic3]]
The Pop2000 playlist makes it even clearer that there is no true correlation between danceability and popularity, as pre 2000 saw not danceable songs as really popular, but also after 2010 more danceable songs were popular. There might be a change here, and that change might be due to some influence by The Neptunes, but that is up for further analysis. 

[[https://github.com/dantesean/comp-music/tree/master/images/Week2_Pop2000_2.png|alt=Pic4]]
