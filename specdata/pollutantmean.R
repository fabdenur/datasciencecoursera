pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      ## set working directory to be directory
      setwd(paste("/Users/flavio/", directory, sep =""))
      
      ## vector which associates each chosen integer in id to
      ## the character string  "id[with 3 characters].csv" 
      filenames <- paste(formatC(id, width=3, flag="0"),".csv", sep="")
      
      ## initializes all_data as a list
      all_data <- list()
      
      ## assigns the ith chosen file to all_data's ith element
      for (i in seq_along(filenames)) {
            all_data[[i]] <- read.csv(filenames[i])
      }
      
      ## initializes single_vector as a vector
      single_vector <- vector()
      
      ## concatenates all numerical data of chosen pollutant into a single vector
      for (i in  seq_along(all_data)){
            single_vector <- c(single_vector, all_data[[i]][!is.na(all_data[[i]][,pollutant]),pollutant])
      }
      
      ## calculates the mean of all data for the chosen pollutant
      mean(single_vector)
}