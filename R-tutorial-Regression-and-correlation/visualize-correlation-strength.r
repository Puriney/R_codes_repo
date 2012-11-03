#主要所用函数
#ctab和plotcorr

#产出数据
set.seed(1026)
vvar <- 1:20 + rnorm(20,sd=3)
wvar <- 1:20 + rnorm(20,sd=5)
xvar <- 20:1 + rnorm(20,sd=3)
yvar <- (1:20)/2 + rnorm(20, sd=10)
zvar <- rnorm(20, sd=6)
data <- data.frame(vvar,wvar,xvar,yvar,zvar)

#绘图
library(ellipse)
#相关性表格
ctab <- cor(data)

#绘图, 但数据为灰白
plotcorr(ctab)

#绘图, 但图的颜色与相关性大小相对应
round(ctab,2)
#vvar  wvar  xvar  yvar  zvar
#vvar  1.00  0.74 -0.88  0.06 -0.03
#wvar  0.74  1.00 -0.64 -0.05  0.13
#xvar -0.88 -0.64  1.00 -0.17 -0.17
#yvar  0.06 -0.05 -0.17  1.00  0.22
#zvar -0.03  0.13 -0.17  0.22  1.00

#红色到蓝色的渐变色
colorfun <- colorRamp(c("#CC0000","white","#3366CC"), space="Lab")
#数值(0,1),颜色(红色,蓝色)
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255))