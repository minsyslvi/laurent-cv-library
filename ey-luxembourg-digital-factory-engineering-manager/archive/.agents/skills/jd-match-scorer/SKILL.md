---
name: jd-match-scorer
description: >
  Scores the match between a job description and Laurent Vincentelli's profile.
  Triggers BEFORE the cv-generator skill when the user provides a JD.
  Fetches laurent.vincentelli.pro as source of truth, applies a weighted 6-dimension
  scoring algorithm, and produces an HTML dashboard + a tailoring recommendations file
  that feeds into the cv-generator skill.
---

# JD Match Scorer — Job Description ↔ Profile Matching

## Purpose

Score how well a job description matches Laurent Vincentelli's professional profile BEFORE generating a CV. This skill runs first in the pipeline:

```
JD input → [JD Match Scorer] → Dashboard + Recommendations → User go/no-go → [CV Generator]
```

It produces two outputs:

1. **HTML dashboard** — a dense one-pager for Laurent to review the match quality
2. **Recommendations file** — structured tailoring directives passed as input to the CV generator

---

## Trigger Conditions

Activate this skill when:

- The user provides a job description (pasted text, uploaded file, or URL) AND asks for a match analysis, score, or assessment
- The user says things like: "score this JD", "how well does this match?", "analyze this job", "check this role"
- The user provides a JD and asks for a CV — run this skill FIRST, present the dashboard, then wait for go/no-go before proceeding to CV generation

Do NOT activate for:

- Requests to generate a CV without analysis (if user explicitly says "skip the scoring")
- General career advice without a specific JD
- Editing the template or skill files

---

## Inputs

| Input | Required | Description |
|---|---|---|
| Job Description | YES | The full JD text, uploaded file, or URL to fetch |
| Language | NO | Default: English. Switch only if user explicitly asks |

---

## Source of Truth

**Always fetch `https://laurent.vincentelli.pro/` live** at the start of every analysis.

Extract and structure Laurent's profile into these asset categories:

- **Hard Skills**: all skill cards with their exact tags and descriptions
- **Soft Skills**: all soft skill cards with their exact tags and descriptions
- **Engagements/Case Studies**: all case studies with domains, technologies, outcomes, metrics
- **Career Timeline**: all roles, companies, durations, responsibilities
- **Certifications**: all certifications held
- **Languages**: all languages and proficiency levels
- **Profile Summary**: the pattern/approach/result narrative

Why live fetch: Laurent updates his profile regularly. A stale snapshot would produce inaccurate scoring.

---

## The Algorithm: JD ↔ Profile Match Score

### Step 1 — Decompose the JD

Parse the JD and extract structured lists for each scoring dimension:

| Dimension | What to extract | Weight |
|---|---|---|
| **Required Skills** | Hard skills, technologies, methodologies explicitly required | **30%** |
| **Domain Alignment** | Industry, sector, business context | **20%** |
| **Seniority Fit** | Years of experience, title level, scope (team size, budget, exec access) | **15%** |
| **Functional Fit** | What the person will DO — advisory, delivery, engineering, strategy, sales | **15%** |
| **Preferred Skills** | Nice-to-have skills, "bonus if you have…" items | **10%** |
| **Certs & Languages** | Specific certifications or language requirements | **10%** |

### Step 2 — Match each item against Laurent's profile

For list-based dimensions (Required Skills, Preferred Skills, Certs & Languages), score each item:

| Match Level | Score | Criteria | Dashboard Color |
|---|---|---|---|
| **Direct match** | 1.0 | Skill/cert/language appears explicitly in Laurent's profile | Green (#22c55e) |
| **Adjacent match** | 0.5 | Related competency exists (e.g., JD says "Kubernetes" → profile has "Cloud-Native & Containerization") | Amber (#f59e0b) |
| **No match** | 0.0 | Nothing in the profile maps to this requirement | Red (#ef4444) |

For judgment-based dimensions (Domain, Seniority, Functional Fit), assign a score from 0–100:

| Score Range | Domain Alignment | Seniority Fit | Functional Fit |
|---|---|---|---|
| **90–100** | Direct case studies in this exact sector | Exact match (level, scope, years) | Role is primarily what Laurent does today |
| **70–89** | Adjacent sector — transferable experience obvious | Slightly over/under but defensible | Strong overlap, some new areas |
| **50–69** | Different sector but skills transfer | Notable gap in experience level | Partial overlap, heavy repositioning |
| **0–49** | Unrelated domain | Clearly mismatched level | Fundamentally different function |

### Step 3 — Compute sub-scores

For list-based dimensions:

```
sub_score = (sum of item scores / number of items) × 100
```

For judgment-based dimensions: use the rubric above to assign a 0–100 score.

### Step 4 — Compute weighted total

```
Match % = (0.30 × Required Skills) + (0.20 × Domain) + (0.15 × Seniority) + (0.15 × Functional Fit) + (0.10 × Preferred Skills) + (0.10 × Certs & Languages)
```

### Step 5 — Flag deal-breakers

Separately flag any hard blockers that kill the application regardless of score:

- A required certification Laurent doesn't have (e.g., "must have AWS Solutions Architect")
- A hard language requirement not met (e.g., "must speak Mandarin")
- A regulatory/clearance requirement (e.g., "must have security clearance")
- A domain lock-in (e.g., "10+ years in pharmaceutical R&D specifically")

Deal-breakers don't change the score — they appear as warnings alongside it.

### Step 6 — Determine match band

| Score | Band | Color | Action |
|---|---|---|---|
| **85–100%** | Excellent Match | Green | Apply confidently, light tailoring |
| **70–84%** | Good Match | Blue | Apply, emphasize strengths, reposition gaps |
| **55–69%** | Moderate Match | Amber | Apply selectively, heavy tailoring needed |
| **Below 55%** | Weak Match | Red | Flag — may not be worth the effort |

---

## Outputs

### Output 1: HTML Dashboard

A single-page HTML file using the template in `template.html` (stored alongside this SKILL.md).

**Do NOT regenerate the CSS from scratch.** Copy the HTML/CSS from the template and only modify the dynamic content sections.

#### Filename convention

```
JD_Match_[CompanyName]_[RoleTitle].html
```

Example: `JD_Match_Gartner_AssociateDirector.html`

#### Dashboard sections (top to bottom)

1. **Header bar** — dark background. Left: "JD Match Report" + date. Right: overall score (large), match band label, color indicator.

2. **JD summary strip** — Company, role title, location (if available), seniority level, domain.

3. **Dimension scorecard row** — 6 cards in a horizontal grid:
   - Each card: dimension label, score (0–100), horizontal progress bar (color-coded), weight label
   - Card border accent reflects score color (green/amber/red)

4. **Deal-breaker bar** — Green "No deal-breakers found" or red alert listing each blocker.

5. **Detailed breakdown** — two-column layout:
   - Left: Required Skills table (skill name | match dot green/amber/red | matched profile asset)
   - Right: Preferred Skills table + Certs & Languages table (same format)

6. **Qualitative assessments** — three compact cards side by side:
   - Domain Assessment (narrative + score)
   - Seniority Assessment (narrative + score)
   - Functional Fit Assessment (narrative + score)

7. **Tailoring Recommendations** — structured list:
   - Headline/tagline direction
   - Engagement priority order (which case studies to lead with)
   - Skills emphasis order (which skill cards to prioritize)
   - Profile highlights tailoring notes
   - Gap strategy (how to address/reposition gaps)
   - Key JD vocabulary to mirror

8. **Footer** — generation metadata.

### Output 2: Recommendations File

A markdown file saved alongside the dashboard. This file is the input bridge to the CV generator skill.

#### Filename convention

```
Recommendations_[CompanyName]_[RoleTitle].md
```

#### Structure

```markdown
# Tailoring Recommendations — [Company] · [Role Title]
Generated: [date] | Match Score: [X]% | Band: [Excellent/Good/Moderate/Weak]

## Headline Direction
[Suggested tagline that mirrors employer vocabulary]

## Engagement Priority Order
1. [Most relevant engagement] — why: [reason]
2. [Second most relevant] — why: [reason]
3. [Third] — why: [reason]
4. [Fourth] — why: [reason]

## Hard Skills Card Order
1. [Most relevant skill card] — why: [reason]
2. ...
3. ...
4. ...
5. ...

## Soft Skills Card Order
1. [Most relevant soft skill card] — why: [reason]
2. ...
3. ...
4. ...
5. ...

## Profile Highlights Tailoring
[Specific suggestions for the opening sentence or additional context to weave in]

## Gap Strategy
- [Gap 1]: [How to address — reposition, omit, acknowledge in cover letter]
- [Gap 2]: ...

## Key Vocabulary to Mirror
- [Term 1 from JD] → [How to reflect it]
- [Term 2 from JD] → [How to reflect it]
- ...

## Entrepreneurial Track
[Recommendation: include or omit, with reasoning based on JD signals]
```

---

## Execution Checklist

When this skill is triggered, follow these steps in order:

1. **Read this SKILL.md** (you're doing it now)
2. **Read template.html** — load the full HTML/CSS dashboard template
3. **Fetch laurent.vincentelli.pro** — extract all profile assets (skills, engagements, timeline, certs, languages, summary)
4. **Parse the JD** — decompose into the 6 scoring dimensions (required skills, domain, seniority, functional fit, preferred skills, certs & languages)
5. **Run the matching algorithm**:
   - Score each item in list-based dimensions (direct/adjacent/no match)
   - Score each judgment-based dimension (0–100 rubric)
   - Compute weighted total
   - Identify deal-breakers
   - Determine match band
6. **Generate tailoring recommendations** based on the scoring results
7. **Produce the HTML dashboard** — copy template structure, inject all scored data
8. **Produce the recommendations markdown file**
9. **Present both files to the user**
10. **Wait for user decision**:
    - If user says "proceed" / "generate CV" → tell them to provide the JD + recommendations file to the CV generator skill
    - If user says "skip" → acknowledge and stop
    - If user wants adjustments → discuss and re-score if needed

---

## Anti-Patterns (things to avoid)

- Do NOT regenerate the dashboard CSS from scratch — copy from template.html
- Do NOT invent skills or experience not on laurent.vincentelli.pro
- Do NOT inflate scores to be optimistic — be honest and precise
- Do NOT skip the deal-breaker check — a high score with a hard blocker is misleading
- Do NOT produce a CV — this skill only scores and recommends; the CV generator is a separate skill
- Do NOT auto-proceed to CV generation without user confirmation
- Do NOT change the algorithm weights without user instruction
