
install.packages("survminer")
install.packages("survAUC")
install.packages("coefplot")
install.packages("DT")
install.packages("c060")

library(glmnet)
library("survival")
library("survminer")
library(survAUC)
library(coefplot)
library(DT)
library(c060)

setwd(".../AML/AML journal paper/survival")

DATA <- read.table(".../AML/AML journal paper/survival/train/data_train_riskscore_R.txt",header = TRUE)


x <- model.matrix(os + censor ~., DATA)[,-1]
y <- Surv(DATA$os, DATA$censor)

cv.fit <- cv.glmnet(x, y, family="cox", nfolds=10, alpha=1) # alpha=1 is lasso and alpha=0 is ridge

plot(cv.fit)
plot(cv.fit$glmnet.fit, xvar="lambda", label=T)
plot(cv.fit$glmnet.fit, xvar="dev", label=T)
plot(cv.fit$glmnet.fit, label=T)

cv.fit$lambda.min # Best Lambda
cv.fit$lambda.1se
cv.fit$cvm[which(cv.fit$lambda==cv.fit$lambda.1se)] # MSE @ lambda.min

coef(cv.fit, s = "lambda.min")#1se
c <- coef(cv.fit, s="lambda.min")#1se
inds <- which(c!=0)
Coefficient <- c[inds]


################## Univariate
DATA <- read.table(".../AML/AML journal paper/survival/train/data_train_riskscore_R.txt",header = TRUE)
DATA <- read.table(".../AML/AML journal paper/survival/test/data_test_riskscore_R.txt",header = TRUE)



model <- coxph(Surv(os, censor) ~ risk_score, data=DATA)
summary(model)

######## KM curves


DATA <- read.table(".../AML/AML journal paper/survival/train/data_train_riskscore_R.txt",header = TRUE)
DATA <- read.table(".../AML/AML journal paper/survival/test/data_test_riskscore_R.txt",header = TRUE)

library(survival)
fit <- survfit(Surv(os, censor) ~ class,
               data = DATA)
# Visualize with survminer
ggsurvplot(fit, palette= c("blue", "red"), data = DATA, risk.table = TRUE)


install.packages("ggfortify")
library(ggfortify)
library(survival)
fit <- survfit(Surv(os, censor) ~ class, data = DATA)
autoplot(fit)


######### MultiVariate Analysis 


#Train
DATA3 <- read.table(".../AML/AML journal paper/survival/train/data_train_riskscore_R.txt",header = TRUE)

model <- coxph(Surv(os, censor) ~ BlastPercent+Gender+DiseaseType+risk_score+age+Conditioning_Intensity+CMI, data=DATA3)

summary(model)

#Test
DATA <- read.table(".../AML/AML journal paper/survival/test/data_test_riskscore_R.txt",header = TRUE)


model <- coxph(Surv(os, censor) ~ BlastPercent+Gender+DiseaseType+risk_score+age+Conditioning_Intensity+CMI, data=DATA)

summary(model)

