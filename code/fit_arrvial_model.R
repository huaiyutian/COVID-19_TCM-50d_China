rm(list = ls())
library(MASS)
library(readxl)
library(car)

infected=read_xlsx(".../data/fit_arrival_model.xlsx",sheet="1")
infectedW=infected[infected$arrivalday>=2,]

step.model <- lm(arrivalday~lat+lon+log10(Pop2018)+
             log10(Totalflow)+aftershutdown,data=infectedW)
summary(step.model)

### Diagnosis###
par(mfrow = c(2,2))
plot(fitted(step.model),
     residuals(step.model, type = "pearson"),
     xlab = "Fitted values", ylab = "Pearson residuals")
plot(fitted(step.model),
     residuals(step.model, type = "deviance"),
     xlab = "Fitted values", ylab = "Deviance residuals")
influencePlot(step.model)
fit1 <- lm(arrivalday~lat+lon+log10(Pop2018)+log10(Totalflow)+aftershutdown,
           data=infectedW[-c(64,72,255,257,258),])

summary(fit1)
influencePlot(fit1)
lmtest::bptest(fit1)
coeftest(fit1, vcov = vcovHC(fit1))
qqnorm(fit1$residuals)
qqline(fit1$residuals)
shapiro.test(fit1$residuals)


