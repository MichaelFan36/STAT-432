# read data
hd = readr::read_csv("data/hd.csv")

# check size of data
nrow(hd)

# check size of data if any observations with NAs are removed
nrow(na.omit(hd))

# function to determine proportion of NAs in a vector
na_prop = function(x) {
  mean(is.na(x))
}

# check proportion of NAs in each column
sapply(hd, na_prop)

# create dataset without columns containing more than 33% NAs
hd_clean = na.omit(hd[, !sapply(hd, na_prop) > 0.33])

# check "cleaned" dataset size
nrow(hd_clean)

# compare to "full" dataset
nrow(hd_clean) / nrow(hd)
