# Load packages
library("tidyverse")
library("caret")
library("rpart")
library("rpart.plot")
# read in the data

#You might have to modify this using your own path.
hd = read_csv("C:/Users/cozyn/Desktop/STATS432/heart-analysis/data/hd.csv")

# test train split the data
set.seed((42))
trn_idx = createDataPartition(hd$num, p = 0.80, list = TRUE)
hd_trn = hd[trn_idx$Resample1, ]
hd_tst = hd[-trn_idx$Resample1, ]

# function to determine proportion of NAs in a vector
na_prop = function(x) {
  mean(is.na(x))
}

# check proportion of NAs in each column
sapply(hd, na_prop)

# create dataset without columns containing more than 30% NAs
hd_trn = na.omit(hd_trn[, !sapply(hd, na_prop) > 0.30])

# coerce character variables to be factors
hd_trn$num = factor(hd_trn$num)
hd_trn$location = factor(hd_trn$location)
hd_trn$cp = factor(hd_trn$cp)
hd_trn$sex = factor(hd_trn$sex)
hd_trn$fbs = factor(hd_trn$fbs)
hd_trn$restecg = factor(hd_trn$restecg)
hd_trn$exang = factor


#additionla feature engineering 
hd_trn[which(hd_trn$chol == 0), ]$chol = NA

# look at the data
skimr::skim(hd_trn)

#starting exploratory analysis
plot(trestbps ~ age, data = hd_trn, pch = 20, col = hd_trn$num)
grid()

# can we fit a model?
# knn3(num~., data = hd_trn)
rpart::rpart(num~., data=hd_trn)

###############################################################################


hd_trn_full = na.omit(hd_trn)
 
# estimation-validation split the data
set.seed((42))
trn_idx = createDataPartition(hd_trn_full$num, p = 0.80, list = TRUE)
hd_est = hd_trn_full[trn_idx$Resample1, ]
hd_val = hd_trn_full[-trn_idx$Resample1, ]


# looking at response in estimation
table(hd_est$num)


# establishing first baseline
table(
  actual = hd_val$num,
  predicted = rep("v0", length(hd_val$num))
)

# fit the first model
mod = rpart(num~., data = hd_est)

# establishing first model-based baseline
table(
  actual = hd_val$num,
  predicted = predict(mod, hd_val, type = "class")
)


# calculate baseline accuracy
mean(predict(mod, hd_val, type = "class")==hd_val$num)

###############################################################################
hd_trn_full = na.omit(hd_trn)

# TODO: with cross-validation, tune decision tree, knn, bossted model

cv_5 = trainControl(method = "cv", number = 5)

hd_tree_tune = expand.grid(
  cp = c(0, 0.0001, 0.001, 0.01, 0.1, 1)
)

hd_knn_tune = expand.grid(
  k = 1:100
)


hd_gbm_tune = expand.grid(
  n.trees = c(50, 100, 150, 200),
  interaction.depth = 1:3,
  shrinkage = c(0.1, 0.3),
  n.minobsinnode = c(5,10)
)

hd_tree_mod = train(form = num~., 
                    data = hd_trn_full, 
                    method = "rpart", 
                    trControl = cv_5, 
                    tuneLength = 10)

hd_knn_mod = train(form = num~., 
                    data = hd_trn_full, 
                    method = "knn", 
                    trControl = cv_5, 
                    tuneGrid = hd_knn_tune)

hd_gbm_mod = train(form = num~., 
                   data = hd_trn_full, 
                   method = "gbm", 
                   trControl = cv_5,
                   tuneGrid = hd_gbm_tune,
                   verbose = FALSE)

hd_rf_mod = train(form = num~., 
                   data = hd_trn_full, 
                   method = "rf", 
                   trControl = cv_5,
                   verbose = FALSE)

predict(hd_tree_mod, data = hd_trn_full, type = "prob")
predict(hd_knn_mod, data = hd_trn_full, type = "prob")
predict(hd_gbm_mod, data = hd_trn_full, type = "prob")
predict(hd_rf_mod, data = hd_trn_full, type = "prob")


#rpart()
#knn3()
#gbm()

