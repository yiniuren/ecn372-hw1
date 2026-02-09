# ------------------------------------------------------------------------------
# 00_setup.R — Package loading and project paths
# ECN372 HW1: Reproducible figure replication
# Run from project root. All paths are project-relative.
# ------------------------------------------------------------------------------

# Required packages (install if missing)
required <- c("tidyverse", "gapminder")
for (pkg in required) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg, repos = "https://cloud.r-project.org")
  library(pkg, character.only = TRUE)
}

# Project root: assume we're run from project root (e.g. Rscript scripts/02_make_figures.R)
# If you run 00_setup.R from scripts/, the working dir is unchanged; 02_make_figures.R
# is the entry point and should be invoked from project root.
OUTPUT_DIR <- "output"

# Ensure output directory exists
if (!dir.exists(OUTPUT_DIR)) dir.create(OUTPUT_DIR, recursive = TRUE)
