path <- "D:/Data/"
    
    
pollutantmean <- function(directory, pollutant, id = 1:332) {
    file.names <- list.files(paste0(path,directory),full.names=TRUE)
    file.numbers <- 1:332
    file.selection <- file.names[match(id, file.numbers)]
    file.content <- lapply(file.selection,read.csv) #get all content
    p1 <- sapply(file.content, function(x) x[,pollutant]) #get values in pollutant column
    p2 <- sapply(p1, function(x) x[!is.na(x)]) #remove NA
    mean_vector <- unlist(p2)
    round(mean(mean_vector),3)
}
