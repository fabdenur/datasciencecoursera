pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      ## vector which associates each chosen integer in id to filename "id[with 3 characters].csv" 
      filenames <- paste(formatC(id, width=3, flag="0"),".csv", sep="")
      
      ## (FAILED) attempt to initialize a list which will contain all files to be read
      all_data <- list()
      
      ## assigning the ith chosen file to alldata's ith element
      for (i in seq_along(my_files)) {
            all_data[[i]] <- read.csv(filenames[i])
      }
      
      
      ## calculates the mean of all non_NA elements of the column which corresponds to pollutant
      mean(monitor001[!is.na(monitor001[,pollutant]),pollutant])
      
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean; either "sulfate" or "nitrate".
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
      ## NOTE: Do not round the result!
}