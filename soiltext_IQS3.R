


install.packages( pkgs = "soiltexture" )
library( soiltexture )


setwd(""C:/Users/your_username/dataset/soiltestext.csv"")

soiltextIQS3 <- read.csv("soiltestext.csv", sep = ";", dec = ",", header = T)

attach(soiltextIQS3)

TT.plot(class.sys= "USDA.TT", tri.data= soiltextIQS3, main= "Soil texture data")

TT.plot(class.sys = "USDA.TT", tri.data = soiltextIQS3, z.name = "Corg",
        main = "Corg bubble plot",
        class.p.bg.col = c("#993404", "#cc4c02", "#ec7014", "#fe9929",
                           "#fec44f", "#fee391", "#fff7bc", "#ffffe5",
                           "#ffeda0", "#fed976", "#feb24c", "#fd8d3c"))

z.cex.range <- TT.get("z.cex.range")
def.pch <- par("pch")
def.col <- par("col")
def.cex <- TT.get("cex")
oc.str <- TT.str(soiltextIQS3[,"Corg"],z.cex.range[1],z.cex.range[2])
  
legend(
  x = 80,
  y = 90,
  title =
    expression( bold('Corg [g.kg'^-1 ~ ']') ),
  legend = formatC(
    c(
      min( soiltextIQS3[,"Corg"] ),
      quantile(soiltextIQS3[,"Corg"] ,probs=c(25,50,75)/100),
      max( soiltextIQS3[,"Corg"] )
    ),
    format = "f",
    digits = 1,
    width = 4,
    flag = "0"
  ), #
  pt.lwd = 4,
  col = def.col,
  pt.cex = c(
    min( oc.str ),
    quantile(oc.str ,probs=c(25,50,75)/100),
    max( oc.str )
  ),
  pch = def.pch,
  bty = "o",
  bg = NA,
 
  text.col = "black",
  cex = def.cex
) 

  




