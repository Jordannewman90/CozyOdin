# ❓ Questions The Designer Needs to Answer

> A running log of open design decisions that block or influence implementation. When you answer one, move it to the **Resolved** section at the bottom with your decision and the date.

---

## 🔴 Open Questions

### Q1 — Fail State Philosophy
**Source:** [Chaos Escalation](mechanics/08_chaos_escalation.md)
**Blocking:** Chaos tier implementation, realm lock/unlock logic

Can realms be **permanently lost** at 100% Chaos (Ruined), or is the game purely cozy with no permanent penalties?

- **Option A — Soft Fail:** Ruined realms lock temporarily but auto-recover slowly (or recover once Odin visits). No permanent loss. Keeps the cozy contract.
- **Option B — Hard Fail:** Ruined realms require expensive "Restoration Rituals" from the Vault to reopen. Creates real stakes but risks frustrating casual players.
- **Option C — Hybrid:** Realms never permanently lock, but Ruined state wipes all deployed Proxies in that realm (you lose your automation setup, not the realm itself).

> **Why it matters:** This determines whether Chaos is a gentle "nudge back to the game" or a real consequence that punishes neglect. Every other system (Proxy deployment risk, Upkeep urgency, Mediation stakes) scales off this answer.

---

### Q2 — Grand Trade Moot Timing: Real-World or In-Game?
**Source:** [Diplomacy](mechanics/07_diplomacy.md), [EconomyManager.gd](../project/systems/EconomyManager.gd)
**Blocking:** Moot interval tuning, crisis trigger logic

The PRD says "every 7 in-game days" but the current code uses **24 hours of real-world time** (`86400` seconds). Which cadence do you want?

- **Option A — Real-Time (current):** Moot fires based on wall-clock time. Creates urgency — if you don't play for 3 days, crises stack. More "idle game" energy.
- **Option B — In-Game Time:** Moot fires based on accumulated play-session time. More cozy — the game only pressures you while you're playing.
- **Option C — Hybrid:** Triggered by offline duration thresholds (e.g., a Moot fires for every 24hr offline chunk), meaning longer sleeps = more diplomatic fallout.

> **Why it matters:** Real-time creates a "daily login" pull (addictive but potentially stressful). In-game time is more respectful of the player's schedule but reduces the "things happened while you slept" drama.

---

### Q3 — Proxy Crafting Costs
**Source:** [Proxy Automation](mechanics/05_proxy_automation.md), [Asgard Hub](world/01_asgard.md)
**Blocking:** Proxy Crafting Bench implementation, early-game pacing

What resources (and quantities) does it cost to build a new Proxy at the Asgard Bench?

- **Starter Proxy:** ??? Star-Iron + ??? Mana-Sap
- **Max Proxy Count:** Is there a hard cap on total deployed Proxies? (Squad cap is 3 portable, but can you have 10 deployed across realms?)
- **Scaling Cost:** Does each successive Proxy cost more?

> **Why it matters:** Proxy scarcity is the primary pacing lever. Too cheap = player automates everything in Act I and the game loses tension. Too expensive = player never gets to experience the core automation loop. This directly determines how long Act II feels.

---

### Q4 — Three-Bucket Split: Manual or Automatic?
**Source:** [Economy](mechanics/06_economy.md)
**Blocking:** Resource allocation UI design, harvest flow implementation

When resources are harvested, how are they split into Upkeep / Trade / Vault?

- **Option A — Manual Allocation:** Player opens a UI before sleeping and drags resources into three buckets. Maximum strategy, maximum friction.
- **Option B — Percentage Presets:** Player sets ratios (e.g., 30% Upkeep / 30% Trade / 40% Vault) and resources auto-split on harvest. Strategic but low-friction.
- **Option C — Auto with Override:** Smart defaults based on realm needs, with a "Review Allocation" screen before each sleep that lets you adjust. Best of both?

> **Why it matters:** This is the strategic heart of every session. If it's too manual, it feels like homework. If it's too automatic, there's no meaningful decision-making before sleeping. The UI design is completely different for each option.

---

### Q5 — Ghost Trail: Always-On or Dash-Only?
**Source:** [Shader Pipeline](architecture/04_shader_pipeline.md), [Odin Abilities](mechanics/03_kinetic_resonance.md)
**Blocking:** GhostTrail.gd refactor, Bifrost Dash implementation

The PRD describes the rainbow trail as part of the **Bifrost Dash** ability, but the current code spawns it during **all movement**. Which do you prefer?

- **Option A — Dash Only (PRD intent):** Trail only appears during the charged Bifrost Step teleport. Walking is trail-free. Makes the dash feel special.
- **Option B — Always On (current code):** Trail follows Odin everywhere. He always looks divine. More "vibes."
- **Option C — Tiered:** Subtle, faint trail during normal movement. Full iridescent 4-color explosion during Bifrost Dash. Best of both worlds but more complex.

> **Why it matters:** Visual hierarchy. If everything glows all the time, nothing feels special. But if Odin just looks like a regular guy walking around, the "divine presence" fantasy is weakened.

---

### Q6 — Is There a Tutorial / Onboarding?
**Source:** [Quest Trees](narrative/04_quest_trees.md), [Core Loop](mechanics/01_core_loop.md)
**Blocking:** First-boot experience, milestone gating

Does the game have an **explicit tutorial** (guided steps, locked features, Heimdall hand-holds you), or is it **discovery-based** (everything is available, figure it out)?

- **Option A — Guided Tutorial:** Features unlock sequentially. Heimdall explains each system as it becomes available. Safe, clear, but potentially patronizing.
- **Option B — Discovery:** All systems available from the start. Player learns by doing and failing. Respects intelligence but risks confusion.
- **Option C — Soft Gates:** Systems unlock based on natural resource thresholds (e.g., Proxy Bench appears after you've harvested 20+ Star-Iron, implying you've played enough to understand basics). No explicit "tutorial" — just pacing.

> **Why it matters:** This determines the first 15 minutes of the game, which determines whether someone keeps playing.

---

### Q7 — Audio Direction: Composed Soundtrack or Ambient?
**Source:** Not in PRD (gap identified)
**Blocking:** Audio integration, mood design

What does the game *sound* like?

- **Option A — Composed OST:** Each realm has a distinct looping track. Asgard is regal, Nidavellir is industrial, Alfheim is serene. Traditional game music.
- **Option B — Ambient Soundscape:** No "music" per se — just layered ambient sounds (forge clanks, wind, birdsong, machinery hum). More immersive, less "gamey."
- **Option C — Adaptive Mix:** Ambient base that dynamically layers musical elements based on Chaos level. Pristine = peaceful, Critical = tense undertones.

> **Why it matters:** Audio sets the emotional tone. "Cozy" games live and die by their soundscapes. This needs a decision before any audio implementation begins.

---

## ✅ Resolved Questions

*Move answered questions here with your decision and the date.*

| # | Question | Decision | Date |
|:--|:---------|:---------|:-----|
| — | *(none yet)* | — | — |

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Designer Questions tracker with 7 open questions surfaced during World Bible audit. | These aren't cosmetic — each one blocks a specific implementation path. Answering them in order of priority (Q1 and Q4 are highest) will unblock the most downstream work. |
