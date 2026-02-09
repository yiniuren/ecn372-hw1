# AI Usage Log

Document each meaningful AI interaction as required by the assignment.

---

### 2025-02-09 — Project setup: requirements, repo structure, reproducibility
- **Tool:** Cursor Agent
- **Prompt:** "Read the requirement.md (README from your repo) file. Let's do the job step by step. 1. Understand all requirements. 2. Create all files needed with the correct structure. 3. Keep reproducibility in mind when coding later on 4. I'll soon give you the intsurction for which figures to produce and how I want to produce them."
- **Output summary:** The agent read requirement.md, summarized the assignment (replicate two figures from five options, gapminder/tidyverse/ggplot2, deliverables, replicability rules). It created the full repo structure: scripts/00_setup.R, scripts/01_data_prep.R, scripts/02_make_figures.R, output/.gitkeep, README.md, AI_USAGE.md. Placeholder figure code in 02_make_figures.R produces two simple PDFs so the pipeline runs end-to-end. It ran Rscript scripts/02_make_figures.R from project root and confirmed both PDFs were written.
- **What I used:** All of it. Kept the created files (00_setup.R, 01_data_prep.R, 02_make_figures.R, output/, README.md, AI_USAGE.md). The entry point is Rscript scripts/02_make_figures.R; no absolute paths; output/ holds figure-1.pdf and figure-2.pdf. Placeholders remain until I specify which two figures to replicate.
- **Verification:** Script was run successfully; output/figure-1.pdf and output/figure-2.pdf were generated.

---

### 2025-02-09 — AI usage documentation
- **Tool:** Cursor Agent
- **Prompt:** "Also, document all interactions I have between you and me in the AI_USAGE file along the process, including the previous request."
- **Output summary:** The agent read AI_USAGE.md and added two log entries: (1) the initial project-setup request and what was delivered, (2) this request to document all interactions. Used the assignment’s template (date, tool, prompt, output summary, what I used, verification).
- **What I used:** The updated AI_USAGE.md with both entries filled in.
- **Verification:** Reviewed AI_USAGE.md; both interactions are documented.

---

### 2025-02-09 — Figure 2: ribbon (IQR) + median and population-weighted mean by continent
- **Tool:** Cursor Agent
- **Prompt:** "The first figure I want to generate is figure 2. We want to plot: Life expectancy over time within each continent. Ribbon = country-level IQR (25th–75th percentile) each year. Lines for median and population‑weighted mean."
- **Output summary:** The agent implemented Figure 2 in scripts/02_make_figures.R: (1) For each continent × year, computed q25, q75 (country-level IQR), median(lifeExp), and weighted.mean(lifeExp, pop). (2) Ribbon with geom_ribbon(ymin = q25, ymax = q75), two lines (median solid, population-weighted mean dashed) via pivot_longer and geom_line with linetype. (3) Faceted by continent for clarity. Ran the script to confirm output/figure-2.pdf was regenerated.
- **What I used:** The full Figure 2 block in 02_make_figures.R (fig2_summary, fig2_lines, p2 with ribbon + lines + facet_wrap by continent, legend for linetype).
- **Verification:** Ran Rscript scripts/02_make_figures.R from project root; script completed; output/figure-2.pdf updated.

---

### 2025-02-09 — Figure 3: dumbbell 1952 vs 2007, top 3 per continent, years gained labels
- **Tool:** Cursor Agent
- **Prompt:** "The second figure I want to generate is figure 3. We want to plot: figure-3-dumbbell-gains.pdf. Dumbbell-style comparison of life expectancy in 1952 vs 2007. Top 3 countries per continent by life expectancy increase. Labels show years gained."
- **Output summary:** The agent implemented Figure 3 in scripts/02_make_figures.R: (1) Pivoted gapminder to get lifeExp in 1952 and 2007 per country; computed gain = lifeExp_2007 - lifeExp_1952. (2) Top 3 countries per continent by gain (slice_max). (3) Dumbbell: geom_segment from 1952 to 2007 lifeExp per country, geom_point for both endpoints (shape by year), geom_text for "+X yr" labels to the right of 2007 point. Countries ordered by gain; x-axis expanded for labels. Removed the Figure 1 placeholder so the script now produces only figure-2.pdf and figure-3.pdf.
- **What I used:** The full Figure 3 block (life_1952_2007, fig3_top3, fig3_points, p3 with segment + points + text labels). README updated to list output/figure-2.pdf and output/figure-3.pdf.
- **Verification:** Ran Rscript scripts/02_make_figures.R; script completed; output/figure-3.pdf created.

---

### 2025-02-09 — Figure 2 & 3: axis limits, blue/orange colors, legend, facets, title
- **Tool:** Cursor Agent
- **Prompt:** User requested multiple adjustments. Figure 2: (1) Time axis 1952–2007, break every 5 years; (2) Life expectancy axis 40–80, break every 10; (3) No continent colors—blue for median, orange for population-weighted mean (Python-style #1f77b4, #ff7f0e); (4) Legend on top, centered; tighter dashed line ("22"). Figure 3: (1) Group by continent, continent labels on left; order Africa → Americas → Asia → Europe → Oceania; (2) Lines gray, left endpoint blue and right endpoint orange; (3) Life expectancy axis 20–90, break every 10; (4) Two-line title + subtitle, legend under title (blue = 1952, orange = 2007); (5) X-axis label "Life expectancy (years)".
- **Output summary:** Agent updated scripts/02_make_figures.R: Fig2—ribbon fill gray85, lines colored by measure (blue/orange), scale_x/y_continuous with requested breaks and limits, linetype "22" for tighter dashes, legend.position = "top" and justification center. Fig3—continent factor order and arrange for row order, facet_grid(continent ~ ., switch = "y", space = "free_y") for left continent labels, gray segments and blue/orange points by year, scale_x_continuous(20–90, 10), title/subtitle with element_text(hjust = 0.5), legend on top, x lab "Life expectancy (years)".
- **What I used:** All changes in 02_make_figures.R (fig2 and fig3 blocks). Shared blue_median and orange_weighted for both figures.
- **Verification:** Ran Rscript scripts/02_make_figures.R; script completed; warnings about rows outside scale range (expected for y 40–80 in early years).

---

*(Add new entries above this block as you use AI.)*
