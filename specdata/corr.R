corr <- function(directory, threshold = 0) {
 
      ## set working directory to be directory
      setwd(paste("/Users/flavio/", directory, sep =""))
      
      ## vector which associates each chosen integer in id to 
      ## the character string "id[with 3 characters].csv" 
      filenames <- paste(formatC(1:332, width=3, flag="0"),".csv", sep="")
      
      ## initialize all_data as a list
      all_data <- list()
      
      ## initialize results as a vector
      results <- c()
      
      ## assigns the ith chosen file to alldata's ith element
      for (i in seq_along(filenames)) {
            all_data[[i]] <- read.csv(filenames[i])}
            
      ## initialize nobs as a list
      nobs <- c()
            
      ## loop counts complete observations in all files 
      for (k in seq_along(all_data)) {
                  
            now_file <- all_data[[k]]
            nobs[k] <- sum(complete.cases(now_file))}
            
            ## determines which monitors have complete data above threshold
            above <- (nobs > threshold)
            
            ## loop calculates correlation for all above-threshold monitors...
            for (j in which(above)) {
                  
                  now_file <- all_data[[j]]
                  x <- now_file[complete.cases(now_file), "sulfate"]
                  y <- now_file[complete.cases(now_file), "nitrate"]
                  
            ## ... and places the correlations in a 332-coordinate vector
            results[j]<-cor(x,y)}
            
            ## removes NAs from "results" vector
            results2 <- results[!is.na(results)]
      
            
}