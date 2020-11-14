# UCI Heart Disease Analysis

This repository contains the files necessary to get started with the Heart Disease data set from the [UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/ml/index.php) for analysis in [STAT 432](https://stat432.org/) at the [University of Illinois at Urbana-Champaign](https://illinois.edu/).

## Files and Directories

- `README.md`: The file that you are reading that describes the analysis and data provided.
- `make-data.R`: The R script used to scrape and wrangle the data.
- `check-data.R`: An R script used to validate the created data. Contains hints for dealing with the missing data.
- `analysis.Rmd`: A **template** R Markdown file to be used for reporting the results of your analysis.
- `data/hd.csv`: The data as created by the `make-data.R` script.
- `heart-analysis.Rproj`: An RStudio project file.

## Source and Documentation

The data stored in `data/hd.csv` was accessed through the UCI Machine Learning Repository.

- [Documentation: UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Heart+Disease)

The data used in the creation of `data/hd.csv` was collected from the four following locations:

1. Cleveland Clinic Foundation
2. Hungarian Institute of Cardiology, Budapest
3. V.A. Medical Center, Long Beach, CA
4. University Hospital, Zurich, Switzerland

The contributors of the data have requested that any publications resulting from the use of the data include the  names of the principal investigator responsible for the data collection at each institution.  They are:

1. Hungarian Institute of Cardiology. Budapest: Andras Janosi, M.D.
2. University Hospital, Zurich, Switzerland: William Steinbrunn, M.D.
3. University Hospital, Basel, Switzerland: Matthias Pfisterer, M.D.
4. V.A. Medical Center, Long Beach and Cleveland Clinic Foundation: Robert Detrano, M.D., Ph.D.

## Analysis Goal

The goal of this analysis is to use the provided data in order to create tool that can be used to screen for heart disease.

## Additional Context

The `num` variable is the "angiographic disease status" which has five levels. The documentation does not appear to be extremely clear about this, so we will assume that the levels mean the following:

- `v0`: 0 major vessels with greater than 50% diameter narrowing. No presence of heart disease.
- `v1`: 1 major vessels with greater than 50% diameter narrowing.
- `v2`: 2 major vessels with greater than 50% diameter narrowing. 
- `v3`: 3 major vessels with greater than 50% diameter narrowing.
- `v4`: 4 major vessels with greater than 50% diameter narrowing.

In other words, the response variable `num` is the **number** of major heart vessels with greater than 50% diameter narrowing. Any value except for `v0` indicates some presence of heart disease.

When considering how to use the remaining variables as features, consider how easy these values are to collect. Because STAT 432 is not a medical course, we do not expect you to know with 100% certainty how these variables are measured, but do make clear what your assumptions are about these variables, especially with respect to how they are measured. Are these variables easy to measure, or do they require an invasive procedure?

Be aware of when and where this data was collected.
