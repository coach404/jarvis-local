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

The native installer is recommended — it needs no Node.js and auto-updates itself.

**Windows CMD** (prompt looks like `C:\Users\You>`):

```batch
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

**Windows PowerShell** (prompt looks like `PS C:\Users\You>`):

```powershell
irm https://claude.ai/install.ps1 | iex
```

**macOS / Linux / WSL:**

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Then **close the terminal and open a new one** — the installer adds `claude` to
PATH, and already-open terminals won't see it until they restart.

Verify and log in:

```bash
claude --version     # should print something like 2.1.211 (Claude Code)
claude               # first run opens the browser login
```

Requires a Claude Pro, Max, Team, or Enterprise account (the free plan doesn't
include Claude Code).

### Windows notes

- **The command is `claude`, not `claude code`.** `claude code` returns
  "not recognized".
- **Install [Git for Windows](https://git-scm.com/downloads/win)** — optional but
  recommended: it gives Claude Code a real Bash shell (otherwise it falls back to
  PowerShell), and you need `git` anyway to clone and push.
- **Prefer not to use a terminal at all?** The [Claude Desktop app](https://claude.com/download)
  runs Claude Code with a graphical interface — same agents, same repo, no CLI.
- Alternative installs if the above fails: `winget install Anthropic.ClaudeCode`,
  or `npm install -g @anthropic-ai/claude-code` (needs Node.js 22+).
- If anything looks broken, run `claude doctor` for a diagnostic.

## 2. Clone both repos — as siblings

Folder layout matters. Put them **next to each other**, not nested:

```
C:\Users\Administrator\
├── jarvis-local\      ← run Claude Code from here
└── anja-agent-os\
```

```bash
git clone https://github.com/coach404/jarvis-local.git
git clone https://github.com/coach404/anja-agent-os.git
```

### How the two repos connect in one session

Run Claude Code from **jarvis-local** — it's the brain, and its `CLAUDE.md`
orchestrates everything. Anja is already wired in via
`.claude/settings.json`:

```json
{ "permissions": { "additionalDirectories": ["../anja-agent-os"] } }
```

That means one session can read and edit both repos: Jarvis can write a new
Anja agent, run her tests, and commit — without you switching windows.

Three ways to do it, in order of preference:

1. **Nothing to do** — the setting above is committed, so it works if the repos
   are siblings.
2. **Per-session:** `claude --add-dir ../anja-agent-os`
3. **Mid-session:** type `/add-dir ../anja-agent-os` in a running session.

Caveat worth knowing: additional directories give **file access only** —
Anja's own config isn't auto-loaded. Jarvis's `CLAUDE.md` stays the single
source of instructions, which is exactly what you want.

**Don't** run a separate Claude session inside `anja-agent-os` for normal work.
You'd lose the orchestrator, the specialists, and the memory files — Anja has no
`CLAUDE.md` of her own. One session from jarvis-local, always.

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

**macOS / Linux:**

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

**Windows CMD** (needs [Python](https://www.python.org/downloads/) — tick
"Add python.exe to PATH" in the installer):

```batch
cd anja-agent-os
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt

set SUPABASE_URL=https://kiqvnmmrnwxbfofmkcma.supabase.co
set SUPABASE_SERVICE_KEY=<service_role key from Supabase dashboard>
set GROQ_API_KEY=<from console.groq.com — free tier is fine>

python -m agents.run hello
python -m agents.run pain-scanner
```

(`set` only lasts for that window. For something permanent, put the three values
in a `.env` file — it's already gitignored.)

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
