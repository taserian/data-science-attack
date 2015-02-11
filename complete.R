complete <- function(directory, id = 1:332) {
    
    cdataframe <- data.frame(id=numeric(0), nobs=numeric(0)) 
    
    for(i in id) {
        filename <- paste(directory,"/",sprintf("%03d", i),".csv", sep='')
        pdata <- read.csv(filename);
        count <- 0
        for(j in 1:nrow(pdata)) {
            jrow = pdata[j,]
            if ((!is.na(jrow$nitrate)) && (!is.na(jrow$sulfate))) {
                count <- count + 1
            }
        }    
        appendData <- data.frame(id=i, nobs=count)
        cdataframe <- rbind(cdataframe, appendData)
    }
    
    cdataframe
}