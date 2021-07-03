# Load packages ----------------------------------------------------------------
library(tidyverse)
library(gt)
library(targets)
library(tarchetypes)


# Source auxiliary R files -----------------------------------------------------
source("R/functions.R")


# Define analysis targets ------------------------------------------------------
list(
    tar_file(
        data_file,
        "data/diamonds.csv"
    ),
    tar_target(
        data,
        read_data(data_file)
    ),
    tar_target(
        table,
        table_metrics(data)
    ),
    tar_target(
        plot,
        plot_relationship(data)
    ),
    tar_target(
        model,
        fit_model(data)
    )
)
