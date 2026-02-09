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
# FIGURE 2 — Life expectancy over time by continent
# Ribbon = country-level IQR (25th–75th percentile) each year
# Lines = median and population-weighted mean
# ------------------------------------------------------------------------------
fig2_summary <- gapminder %>%
  group_by(continent, year) %>%
  summarise(
    q25 = quantile(lifeExp, 0.25),
    q75 = quantile(lifeExp, 0.75),
    median = median(lifeExp),
    weighted_mean = weighted.mean(lifeExp, pop),
    .groups = "drop"
  )

# Long form for the two lines (median vs weighted mean)
fig2_lines <- fig2_summary %>%
  select(continent, year, median, weighted_mean) %>%
  tidyr::pivot_longer(
    cols = c(median, weighted_mean),
    names_to = "measure",
    values_to = "lifeExp"
  ) %>%
  mutate(measure = if_else(measure == "weighted_mean", "Population-weighted mean", "Median"))

# Classic blue/orange (Python default style)
blue_median <- "#1f77b4"
orange_weighted <- "#ff7f0e"

p2 <- ggplot(fig2_summary, aes(x = year)) +
  geom_ribbon(aes(ymin = q25, ymax = q75, group = continent), fill = "gray85", alpha = 0.6) +
  geom_line(
    data = fig2_lines,
    aes(y = lifeExp, color = measure, linetype = measure),
    linewidth = 0.9
  ) +
  scale_color_manual(values = c("Median" = blue_median, "Population-weighted mean" = orange_weighted)) +
  scale_linetype_manual(values = c("Median" = "solid", "Population-weighted mean" = "22")) +
  scale_x_continuous(breaks = seq(1952, 2007, 5), limits = c(1952, 2007)) +
  scale_y_continuous(breaks = seq(40, 80, 10), limits = c(40, 80)) +
  facet_wrap(vars(continent), ncol = 2) +
  labs(x = "Year", y = "Life expectancy", color = NULL, linetype = NULL) +
  theme_minimal() +
  theme(
    legend.position = "top",
    legend.justification = "center",
    legend.box = "horizontal"
  )
ggsave(file.path(OUTPUT_DIR, "figure-2.pdf"), plot = p2, width = 8, height = 6)

# ------------------------------------------------------------------------------
# FIGURE 3 — Dumbbell: life expectancy 1952 vs 2007
# Top 3 countries per continent by life expectancy increase; labels = years gained
# ------------------------------------------------------------------------------
life_1952_2007 <- gapminder %>%
  filter(year %in% c(1952L, 2007L)) %>%
  select(country, continent, year, lifeExp) %>%
  tidyr::pivot_wider(names_from = year, values_from = lifeExp, names_prefix = "lifeExp_") %>%
  mutate(gain = lifeExp_2007 - lifeExp_1952)

# Top 3 per continent; order continents (Africa → Oceania), within each by gain (high first)
fig3_top3 <- life_1952_2007 %>%
  group_by(continent) %>%
  slice_max(gain, n = 3, with_ties = FALSE) %>%
  ungroup() %>%
  arrange(factor(continent, levels = c("Africa", "Americas", "Asia", "Europe", "Oceania")), desc(gain)) %>%
  mutate(
    continent = factor(continent, levels = c("Africa", "Americas", "Asia", "Europe", "Oceania")),
    country = forcats::fct_inorder(country)
  )

# Long form for endpoints (1952 and 2007 points)
fig3_points <- fig3_top3 %>%
  select(country, continent, lifeExp_1952, lifeExp_2007) %>%
  tidyr::pivot_longer(
    cols = c(lifeExp_1952, lifeExp_2007),
    names_to = "year",
    values_to = "lifeExp"
  ) %>%
  mutate(year = if_else(year == "lifeExp_1952", "1952", "2007"))

# Same blue/orange as figure 2: 1952 = blue, 2007 = orange
p3 <- ggplot(fig3_top3, aes(y = country)) +
  geom_segment(
    aes(x = lifeExp_1952, xend = lifeExp_2007, y = country, yend = country),
    color = "gray50",
    linewidth = 1.2,
    lineend = "round"
  ) +
  geom_point(data = fig3_points, aes(x = lifeExp, color = year), size = 3, shape = 16) +
  geom_text(
    aes(x = lifeExp_2007, label = sprintf("+%.1f yr", gain)),
    hjust = -0.15,
    size = 2.8
  ) +
  scale_color_manual(values = c("1952" = blue_median, "2007" = orange_weighted)) +
  scale_x_continuous(
    breaks = seq(20, 90, 10),
    limits = c(20, 90),
    expand = expansion(mult = c(0.02, 0.12))
  ) +
  facet_grid(continent ~ ., scales = "free_y", space = "free_y", switch = "y") +
  labs(
    title = "Life Expectancy Gains (1952-2007)",
    subtitle = "Top 3 countries per continent by life expectancy increase; labels show years gained",
    x = "Life expectancy (years)",
    y = NULL,
    color = NULL
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top",
    legend.justification = "center",
    legend.box = "horizontal",
    panel.grid.major.y = element_blank(),
    strip.placement = "outside",
    strip.text.y.left = element_text(angle = 0, hjust = 1)
  )
ggsave(file.path(OUTPUT_DIR, "figure-3.pdf"), plot = p3, width = 8, height = 6)

message("Done. Figures written to ", OUTPUT_DIR, "/")
