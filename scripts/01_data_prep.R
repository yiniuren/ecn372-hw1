# ------------------------------------------------------------------------------
# 01_data_prep.R — Load and prepare gapminder data for figures
# ECN372 HW1: Shared data steps; keep figure-specific logic in 02_make_figures.R
# ------------------------------------------------------------------------------

# Load gapminder (already attached by 00_setup.R; use explicit dataset)
gapminder <- gapminder::gapminder

# Optional: add any shared derived variables used by multiple figures
# (e.g. continent summaries, population in 2007 for filtering)
# Figure-specific filters and summaries stay in 02_make_figures.R for clarity.
