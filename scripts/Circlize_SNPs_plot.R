##- Read the .csv into correct data types
snps <- read.csv("LH4.csv")  ## specify correct file
snps$gene <- as.factor(snps$gene)
snps$start <- as.numeric(snps$start)
snps$end <- as.numeric(snps$end)

#Import library
library(circlize)
#clear any current stored circos
circos.clear()

##- Export the .png image
#Initiate image device 
png("L4.png", width = 4, height = 4, units = 'in', res = 700 ) ## secify correct filename

#Make circos plot
circos.genomicInitialize(snps)

circos.genomicTrack(snps,ylim=c(0,1),
                          # bg.col= c("#FF000040","#00FF0040","#0000FF40"),
                          panel.fun = function(region, value, ...) {
                            circos.genomicLines(region, value=1, type = "h",col="blue")
                          })

#Close image device
dev.off()

# #Turn off devices
# dev.cur()
# dev.off (1) #adjust based on number of device

##-- v0
#with png(), the plot doesn't show up in plot pane but it is saved into the folder
#Image devices issue: needs to run dev.cur() to see how many devices running use dev.off() to deactivate
