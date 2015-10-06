price <- read.csv("data/input_of_the_first_week.csv")
divStuff <-function(aCol){
  
  newCol <- log(aCol[2:length(aCol)]/aCol[1:length(aCol)-1])*100
  newCol <- c(NA,newCol)
  
  return(newCol)
}
return_data <- as.matrix(data.frame(lapply(price[-1],divStuff)))
return_data <- return_data [-1,]

Expected_Return <- (t (rep(1,nrow(return_data))) %*% return_data)*1/nrow(price)
Expected_Return_matrix <- t(replicate(nrow(return_data),as.vector(Expected_Return)))
Covariance <- (t(return_data-Expected_Return_matrix) %*% (return_data-Expected_Return_matrix))/nrow(price)
weights <- runif(ncol(return_data))
weights <- weights/sum(weights)
getSharpeRatio <- function(myWeights,ExpRet,CovMat){
  myWeights <- myWeights/sum(myWeights)
  minFunc <- (t(myWeights) %*% t(ExpRet))-sqrt(t(myWeights) %*% CovMat %*% myWeights)/2
  return(-minFunc)
}

sharpRatio <- optim (par = weights, 
                    fn = getSharpeRatio,
                    ExpRet = Expected_Return, 
                    CovMat = Covariance,
                    method = "L-BFGS-B",
                    lower = 0,
                    upper = 1)

optWeights <- sharpRatio$par/sum(sharpRatio$par)      
sRatioExcel <- -1*getSharpeRatio(weights,Expected_Return,Covariance)
sRatioR <- -1*getSharpeRatio(optWeights,Expected_Return,Covariance)
optWeights                
