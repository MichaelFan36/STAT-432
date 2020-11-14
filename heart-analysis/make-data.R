# read in each "processed" dataset from UCI
hd_cl = data.table::fread("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data")
hd_hu = data.table::fread("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.hungarian.data")
hd_ch = data.table::fread("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data")
hd_va = data.table::fread("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data")

# add location variable for each dataset
hd_ch$location = "ch"
hd_cl$location = "cl"
hd_hu$location = "hu"
hd_va$location = "va"

# combine the four locations into one dataset
hd = rbind(hd_cl, hd_ch, hd_hu, hd_va)

# add column names
colnames(hd) = c(
  "age",
  "sex",
  "cp",
  "trestbps",
  "chol",
  "fbs",
  "restecg",
  "thalach",
  "exang",
  "oldpeak",
  "slope",
  "ca",
  "thal",
  "num",
  "location"
)

# rename response variable
hd$num = factor(dplyr::case_when(
  hd$num == 0 ~ "v0",
  hd$num == 1 ~ "v1",
  hd$num == 2 ~ "v2",
  hd$num == 3 ~ "v3",
  hd$num == 4 ~ "v4"
))

# switch "?" to NA
hd[hd == "?"] = NA

# write to disk
data.table::fwrite(hd, file = "data/hd.csv")

# clean up
rm(hd_cl, hd_hu, hd_ch, hd_va, hd)
