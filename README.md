# ECN372 — HW1

Replication of two figures from the assignment using the **gapminder** dataset (tidyverse + ggplot2), with a reproducible workflow.

## Repo structure

| Path | Purpose |
|------|--------|
| `requirement.md` | Assignment requirements and figure descriptions |
| `README.md` | This file: structure, replication instructions, process notes |
| `AI_USAGE.md` | Log of AI tool use (required) |
| `scripts/00_setup.R` | Loads required packages and sets project-relative paths |
| `scripts/01_data_prep.R` | Loads gapminder and any shared data preparation |
| `scripts/02_make_figures.R` | **Entry point**: generates the two output figures |
| `output/` | Directory for generated PDF figures |

## Replication instructions

**Prerequisites:** R (with packages `tidyverse` and `gapminder`). Optional: use `renv` for a pinned environment (see below).

1. Clone the repo and open a terminal in the project root (`ecn372-hw1/`).
2. Install R dependencies if needed:
   ```bash
   Rscript -e "install.packages(c('tidyverse','gapminder'), repos='https://cloud.r-project.org')"
   ```
3. From the **project root**, run the figure-building script:
   ```bash
   Rscript scripts/02_make_figures.R
   ```
4. The two PDFs will appear in `output/`: `output/figure-2.pdf` (ribbon + median/weighted mean by continent) and `output/figure-3.pdf` (dumbbell 1952 vs 2007, top 3 per continent).

**Optional (renv):** To use a reproducible environment, run `renv::init()` and `renv::restore()` in R from the project root, then run the same command above.

## Process explanation (reverse-engineering)

[To be filled after choosing and replicating the two figures: describe how you matched the assignment’s figure descriptions to data steps (filters, summaries, geoms, scales) and how you checked your outputs against the intended design.]

## AI usage

See **`AI_USAGE.md`** for the required log of AI tool use (Cursor Chat/Agent, prompts, what was used, and verification).
