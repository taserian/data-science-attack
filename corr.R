corr <- function(directory, threshold = 0) {
    output <- c()
    comp <- complete(directory)
    
    for(i in 1:nrow(comp)){
        comprow <- comp[i,]
        if(comprow$nobs > threshold) {
            filename <- paste(directory,"/",sprintf("%03d", i),".csv", sep='')
            pdata <- read.csv(filename)
            correl <- cor(pdata$sulfate, pdata$nitrate, use="complete.obs")
            output <- c(output, correl)
        }
    }
    
    output
}