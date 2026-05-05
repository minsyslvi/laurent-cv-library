# CLAUDE.md — CV Generator Project Context

## What this is

This file provides context for continuing work on Laurent Vincentelli's automated CV/Resume generator.
It summarizes the design decisions, iterations, and final deliverables from the initial build session (May 2026).

---

## Project Goal

Laurent applies to 3–4 senior consulting/advisory roles per day. He needs to **industrialize** the creation of a perfectly tailored CV + optional cover letter for each application.

**Workflow (two-skill pipeline):**
1. Laurent finds a job description on a platform
2. He pastes the JD into a Claude conversation
3. **Skill 1 — JD Match Scorer** runs first: fetches laurent.vincentelli.pro, scores the JD against Laurent's profile across 6 weighted dimensions, produces an HTML dashboard + a tailoring recommendations file
4. Laurent reviews the match report and decides go/no-go
5. **Skill 2 — CV Generator** runs next: takes the JD + recommendations file as input, generates a tailored 2-page HTML CV. The recommendations drive content emphasis, ordering, and augmentation — the CV generator may add or reframe content beyond the website to maximize interview conversion
6. Laurent exports to PDF or Google Docs/DOCX for submission

---

## Deliverables

| File | Location | Purpose |
|---|---|---|
| `SKILL.md` | `.agents/skills/jd-match-scorer/SKILL.md` | **Skill 1.** Scores the JD against Laurent's profile using a 6-dimension weighted algorithm. Produces an HTML dashboard + recommendations file. |
| `template.html` | `.agents/skills/jd-match-scorer/template.html` | The HTML/CSS template for the match score dashboard (utilitarian, data-oriented). |
| `SKILL.md` | `.agents/skills/cv-generator/SKILL.md` | **Skill 2.** Generates a tailored 2-page HTML CV from the JD + recommendations. May augment content beyond the website to maximize interview conversion. |
| `template.html` | `.agents/skills/cv-generator/template.html` | The validated HTML/CSS template (v8). Claude copies this structure and injects tailored content — it does NOT regenerate CSS from scratch. |
| `CLAUDE.md` | `/CLAUDE.md` (root of workspace) | This file. Context log for new conversations. |

---

## Design Decisions Made (and why)

### Template structure — Page 1
1. **Single-column layout** (not sidebar). Sidebar was tested in v1 and rejected — it cramped the content and didn't match the website's visual language.
2. **Title bar**: Left = name, tagline (dynamic), contact, current role + pedigree ("ex-IBMer, ex-Accenture, ex-Capgemini"). Right = certifications + languages.
3. **Profile Highlights**: Uses Laurent's own pattern/approach/result structure from his website. Lightly tailored per JD but structure is preserved.
4. **Achievements — dashboard cards**: 2×2 grid. Each card has 60% left (explainer text) and 40% right (dark navy panel with engagement sizing + gold success metrics). This layout was iterated — the initial version had KPIs in a separate column that readers couldn't link to the explainer. The card-based approach solved that.
5. **Hard Skills cards**: Match the exact visual and wording from laurent.vincentelli.pro (screenshot-verified). 2×2 grid + 1 full-width (Frameworks & Methodologies). Each card has title, explainer paragraph, blue tags.
6. **Soft Skills cards**: Same pattern. 2×2 grid + 1 full-width (Entrepreneurial Mindset).
7. **Horizontal timeline**: Was included in early versions but removed because page 1 overflows. Page 2's vertical timeline covers the career progression.

### Template structure — Page 2
1. **Title bar repeated** (same content, slightly smaller heading).
2. **Vertical timeline**: Year labels (1.05rem, bold) on the left, connecting line with dots, role titles (1.3rem bold) + company names (1.25rem) on the right. Current role dot is magenta; others are navy.
3. **Proportions**: ~3/8 for the timeline visual (years + line + dots), ~5/8 for the text content.
4. **Fills the full page**: blocks use `flex: 1` to distribute evenly.

### Strategic tailoring logic
- **Headline mirrors employer vocabulary** — dynamically rewritten per JD
- **Advisory-first positioning** — reframe from "built platforms" to "advised CIOs on platform strategy"
- **Outcome-led bullets** — business outcome first, activity second
- **Engagement cards ordered by JD relevance** — most relevant case study appears top-left
- **Skill cards ordered by JD relevance** — most relevant skill domain appears first
- **Entrepreneurial track**: not included by default — Claude asks the user each time

### Visual design
- Fonts: Playfair Display (headers, editorial) + DM Sans (body, modern)
- Color accent: navy (#0f3460) for structure, magenta (#c2185b) for highlights/tagline, gold (#ffd54f) for metric values in achievement cards
- A4 pages: 210mm × 297mm, `@page` and `@media print` ready
- Cards use light borders (#c8d5e3) matching the website's card style

---

## Iteration History

| Version | Changes |
|---|---|
| v1 | Two-column layout (sidebar + main). Rejected — too cramped, didn't match website. |
| v2 | Single-column page 1. Skill cards matching website screenshots. Horizontal timeline (L→R). Vertical timeline on page 2. |
| v3 | Achievement cards redesigned as dashboard cards (top/bottom: explainer + KPI footer). Horizontal timeline removed (overflow). Page 2 timeline proportions fixed (3/8 vs 5/8). |
| v4 | Added "Currently: Engagement Manager at Deloitte, T&T" + "ex-IBMer, ex-Accenture, ex-Capgemini" to title sections on both pages. |
| v5 | Achievement cards redesigned again: 60% left (explainer) / 40% right (navy panel with engagement sizing + gold success metrics). Placeholder sizing values added. |
| v6 | Page 2 timeline: year labels increased to 1.05rem bold, role titles to 1.1rem, company names to 1.05rem. |
| v7 | Role titles bumped to 1.3rem bold, company names to 1.25rem (per user request). |
| v8 (final) | Achievement right panels: all text changed to plain white, metric values kept gold. Final version locked. |

---

## Known TODOs

1. **Engagement sizing values are PLACEHOLDERS** — Laurent needs to provide real duration/budget/FTE for each case study:
   - Insurance-as-a-Service Platform: currently "18 months · $5M · 22-FTE"
   - The AI Factory: currently "12 months · $3M · 14-FTE"
   - Open Banking Platform: currently "14 months · $4.2M · 18-FTE"
   - Internal Developer Platform: currently "10 months · $2.8M · 12-FTE"

2. **Cover letter template** — not yet built. The SKILL.md has instructions for generating one, but no HTML template exists yet. It will be generated inline or as a simple HTML when requested.

3. **Testing** — The skill needs to be tested in a fresh conversation:
   - Re-run the Gartner JD through the skill
   - Compare output to the manually crafted v8
   - Verify the strategic tailoring logic produces the right emphasis

---

## File Structure

```
/Users/lvi/Documents/Second-Brain/workspaces/laurent-cv-library/
├── CLAUDE.md                                    (this file)
└── .agents/
    └── skills/
        ├── jd-match-scorer/                     (Skill 1 — runs first)
        │   ├── SKILL.md                         (scoring algorithm + instructions)
        │   └── template.html                    (dashboard template)
        └── cv-generator/                        (Skill 2 — runs after go/no-go)
            ├── SKILL.md                         (CV generation instructions)
            └── template.html                    (v8 HTML/CSS template)
```

---

## How to use in a new conversation

1. Start a new Claude conversation with this workspace as context
2. Paste a job description
3. **Option A — Full pipeline:** Say "score this JD" or "analyze this job" → Claude runs the JD Match Scorer, presents the dashboard, waits for go/no-go, then generates the CV using the recommendations
4. **Option B — Direct CV:** Say "create a CV for this JD, skip scoring" → Claude skips the match scorer and generates the CV directly (original workflow)
5. **Option C — Score only:** Say "just score this, don't generate a CV" → Claude produces only the match dashboard

---

## Key URLs

- **Laurent's professional profile (source of truth):** https://laurent.vincentelli.pro/
- **LinkedIn:** https://www.linkedin.com/in/laurentvincentelli/
- **Contact:** laurent@vincentelli.pro
