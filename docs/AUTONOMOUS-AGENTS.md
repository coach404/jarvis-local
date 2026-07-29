# Autonomni agenti — kako da rade bez tebe

Tri sloja, od najlakšeg do najmoćnijeg. Sve troje već postoji u repou.

## Sloj 1 — `claude -p` (headless Claude Code)

Claude Code ne mora da otvori chat. Sa `-p` odradi zadatak i ispiše rezultat:

```batch
claude -p "/daily-briefing"
claude -p "/idea-engine marketing agencije u Nemačkoj"
claude -p "pregledaj memory/pipeline.md i reci da li sam prešao prag"
```

To znači da **tvoji postojeći agenti već mogu da rade sami** — isti kvalitet,
isti specijalisti, bez tvog vremena. Koristi tvoju pretplatu.

Preusmeri u fajl da ti ostane zapis:

```batch
claude -p "/daily-briefing" > outbox\brifing.md
```

## Sloj 2 — Anja (Python + Groq), potpuno nezavisna od Claudea

`../anja-agent-os` su headless Python agenti. Ne koriste Claude uopšte — koriste
Groq (free tier). Rade na cron-u ili GitHub Actions.

| Agent | Kad | Šta radi |
|-------|-----|----------|
| `pain-scanner` | ponedeljak 06:00 UTC | kopa bolne tačke sa HN-a → `pain_points` tabela |
| `daily-digest` | svako jutro 05:00 UTC | čita `pain_points`, piše brifing → `jarvis-local/outbox/` |

```batch
cd ..\anja-agent-os
python -m agents.run daily-digest
```

## Sloj 3 — sve zajedno, automatski (Windows Task Scheduler)

`scripts\jarvis-morning.cmd` spaja oba sloja: Anja napravi digest bolnih tačaka,
pa Jarvis napravi dnevni brifing. Oba završe kao fajlovi u `outbox/`.

### Podešavanje (jednom, 2 minuta)

1. Otvori skript i proveri putanje na vrhu (`JARVIS_DIR`, `ANJA_DIR`).
2. Stavi ključeve u `anja-agent-os\.env` (`SUPABASE_SERVICE_KEY`, `GROQ_API_KEY`).
3. Testiraj ručno:

```batch
C:\Users\Administrator\jarvis-local\scripts\jarvis-morning.cmd
```

4. Zakaži ga — otvori **Task Scheduler** → *Create Basic Task*:
   - Name: `Jarvis jutarnji brifing`
   - Trigger: **Daily**, 07:00
   - Action: **Start a program** → `C:\Users\Administrator\jarvis-local\scripts\jarvis-morning.cmd`
   - Finish → u *Properties* uključi **Run task as soon as possible after a
     scheduled start is missed** (da radi i kad ti je kompjuter bio ugašen).

Ili iz CMD-a odjednom:

```batch
schtasks /create /tn "Jarvis jutarnji brifing" /tr "C:\Users\Administrator\jarvis-local\scripts\jarvis-morning.cmd" /sc daily /st 07:00
```

Ujutru samo otvoriš `outbox\brifing-najnoviji.md`.

## Podela rada — ovo NE menjaj bez razloga

> **Claude misli, Anja donosi.**

| Ostaje na Claudeu (kvalitet je bitan) | Može na Groq/Anju (mehanički rad) |
|---|---|
| idea-validator, offer-doctor | skupljanje podataka (scraping) |
| client-analyst, money-strategist | klasifikacija i ocenjivanje po fiksnim kriterijumima |
| sat-coach, ielts-coach | sažimanje već pronađenog |
| insight-synthesizer, venture-builder | ponavljajući izveštaji |

Ako `idea-validator` prebaciš na malog modela, dobiješ agenta koji zvuči pametno
i greši — a njegova greška te košta mesec dana pogrešnog rada. Zato ta granica
postoji.

## Granice (iskreno)

- **Nijedan agent ne šalje ništa.** Ni mejl, ni objavu, ni poruku. Piše drafte,
  ti pritiskaš send. To je namerno i ne bih menjao dok ne prodaš prvih 5 kitova.
- **`claude -p` troši tvoj limit** kao i normalna sesija. Anja ne — ona ide na
  Groq free tier.
- **GitHub Actions je trenutno blokiran** zbog billinga na privatnom repou.
  Lokalni Task Scheduler to potpuno rešava, bez plaćanja.
- Agent ne zna da li je uspeo u poslu — zna samo da je odradio korak. Nedeljni
  pregled (`/second-brain`) je mesto gde se vidi da li sistem stvarno pomaže.
