
Holding  <- NULL
j <- for(i in 1:1000)
  Holding <- rbind(Holding, t(Pilsfer.Method()[,1]))

 j <- for(i in 1:1000)
+ Holding <- rbind(Holding, t(Pilsfer.Method()[,1]))
> mean.maybe <- apply(Holding, 1, mean)
> hist(mean.maybe)

