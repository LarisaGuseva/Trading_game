price <- read.csv("data/444.csv")
require(rugarch)
attSpec <- ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                      mean.model=list(armaOrder=c(1,1)),
                      distribution.model="std")
attLog <- log(price)
attLogSpec <- ugarchspec(variance.model =list(model="sGARCH", garchOrder=c(1,1)),
                         mean.model=list(armaOrder=c(1,1)),
                         distribution.model="std")
attLogGarch <- ugarchfit(spec=attSpec, data=attLog)

attpred <- ugarchboot(attLogGarch, n.ahead = 7, method=c("Partial", "Full")[1])
plot(attpred, which=2)

