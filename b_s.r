# Mustafa Anjrini on 27.08.2024

b_s<- function(x,knots,degree){
  M<- degree+1 
  k<- length(knots) # N of knots
  
  #row matrix of the basis functions
  mm<-matrix(rep(0,length(a)*(k+2*M)),ncol = k+2*M)
  
  #constructing the t values of the knots
  t<-rep(0,(k+2*M))
  t[M]<- min(a)
  t[M+k+1]<- max(a)
  t[(M+1):(M+k)]<-knots
  
  #for the left side of t, we remove one from each value for
  #the calculations
  for (i in (M-1):1) {
    t[i]<-t[M]-i
  }
  
  #for the right side of t, we add i to each value for
  #the calculations
  for (i in (M+k+2):(k+2*M)) {
    t[i]<-t[M+k+1]+i
  }
  
    
  # constructing the b(i,1) of the basis functions as
  # it contains only 1s
  for (i in M:(k+M)) {
      if (i==(k+M)) {
        mm[t[i]<=a ,i]<-1
      }else{
        mm[t[i]<=a & a<t[i+1],i]<-1
      }
  }
  
    
  #looping for the calculating the matrix of the basis functions  
  for (m in 2:M) {
      for (i in 1:(k+2*M-m)) {
        mm[,i]<-(a-t[i])/(t[i+m-1]-t[i])*mm[,i]+(t[i+m]-a)/(t[i+m]-t[i+1])*mm[,i+1]
      }
  }
  
  return(mm[,1:(k+M-1)])
}

library(ISLR2)
library(splines)



df<- Wage
a<- df$age
knots<-c(21,25,30,35,40,45,50,55,60,65,70,75)

lm_1<- lm(wage~b_s(x = a,knots = knots,degree = 5),data = df)
lm_2<- lm(wage~bs(x = a,degree = 5,knots = knots),data = df)
lm_1$fitted.values[70:75]
lm_2$fitted.values[70:75]




