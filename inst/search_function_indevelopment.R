
testing <- spell_description %>% map(names) %>% map(grep, pattern = "skin")
testing


nam <- row.names(melt(unlist(testing)))
nam


unit.num <- unlist(testing)
unit.num

hope <- cbind(unit.num, nam)

holding <- NULL
for(i in 1:dim(hope)[1]){
lis <- list( spell_description[[hope[i,2]]][[as.numeric(hope[i,1])]])
holding <- c(holding, lis)
  }


