# Google Cloud OCE — RRK Interview Prep Briefing

**Interview:** Role-Related Knowledge (RRK), 45 min, video call
**Scheduling window:** within 2 weeks of 2026-05-21 → expect between 2026-05-25 and 2026-06-04
**Role:** Outcome Customer Engineer, Google Cloud Platform (Paris)
**Source email:** [`email-karina-rrk.md`](./email-karina-rrk.md)

> **How to use this doc.** It is a *prep harness*, not a script. Part 1 sets the mental model so you don't over-rotate. Part 2 decodes the four scoring lenses. Part 3 walks each of the five competency areas with frameworks + likely scenarios. Part 4 is the **90% question bank** — read it as the firing range you train on. Part 5 is your **story library** — pre-curate so STAR answers come out clean under time pressure. Part 6 is the **live-deployment toolkit** for the interview itself. Part 7 is the operating checklist + the question to ask Karina.

---

## Part 1 — What an RRK at Google Actually Is

**The mental model.** RRK is the *technical-credibility gate*. The interviewer's only job in 45 minutes is to leave the room able to say one of three things: **"yes, this person can do the job from day one"**, **"yes, with ramp"**, or **"no"**. They will not test trivia. They will test *how you reason*, *whether you've actually done the work*, and *whether you can communicate it to a customer*.

**Four things to internalise:**

1. **They expect 4–6 questions in 45 min — so ~7–8 min per answer.** That includes their follow-ups. Plan your STAR stories to land the headline in 60–90 seconds, with depth ready on probe. Long monologues fail this format.
2. **"Hypothetical" questions are sold as fiction but are graded as fact.** They want to see *your real instinct* — what you'd actually do — not the textbook answer. Drop into a real scenario from your past as soon as the hypothetical permits it.
3. **The 90% predictability claim is true *because the scope is narrow*.** The five competency areas are the entire blast radius. If you have a 3-story answer ready for every junction inside those five areas, you've cornered the surface area.
4. **They are listening for what you *did personally*, not what your team did.** Use "I", not "we", for the load-bearing actions. "We" for context only.

**What makes the OCE RRK different from a CE RRK:** A CE candidate is graded on pre-sales architecture polish — can they paint the vision. **You** are graded on *delivery thrust* — can you move a stalled workload from "agreement" to "in production" with measurable consumption. That tilts every answer toward outcomes, blockers cleared, and time-to-value. Anchor on that bias.

---

## Part 2 — The Four Scoring Lenses

Every answer is scored across these four lenses. You can think of each answer as a four-dimensional vector — the question is *which lens the interviewer will weight most* on this particular probe. **Engineer your stories so each one scores well on at least three lenses.**

### Lens 1 — General Cognitive Ability (GCA)
- **What it really measures:** Can you decompose an ambiguous problem? Do you state assumptions? Do you use data to choose between paths?
- **How it shows up in RRK:** Open-ended hypotheticals with missing inputs. *"A customer has bought €5M in GCP commit and is consuming €400K — what do you do?"* — they want to hear you slice the problem (commercial vs technical vs organisational), state assumptions ("I'd want to know which workloads were scoped"), and reason toward a path.
- **Tactical signal to drop:** Numbers. Stating ranges. "If consumption is below 20% of commit by month 6, the contract is at risk — that's my trigger."

### Lens 2 — Leadership
- **What it really measures:** Have you mobilised others, especially without formal authority? Have you navigated competing priorities? Have you made a hard call?
- **How it shows up in RRK:** *"Tell me about a time you had to align a customer team, a GSI, and Google teams toward a single deployment plan."* They want to hear who you brought to the table, what you decided unilaterally, what you delegated.
- **Tactical signal to drop:** Name the cross-functional cast (engineers, PMs, customer exec sponsor, GSI lead, vendor SE). Show you can name them because you *worked with them by name*.

### Lens 3 — Role-Related Knowledge (RRK proper)
- **What it really measures:** Do you actually know GCP at the depth required to debug, design, and unblock? Do you know the *patterns* (migration phases, landing zones, observability)?
- **How it shows up in RRK:** Pointed technical follow-ups. *"You said you'd use VPC Service Controls — why not just IAM conditions?"* Don't bluff. If you don't know, say "I'd validate that with the product team — my instinct is X."
- **Tactical signal to drop:** Specific service names with reasons. Not "we used a GCP database" — "we used Cloud SQL for the relational tier because the team was Postgres-native, and BigQuery for the analytics warehouse — separation kept the OLTP latency budget intact."

### Lens 4 — Googleyness
- **What it really measures:** How you handle ambiguity, how you treat others, whether you grow yourself, whether you're collaborative.
- **How it shows up in RRK:** *"Tell me about a time you got something wrong"*, *"…a time you had to learn something new fast"*, *"…a teammate you helped grow"*. Also embedded in *how you talk about customers* — do you blame them or treat them as partners?
- **Tactical signal to drop:** Owning a failure cleanly (no scapegoating). One sentence on what you'd do differently. Never disparage a past employer or customer — even when the story justifies it.

---

## Part 3 — The Five Competency Areas, Decoded

The Karina email lists five focus areas. Below: what each one is *really* asking, the GCP knowledge surface you need fluency in, and the question patterns you can expect.

---

### 3.1 — Cloud Technology Landscape: GCP Critical Workload Migration

**What they're really testing:** Can you talk credibly about moving *real* enterprise workloads onto GCP? Do you know the patterns, the tools, the failure modes?

**The four migration archetypes in the JD:**

| Archetype | GCP toolchain | Common blockers |
|---|---|---|
| **VM migration** | Migration Center (assessment) → Migrate to Virtual Machines (M2VM) → Compute Engine MIGs | Network IP overlap, licence portability (Windows/RHEL), MTBF on large LUNs |
| **App modernisation** | GKE, Cloud Run, Cloud Build, Anthos Service Mesh, Migrate to Containers (M2C) | Stateful dependencies, session affinity, secrets rotation, observability gap |
| **Data migration & analytics** | BigQuery (BQ Migration Service for Teradata/Redshift/Snowflake), Dataflow, DataStream, Storage Transfer Service | Schema drift, latency for online cutover, data sovereignty, cost spike post-migration |
| **AI/ML workloads** | Vertex AI (Training, Pipelines, Model Registry, Endpoints), GKE with GPU node pools, TPU v5p, Model Garden, Agent Builder | GPU/TPU capacity reservations, data residency for training corpus, MLOps governance |

**The migration phases you must be able to draw on a whiteboard from memory:**
`Assess → Plan → Migrate → Optimise → Operate`. Map the GCP tool to each phase. Migration Center sits in Assess. Cloud Foundation Toolkit (CFT) sits in Plan. M2VM/M2C/BQ Migration Service sit in Migrate. Active Assist + Recommender + FinOps sit in Optimise.

**The 6 R's (own this vocabulary):** Rehost (lift-and-shift), Replatform (lift-and-tinker), Refactor (re-architect for cloud-native), Repurchase (move to SaaS), Retire, Retain. Google uses these. So does AWS. Knowing them signals industry fluency.

**Likely question patterns:**
- *"Walk me through how you'd plan the migration of 800 VMs from a customer's on-prem datacentre in Paris to GCP, 9-month deadline."*
- *"A customer wants to modernise a 15-year-old Java monolith — what's your phased approach on GCP?"*
- *"Tell me about a critical workload migration you led. What went wrong, and what did you do about it?"*
- *"How would you migrate a 500TB on-prem Teradata warehouse to BigQuery without breaking nightly reports?"*

**Your live ammo:**
- **AI Factory at Deloitte (GCP)** — Vertex AI, GKE GPU, self-service AI marketplace, 98% provisioning reduction. **Primary AI/ML migration story.**
- **IBM multi-cloud API platform (GCP + AWS)** — Payments, Capital Markets, Terraform modules, 200+ API consumers. **Primary app modernisation story.**
- **Accenture IDP** — provisioning 18d → 4h, $9M/year recovered, 3× deploy frequency. **Primary platform-engineering story.**
- **OVHcloud sovereign cloud** — GDPR architecture patterns, FSI / public sector. **Primary regulated-industry / data-sovereignty story.**

---

### 3.2 — Cloud Architecture

**What they're really testing:** Can you reason about a landing zone, a multi-region topology, identity, networking, security, reliability — and trade them off against cost?

**The architecture surface you must be fluent in:**

- **Resource hierarchy.** Organisation → Folders (environment / BU) → Projects → Resources. Inheritance of IAM and Org Policy. *Why this matters in your answers:* it's the first thing you draw when a customer asks for a "landing zone".
- **Networking.** VPC, Shared VPC (host/service projects), VPC Service Controls (data exfil protection — the FSI compliance favourite), Private Service Connect (PSC), Cloud Interconnect (Dedicated/Partner) vs Cloud VPN, Cloud NAT, Cloud DNS.
- **Identity.** Cloud Identity / Workspace federation, Workforce Identity Federation, Workload Identity Federation (no more JSON keys!), IAM Conditions, Service Accounts and impersonation patterns.
- **Security.** Security Command Center (Standard / Premium / Enterprise), Cloud KMS, Cloud HSM, Confidential VMs, Assured Workloads (for regulated regions — EU Sovereign Controls), Org Policy Service.
- **Reliability.** Regions vs zones, multi-regional services, GCLB, MIGs with health checks, Cloud SQL HA / read replicas, Spanner for global consistency, SLO/SLI/error-budget thinking from SRE.
- **Observability.** Cloud Logging, Cloud Monitoring (was Stackdriver), Cloud Trace, Cloud Profiler, Error Reporting, Managed Service for Prometheus, OpenTelemetry.
- **Tooling for repeatable architecture.** Cloud Foundation Toolkit (CFT) — Terraform blueprints for landing zones. Mention this **by name** — it's in your JD's preferred quals.

**Key architecture pattern vocabulary to deploy:**
- *Hub-and-spoke VPC topology* (the regulated-industry default)
- *Landing zone* (foundational org/folder/project/network/IAM scaffolding)
- *Defence-in-depth* (IAM + Org Policy + VPC-SC + KMS)
- *Blast radius* (containment via project boundary)
- *Cell-based architecture* (for high-isolation multi-tenant SaaS)
- *Active-active vs active-passive DR* (RPO/RTO trade-off)

**Likely question patterns:**
- *"Walk me through the landing zone you'd design for a Tier-1 European bank doing their first GCP workload."*
- *"How do you architect for GDPR data residency when the customer wants to use Vertex AI training?"*
- *"What's your default approach to multi-region HA on GCP, and when do you not use it?"*
- *"A customer wants to expose 50 internal APIs to fintech partners — sketch the architecture."*

**Your live ammo:**
- **Open Banking Platform (EU Fintech)** — 90% reduction time-to-first-API-call, 30+ fintech partners day-one. **Primary API platform + partner ecosystem architecture story.**
- **Insurance-as-a-Service (NA FSI)** — partner onboarding 14w → 3w, 140+ regulatory controls, zero findings. **Primary regulated-industry architecture + compliance story.**
- **OVHcloud sovereign patterns** — GDPR-compliant architecture for FSI/public-sector. **Backup story for sovereignty.**

---

### 3.3 — Project Management: Orchestrating Customer, Partner, and Google Teams

**What they're really testing:** Can you actually run a deployment programme? Do you know how to manage risk, change, capacity, and stakeholders simultaneously?

**The methodology vocabulary you should deploy fluently:**

- **Delivery flow.** SAFe (your cert), Scrum (your cert PSM/PSPO), Kanban (your cert), Lean / VSM (your Black Belt). You have the alphabet — *use the words* when relevant.
- **Change management.** ADKAR (Awareness → Desire → Knowledge → Ability → Reinforcement) or Kotter's 8 steps. **Pick one and own it** — don't half-cite both.
- **Risk & dependency.** RAID log (Risks, Assumptions, Issues, Dependencies). RACI (or RASCI with Consulted/Support distinction).
- **Programme cadence.** Steering committees (monthly), workstream stand-ups (daily/twice-weekly), QBRs (quarterly) for executive alignment.
- **Capacity & readiness.** This is in the JD — "ensuring readiness (e.g., capacity, training)". They want to hear you've trained customer teams *while* delivering, not after.
- **Partner orchestration.** Knowing the names: Accenture, Capgemini, Deloitte (you), TCS, Wipro, Atos, Sopra Steria, Devoteam — the EMEA GSI landscape Google partners with.

**The OCE-specific PM angle they care about:** *Time-to-consumption*. Every project decision should be re-framed against "does this accelerate when the meter starts running on the workload?" That's the OCE's North Star metric. Make sure at least one of your project answers explicitly says: "we tracked time-to-first-production-workload as the primary KPI".

**Likely question patterns:**
- *"Tell me about a time you had to orchestrate a GSI, the customer, and a vendor through a deployment. What was the friction?"*
- *"Imagine your customer is 8 weeks behind their consumption ramp. The exec sponsor is escalating. Walk me through your next 72 hours."*
- *"How do you build a deployment plan when the customer's internal team isn't ready and the GSI is pushing for accelerated billing?"*
- *"Describe how you sequenced workloads onto cloud — how did you decide what went first?"*

**Your live ammo:**
- **IBM Payments + Capital Markets** — orchestrated GSIs across 3 programmes, drove workloads zero-to-full-consumption. **Primary GSI orchestration story.**
- **Deloitte AI Factory (current)** — 40+ cross-functional team, GCP-backed AI platform. **Primary current-role multi-stakeholder story.**
- **Accenture IDP** — 300+ engineers across 3 product domains. **Primary scaled-adoption story.**

---

### 3.4 — Software System Design / Troubleshooting / Debugging

**What they're really testing:** When the production deployment goes sideways, can you *technically unblock it* — not just escalate? This is the player-coach test. They want code-and-architecture instinct still alive.

**The troubleshooting frameworks to deploy:**

- **The funnel.** Start broad (is the whole region down? is it the network? is it the app?) → narrow with data → form hypothesis → test cheaply → confirm or reject.
- **5 Whys / fishbone (Ishikawa)** for root cause. Your Six Sigma BB toolkit. *Drop the term once.*
- **The four golden signals (SRE).** Latency, Traffic, Errors, Saturation. *Cite by name when discussing observability.*
- **Hypothesis-driven debugging.** "I'd check X first because failure mode Y matches symptom Z."

**The GCP debugging toolkit (be able to name and sequence):**
- **Cloud Logging** with structured logs + log-based metrics + log sinks for retention
- **Cloud Monitoring** dashboards + alerts on SLO burn
- **Cloud Trace** for distributed-system latency breakdown
- **Cloud Profiler** for CPU/memory hot paths
- **Error Reporting** for exception aggregation
- **GKE-specific:** `kubectl describe`, events, node-level metrics, autoscaler events
- **Network debugging:** Network Intelligence Center, Connectivity Tests, VPC Flow Logs, Firewall Insights
- **IAM debugging:** Policy Troubleshooter, IAM Recommender

**Common failure modes you should have an instant answer for:**
- *Cloud Run cold starts → mitigation patterns* (min instances, CPU-always-allocated, image size, startup probe)
- *GKE OOMKills → resource requests/limits tuning, VPA recommendations*
- *BigQuery slot exhaustion → reservations vs on-demand, query optimisation, partitioning/clustering*
- *VPC-SC blocking a legitimate call → access levels, dry-run mode, audit logs*
- *Cloud SQL replica lag → write throughput, binlog size, network*

**Likely question patterns:**
- *"A production GKE service is experiencing intermittent 503s. Walk me through your debugging."*
- *"Tell me about the hardest technical problem you debugged personally in the last two years."*
- *"A BigQuery report that ran in 5 minutes yesterday is now timing out at 60 minutes. What do you do?"*
- *"Imagine a customer says their migration is 'broken'. They can't tell you what's wrong. What's your first hour?"*

**Your live ammo:**
- **IBM API platform** — resolved K8s and API gateway blockers *in production*. **Primary live-production-debug story.**
- **AI Factory** — pipeline / GPU / quota debugging at scale. **Primary AI-platform-debug story.**
- **CloudLifters founder** — cloud migration platform, deep hands-on debugging during M&A diligence. **Backup story for founder-mode debugging.**

---

### 3.5 — Communication and Stakeholder Management

**What they're really testing:** Can you sit in a room with a CIO and earn trust in 10 minutes? Can you de-escalate a hostile programme? Can you say "no" to a customer without losing the relationship?

**The communication frameworks to deploy:**

- **BLUF (Bottom Line Up Front).** Lead with the answer; layer the reasoning behind. Mirror this in your *interview answers* too — it makes you sound senior.
- **Pyramid Principle / Minto.** Headline → grouped arguments → evidence. You already used this in your interview-1 prep — show you operate this way *by example*, not by citing the name.
- **The "Situation – Complication – Resolution"** (McKinsey SCR) framing for executive narratives.
- **Influencing without authority.** Cialdini's reciprocity, social proof, commitment — useful vocabulary but don't quote a self-help book; just demonstrate it.

**Stakeholder modes to be able to switch between live:**
- *To a customer C-suite:* outcome language, business risk, time-to-value
- *To a customer engineer:* technical respect, peer-to-peer, no patronising
- *To a GSI partner lead:* contract-clarity, RACI, no scope creep
- *To Google's own product/capacity team:* clear escalation rationale, data-backed
- *To your own internal leadership:* concise status, risks surfaced early

**Likely question patterns:**
- *"Tell me about a time you delivered bad news to a customer executive. How did you frame it?"*
- *"You disagree with the customer's architectural choice but they're paying. What do you do?"*
- *"Describe a time you had to align a stakeholder who actively didn't want your project to succeed."*
- *"How do you communicate technical risk to a non-technical exec sponsor?"*

**Your live ammo:**
- **Deloitte–Google Canada partnership table** — you're already at it. **Primary partnership-comms story.**
- **Capgemini Defence & Space** — classified environment, zero-defect CI/CD in a stakeholder-heavy programme. **Primary high-stakes-stakeholder story.**
- **OVHcloud pre-sales engineering** — C-suite translations. **Backup story for technical-to-business translation.**

---

## Part 4 — The 90% Question Bank

> **How to use this.** For each question, pre-stage *three* STAR-shaped answers (per Karina's "have a backup plan" guidance) and have at least one mapped to GCP specifically. Headlines below; flesh them out with the **Story Library** in Part 5.

### 4.1 — Behavioural (Tell me about a time…)

| # | Question | Lens(es) primarily targeted | Your 3 candidate stories |
|---|---|---|---|
| B1 | …you led a critical workload migration to cloud. | RRK, Leadership | AI Factory (Deloitte/GCP); IBM Payments migration; Accenture IDP rollout |
| B2 | …you debugged a production issue under time pressure. | RRK | IBM K8s API gateway prod blocker; AI Factory GPU/quota issue; CloudLifters M&A diligence debug |
| B3 | …you orchestrated a GSI / partner through a delivery. | Leadership, RRK | IBM 3 programmes with GSIs; Deloitte AI Factory current; Accenture multi-vendor IDP |
| B4 | …you had to deliver bad news to an executive. | Comms, Googleyness | Story TBD — pick one programme where you re-baselined a schedule with the sponsor; one where you killed a workstream; one where you said "this won't deliver value, here's why" |
| B5 | …you failed or got something wrong. | Googleyness | Pick: a hire that didn't work; an architecture choice you'd redo; a customer relationship that soured. Choose ones where you owned the call. |
| B6 | …you influenced without formal authority. | Leadership, Comms | Open Banking platform alignment; IBM cross-org GSI coordination; CloudLifters founder period |
| B7 | …you upskilled a team or individual (player-coach). | Leadership, Googleyness | Deloitte current team; Accenture engineering org; Cognizant SRE/DevOps introduction |
| B8 | …you navigated ambiguity / no clear playbook. | Googleyness, GCA | CloudLifters founder; OVHcloud sovereign cloud patterns (new ground); Deloitte AI Factory greenfield |
| B9 | …you accelerated a customer's time-to-value or consumption. | RRK (OCE-specific), GCA | AI Factory 98%; Accenture 18d→4h; Open Banking 90% TTFAC |
| B10 | …you handled a customer who was unhappy / escalating. | Comms, Leadership | Pick the one with the cleanest recovery arc. |
| B11 | …you had to learn a new technology fast. | Googleyness, RRK | Vertex AI for the AI Factory; M2VM/M2C tooling; Terraform module authorship at IBM |
| B12 | …you made a data-driven decision that contradicted gut feel. | GCA | Pick a sequencing decision — which workload migrated first based on consumption potential, not customer preference |

### 4.2 — Hypothetical / Scenario (Imagine a scenario where…)

| # | Scenario | Lens(es) primarily targeted | Your structured response approach |
|---|---|---|---|
| H1 | A customer has €5M committed to GCP, six months in, consuming €400K. What do you do? | RRK, GCA | (1) Diagnose — workload-by-workload consumption breakdown, blockers analysis; (2) Re-baseline plan with sponsor; (3) Quick-win identification; (4) Re-trigger time-to-value metric. **Tell the AI Factory or Open Banking story as your real-world parallel.** |
| H2 | Customer wants 800 on-prem VMs migrated in 9 months. Plan it. | RRK, PM | Phase: Assess (Migration Center, 4-6w) → Wave plan (group by interconnect/dependency) → Pilot wave → Production waves → Optimise. **Cite tooling: M2VM, dependency mapping, network landing zone first.** |
| H3 | A GKE production service is throwing intermittent 503s during peak hours. Walk me through. | RRK | Four golden signals → narrow latency vs error → check HPA/VPA events, node pool saturation, upstream dependency latency via Trace, error budget burn. **Hypothesis-test cheaply first.** |
| H4 | Customer wants Vertex AI training but data must stay in-region (GDPR). | RRK, Arch | Assured Workloads (EU region constraint), VPC-SC perimeter, CMEK via Cloud KMS, Workload Identity Federation for the training pipeline, data residency audit via SCC + Access Transparency. |
| H5 | Your project is 8 weeks behind. Exec sponsor is escalating. Next 72 hours? | PM, Comms | (1) Diagnose in 24h — pull RAID log, talk to each workstream lead; (2) Communicate up at hour-30 with options not problems; (3) Re-baseline plan with explicit trade-offs (scope/time/cost) by hour-72; (4) Re-set cadence and trust. |
| H6 | Customer's internal team disagrees with the GSI on the architecture. You're in the middle. | Comms, Leadership | Establish facts vs preferences; surface trade-offs in writing; convene a single decision forum with the right deciders; document and proceed. **Don't be the arbiter of taste — be the arbiter of process.** |
| H7 | Customer wants Cloud Run; team wants GKE. What do you do? | RRK, Comms | Don't pick a side first. Surface: workload characteristics (statefulness, traffic shape, team operational maturity), TCO over 3y, team skills, scaling needs. *Cloud Run wins on simplicity and zero-to-one velocity; GKE wins on customisation and stateful workloads.* Decide *with* the team using a scoring matrix. |
| H8 | Migrating a 500TB on-prem warehouse to BigQuery — design the cutover. | RRK | Schema conversion (BQ Migration Service), initial bulk via Storage Transfer / Transfer Appliance, CDC via DataStream for delta, parallel-run period, switch consumers, decommission. RTO/RPO trade-offs. |
| H9 | A customer's CIO asks why GCP over AWS. You have 2 minutes. | Comms, RRK | Lead with their business: data + AI moat, BigQuery + Vertex AI, Open ecosystem (Anthos for multi-cloud), pricing model differentiators. **Don't trash AWS — name where Google leads.** |
| H10 | Customer's deployment plan looks fine on paper but the team doesn't trust the GSI. | PM, Leadership | Trust isn't fixed by process — but process surfaces the trust gap. Run a small joint pilot, define success criteria up-front, retro with both teams in the room. The work creates the trust. |

### 4.3 — "Why" / Personal (lightweight in RRK, but they slip in)

- *Why Google? Why now? Why OCE?* — you already nailed this in interview 1 (AI revolution → outcome model → Google's $750M agentic AI fund). **Reuse the same headline.**
- *What's your biggest weakness?* — pick a real one tied to growth ("I default to taking on the closer role even when I should be coaching someone into it"). One sentence on how you work on it.

---

## Part 5 — Your Story Library (STAR-Indexed)

Each story below is sized for ~90-second telling, with depth on tap. Pre-rehearse the **headline** and the **result** — those are the load-bearing parts.

### Story 1 — AI Factory at Deloitte (GCP)
- **S** — Global energy conglomerate, GCP infra, AI platform commit signed, raw GPU compute but no developer-facing platform. Time-to-AI-service measured in weeks.
- **T** — Build the platform layer between Vertex AI / GKE GPU and the data science org of ~200 users; turn it into a self-service marketplace.
- **A** — *I* designed the missing abstractions (workspace templates, GPU quota self-service, model-serving pipelines, FinOps showback). *I* resolved the technical blockers in production (GKE GPU node pool autoscaling, Vertex pipeline orchestration, IAM at scale). *I* coordinated the customer's MLOps team, the data science org, and the GCP technical account team.
- **R** — **98% reduction in AI service provisioning time.** GPU → self-service marketplace. Now my primary current GCP story.
- **Lenses it scores on:** RRK, Leadership, GCA, Googleyness.

### Story 2 — IBM Multi-Cloud API Platform (GCP + AWS)
- **S** — Payments + Capital Markets business, 200+ API consumers internal and external, three concurrent programmes, GSIs on each.
- **T** — Drive workloads zero → full consumption; author Terraform modules for IaC provisioning; resolve K8s/API-gateway blockers in production.
- **A** — *I* authored the Terraform module library that became the team's standard. *I* triaged the production K8s/API-gateway blockers personally when escalated. *I* coordinated the GSI leads on each of the three programmes — RACI-clarified, weekly steerco, quarterly QBR with customer exec.
- **R** — Multi-cloud API platform live with 200+ consumers, programmes delivered, workloads from zero to full consumption.
- **Lenses it scores on:** RRK, Leadership, PM.

### Story 3 — Accenture Internal Developer Platform
- **S** — Retailer, 300+ engineers, e-commerce + supply chain + loyalty, provisioning time = 18 days, deployment friction throttling business.
- **T** — Build the IDP, drive adoption across three product domains.
- **A** — *I* led the platform engineering team; *I* designed the developer self-service portal and the golden-path templates; *I* drove a measured adoption programme rather than mandating use.
- **R** — **18 days → 4 hours provisioning. $9M/year recovered. 3× deployment frequency. 500+ voluntary adopters.**
- **Lenses it scores on:** RRK, Leadership, PM, Comms (the adoption play).

### Story 4 — OVHcloud Sovereign Cloud Patterns
- **S** — French sovereign hyperscaler, regulated customers (FSI, public sector), GDPR + emerging data-sovereignty requirements pre-Schrems II clarity.
- **T** — Design reference architecture patterns + lead pre-sales engineering translating customer requirements into structured deployment plans.
- **A** — *I* authored the GDPR-compliant architecture patterns. *I* led the pre-sales engagement model — discovery → solution design → consumption roadmap.
- **R** — Reference patterns adopted across multiple regulated engagements. Backup story for sovereignty + pre-sales translation.
- **Lenses it scores on:** RRK, Comms, Arch.

### Story 5 — Open Banking Platform (EU Fintech)
- **S** — Open banking play, fintech partner ecosystem, regulatory + business clock both ticking.
- **T** — Stand up the API platform, onboard fintech partners day-one.
- **A** — *I* led the technical engagement, drove the architecture, orchestrated partner onboarding workflow.
- **R** — **90% reduction in time-to-first-API-call (3w → 2d). 30+ fintech partners live day one.**
- **Lenses it scores on:** RRK, PM, Comms.

### Story 6 — Insurance-as-a-Service (NA FSI)
- **S** — North American FSI, partner onboarding the bottleneck, heavy regulatory regime.
- **T** — Accelerate partner onboarding, clear regulatory controls.
- **A** — *I* re-engineered the onboarding workflow; *I* led the control-mapping with the customer's compliance org.
- **R** — **14 weeks → <3 weeks. 140+ regulatory controls cleared, zero findings.**
- **Lenses it scores on:** RRK, PM, Comms.

### Story 7 — Capgemini Defence & Space (Classified)
- **S** — Mission-critical embedded systems programme, classified environment, zero margin for defect.
- **T** — Deliver the PaaS layer + CI/CD pipeline.
- **A** — *I* led the platform engineering inside the cleared environment, navigated the security controls without slowing delivery.
- **R** — Zero-defect CI/CD pipeline in classified environment. **Backup story for high-stakes-stakeholder + ambiguity.**
- **Lenses it scores on:** RRK, Leadership, Googleyness (ambiguity).

### Story 8 — CloudLifters Founder
- **S** — Founded a cloud migration platform, scaled, exited via M&A at 7× EBITDA.
- **T** — Build, sell, scale, exit.
- **A** — Founder-mode across architecture, sales, hiring, M&A diligence.
- **R** — M&A at 7× EBITDA. **Primary "ambiguity / entrepreneurial / built-something-from-zero" story.**
- **Lenses it scores on:** Leadership, Googleyness, GCA.

---

## Part 6 — Live-Deployment Toolkit (What You Actually Use During the Interview)

These are the verbal tools you wield in the 45-min room. Drill them.

### 6.1 — The Opening Move on Any Hypothetical

> *"Let me make sure I've framed this right. I'm hearing X. Two assumptions I'd want to validate before I commit to a path: [A] and [B]. Then I'd approach it as follows…"*

This single move does four things at once: shows GCA (you state assumptions), shows Comms (you check before committing), buys you 10 seconds of thinking time, and turns the interviewer into a collaborator instead of a judge.

### 6.2 — STAR With Headline-First

For every behavioural question, lead with **one-sentence headline** before the STAR. Example:

> *"The story I want to tell you is the one where we cut AI service provisioning at the energy customer by 98%. Here's the context…"*

The headline tells the interviewer where you're going and why it's relevant. Then they stay tuned.

### 6.3 — "Improve Your Own Answer" Move

> *"…that's how I solved it then. If I were doing it today on GCP, I'd refine two things — I'd lean harder on Migration Center for the assessment phase, and I'd use Workload Identity Federation instead of the service-account-key approach we used."*

Karina explicitly listed this in her prep guide ("Improve"). Use it. It signals growth + current GCP fluency.

### 6.4 — The Bridge to GCP

If the question is generic and your story is from AWS or multi-cloud: **always finish with a GCP bridge**.

> *"…and the GCP equivalent of what I did there is X — same architectural shape, but I'd swap [AWS service] for [GCP service] because [reason]."*

This reframes a non-GCP story as evidence of GCP fluency.

### 6.5 — The "I Don't Know" Move

> *"Honest answer — I haven't worked directly with that. My instinct, based on adjacent experience, is [X]. I'd validate that with [Y] before committing in front of the customer."*

Never bluff. Owning the gap with a structured reasoning move scores higher on Googleyness than a bad guess scores on RRK.

### 6.6 — The Time-Management Move

Each answer should land its headline in ~60s and full STAR in ~3 min. If you sense you're running long: *"I can go deeper on the architecture if useful, or move on — what's most valuable?"* — this puts the interviewer in control and prevents you from monopolising airtime.

### 6.7 — The Closing Questions (you get 3–5 min at the end)

Two questions for the RRK. Pick from:

- *"For the OCE practice in EMEA, where do you see the highest concentration of stalled-consumption risk right now — is it the AI/ML workload archetype, or the data-platform migrations? I'd love to understand where the team is putting the most weight."*
- *"What separates an OCE who is performing well at month-six from one who is performing exceptionally? Is it the depth of the technical unblock, the breadth of the stakeholder orchestration, or something else?"*
- *"How does the OCE work surface back into the product roadmap — is there a structured feedback loop into the GCP product team when you see a blocker pattern across customers?"*

Pick the one that lets the interviewer talk about their own work. Strong final-impression move.

---

## Part 7 — Pre-Interview Operating Checklist

### T-7 days
- [ ] Confirm interview date/time via the recruitment coordinator portal
- [ ] **Ask Karina**: *Do I have access to my own laptop / IDE / Claude or Gemini during the interview, or does Google provide a closed environment with tooling?* (See note at bottom of `email-karina-rrk.md`.) If technical-design or coding is expected, knowing the environment changes prep significantly.
- [ ] Re-read this briefing once; star the questions where your three stories aren't yet locked
- [ ] Read the GCP Migration Center, M2VM, Vertex AI overview pages — 30 min each, just enough to refresh terminology

### T-3 days
- [ ] Rehearse 6 of the B-questions and 4 of the H-questions out loud — *out loud, timed* — phone voice memo or webcam
- [ ] Review your Story Library — for each story, can you tell it in 90 seconds with the result on the tip of your tongue?
- [ ] Pick your two closing questions, write them on the index card

### T-1 day
- [ ] Test the Google Meet link, camera, mic, lighting
- [ ] Set up second screen with: this briefing (collapsed to Part 4 + Part 5), your résumé, the JD, a blank scratch doc for notes
- [ ] Sleep before 23:00. RRK is a cognitive load test — fatigue costs more here than under-prep at this stage.

### T-0 (interview day)
- [ ] 60 min before: re-read Part 6 (the live-deployment toolkit). Not the content — the *moves*.
- [ ] 15 min before: log in, mute, run-through your opening 30 seconds once
- [ ] 5 min before: water bottle, pen, paper, index card
- [ ] Camera on, smile, let the interviewer set the pace

---

## Part 8 — The Question to Ask Karina Now

Before the RRK is scheduled, reply to Karina with the calibration question Laurent flagged in `email-karina-rrk.md`:

> *"One quick clarification before scheduling — for the RRK interview, will I have access to my own working environment (laptop, IDE, AI assistants like Claude / Gemini / Codex), or does Google provide a closed interview environment with the tooling needed? Asking so I can prepare appropriately — happy with either setup."*

**Why ask now and not at T-1:** if the answer is *"closed environment, expect a live design or coding exercise"*, your prep window needs to include hands-on GCP console refresher + maybe a system-design rehearsal. If the answer is *"conversational only, no tooling required"*, you can keep this briefing as-is.

---

## Final Blueprint Review

- **You are not interviewing as a candidate.** You are interviewing as **an industry peer at the inflection point of the consulting-to-consumption shift**, choosing Google because Google is on the right side of that shift.
- **Your stories already win.** The AI Factory (98%), Open Banking (90%), Accenture (18d→4h), and IBM (200+ API consumers) are stronger evidence than 90% of candidates will bring. The work is to *retrieve them cleanly under time pressure*, not to invent more.
- **Headline → STAR → improve → GCP bridge.** Every answer follows that shape.
- **The four lenses are scored simultaneously.** Engineer each answer to score on at least three.
- **Honesty beats bluff on Googleyness, every time.** When you don't know, say so, structured.
- **The closer is what the OCE role wants.** Don't apologise for being a closer who left the keyboard — celebrate it, and prove the keyboard instinct is still alive when it needs to be.
