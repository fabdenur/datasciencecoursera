complete <- function(directory, id = 1:332) {
            
      ## set working directory to be directory
      setwd(paste("/Users/flavio/", directory, sep =""))
            
      ## vector which associates each chosen integer in id to 
      ## the character string "id[with 3 characters].csv" 
      filenames <- paste(formatC(id, width=3, flag="0"),".csv", sep="")
            
      ## initialize all_data as a list
      all_data <- list()
            
      ## assigns the ith chosen file to alldata's ith element
      for (i in seq_along(filenames)) {
            all_data[[i]] <- read.csv(filenames[i])
      
      ## initialize nobs as a list
      nobs <- c()
      
      ## loop counts complete observations in all files 
      for (k in seq_along(all_data)) {
            
      nobs[k] <- sum(complete.cases(all_data[[k]]))}
      }
      
      ## create dataframe and print
      df <- data.frame(id, nobs)
      
      print(df)
}