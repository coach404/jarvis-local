# Validation — Idea #1: Agent-team starter kits for niche agencies

Date: 2026-07-19 · Agent: idea-validator · Source idea: outbox/2026-07-19-ideas-b2b-digital-products.md

**Idea:** Packaged Claude Code agent teams (.claude/agents + .claude/skills + CLAUDE.md orchestrator, jarvis-local-style) pre-built per vertical (recruiting, real estate, accounting, marketing agencies), sold as repo + setup guide + optional paid setup call.

---

## Check 1 — Existence (confidence: HIGH)

**The developer segment is saturated with free.** Kill zone — do not sell dev-focused agent packs:
- [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) — 100+ free subagents; [0xfurai](https://github.com/0xfurai/claude-code-subagents) 100+; [rshah515](https://github.com/rshah515/claude-code-subagents) 165; directory at [rahulvrane/awesome-claude-agents](https://github.com/rahulvrane/awesome-claude-agents). (checked 2026-07-19)
- Official ecosystem: [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) built into Claude Code (101 plugins as of Mar 2026); community marketplaces ([claudemarketplaces.com](https://claudemarketplaces.com/), [tonsofskills — 425 plugins / 2,810 skills / 200 agents](https://github.com/jeremylongshore/claude-code-plugins-plus-skills), [aitmpl.com — "1000+ agents, commands, skills"](https://www.aitmpl.com/)). All MIT-licensed, **no monetization mechanism** — plugins are free by construction.

**The vertical/non-developer segment has paid activity but no dominant incumbent:**
- Paid products exist and are small/fragmented: [Etsy: "Claude Code for Real Estate Agents — 50 prompts + setup guide"](https://www.etsy.com/listing/4490928370/claude-code-for-real-estate-agents-50), [Maven course: Claude AI Marketing System for Real Estate Agents](https://maven.com/matt-spangler/claude-for-real-estate-agents), Gumroad playbooks/starter kits ([Complete Claude Code Playbook](https://getflowmate.gumroad.com/l/dxnjk), [Project Starter Pack](https://buildtolaunch.gumroad.com/l/claude-code-project-starter-pack), [Joey Hipolito Starter Kit](https://joeyhipolito.gumroad.com/l/ai-starter-kit)).
- Fiverr gigs selling Claude Code setup at [$15](https://www.fiverr.com/james_automat/claude-code-setup-claude-consultant-claude-ai-agent-claude-tutor-claude-cowork)–[$175](https://www.fiverr.com/masdouk_zoho/set-up-customize-and-automate-your-salesforce).
- **Platform threat:** Anthropic launched [Claude for Small Business](https://www.anthropic.com/news/claude-for-small-business) (May 13, 2026 — [Axios](https://www.axios.com/2026/05/13/anthropic-claude-small-business-smb)): Claude inside QuickBooks/HubSpot/PayPal with 15 ready-to-run workflows, "no technical setup required." This eats the *generic SMB workflow* layer. It does NOT (yet) cover custom agency verticals (recruiting pipelines, listing/CMA workflows, client-reporting for marketing agencies).

**Read:** crowded = demand signal. Free dominates only the developer niche. The vertical-agency packaging layer is fragmented, low-ticket, and unowned. No kill here — but the product must NOT be "another agents repo."

## Check 2 — Demand (confidence: MEDIUM — the weakest check)

- Non-coder adoption is exploding: Anthropic analysis of ~400k Claude Code sessions (Oct 2025–Apr 2026) shows non-technical professionals (management, sales, legal = fastest-growing user groups) completing tasks at near-engineer success rates; Claude Code >$1B ARR in 6 months, ~$2.5B run rate by Feb 2026 ([365i summary](https://www.365iwebdesign.co.uk/news/2026/01/24/claude-code-billion-dollar-non-coders/), [White Beard Strategies](https://whitebeardstrategies.com/general-help/how-do-you-use-claude-code-without-being-a-programmer/)).
- People are already PAYING for exactly this shape: Fiverr setup gigs (above); a marketing consultant listed 25 Claude skills from his client work at **$99 each → ~$3,000 in 45 days** ([How to Sell Claude Skills](https://aiblewmymind.substack.com/p/sell-claude-skills) — secondhand, article fetch blocked, unverified); YouTube practitioners: ["I Set Up Claude Code for 20+ Businesses"](https://www.youtube.com/watch?v=mFMTK52_q_0).
- Agency-side value quantified: a digital agency reports content audits 8h → 1.5h via subagent orchestration, "$325 saved per audit at $50/hr rates" ([digitalapplied.com](https://www.digitalapplied.com/blog/claude-code-subagents-digital-marketing-guide)).
- **Gap:** I could not surface verbatim forum quotes of agencies asking "sell me a pre-built agent team" (multiple Reddit-targeted searches returned nothing indexable; HN Algolia fetch 403'd). Willingness-to-pay for *setup/skills* is evidenced; willingness-to-pay for a *repo template specifically* is still a hypothesis. This is what the probe must test.

## Check 3 — Wedge (confidence: MEDIUM-HIGH, conditional)

- **No wedge** as a naked template repo — free GitHub collections + free official plugins kill that instantly.
- **Credible wedge = vertical + done-with-you + proof-of-work:**
  1. **Vertical specialization**: free collections are 95% dev-workflow. A kit whose agents speak "candidate pipeline," "listing/CMA," "client reporting" doesn't exist as a maintained product.
  2. **Done-with-you setup call** is the real product; the repo is the artifact. Fiverr's $15–$175 anchors show the floor; agency-grade positioning can hold €150–500 because the buyer values time, not files ([MindStudio: sell on time saved](https://www.mindstudio.ai/blog/sell-ai-automations-local-businesses-claude-code-skills)).
  3. **jarvis-local is a live public demo** — "the kit I sell runs my own company" is a trust asset none of the prompt-pack sellers have.
  4. **Bilingual Balkan/EU angle**: zero Serbian/Bosnian-language Claude Code onboarding found; regional agencies are unreachable by US Fiverr sellers in their own language.
- Honest caveat: build-in-public audience size is currently unproven (memory has no follower numbers) — the brand wedge is potential, not kinetic. And Anthropic's SMB push means the wedge narrows over time: speed matters.
- Note: this reshapes idea #1 into a merge with idea #5 (Claude Code onboarding for SMEs) — kit as productized front-end, setup call as the margin.

## Check 4 — Path to first customer (confidence: MEDIUM)

Named channels, in order of cheapness:
1. **ATime client contacts** — warm list; even non-agency clients can refer. First DM batch comes from here.
2. **Apollo (connected)** — pull 25–50 marketing/recruiting agencies, 5–50 employees, Serbia/Bosnia/Croatia + one English-market batch; outreach in Serbian for the regional batch (differentiated inbox).
3. **Communities where buyers already are:** r/ClaudeAI + r/agency (post the jarvis-local walkthrough as build-in-public content, offer in comments/DM), and the Claude Code plugin marketplaces — publish a FREE thin plugin as lead-gen (marketplace has no monetization = it's a distribution channel, not a competitor, if used as a funnel).
4. Build-in-public posts (X/LinkedIn) — supporting, not primary, until audience numbers exist.

Path exists and is concrete → pass.

---

## VERDICT: **PROBE** (not BUILD — demand for the *paid template* itself is unproven; not KILL — paid activity, empty vertical layer, and a real wedge all check out)

Per-check: Existence HIGH-pass · Demand MEDIUM-unproven · Wedge MEDIUM-HIGH-pass (conditional on vertical + setup-call shape) · Path MEDIUM-pass.

## The probe (≤ 1 week, near-zero cost)

**Offer:** "Agent team for [ONE vertical: marketing agencies — strongest evidence found] — repo + 60-min done-with-you setup, €190 presale (founding price)." Do NOT build the kit first; jarvis-local is the demo.
1. Day 1: one-page offer (Gumroad or Notion page) + 3-min Loom of jarvis-local running.
2. Day 1–2: build-in-public post (X/LinkedIn + r/ClaudeAI) showing the jarvis-local architecture, ending with the offer link.
3. Day 2–5: 15 targeted DMs/emails — 5 ATime/warm contacts, 10 Apollo-sourced agencies (mixed Serbian + English). DRAFT-ONLY → Coach approves each before sending.
**Success threshold (by day 7): ≥1 presale at €190 OR ≥3 booked discovery calls → upgrade to BUILD (build kit v1 for the first buyer live). Below threshold → KILL the template-pack shape, keep the setup-service shape (idea #5) as the surviving hypothesis.**

## Next action
Approve the probe vertical (marketing agencies) and the €190 presale price, then have venture-builder draft the one-page offer + 15 outreach drafts today.
