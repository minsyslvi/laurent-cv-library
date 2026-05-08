# CLAUDE.md — EY Luxembourg Digital Factory · Engineering Manager (Associate Director) Application

> **Purpose of this file:** continuity context for any new Claude conversation working on Laurent Vincentelli's application to the **EY Luxembourg "Digital Factory — Engineering Manager — Associate Director"** role. Read this file first, then execute the **"Read context files in parallel"** chapter below before producing any new content.

---

## Folder layout

```
ey-luxembourg-digital-factory-engineering-manager/
├── CLAUDE.md                  ← this file
├── context/                   ← READ-ONLY input · read all files every conversation
├── v1/                        ← LOCKED baseline (do not modify in place)
│   ├── CV_Laurent_Vincentelli_EY_v1.html
│   └── photo.jpeg
└── archive/                   ← ⛔ DO NOT READ · superseded prior iterations (former v0–v5)
```

### `context/` — the briefing material (READ-ONLY)

This folder is the input that must be loaded into context every conversation. It contains:
- The **target JD** for the role Laurent is applying for.
- A strategic **briefing** on why EY Luxembourg is hiring now.
- A profile of the **EY Digital Factory leadership team** (Laurent's potential future bosses).
- A description of EY's **global Digital Factory** construct.
- The **5 team-member JDs** for the roles Laurent will lead and hire (Cloud Engineering Manager, Backend SWE, Data Engineer, Solution Architect, Project Manager).

The files are listed with paths and reading rationale in the next chapter. Laurent updates these frequently — re-read them every session, do not rely on memory.

### `v1/` — the locked baseline

`v1/` is the **frozen baseline** for this application. It contains the V1 CV (`CV_Laurent_Vincentelli_EY_v1.html`) and the photo asset. **Do not modify v1 in place.** When new work begins, create a fresh `v2/` folder, copy v1's CV and photo into it, and modify there. Subsequent iterations create `v3/`, `v4/`...

### `archive/` — ⛔ explicitly excluded

The `archive/` folder contains prior iterations (former v0 through v5) and prior agent state. They have been **superseded** by `v1/`. **Do NOT read, reference, list, or open any file under `archive/`** in any conversation. If a question seems to require historical context, ask Laurent rather than reading archive contents.

---

## Read context files in parallel

**Mandatory starting point of every new conversation.** Before answering anything, before generating, editing, or scoring anything, read all files in `context/` in parallel (single message, multiple `Read` tool calls) AND the current CV at `v1/CV_Laurent_Vincentelli_EY_v1.html`. The application is a leadership pitch — context density is everything.

| Path | What it is | Why it matters |
|---|---|---|
| `context/jd-engineering_manager-associate_director.md` | **THE target JD** — the role Laurent is applying for | Drives all tailoring decisions |
| `context/briefing.md` | Laurent's hypothesis on **why EY Luxembourg is hiring now** | Strategic narrative for CV + cover letter framing |
| `context/the Digital Factory leadership.md` | The **EY Digital Factory leadership team** (Laurent's potential future bosses) | Tone, vocabulary, and political alignment |
| `context/The Digital Factory at EY.md` | EY's **global Digital Factory** construct (what it is, how it operates) | Frame for the "industrialised delivery" positioning |
| `context/jd-cloud_engineering_manager-assistant_director.md` | Team JD #1 — **Cloud Engineering Manager** (will report to Laurent) | Azure stack, FinOps, regulatory framing |
| `context/jd-backend_sofware_engineer-supervising_associate.md` | Team JD #2 — **Backend SWE Supervising Associate** | .NET/C# / Python stack, DDD/CQRS, microservices |
| `context/jd-data_engineer-associate.md` | Team JD #3 — **Data Engineer** | Lakehouse (Databricks/Fabric), Azure Data Factory |
| `context/jd-solution_architect-assistant_director.md` | Team JD #4 — **Solution Architect** | Enterprise/cloud architecture, integration |
| `context/jd-project_manager-assistant_director.md` | Team JD #5 — **Project Manager** | Delivery governance, cadence rituals, portfolio reporting |
| `v1/CV_Laurent_Vincentelli_EY_v1.html` | **Current CV** (the foundation to evolve into v2) | Current state of all tailoring decisions |

After this parallel read, summarize back what you understand before proposing any change. Do not skip files, even if you "think" you remember them.

---

## Where v1 stands today (final state)

v1 is the result of an iterative redesign that landed on a JD-aligned, capability-mirrored structure. The redesign chapter was **"Align CV pillars with job description requirements"** — replacing generic leader-CV pillars with verbatim mirrors of the JD's own capability headings. Decisions to preserve unless Laurent explicitly overrides:

### Page 1 — Header · Profile · Expertise grid

**Header strip (LOCKED by Laurent — do not modify without explicit instruction):**
- **Name:** Laurent Vincentelli (Playfair Display, 2.4rem, dark grey)
- **Tagline (two lines, no colon, US "z" spelling):**
  > Digital & AI Factory Engineering Leader  
  > Industrializing Digital & AI Transformation for Regulated FSI
- **Contact line:** email · LinkedIn
- **Current role line:** "Currently: Engagement Manager at Deloitte, Technology & Transformation" with the subline "ex-IBMer, ex-Accenture, ex-Capgemini"
- **Photo:** top-right, 26mm square

**Profile:** single 3-line operator-grounded paragraph. No bullet stack, no marketing register.

**Section title:** *"My expertise for the EY Luxembourg Digital Factory"*

**2×3 grid of 6 expertise blocks** with headings **verbatim** from the JD's own capability sections:

1. **Team & People Leadership** — leads cloud engineering, backend, and data engineering teams; partners with Project Management and Solution Architecture; coaches across adjacent domains.
2. **Delivery & Execution** — Lean & Agile delivery: Scrum at squad level, Scaled Agile (SAFe) at programme level.
3. **Technical Stewardship** — DevOps and DevSecOps practices that span CI/CD, trunk-based development, automated testing, and cloud-native systems.
4. **Quality, Reliability & Operability** — SRE practices that span telemetry, SLOs, error budgets, and runbooks; blameless incident culture.
5. **Cross-Functional Collaboration** — alignment with Business Stakeholders, Product, Design, Architecture, CyberSecurity, and Data; engineering voice in governance forums.
6. **Platform & Reuse** — partners with the Solution Architect to encourage reuse across the **architectural runway**.

Each block: bold heading + 1-sentence claim + prose proof + small metric chips (yellow-square marker + tabular numerals on light grey).

### Page 2 — Professional Experience · Credentials

- **Professional Experience:** 7 roles in reverse chronology (Deloitte → IBM → Accenture → OVHcloud → Capgemini → Cognizant → GreenSaaS / Fiducial Cloud). Each bullet leads with a **capability tag** that maps evidence back to the page-1 expertise claims.
- **Credentials footer (three columns):**
  - **Education:** MSc Computer Science · Université Aix-Marseille · 2009
  - **Certifications:** Scrum (PSM · PSPO · Kanban) · Lean Six Sigma Black Belt · ITIL Certified · SAFe Practitioner · TOGAF Practitioner
  - **Languages:** French (native) · English (full professional) · Spanish (professional working)
- **Selected Engagements section is REMOVED in v1** — to be reworked and reintroduced as **Page 3** in v2.

### Voice & vocabulary rules locked in v1

- **Plain-English full sentences**, not semicolon-stacked fragments. A non-technical hiring-team member must follow the rationale in ~8 seconds per block.
- **JD-verbatim headings** on Page 1's six expertise blocks — maximum pattern-match for the screener.
- **"Industrializing"** — US "z" spelling preferred in the tagline (Laurent's stylistic choice).
- **No PSD2 mentions** — use "Open Banking" generically.
- **No "Lakehouse data foundations"** — rejected wording.
- "**Cloud engineering, backend, and data engineering**" is the canonical trio of domains Laurent leads (the three direct-report engineering JDs).
- "**Architectural runway**" replaces "engineering estate" (SAFe-aligned, pairs with the SAFe reference in Delivery & Execution).
- "**Business Stakeholders**" sit at the head of the cross-functional list (before Product / Design / Architecture / CyberSecurity / Data).
- JD-verbatim phrases preserved: "inclusive, high-trust team cultures", "individualised development plans", "growth-oriented performance conversations", "literacy across adjacent domains".

---

## Open work for v2 (the v1 → v2 backlog)

When the next conversation begins, these are the priorities — already identified, ready to action:

1. **Selected Engagements section (Page 3) — the centrepiece to rebuild.**
   The engagement section was deliberately removed from v1 because it needs reworking. v2 should reintroduce it with:
   - **Outcome-led headlines** (Minto), not Context-first; drop the STAR labels.
   - **Anonymised client tags** (e.g. *"Tier-1 European retail bank · 18-month engagement · €5M · 22 FTE"*).
   - **Prose + metrics strip** (yellow numerals on dark grey panel).
   - **Engagement set to revisit:** prior iterations had 4 — Software Factory · AI & Data Factory · Open Banking · Insurance-as-a-Service. The North American insurance engagement may need substituting with a more EU/LU-relevant case to reinforce Luxembourg fit.
   - **Suggested order:** lead with Open Banking (European retail bank) for strongest Luxembourg/FSI signal, then sequence by relevance.

2. **Deloitte current-role scope clarifier (Page 2) — fill in placeholders.**
   The current Deloitte role-scope line still reads:
   > *"Director-track band: portfolio of [N] concurrent engagements, ~[N] FTE cumulative across cross-functional engineering teams (cloud, backend, data, security, architecture). Lead engineering-focused engagements across Financial Services, Insurance, and Telecom under strict regulatory and audit constraints; Partner-adjacent client and risk ownership."*
   
   v2 should replace `[N]` with Laurent's real numbers, and confirm whether *"Director-track band"* is the truthful framing for his Deloitte EM grade.

3. **Cover letter** — not yet started. Should align to v1's CV positioning, EY brand, and `briefing.md` strategic narrative. Save to `v2/CoverLetter_Laurent_Vincentelli_EY.html`.

4. **JD Match re-score** — once v2's CV is stable, run a JD-match scoring pass against `context/jd-engineering_manager-associate_director.md` and produce `v2/JD_Match_v2.html` and `v2/Recommendations_v2.md`.

5. **French version** — Luxembourg is French-speaking; a French translation of the CV may be requested. Use Laurent's native French + EY brand and same structural template. Save to `v2/CV_Laurent_Vincentelli_EY_v2_FR.html`.

---

## Design system (EY brand)

```
--accent       #ffe600   EY Yellow (section underlines, metric-chip markers, current-role rule)
--accent-dark  #2e2e38   EY Dark Grey (h1/h2, expertise headings, role titles)
--highlight    #747480   EY mid-grey (taglines, italic scope)
--ink          #1a1a2e   body ink
```

Fonts: **Playfair Display** (display, name, section titles) + **DM Sans** (body, expertise headings, chips). Loaded via Google Fonts CDN.
Page sizing: A4 portrait, `@page { size: A4; margin: 0 }`, print-ready.

---

## Hard guardrails (do not violate)

- ⛔ **DO NOT read, list, or reference anything under `archive/`** — superseded iterations only. The starting point is `v1/`.
- ⛔ **DO NOT modify `v1/` in place.** v1 is locked. Always create `v2/` (copy the CV + photo across) and iterate there. Subsequent iterations create `v3/`, `v4/`...
- ⛔ **DO NOT modify the locked header strip** (name, tagline, contact, current-role, photo) without explicit Laurent instruction. The tagline in particular: two lines, no colon, "Industrializing" with US "z" spelling.
- ❌ Do NOT add CSSF/PSF or any Luxembourg-specific regulatory framework as something Laurent has practiced — use generic "FSI regulatory" language.
- ❌ Do NOT claim hands-on coding in .NET/C#, Python, Spark, or other team-stack languages. Laurent is the leader, not the IC.
- ❌ Do NOT add Azure certifications — Laurent does not hold them; the team's Cloud Engineering Manager will.
- ❌ Do NOT regenerate CSS from scratch — copy the v1 template and only modify dynamic content + tokens.
- ❌ Do NOT use em-dashes (`—`) as content separators in prose — use `,` or `:`. Em-dash is reserved for design bullets, number ranges (`12–22 FTE`), and the tagline line break is a `<br>`, not an em-dash.
- ❌ Do NOT bring back PSD2 mentions or "Lakehouse data foundations" wording (both rejected in prior iterations).
- ❌ Do NOT replace JD-verbatim expertise headings on Page 1 — they are the screener's pattern-match.
- ❌ Do NOT add STAR labels (Context / Contribution / Result) to engagement cards when they return in v2 — that pattern was rejected.
- ✅ DO keep expertise claims and proofs as plain-English full sentences.
- ✅ DO maintain Laurent's leadership positioning: cloud engineering, backend, and data engineering as primary domains, with literacy across adjacent domains.

---

## How to start a new conversation about this application (v1 → v2)

1. Open Claude in this workspace.
2. Drop a short brief like:
   > *"Continue work on the EY Luxembourg Engineering Manager AD application. CLAUDE.md has full context. Let's move v1 → v2."*
3. Claude reads this file.
4. Claude executes the **"Read context files in parallel"** chapter — single message, parallel `Read` calls on the 9 context files plus `v1/CV_Laurent_Vincentelli_EY_v1.html`.
5. Claude summarizes back its understanding before proposing changes, anchoring on the **"Open work for v2"** chapter as the starting backlog.
6. Claude creates `v2/` (copying `CV_Laurent_Vincentelli_EY_v1.html` → `v2/CV_Laurent_Vincentelli_EY_v2.html` and the photo) and proposes a v2 plan focused on the Selected Engagements rebuild + Deloitte scope clarifier fill-in.
7. Then the actual work begins.
