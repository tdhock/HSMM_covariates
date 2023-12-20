
library(data.table)
library(ggplot2)
(objs=load("dat.RData"))
str(dat)
dir.long <- melt(data.table(dat)[, data.i := .I], id.vars="data.i", measure.vars=c("Wind.Dir", "Wave.Dir"))
gg <- ggplot()+
  geom_point(aes(
    data.i, value),
    data=dir.long)+
  facet_grid(variable ~ .)
png("plot_realdata.png", width=10, height=4, units="in", res=100)
print(gg)
dev.off()
