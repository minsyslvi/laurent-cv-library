# CLAUDE.md — EY Luxembourg Digital Factory · Engineering Manager (Associate Director) Application

> **Purpose of this file:** continuity context for any new Claude conversation working on Laurent Vincentelli's application to the **EY Luxembourg "Digital Factory — Engineering Manager — Associate Director"** role. Read this file first, then immediately execute the **"Read context files in parallel"** chapter below before producing any new content.

---

## Read context files in parallel

**This is the mandatory starting point of every new conversation about this application.** Before answering anything, before generating, editing, or scoring anything, read all files in the `context/` folder in parallel (single message, multiple `Read` tool calls) AND the latest CV. The application is a leadership pitch — context density is everything.

Files to read in parallel (every one of them, every time):

| Path | What it is | Why it matters |
|---|---|---|
| `context/jd-engineering_manager-associate_director.md` | **THE target JD** — the role Laurent is applying for | Drives all tailoring decisions |
| `context/briefing.md` | Laurent's hypothesis on **why EY Luxembourg is hiring now** | Strategic narrative for CV + cover letter framing |
| `context/the Digital Factory leadership.md` | The **EY Digital Factory leadership team** (Laurent's potential future bosses) | Tone, vocabulary, and political alignment for messaging |
| `context/The Digital Factory at EY.md` | EY's **global Digital Factory construct** (what it is, how it operates) | Frame for the "industrialised delivery" positioning |
| `context/jd-cloud_engineering_manager-assistant_director.md` | Team JD #1 — **Cloud Engineering Manager** (will report to Laurent) | Azure stack, FinOps, regulatory framing |
| `context/jd-backend_sofware_engineer-supervising_associate.md` | Team JD #2 — **Backend SWE Supervising Associate** | .NET/C# / Python stack, DDD/CQRS, microservices |
| `context/jd-data_engineer-associate.md` | Team JD #3 — **Data Engineer** | Lakehouse (Databricks/Fabric), Azure Data Factory |
| `context/jd-solution_architect-assistant_director.md` | Team JD #4 — **Solution Architect** | Enterprise/cloud architecture, integration |
| `context/jd-project_manager-assistant_director.md` | Team JD #5 — **Project Manager** | Delivery governance, cadence rituals, portfolio reporting |
| `v2/CV_Laurent_Vincentelli_EY_DigitalFactory_EngineeringManager.html` | **Latest CV** (the foundation to evolve) | Current state of all tailoring decisions |

After this parallel read, summarize back what you understand before proposing any change. Do not skip files, even if you "think" you remember them — Laurent updates them frequently and stale memory will tank the work.

---

## The role being applied for

**Title:** Digital Factory — Engineering Manager — Associate Director
**Location:** Luxembourg
**Type:** Internal leadership role (NOT external advisory consulting)
**What Laurent will lead:** A multi-discipline EY Digital Factory team comprising — at minimum — a Cloud Engineering Manager (AD), Backend SWEs, Data Engineers, Solution Architects, and Project Managers. The 5 team JDs in `context/` describe the team archetypes Laurent will hire, lead, and develop.

**Critical framing nuance:** Laurent is NOT applying as a hands-on coder. He is the **T-shape leader** who orchestrates specialists — broad cross-discipline literacy + deep stewardship of the TOGAF Application & Data layers, platform engineering practices, and delivery governance. Hands-on Azure, .NET/C#, Python, Databricks etc. are owned by his team, not by him. 

---

## Latest CV — `v2/` is the foundation

**Path:** `/Users/lvi/Documents/Second-Brain/workspaces/laurent-cv-library/ey-luxembourg-Digital Factory-Engineering Manager/v2/CV_Laurent_Vincentelli_EY_DigitalFactory_EngineeringManager.html`

**Format:** 3-page A4 HTML, EY brand colors (yellow `#ffe600` + dark grey `#2e2e38`), self-contained CSS, print-ready.

**Page 1:** Title section + Profile Highlights + Hard Skills (4 cards in 2×2 + 1 full-width Frameworks card) + Soft Skills (4 cards in 2×2)
**Page 2:** Professional Experience (vertical timeline, 7 roles, current role highlighted in yellow)
**Page 3:** Achievements — 4 STAR-formatted engagement cards (Software Factory · AI & Data Factory · Open Banking · Insurance-as-a-Service) with dark-grey metric panels and yellow KPI values

### Tailoring decisions locked in v2

| Decision | What it is | Why |
|---|---|---|
| **Tagline** | "Digital & AI Factory Engineering Leader: Industrialising Digital & AI Transformation for Regulated FSI" | Mirrors EY's "industrialise" framework + names FSI without claiming Luxembourg-specific experience |
| **Title section** | LOCKED — name, contact, current role line, certs (PSM/PSPO/Kanban · LSSBB · SAFe Practitioner · TOGAF Practitioner), languages — DO NOT change without explicit user instruction | User-defined invariant |
| **No Azure cert** | Azure expertise is implicit/team-led, not certified | Team's Cloud Engineering Manager carries the Azure cert; Laurent leads them |
| **T-shape positioning** | Skills cards describe stewardship/orchestration, NOT hands-on stack mastery | Leadership role, not IC |
| **No CSSF/PSF mentions** | Generic "FSI regulatory" / "audit-ready" language only | Laurent has worked Canada, US, UK, France — not Luxembourg specifically. Equivalent regulatory exposure, not the named frameworks. |
| **Em-dash usage** | Reduced; replaced with `,` or `:` in content text. Design bullets (`—` as `::before` and `list-style-type`) preserved. | User stylistic preference |
| **STAR achievement cards** | Each Page 3 card: **Context** / **My contribution** (bullets) / **Result** | Consulting-style framing emphasizing Laurent's individual impact |
| **Engagement renamings** | "Internal Developer Platform" → "The Software Factory"; "The AI Factory" → "The AI & Data Factory" | Mirrors EY's Digital Factory taxonomy |
| **Engagement order** | Software Factory (1st, most direct EM match) → AI & Data Factory → Open Banking → Insurance | Recommended order from JD Match Scorer |
| **Hard skill order** | Software Engineering Practices → Hybrid Cloud → Digital & AI Platform as a Product → Application & Data Architecture Stewardship → Frameworks (full-width) | JD-priority weighted |
| **Soft skill order** | Team Leadership → Cross-functional Collaboration → Negotiation & Conflict Resolution → Executive Communication | Team Leadership leads (JD's #1 emphasis) |

### Engagement sizing (still placeholders — TODO with Laurent)

- The Software Factory: 10 months · $2.8M · 12-FTE
- The AI & Data Factory: 12 months · $3M · 14-FTE
- Open Banking Platform: 14 months · $4.2M · 18-FTE
- Insurance-as-a-Service Platform: 18 months · $5M · 22-FTE

---

## Folder layout

```
ey-luxembourg-Digital Factory-Engineering Manager/
├── CLAUDE.md                                           ← this file
├── context/                                            ← READ-ONLY input (the user owns this)
│   ├── jd-engineering_manager-associate_director.md   ← THE target JD
│   ├── briefing.md                                    ← Laurent's strategic hypothesis (You need to read this file and capture the hypothesis for crafting a 95% or more matching CV + Resume, this is a very important application for Laurnt that wants to take time to taylor the CV to make it resonate to the EY luxembourg hiring Manager/team.  )
│   ├── the Digital Factory leadership.md              ← future bosses
│   ├── The Digital Factory at EY.md                   ← global EY Digital Factory context (not specific to EY luxembourg yet the Luxembourg leadership will leverage this EY asset for the local market (Luxembourg is a FSI hub))
│   ├── jd-cloud_engineering_manager-assistant_director.md
│   ├── jd-backend_sofware_engineer-supervising_associate.md
│   ├── jd-data_engineer-associate.md
│   ├── jd-solution_architect-assistant_director.md
│   └── jd-project_manager-assistant_director.md
├── v0/                                                 ← DO NOT USE : initial draft (JD scoring + recommendations + first CV)
│   ├── CV_Laurent_Vincentelli_EY_DigitalFactory_EngineeringManager.html
│   ├── JD_Match_EY_DigitalFactory_EngineeringManager.html
│   ├── Recommendations_EY_DigitalFactory_EngineeringManager.md
│   └── jd-Digital Factory - Engineering Manager - Associate Director.md
├── v1/                                                 ← DO NOT USE : first user-led iteration
│   ├── briefing.md
│   ├── cv.html
│   └── cover-letter.html
└── v2/                                                 ← Starting point : LATEST — foundation for next iteration
    └── CV_Laurent_Vincentelli_EY_DigitalFactory_EngineeringManager.html
```

**Versioning rule:** when Laurent asks for a meaningful new iteration, create a `v3/` folder, copy v2's CV in, and modify there. Do not overwrite v2 in place — keep iteration history.

---

## Design system (EY brand)

```
--accent       #ffe600   EY Yellow (section underlines, current-role timeline dot, KPI values)
--accent-dark  #2e2e38   EY Dark Grey (h1/h2, section titles, achievement card right panel, timeline line)
--highlight    #747480   EY mid-grey (taglines)
--ink          #1a1a2e   body ink
--tag-bg       #f2f2f6   skill tag background
--tag-text     #2e2e38   skill tag text
```

Fonts: **Playfair Display** (display, headers) + **DM Sans** (body). Loaded via Google Fonts CDN.
Page sizing: A4 portrait, `@page { size: A4; margin: 0 }`, print-ready.

---

## Key EY / target-JD vocabulary to mirror

Always weave these terms when tailoring CV / cover letter content:

- **"Industrialise" / "industrialised"** — EY's preferred verb for moving from PoC to production at scale
- **"Digital Factory"** — EY's specific construct (always with capital D and F)
- **"Engineering excellence"**, **"craftsmanship"**, **"predictable delivery"**, **"technical stewardship"**
- **"Audit-Ready by default"** — generic equivalent of CSSF/PSF readiness
- **"Data-Driven Audit & Assurance"** — EY's signature use case for data platforms
- **"DORA & SPACE metrics"** — engineering productivity vocabulary
- **"Onshore / nearshore / offshore matrix delivery"** — EY operating model signal
- **"Platform engineering"**, **"shift-left"**, **"DevSecOps"**, **"SRE"**, **"FinOps"**
- **"TOGAF Application & Data layers"** — Laurent's stewardship anchor (vs. infra layer which his Cloud EM owns)

---

## Hard guardrails (do not violate)

- ❌ Do NOT add CSSF/PSF or any Luxembourg-specific regulatory framework as something Laurent has practiced — he has not. Use generic "FSI regulatory" language.
- ❌ Do NOT claim hands-on coding in .NET/C#, Python, Spark, or other team-stack languages. Laurent is the leader, not the IC.
- ❌ Do NOT add Azure certifications — Laurent does not hold them; the team's Cloud Engineering Manager will.
- ❌ Do NOT modify the title section (name, contact, current role, certs, languages) without explicit user instruction. The tagline can be optimized.
- ❌ Do NOT overwrite `v2/` in place. Always start a new `v3/`, `v4/`... folder for the next iteration.
- ❌ Do NOT regenerate CSS from scratch — copy the v2 template and only modify dynamic content + tokens.
- ❌ Do NOT use em-dashes (`—`) as content separators — use `,` or `:`. The em-dash is reserved for design bullets only.
- ✅ DO mirror the EY vocabulary list above throughout the CV / cover letter.
- ✅ DO maintain the T-shape positioning: stewardship + orchestration, not deep stack mastery.

---

## Open work / next likely tasks

1. **Cover letter** — `v1/cover-letter.html` exists as a draft; needs alignment to v2's CV positioning, EY brand colors, T-shape framing, and `briefing.md` strategic narrative. Save to `v2/CoverLetter_Laurent_Vincentelli_EY_DigitalFactory_EngineeringManager.html`.
2. **Real engagement sizing** — replace placeholder $ / FTE / duration values when Laurent provides actuals.
3. **JD Match re-score** — run the `jd-match-scorer` skill against v2's CV to confirm the score is at the 95% target, generate an updated `v2/JD_Match_*.html` and `v2/Recommendations_*.md`.
4. **French version** — Luxembourg is French-speaking; a French translation of the CV may be requested. Use Laurent's native French + the EY brand and same structural template.

---

## How to start a new conversation about this application

1. Open Claude in this workspace.
2. Drop a short brief like: *"Continue work on the EY Luxembourg Engineering Manager AD application. CLAUDE.md at `ey-luxembourg-Digital Factory-Engineering Manager/CLAUDE.md` has full context."*
3. Claude reads this file.
4. Claude executes the **"Read context files in parallel"** chapter — single message, parallel `Read` calls on all 10 files.
5. Claude summarizes back its understanding before proposing changes.
6. Then the actual work begins.
