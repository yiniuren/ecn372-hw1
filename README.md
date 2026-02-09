# ECN372 — HW1

Replication of two figures from the assignment using the **gapminder** dataset (tidyverse + ggplot2), with a reproducible workflow.

## Repo structure

| Path | Purpose |
|------|--------|
| `requirement.md` | Assignment requirements and figure descriptions |
| `README.md` | This file: structure, replication instructions, process notes |
| `AI_USAGE.md` | Log of AI tool use |
| `scripts/00_setup.R` | Loads required packages and sets project-relative paths |
| `scripts/01_data_prep.R` | Loads gapminder and any shared data preparation |
| `scripts/02_make_figures.R` | **Entry point**: generates the two output figures |
| `output/` | Directory for generated PDF figures |

## Replication instructions

1. From the project root, run:
   ```bash
   Rscript scripts/02_make_figures.R
   ```
   (Requires R with packages `tidyverse` and `gapminder`.)

## Process explanation

I fed the figure descriptions from the assignment to Cursor and had it generate a first version of each figure. I then compared the results to the target figures in detail—checking axis ranges, axis labels, colors, layout, legend placement, and other details—and told Cursor what to improve. After a few iterations (e.g. fixing the time and life-expectancy axis breaks, switching to blue/orange for median vs population-weighted mean, moving the legend to the top, and for figure 3 grouping by continent with labels on the left and adding the title and “years gained” labels), I got the figures we wanted. When the ribbon and curves in figure 2 appeared to be missing in some panels, I asked Cursor to debug; it turned out the fixed y-axis (40–80) was clipping the data, so we expanded the life-expectancy axis to 30–90 and the full series showed correctly.

## AI usage

See **`AI_USAGE.md`** for the log of AI tool use.
