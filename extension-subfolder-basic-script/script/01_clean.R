# Load packages ----------------------------------------------------------------
library(tidyverse)


# Source auxiliary R files -----------------------------------------------------
source("R/functions.R")


# Clean ------------------------------------------------------------------------
raw_data <- read_csv("data/raw/diamonds.csv")

clean_data <-
  raw_data %>%
  select(carat, cut, color, clarity, price)

write_csv(clean_data, "data/clean/diamonds.csv")