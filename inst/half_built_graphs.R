ferguson <- as.vector(fm)
pilsfer <- as.vector(pm)
heroic <- as.vector(hm)
base <- as.vector(bm)
data <- data.frame(ferguson, pilsfer, heroic, base)
library(reshape2)
diti <- melt(data)
ggplot(diti, aes(value)) + geom_bar(aes(fill = variable)) + facet_wrap(~variable)

fmax <- apply(fm, 2, max)
pmax <- apply(pm, 2, max)
hmax <- apply(hm, 2, max)
bmax <- apply(bm, 2, max)
dat.max <- melt(data.frame(fmax, pmax, hmax, bmax))
ggplot(dat.max, aes(value)) + geom_bar(aes(fill = variable)) + facet_wrap(~variable)




fmean <- apply(fm, 2, mean)
pmean <- apply(pm, 2, mean)
hmean <- apply(hm, 2, mean)
bmean <- apply(bm, 2, mean)
dat.max <- melt(data.frame(fmean, pmean,  hmean, bmean))
ggplot(dat.max, aes(value)) + geom_bar(aes(fill = variable)) + facet_wrap(~variable) + guides(fill=FALSE)





fmin <- apply(fm, 2, min)
pmin <- apply(pm, 2, min)
hmin <- apply(hm, 2, min)
bmin <- apply(bm, 2, min)
dat.max <- melt(data.frame(fmin, pmin,  hmin, bmin))
ggplot(dat.max, aes(value)) + geom_bar(aes(fill = variable)) + facet_wrap(~variable) + guides(fill=FALSE)
