# An analysis of business licences issued by the Toronto Municipal Licensing and Standards.

## Overview of Paper

This paper investigates the impact of various factors on the duration of business and trade licences issued by Municipal Licensing & Standards (ML&S) in Toronto. 

## File Structure

The repository is structured as:

o `data` Includes the data sources utilized in the paper: raw data and analysis data.

o `paper` Includes the Quarto document, reference bibliography file and the rendered
PDF.

o `scripts` Includes the R scripts utilized for data simulation, downloading, cleaning, testing and modelling.

## How to Run
0. For simulation and testing, run `scripts/00-simulate_data.R`
1. Run `scripts/01-download_data.R` to download raw data
2. Run `scripts/02-data_cleaning.R` to clean data and generate cleaned data
3. Run `scripts/03-test_data.R` to test data
4. Run `scripts/04-model.R` to model data
3. Run `paper/Business_licences_analysis.qmd` to create the PDF version of the paper

## Statement on LLM usage:
There was no LLM usage to write this paper.