library(ggplot2)
qplot(carat,price,data=diamonds,color=clarity,xlab='Carat',ylab='Price',
      main='Diamond Price')+
      
        #会导致misleading graph 溢出(1,3.5)的数据都不会做图
        #xlim(1,3.5)+
        
        #这才是真zoom-in到局部的做法
        coord_cartesian(xlim=c(1,3.5))+
        theme(plot.title=element_text(size=23))