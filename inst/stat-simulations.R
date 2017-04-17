
library(ggplot2)

n = 100000
fm<-replicate(n = n, expr = stat.roll(method = Ferguson.Method))
fm<-fm[1,,1:n]
pm<-replicate(n = n, expr= stat.roll(method = Pilsfer.Method))
pm<-pm[1,,1:n]
hm<-replicate(n = n, expr=stat.roll(method = Heroic.Method))
hm<-hm[1,,1:n]
bm<-replicate(n = n, expr=stat.roll(method = Base.Method))
bm<-bm[1,,1:n]
cm<-replicate(n = n, expr=stat.roll(method = Commoner.Method))
cm<-cm[1,,1:n]

#method<- as.data.frame(cbind(fm,pm,hm,bm,cm))

dat <- data.frame(xx = c(fm,pm,hm,bm,cm),yy = rep(c("fm","pm","hm","bm","cm"),each = n))

#ggplot(method) + geom_histogram(data = fm)

ggplot(dat, aes(x =xx)) + 
  geom_histogram(data=subset(dat,yy == 'fm'),fill = "red", alpha = 0.2) +
  geom_histogram(data=subset(dat,yy == 'pm'),fill = "blue", alpha = 0.2) +
  geom_histogram(data=subset(dat,yy == 'hm'),fill = "green", alpha = 0.2) +
  geom_histogram(data=subset(dat,yy == 'bm'),fill = "black", alpha = 0.2) +
  geom_histogram(data=subset(dat,yy == 'cm'),fill = "orange", alpha = 0.2)

 ggplot(dat, aes(x =xx)) +
   geom_histogram(data=subset(dat,yy == 'fm'),fill = "red", alpha = 0.4) +
   geom_histogram(data=subset(dat,yy == 'pm'),fill = "blue", alpha = 0.4) +
   geom_histogram(data=subset(dat,yy == 'hm'),fill = "green", alpha = 0.4) +
   geom_histogram(data=subset(dat,yy == 'bm'),fill = "black", alpha = 0.4) +
   geom_histogram(data=subset(dat,yy == 'cm'),fill = "orange", alpha = 0.4) +
facet_grid(yy ~ .) +  ggtitle("Stat Roll Methods") +  theme(legend.position="none") 
 
 save(dat, file = "stat-simulation.rda")
