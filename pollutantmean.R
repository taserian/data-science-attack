 pollutantmean <- function(directory, pollutant, id = 1:332) {
     
     pollutantvector <- c()
     
     for(i in id) {
         filename <- paste(directory,"/",sprintf("%03d", i),".csv", sep='')
         pollutantdata <- read.csv(filename);
         pollutantvector <- c(pollutantvector, pollutantdata[[pollutant]])
     }
     
     m <- mean(pollutantvector, na.rm = TRUE)
     
     m
 }