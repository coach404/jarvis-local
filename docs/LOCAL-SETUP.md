# Working locally — setup guide

Everything in this repo is pushed to `main`, so moving to your own machine loses
nothing. This guide gets Jarvis running locally in about 15 minutes.

## Why local is better from here

- **Anja runs without GitHub Actions.** The Actions billing block stops the cron,
  but locally you just set three env vars and run the agent. No minutes needed.
- You can record the Loom, take screenshots, and open the browser — the actual
  next steps of the probe.
- Faster loop: edit an agent, run it, see the result. No PR ceremony for every
  small change.
- This cloud container is ephemeral and gets reclaimed; your laptop doesn't.

One honest caveat: local Claude Code uses the **same account usage limits** as
the web version. Running locally doesn't give you more budget — it gives you
speed, files, and the browser.

## 1. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

(Needs Node.js 18+. Alternative native installer: `curl -fsSL https://claude.ai/install.sh | bash`.)

Then log in once:

```bash
claude
# follow the browser login prompt
```

## 2. Clone both repos

```bash
git clone https://github.com/coach404/jarvis-local.git
git clone https://github.com/coach404/anja-agent-os.git
```

## 3. Start Jarvis

```bash
cd jarvis-local
claude
```

That's it — `CLAUDE.md` loads as the orchestrator, and every agent in
`.claude/agents/` and skill in `.claude/skills/` is available automatically.

Try:
- `/daily-briefing` — morning brief
- `/idea-engine` — the wealth pipeline
- `/study-session` — SAT / IELTS / programming
- `/second-brain` — capture a fact or run the weekly review
- `/content-pipeline` — turn a win into posts

Or just talk: *"brief me"*, *"validate this idea"*, *"test me on X"*.

## 4. Connect your tools (MCP)

Inside a Claude Code session, run `/mcp` to see and add connectors. The ones
that matter for the current work:

| Connector | Used by | Why |
|-----------|---------|-----|
| Gmail | inbox-triage | triage + draft replies (never sends) |
| Google Calendar | day-planner | real schedule in the day plan |
| Apollo | prospect-scout | verified decision-maker names/emails for the probe |
| Supabase | idea-scout, anja | read `pain_points`, write memory |
| GitHub | all | PRs, issues, CI |

Apollo currently needs re-authorization — reconnect it and prospect-scout can
fill in the `[owner]` blanks in your outreach drafts automatically.

## 5. Run Anja (the scheduled agent) locally

This is the part that unblocks today.

```bash
cd anja-agent-os
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt

export SUPABASE_URL="https://kiqvnmmrnwxbfofmkcma.supabase.co"
export SUPABASE_SERVICE_KEY="<service_role key from Supabase dashboard>"
export GROQ_API_KEY="<from console.groq.com — free tier is fine>"

python -m agents.run hello          # connection test
python -m agents.run pain-scanner   # the real thing
```

`pain-scanner` mines Hacker News for verbatim pain points in the niches listed
in `agents/config/pain_scanner.json`, scores them with Groq, and writes the
keepers to the `pain_points` table. Edit that config to point it at your niches.

Run the tests any time (no keys needed — the network is mocked):

```bash
pip install -r requirements-dev.txt
python -m pytest tests/ -v
```

**Never commit the keys.** `.env` is already gitignored; use it instead of
exporting by hand if you prefer:

```bash
cp .env.example .env   # then fill it in
```

### Schedule it locally (optional, replaces the blocked Actions cron)

macOS/Linux, weekly on Monday at 06:00:

```bash
crontab -e
# add:
0 6 * * 1 cd /full/path/to/anja-agent-os && .venv/bin/python -m agents.run pain-scanner >> /tmp/anja.log 2>&1
```

## 6. Keep the work safe

The repo is the second brain — if it's not committed, it doesn't exist:

```bash
git add -A && git commit -m "..." && git push
```

Everything in `memory/` and `outbox/` is meant to be committed. Anything
confidential goes in `memory/private/` (already gitignored).

## Where the probe stands

| Asset | File |
|-------|------|
| Offer, Loom script, 15 outreach drafts, run sheet | `outbox/2026-07-19-probe-agent-kits-marketing.md` |
| 10 ranked agencies + personalized drafts | `outbox/2026-07-19-target-list-and-outreach.md` |
| LinkedIn profile copy | `outbox/2026-07-19-linkedin-profile-rewrite.md` |
| Banner image (1584×396) | `assets/linkedin-banner.png` |
| Live scoreboard | `memory/pipeline.md` |

**Next action, locally:** record the 3-minute Loom, then send the 5 warm messages.
