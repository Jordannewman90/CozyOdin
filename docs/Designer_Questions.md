# ❓ Questions The Designer Needs to Answer

> A running log of open design decisions that block or influence implementation. When you answer one, move it to the **Resolved** section at the bottom with your decision and the date.

---

## 🟢 Open Questions

### Q2 — The Offline Time Delta: Linear or Diminishing? [RESOLVED: 2026-04-18]
**Decision:** **The 24/48 Sunset + Deep Overgrowth (14+ Days).**
The simulation math uses a tiered decay to respect player time while providing consequences for long absences.
- **0–24 Hours:** 100% Simulation Speed (Rewards the Daily Player).
- **24–48 Hours:** 50% Simulation Speed (The Buffer Zone).
- **48 Hours – 14 Days:** 5% Simulation Speed (Stasis).
- **14+ Days (Deep Overgrowth):** Chaos caps at 80% (Safe from Ruin). **Primal Knots** physically block realm portals, and Proxies enter **Stony Stasis** (requiring a manual Stamina "touch" from Odin to re-activate).
**Reasoning:** Rewards consistent play without creating "vacation anxiety." Long-term neglect becomes a fun "Restoration Event" rather than a punishing economic collapse.

---

---

### Q5 — Ghost Trail: Always-On or Dash-Only?
**Source:** [Shader Pipeline](architecture/04_shader_pipeline.md), [Odin Abilities](mechanics/03_kinetic_resonance.md)
**Blocking:** GhostTrail.gd refactor, Bifrost Dash implementation

The PRD describes the rainbow trail as part of the **Bifrost Dash** ability, but the current code spawns it during **all movement**. Which do you prefer?

- **Option A — Dash Only (PRD intent):** Trail only appears during the charged Bifrost Step teleport. Walking is trail-free. Makes the dash feel special.
- **Option B — Always On (current code):** Trail follows Odin everywhere. He always looks divine. More "vibes."
- **Option C — Tiered:** Subtle, faint trail during normal movement. Full iridescent 4-color explosion during Bifrost Dash. Best of both worlds but more complex.

---

### Q7 — Audio Direction: Composed Soundtrack or Ambient?
**Source:** Not in PRD (gap identified)
**Blocking:** Audio integration, mood design

What does the game *sound* like?

- **Option A — Composed OST:** Each realm has a distinct looping track. Asgard is regal, Nidavellir is industrial, Alfheim is serene. Traditional game music.
- **Option B — Ambient Soundscape:** No "music" per se — just layered ambient sounds (forge clanks, wind, birdsong, machinery hum). More immersive, less "gamey."
- **Option C — Adaptive Mix:** Ambient base that dynamically layers musical elements based on Chaos level. Pristine = peaceful, Critical = tense undertones.

---

## ✅ Resolved Questions

| # | Question | Decision | Date |
|:--|:---------|:---------|:-----|
| Q1 | Fail State Philosophy | Option C (Hybrid) + Heroic Restoration. Ruined realms require manual cleanup. | 2026-04-18 |
| Q3 | Proxy Crafting Costs | The Runic Seed Model + The Bridge Keeper tutorial. | 2026-04-18 |
| Q4 | The Blessing System | Generosity over Taxes. Voluntary offerings trigger Festivals. | 2026-04-18 |
| Q6 | Tutorial / Onboarding | Soft Gates + The Regrowing Lesson at the Bifrost. | 2026-04-18 |

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-18 | Massive synchronization of Economy, Tutorial, and Fail State logic. | Resolved the "Tax vs. Blessing" debate and codified the Act I onboarding flow. |
| 2026-04-15 | Created Designer Questions tracker. | Surfaced 7 open questions during World Bible audit. |
