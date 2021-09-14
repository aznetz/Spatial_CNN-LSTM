library(pROC)
library(randomForest)

# example
y_temp = rbinom(50,1,0.3)
p_hat = runif(50,0,1)
pROC::ci.auc(y_temp, p_hat)
## 95% CI: 0.5649-0.856 (DeLong)
?pROC::ci.auc
pROC::ci.auc(y_temp, p_hat, method='bootstrap')
## 95% CI: 0.5657-0.8438 (2000 stratified bootstrap replicates)
pROC::auc(y_temp, p_hat)


# code start
# VGG16
T_true <- read.csv(file="H:/CODE/JUPYTER/PROJECTS/1_1_PsP/VGG16_OpenCL/y_true.csv", header=FALSE, sep=",")
T_pred <- read.csv(file="H:/CODE/JUPYTER/PROJECTS/1_1_PsP/VGG16_OpenCL/y_prob.csv", header=FALSE, sep=",")

# LSTM
T_true <- read.csv(file="H:/CODE/JUPYTER/PROJECTS/1_1_PsP/CNN_LSTM/y_true.csv", header=FALSE, sep=",")
T_pred <- read.csv(file="H:/CODE/JUPYTER/PROJECTS/1_1_PsP/CNN_LSTM/y_prob.csv", header=FALSE, sep=",")

# auc 95% C.I.
y_true = T_true[,1]
y_pred = T_pred[,1]
AUCval<-pROC::auc(y_true, y_pred)
ci<-pROC::ci.auc(y_true, y_pred, method='bootstrap')
AUCval
ci
ci-(2*AUCval-1) # when tpr and fpr are switched
