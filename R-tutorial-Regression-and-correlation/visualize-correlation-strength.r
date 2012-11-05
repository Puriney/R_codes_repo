#functions we will use
#cor
#plotcorr
#corrplot

#产出数据
set.seed(1026)
vvar <- 1:20 + rnorm(20,sd=3)
wvar <- 1:20 + rnorm(20,sd=5)
xvar <- 20:1 + rnorm(20,sd=3)
yvar <- (1:20)/2 + rnorm(20, sd=10)
zvar <- rnorm(20, sd=6)
data <- data.frame(vvar,wvar,xvar,yvar,zvar)


library(ellipse)
#table
ctab <- cor(data)

#graphing, but grey-white
plotcorr(ctab)

#graphing, and data-value <-> color
round(ctab,2)
#vvar  wvar  xvar  yvar  zvar
#vvar  1.00  0.74 -0.88  0.06 -0.03
#wvar  0.74  1.00 -0.64 -0.05  0.13
#xvar -0.88 -0.64  1.00 -0.17 -0.17
#yvar  0.06 -0.05 -0.17  1.00  0.22
#zvar -0.03  0.13 -0.17  0.22  1.00

#red->blue gradient
colorfun <- colorRamp(c("#CC0000","white","#3366CC"), space="Lab")
#value: (0,1); color:(red,blue)
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255))

#corrplot
par (ask=FALSE)
for (i in c("circle", "square", "ellipse", "number", "shade", "color", "pie")){
  corrplot(ctab,method=i,title=paste("method:",i,sep=""))
  Sys.sleep(2)
}

cor.mtest <- function(mat, conf.level = 0.95){
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat <- lowCI.mat <- uppCI.mat <- matrix(NA, n, n)
  diag(p.mat) <- 0
  diag(lowCI.mat) <- diag(uppCI.mat) <- 1
  for(i in 1:(n-1)){
    for(j in (i+1):n){
      tmp <- cor.test(mat[,i], mat[,j], conf.level = conf.level)
      p.mat[i,j] <- p.mat[j,i] <- tmp$p.value
      lowCI.mat[i,j] <- lowCI.mat[j,i] <- tmp$conf.int[1]
      uppCI.mat[i,j] <- uppCI.mat[j,i] <- tmp$conf.int[2]
    }
  }
  return(list(p.mat, lowCI.mat, uppCI.mat))
}
res1<-cor.mtest(ctab,0.95)
corrplot(ctab, p.mat = res1[[1]], sig.level=0.2,order="hclust",addrect=3,cl.length=5,cl.align.text="l",tl.col="black",tl.srt=45,bg="#fcfcfc",addCoef.col="black",tl.srt=45,method="ellipse",)

