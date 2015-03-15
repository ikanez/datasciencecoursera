path <- "D:/Data/"

corr <- function(directory, threshold = 0) {
    file.names <- list.files(paste0(path,directory),full.names=TRUE)
    #id <- 1:332
    file.numbers <- 1:332
    #file.selection <- file.names[match(1:332, file.numbers)]
    nobs <- c()
    
    for (i in 1:332) {
        nobs <- c(nobs,sum(complete.cases(read.csv(file.names[[i]]))))        
    }
    
    df <- data.frame(id = 1:332, nobs = nobs)
    df_2 <- subset(df, nobs >= threshold)
    
    cor_result <- c()
    
    for (i in seq_along(df_2$id)) {
        data <- read.csv(file.selection[df_2$id[i]])
        cor_result <- c(cor_result,cor(data$sulfate,data$nitrate, use="pairwise.complete.obs", method="pearson"))
    }
    #round(cor_result,5)
    cor_result
}