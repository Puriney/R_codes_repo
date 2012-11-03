#构造渐变色

#从红色到蓝色的渐变
colorfun <- colorRamp(c("#CC0000","white","#3366CC"), space="Lab")
#colorfun会返回数值:
#colorfun(1)
#[,1] [,2] [,3]
#[1,]   51  102  204
#即颜色#3366CC的蓝色

#从0到1, 便可以得到连续的30个与数值大小对应的颜色
rgb(colorfun(seq(0,1,length=30)))
#绘图可见:
barplot(rep(1,30),col=rgb(colorfun(seq(0,1,length=30)),maxColorValue=255))