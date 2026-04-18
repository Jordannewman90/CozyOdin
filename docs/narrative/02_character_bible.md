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
- **The Two-Voice System:**
  - **Public (The All-Father):** Never speaks directly to NPCs or the public. Communicates through stoic nods, glares, and presence.
  - **Private (The Husband):** Only speaks openly to Frigg. In her company, he is talkative, cynical, and vents his frustrations about the realms.
  - **Internal (Odin's Intuition):** The player sees his internal monologue as "Thought Bubbles" when inspecting objects or environmental clues.
- **Tone & Respect Directive:** Odin's "grumpy" humor is always directed at **himself**, his own exhaustion, or the absurdity of divine chores. Humor must never be demeaning toward Frigg or use tired tropes. Frigg is the competent partner; Odin is the relatable, tired laborer trying to keep up.

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

---

## 3. Frigg (NPC — The All-Mother)

### Core Identity
- **Role:** Odin's wife, Home-life manager, Domestic Quest-giver.
- **Personality:** Patient, observant, the "real" power in Asgard. She is the only one Odin is truly himself around.
- **Location:** The Royal Chambers / Asgard Gardens.

### Narrative Function: "Divine Harmony"
- Surfaces "Husband Favors" through subtle environmental cues (Sighs, broken vases).
- Provides the only direct, two-way dialogue in the game for Odin.
- Rewards player with "Well-Rested" buffs and Hub upgrades.

---

## 4. Thor (NPC — The Enthusiastic Breaker)

### Core Identity
- **Role:** Brother, "Support" NPC, accidental chaos-generator.
- **Personality:** Loud, cheerful, over-confident, clumsy.
- **Schedule:** Visits Nidavellir to "help" the smiths (actually increases Chaos by 5% when present).

### Narrative Function
- Reprsents the "Unintended Consequences" of power. He wants to help, but his presence usually creates more work for Odin.

---

## 5. Loki (NPC — The Anti-Manager)

### Core Identity
- **Role:** Adopted brother, Rival, Phase 1 Ghost.
- **Personality:** Playful, mocking, obsessed with unpredictability.
- **Location:** Off-screen (Phase 1), Muspelheim / Jotunheim (Phase 2).

### Narrative Function
- Leaves "Loki-isms" (tags, prank items) throughout the realms to fuel the early-game mystery.
- Represents the player's frustration with imperfect systems.

---

## 6. Dagr (NPC — Alfheim Regent)

### Core Identity
- **Title:** Caretaker of the Nursery
- **Role:** Alfheim's representative, Mana-Sap trade liaison
- **Personality:** Idealistic, emotional, passive-aggressive when upset
- **Location:** Alfheim — Dagr's Nursery

---

## 7. Brokk & Eitri (NPC — Nidavellir Regents)

### Core Identity
- **Title:** Master Smiths, Forge-Lords
- **Role:** Nidavellir's representatives, tool/upgrade vendors
- **Personality:** Pragmatic, transactional, respect competence
- **Location:** Nidavellir — Brokk & Eitri's Shop

---

## 8. Hugin & Munin (Narrative Device — Ravens)

### Core Identity
- **Role:** Odin's ravens — deliver the "Status Report" on each wake-up
- **Hugin** ("Thought"): Reports facts — resource counts, chaos levels, proxy status
- **Munin** ("Memory"): Reports narrative flavor — "The elves are whispering about you," "Brokk hasn't slept either"

---

## 9. Ratatoskr (Narrative Device — The Messenger)

### Core Identity
- **Role:** Realm-to-realm rumor mill, Mail delivery.
- **Personality:** Jittery, fast-talking, prone to gossip.

---

## 10. Mimir (NPC — The Lore-Head)

### Core Identity
- **Role:** Tutorial Hub, Lore-dump, "Advanced Mechanic" advisor.
- **Personality:** Cryptic, wise, loves riddles.
- **Location:** Sitting in a jar on Odin's desk in Asgard.

---

## 11. The Norns (Urd, Verdandi, Skuld)

### Core Identity
- **Role:** Save-Keepers, Stat-trackers.
- **Personality:** Spooky, detached, speak in the "Past, Present, and Future" tenses.
- **Location:** The Well of Urd (Asgard).
- **Narrative Function:** They "weave the save file." Visiting them shows you your overall efficiency stats and "Perfect System" progress.

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
