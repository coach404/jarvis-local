---
name: client-discovery
description: Full growth pipeline — from a niche or a named company to a ready-to-pitch offer. Use when Coach says "find me clients in X", "analyze this client", "what should I sell to Y", or starts any new business/client hunt.
---

# Client Discovery Pipeline

Chain the Growth team end-to-end. Input: a niche ("physio clinics in Vienna")
or a specific company. Output: a decision brief + prescription, saved to `outbox/`.

## Steps

1. **Scope check** — confirm with Coach: niche or named target? Offer type in
   mind or open? Budget of time (quick scan vs deep dive)?
2. **Fan-out (run in parallel):**
   - `market-analyst` → market map of the niche
   - `pain-point-miner` → verbatim pains of that customer type
   - `prospect-scout` → ranked list of real candidate clients (skip if a company
     was named)
3. **Deep dive** — `client-analyst` on the named company or the scout's top 1–3
   prospects: dossier with bleeding points and key people.
4. **Fan-in** — `insight-synthesizer` fuses all outputs into one ≤400-word brief:
   go/no-go on the niche, which client first, which pain to attack.
5. **Prescription** — `offer-doctor` designs the offer + pricing for the chosen
   target.
6. **Optional bridge to brand** — offer to draft the pitch (content-writer /
   ATime pitch skill) and log the pursuit in `memory/pipeline.md`.

## Rules
- Steps 2's agents run concurrently — never serially.
- Everything outbound stays DRAFT until Coach approves.
- If any specialist returns INSUFFICIENT DATA, surface the gap before continuing
  the chain — garbage in step 2 becomes confident garbage in step 5.
