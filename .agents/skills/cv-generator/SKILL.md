---
name: cv-generator
description: >
  Generates a tailored 2-page HTML CV/Resume for Laurent Vincentelli from a job description.
  Triggers when the user provides a job description (pasted or uploaded) and asks for a CV, resume,
  or application document. Also triggers for cover letter requests when explicitly asked.
  Uses laurent.vincentelli.pro as the single source of truth for professional content.
  Outputs an A4-compatible HTML file ready for PDF/DOCX export.
---

# CV/Resume Generator for Laurent Vincentelli

## Purpose

Automate the creation of a perfectly tailored 2-page CV/Resume for each job application.
The user searches job platforms, finds relevant JDs, and provides them one at a time.
This skill produces a tailored CV (and optionally a cover letter) as an HTML file.

---

## Trigger Conditions

Activate this skill when:
- The user provides a job description (pasted text, uploaded file, or URL) AND asks for a CV/resume
- The user says things like: "create a CV for this JD", "tailor my resume to this role", "apply to this job", "generate a CV"
- The user asks for a cover letter for a previously generated CV

Do NOT activate for:
- General career advice without a specific JD
- Requests to edit the template itself (those are template maintenance tasks)

---

## Inputs

| Input | Required | Description |
|---|---|---|
| Job Description | YES | The full JD text, uploaded file, or URL to fetch |
| Cover letter | NO | Only produce if the user explicitly asks. Default: CV only |
| Language | NO | Default: English. Switch only if user explicitly asks (e.g. "in French") |
| Entrepreneurial track | ASK | Ask the user: "Does this role signal commercial/BD/entrepreneurial fit? Should I include your entrepreneurial track?" |

---

## Source of Truth

**Always fetch `https://laurent.vincentelli.pro/` live** at the start of every CV generation.
This is the single source of truth for:
- Professional summary / profile highlights
- Career timeline (corporate + entrepreneurial journeys)
- Skills & expertise (hard skills and soft skills — exact wording, categories, and tags)
- Case studies & achievements (engagements, metrics, outcomes)
- Certifications, languages, contact details

Why live fetch: Laurent updates his profile regularly. A stale snapshot would produce outdated CVs.

---

## Strategic Logic — The Tailoring Engine

These rules were developed and validated during the initial UAT session. They are critical to output quality.

### 1. Mirror the employer's vocabulary
- **Dynamically rewrite the headline/tagline** to match the target employer's language
- Example: For Gartner → "Technology Strategy & Digital Transformation Advisor" (not "Digital & AI Platforms Lead")
- Example: For McKinsey → "Digital & Technology Transformation Leader"
- Scan the JD for their specific terminology and reflect it in the headline, profile, and skills emphasis

### 2. Advisory-first positioning
- Laurent's background is deep in platform engineering and delivery
- For senior consulting/advisory roles: reframe as **strategic advisory enabled by deep technical credibility**
- Lead with "Advise CIOs on..." not "Built a platform for..."
- The CV sells **decisions**, not deliverables

### 3. Outcome-led, not activity-led
- Every bullet should lead with the business outcome, not the activity
- Weak: "Led delivery of a multi-cloud API platform"
- Strong: "Advised CIO on $5M platform consolidation — cut partner onboarding by 79%"

### 4. Select and reorder engagements by JD relevance
- From the 4 case studies on laurent.vincentelli.pro, select and ORDER by relevance to the JD
- If the JD emphasizes cloud → lead with the engagement most relevant to cloud
- If the JD emphasizes AI/digital → lead with The AI Factory
- All 4 can appear, but the order matters

### 5. Tailor hard/soft skills emphasis
- The skill cards stay structurally identical (same categories, same wording from the website)
- But the ORDER of the cards should reflect JD priorities
- If the JD emphasizes Agile/DevOps → put "Software Engineering Practices" first

### 6. Profile Highlights — default text with tailoring option
The default profile highlights text is (from laurent.vincentelli.pro):

> I have spent 15+ years building and scaling the platform layer that sits between raw compute and the people who need to use it.
>
> — The pattern: a brilliant multidisciplinary team with world-class infrastructure access — and a missing platform layer costing them velocity.
> — The approach: Start with the customer, map the friction, systematically partner with stakeholders to secure funding/budget. Then hire talent, assemble the right team topology, lead the value streams that build the platform, ship with cadence, and scale (or pivot).
> — The result: zero-friction vertical user experiences, translating on-premises and hyperscaler infrastructure into platforms that actually scale the business.

This text is the DEFAULT. It can be lightly tailored (e.g., adding a sentence connecting to the employer's mission) but the core structure (pattern/approach/result) must be preserved.

### 7. "Currently" line in the title section
The title section includes:
```
Currently: Engagement Manager at Deloitte, Technology & Transformation
ex-IBMer, ex-Accenture, ex-Capgemini
```
This line is FIXED and should not change between applications (unless Laurent changes roles).

### 8. Entrepreneurial track
- ASK the user before including: "Does this role signal commercial/BD/entrepreneurial fit? Should I include your entrepreneurial track?"
- If YES: add a compact entrepreneurial section or weave it into the profile
- If NO: omit entirely (the corporate journey is sufficient)

### 9. Engagement sizing (placeholder values)
The achievement cards include engagement sizing data (duration, budget, FTE). Current values are PLACEHOLDERS:
- Insurance-as-a-Service Platform: 18 months · $5M · 22-FTE
- The AI Factory: 12 months · $3M · 14-FTE
- Open Banking Platform: 14 months · $4.2M · 18-FTE
- Internal Developer Platform: 10 months · $2.8M · 12-FTE

These should be replaced with real values when Laurent provides them. Until then, keep these placeholders.

---

## Output Specification

### Format
- **HTML file** — single self-contained file with embedded CSS
- A4-compatible (210mm × 297mm pages)
- Print-ready: use `@page { size: A4; margin: 0; }` and `@media print` rules
- Fonts loaded from Google Fonts CDN (DM Sans + Playfair Display)

### Template
Read `template.html` (stored alongside this SKILL.md) as the structural and visual reference.
**Do NOT regenerate the CSS from scratch.** Copy the CSS from the template and only modify the dynamic content sections.

### Pages
- **Page 1** — tailored to the JD. Contains: Title, Profile Highlights, Achievements (dashboard cards), Hard Skills (cards), Soft Skills (cards)
- **Page 2** — detailed professional experience with vertical timeline. Structure is stable across applications; only light wording adjustments needed.

### Filename convention
```
CV_Laurent_Vincentelli_[CompanyName]_[RoleTitle].html
```
Example: `CV_Laurent_Vincentelli_Gartner_AssociateDirector.html`

### Where to save
Save to `/mnt/user-data/outputs/` and present to the user with the `present_files` tool.

---

## Page 1 Structure (dynamic — tailored per JD)

### Section 0: Title Bar
| Left | Right |
|---|---|
| **Laurent Vincentelli** (h1, Playfair Display 2.8rem) | **Certifications** |
| Dynamic tagline in magenta (mirrors employer vocabulary) | Scrum (PSM · PSPO · Kanban) |
| laurent@vincentelli.pro · linkedin.com/in/laurentvincentelli | Lean Six Sigma Black Belt |
| Currently: Engagement Manager at Deloitte, T&T | SAFe Practitioner · TOGAF Practitioner |
| ex-IBMer, ex-Accenture, ex-Capgemini | **Languages** |
| | English (fluent) · French (native) |
| | Spanish (professional proficiency) |

### Section 1: Profile Highlights
- Use the default pattern/approach/result text
- Lightly tailor the opening sentence if the employer's mission warrants it
- Preserve the 3-bullet structure

### Section 2: Achievements — Selected Engagements
- 2×2 grid of dashboard cards
- Each card: 60% left (explainer), 40% right (dark navy panel with engagement sizing + success metrics)
- ORDER cards by relevance to the JD
- Engagement sizing in white text at top of right panel
- Success metrics: gold values (#ffd54f) + white labels
- "Success Metrics" sub-label in dimmed white

### Section 3: Hard Skills — Technologies & Flow
- 2×2 grid + 1 full-width card (Frameworks & Methodologies)
- Cards contain: title, explainer paragraph, blue tags
- **Use exact wording from laurent.vincentelli.pro** — do not rewrite
- ORDER cards by JD relevance

### Section 4: Soft Skills — Leadership & Outcomes
- 2×2 grid + 1 full-width card (Entrepreneurial Mindset & Ownership)
- Same card structure as hard skills
- **Use exact wording from laurent.vincentelli.pro** — do not rewrite
- ORDER cards by JD relevance

---

## Page 2 Structure (mostly stable)

### Title Bar (repeated from page 1)
Same content as page 1 title, using h2 (2.2rem) instead of h1.

### Professional Experience — Vertical Timeline
- Left: year labels (1.05rem, bold, dark ink) positioned left of a vertical connecting line
- Dots on the line (current role = magenta, others = navy)
- Right: role title (1.3rem bold) · company name (1.25rem, accent blue)
- Body text: description + bullet points
- All 7 corporate roles from GreenSaaS (2008) to Deloitte (present)
- Blocks use `flex: 1` to fill the full page height
- Footer: "Full engagement portfolio, references, and case-study deep-dives available on request · laurent.vincentelli.pro"

---

## Cover Letter (only when explicitly asked)

### Format
- Separate HTML file or inline in chat (ask user preference)
- Professional, concise — max 400 words
- Structure: Opening hook → Why this role → What I bring → Closing

### Tone
- Confident but not arrogant
- Mirror the employer's language
- Reference specific JD requirements and map them to Laurent's experience
- Close with a clear call to action

### Filename
```
CoverLetter_Laurent_Vincentelli_[CompanyName]_[RoleTitle].html
```

---

## Execution Checklist

When the skill is triggered, follow these steps in order:

1. **Read this SKILL.md** (you're doing it now)
2. **Read template.html** — load the full HTML/CSS template
3. **Fetch laurent.vincentelli.pro** — get the latest content (profile, skills, case studies, career timeline)
4. **Analyze the JD** — extract: company name, role title, key requirements, domain focus, vocabulary patterns, seniority level
5. **Ask the user**: "Does this role signal commercial/BD/entrepreneurial fit? Should I include your entrepreneurial track?"
6. **Generate the tailored CV**:
   - Copy the template HTML/CSS structure
   - Dynamically rewrite: tagline, profile highlights (light touch), achievement card order, skill card order
   - Keep all content faithful to laurent.vincentelli.pro (single source of truth)
   - Apply strategic logic rules (advisory-first, outcome-led, vocabulary mirroring)
7. **Save and present** the HTML file
8. **If cover letter requested**: generate separately after the CV is confirmed

---

## Anti-Patterns (things to avoid)

- ❌ Do NOT regenerate CSS from scratch — always copy from template.html
- ❌ Do NOT invent engagements, metrics, or skills not on laurent.vincentelli.pro
- ❌ Do NOT rewrite the hard/soft skill card text — use exact wording from the website
- ❌ Do NOT use a sidebar/two-column layout on page 1 — it's single-column
- ❌ Do NOT produce a 1-page CV — always 2 pages
- ❌ Do NOT include the entrepreneurial track without asking first
- ❌ Do NOT produce a cover letter unless explicitly asked
- ❌ Do NOT change the contact info, certifications, or languages without user instruction
