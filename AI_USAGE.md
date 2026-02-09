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

*(Add new entries above this block as you use AI.)*
