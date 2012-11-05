par(ask=FALSE)
for(i in seq(0.1, 0, -0.005)){
  tmp <- cor.mtest(mtcars,1-i)
  corrplot(M, p.mat = tmp[[1]], low=tmp[[2]], upp=tmp[[3]], order="hclust",
           pch.col="red", sig.level = i, plotC="rect", cl.pos="n",
           mar=c(0,0,1,0), 
           title=substitute(alpha == x,list(x=format(i,digits=3,nsmall=3))))
  Sys.sleep(0.15)
}