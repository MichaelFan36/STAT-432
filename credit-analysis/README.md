# Kaggle's Credit Card Fraud Detection Analysis

This repository contains the files necessary to get started with the Credit Card Fraud Detection data set from [Kaggle](https://www.kaggle.com/) for analysis in [STAT 432](https://stat432.org/) at the [University of Illinois at Urbana-Champaign](https://illinois.edu/).

## Files and Directories

- `README.md`: The file that you are reading that describes the analysis and data provided.
- `make-data.R`: The R script used to scrape and wrangle the data.
- `analysis.Rmd`: A **template** R Markdown file to be used for reporting the results of your analysis.
- `data-raw/creditcard.csv.zip`: The original data downloaded from Kaggle and zipped.
- `credit-analysis.Rproj`: An RStudio project file.

Additional files are created by running the `make-data.R` script.

- `data/cc-sub.csv`: The subset of the data as created by the `make-data.R` script.
- `data/cc.csv.gz`: The "full" data as created by the `make-data.R` script.

## Source and Documentation

The data stored in `data-raw` folder was accessed from Kaggle. Please be aware of the documentation provided there.

- [Documentation: Kaggle Credit Card Fraud Detection](https://www.kaggle.com/mlg-ulb/creditcardfraud)

## Analysis Goal

The goal of this analysis is to use the provided data in order to create tool that can be used to detect credit card fraud.

## Additional Context

The `Class` variable indicates whether or not a transaction is genuine or fraud. In the original data, these were encoded as `0` and `1` respectively. In the processed data contained in the `data` folder, these have been changed to `genuine` and `fraud` to avoid any confusion.

Because the "full" data is somewhat larger, for the purpose of completing a data analysis for STAT 432, you may simply work with a subset of the data, but consider taking on the challenge of trying to use the full data with whatever limited computational resources you have available.
