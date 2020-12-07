# check for package, install if missing
if (!require("baseballr")) {
  devtools::install_github("BillPetti/baseballr")
}

# load package
library("baseballr")

# helper function to retrieve all pithces for a single day
get_daily_pithces = function(date) {
  scrape_statcast_savant_batter_all(start_date = date, end_date = date)
}

# define dates for all statcast years
dates_2015 = seq(as.Date("2015-01-01"), as.Date("2015-12-31"), by = "1 days")
dates_2016 = seq(as.Date("2016-01-01"), as.Date("2016-12-31"), by = "1 days")
dates_2017 = seq(as.Date("2017-01-01"), as.Date("2017-12-31"), by = "1 days")
dates_2018 = seq(as.Date("2018-01-01"), as.Date("2018-12-31"), by = "1 days")
dates_2019 = seq(as.Date("2019-01-01"), as.Date("2019-12-31"), by = "1 days")
dates_2020 = seq(as.Date("2020-01-01"), as.Date("2020-12-31"), by = "1 days")

# collect all pithces for each year as a data frame
pithces_2015 = do.call(rbind, lapply(dates_2015, get_daily_pithces))
pithces_2016 = do.call(rbind, lapply(dates_2016, get_daily_pithces))
pithces_2017 = do.call(rbind, lapply(dates_2017, get_daily_pithces))
pithces_2018 = do.call(rbind, lapply(dates_2018, get_daily_pithces))
pithces_2019 = do.call(rbind, lapply(dates_2019, get_daily_pithces))
pithces_2020 = do.call(rbind, lapply(dates_2020, get_daily_pithces))

# write data to files
data.table::fwrite(pithces_2015, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2015.csv")
data.table::fwrite(pithces_2016, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2016.csv")
data.table::fwrite(pithces_2017, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2017.csv")
data.table::fwrite(pithces_2018, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2018.csv")
data.table::fwrite(pithces_2019, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2019.csv")
data.table::fwrite(pithces_2020, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_2020.csv")

# merge all data
pithces_all = rbind(
  pithces_2015,
  pithces_2016,
  pithces_2017,
  pithces_2018,
  pithces_2019,
  pithces_2020
)

# write full data to file
data.table::fwrite(pithces_all, file = "C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_all.csv")
