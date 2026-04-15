# Character Bible

**Category:** Narrative — Characters
**Status:** 📋 Design Phase

---

## 1. Odin (The Player Character)

### Core Identity
- **Title:** All-Father, King of Asgard
- **Archetype:** The Exhausted Executive
- **Personality:** Dry humor, weary competence, grudging fondness for the realms
- **Internal Conflict:** Wants to rest vs. can't stop caring
- **Never speaks directly** — his personality is conveyed through gameplay actions and NPC reactions

### Visual Design
- **Size:** 32x32 pixel sprite
- **Style:** Heavy robes, single eye (lore-accurate), staff/Gungnir at his side
- **Animation States:**
  - `odin_idle_down` — Robes shifting, patient stance (4 frames)
  - `odin_walk_*` — Purposeful stride, cloak billowing (4 frames per direction)
  - `odin_exhausted` — Slumped posture, stamina depleted (1 frame static)
  - `odin_interact` — Swing animation for harvesting (3 frames burst)

### Aura
- Iridescent shader applied to sprite — Odin literally **glows.**
- Presence Aura causes nearby environment to bloom (planned).

---

## 2. Heimdall (NPC — Intel Provider)

### Core Identity
- **Title:** Guardian of the Bifrost
- **Role:** Tutorial guide, strategic advisor, exposition
- **Personality:** Stoic, observational, occasionally cryptic
- **Location:** Asgard — near the Bifrost portals

### Key Dialogue Themes
- Comments on how long Odin slept ("Three days. The dwarves are furious.")
- Warns about rising Chaos levels in specific realms
- Provides hints about optimal Proxy deployment
- Never negotiates — only observes and reports

---

## 3. Dagr (NPC — Alfheim Regent)

### Core Identity
- **Title:** Caretaker of the Nursery
- **Role:** Alfheim's representative, Mana-Sap trade liaison
- **Personality:** Idealistic, emotional, passive-aggressive when upset
- **Location:** Alfheim — Dagr's Nursery

### Key Dialogue Themes
- Grateful when Alfheim is well-maintained
- Offended when Dwarven-context Proxies are deployed in "their" forests
- Emotional appeals during Mediation ("You sent a MACHINE into our sacred grove!")
- Provides gardening tips that are actually Proxy optimization advice

---

## 4. Brokk & Eitri (NPC — Nidavellir Regents)

### Core Identity
- **Title:** Master Smiths, Forge-Lords
- **Role:** Nidavellir's representatives, tool/upgrade vendors
- **Personality:** Pragmatic, transactional, respect competence
- **Location:** Nidavellir — Brokk & Eitri's Shop

### Key Dialogue Themes
- Demand exact resource quantities; hate ambiguity
- Respect efficient Proxies ("That golem runs like one of ours. Well done.")
- Disgusted by buggy Proxies ("It keeps dropping our Star-Iron into the lava.")
- During Mediation: present invoices, not emotions

---

## 5. Hugin & Munin (Narrative Device — Ravens)

### Core Identity
- **Role:** Odin's ravens — deliver the "Status Report" on each wake-up
- **Hugin** ("Thought"): Reports facts — resource counts, chaos levels, proxy status
- **Munin** ("Memory"): Reports narrative flavor — "The elves are whispering about you," "Brokk hasn't slept either"
- **Implementation:** Text strings in the Raven Dashboard UI, randomized from JSON banks

---

## Active Task List

- [ ] Create NPC entity base class (position, dialogue trigger, portrait)
- [ ] Write Heimdall's dialogue bank (20+ lines, context-dependent)
- [ ] Write Dagr's dialogue bank (20+ lines, chaos/trade-dependent)
- [ ] Write Brokk & Eitri's dialogue bank (20+ joint lines)
- [ ] Design NPC portrait sprites (high-res emotional portrait boxes)
- [ ] Define Hugin vs. Munin voice distinction in Raven Dashboard text
- [ ] Create dialogue JSON schema and parser system
- [ ] Implement NPC interaction range (Area2D + E key prompt)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Character Bible with 5 character profiles, personality archetypes, and dialogue themes. | NPCs aren't just lore — they're the voice of the game's mechanical systems. Heimdall surfaces data, Dagr surfaces diplomatic friction, Brokk & Eitri surface economic state. Every character exists to make a system legible. |
