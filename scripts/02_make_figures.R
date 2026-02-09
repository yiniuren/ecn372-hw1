# ------------------------------------------------------------------------------
# 02_make_figures.R — Entry point: builds the two chosen figures
# ECN372 HW1
# Run from project root: Rscript scripts/02_make_figures.R
# ------------------------------------------------------------------------------

# Source setup and data prep (paths and packages)
source("scripts/00_setup.R")
source("scripts/01_data_prep.R")

# Re-ensure output dir (in case script is run from different wd)
if (!dir.exists(OUTPUT_DIR)) dir.create(OUTPUT_DIR, recursive = TRUE)

# ------------------------------------------------------------------------------
# FIGURE 1 — [Placeholder: replace with chosen figure replication]
# ------------------------------------------------------------------------------
p1 <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.3) +
  scale_x_log10() +
  labs(title = "Figure 1 (placeholder)", x = "GDP per capita", y = "Life expectancy") +
  theme_minimal()
ggsave(file.path(OUTPUT_DIR, "figure-1.pdf"), plot = p1, width = 7, height = 5)

# ------------------------------------------------------------------------------
# FIGURE 2 — [Placeholder: replace with chosen figure replication]
# ------------------------------------------------------------------------------
p2 <- ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_line(stat = "summary", fun = mean, linewidth = 1) +
  labs(title = "Figure 2 (placeholder)", x = "Year", y = "Life expectancy", color = "Continent") +
  theme_minimal()
ggsave(file.path(OUTPUT_DIR, "figure-2.pdf"), plot = p2, width = 7, height = 5)

message("Done. Figures written to ", OUTPUT_DIR, "/")
