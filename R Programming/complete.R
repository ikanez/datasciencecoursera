path <- "D:/Data/"

complete <- function(directory, id = 1:332) {
    file.names <- list.files(paste0(path,directory),full.names=TRUE)
    file.numbers <- 1:332
    file.selection <- file.names[match(id, file.numbers)]
    nobs <- c()
    
    for (i in seq_along(id)) {
        nobs <- c(nobs,sum(complete.cases(read.csv(file.selection[[i]]))))        
    }
    result <- data.frame(id = id, nobs = nobs)
    result
   
}