# Kinetic Resonance (Stamina System)

**Category:** Mechanics — Player System
**Status:** 🟡 Partially Implemented (stub functions exist)
**Related Code:** `project/entities/player/Odin.gd`
**Supersedes:** Section in [features/04_Odin_Abilities_And_VFX.md](../features/04_Odin_Abilities_And_VFX.md)

---

## 1. Overview

Odin doesn't eat food. He absorbs energy through **momentum and divine resonance**. This system replaces traditional hunger/food mechanics with a "Flow State" — Odin gains energy by actively **doing things** and loses it by using divine abilities.

The design goal: **reward engagement, not inventory hoarding.**

---

## 2. Stamina Sources

### A. Divine Spark Absorption
- Clearing Chaos Tiles (ice, weeds) releases holographic **Divine Spark** particles.
- Walking through fresh Sparks restores **5% Stamina** per spark.
- Sparks persist for 10 seconds after being generated, then fade.
- **Implementation:** `DivineSpark.tscn` (GPUParticles2D) already exists but doesn't yet interact with Odin's stamina.

### B. Peaceful Trickle
- Walking through a perfectly healthy realm (0% Chaos) passively regenerates **1% Stamina per 5 seconds**.
- Incentivizes maintaining clean realms — a "dividend" for good automation.
- **Implementation:** Not started.

### C. The Deep Wind (Hard Reset)
- When completely tapped out, Odin sits on the **Hlidskjalf throne** in Asgard.
- Player holds `E` while a circular meter fills — a physical "winding" animation.
- Accompanied by a heavy, mechanical ratcheting sound effect.
- Fully restores Stamina over ~8 seconds of held interaction.
- **Implementation:** Not started. Throne interaction area doesn't exist yet.

---

## 3. Stamina Drains

| Ability | Cost | Notes |
|:--------|:-----|:------|
| Bifrost Step (Dash) | 10% | Short-range teleport |
| Gungnir Resonance (AoE) | 35% | Massive chaos-clearing shockwave |
| Prismatic Transmutation | 15% | Charged harvesting strike |
| Bezel Re-spin | 20% | Push-your-luck unlock |

---

## 4. Current Implementation State

```gdscript
# Odin.gd — Existing stub functions
@export var max_stamina: float = 100.0
var current_stamina: float = 100.0

func consume_stamina(amount: float):
    current_stamina = max(0, current_stamina - amount)

func restore_stamina(amount: float):
    current_stamina = min(max_stamina, current_stamina + amount)
```

- The `StaminaBar` node exists in `HUD.tscn` but is not wired to read `Odin.current_stamina`.
- No abilities currently call `consume_stamina()`.
- No sources currently call `restore_stamina()`.

---

## 5. Design Constraints

- **Zero stamina ≠ death.** Odin just becomes sluggish (movement speed reduced to 50%) and can't use abilities. The `odin_exhausted.png` sprite state activates.
- **No food items.** This is explicitly not a farming sim with cooking. The stamina system is kinesthetic, not inventory-based.
- **The Deep Wind is always available.** It should never be possible to be "stuck" with no way to recover stamina.

---

## Active Task List

- [ ] Wire `StaminaBar` in HUD to read `Odin.current_stamina` each frame
- [ ] Implement Divine Spark collision detection → call `restore_stamina(5.0)`
- [ ] Implement Peaceful Trickle (Area2D check for 0% chaos realm → passive regen)
- [ ] Build Hlidskjalf Throne interaction area in Asgard with Deep Wind hold-to-charge UI
- [ ] Implement exhaustion state: reduce `move_speed` to 50% when `current_stamina == 0`
- [ ] Add stamina cost calls to Bifrost Dash, Gungnir Resonance, and Bezel re-spin
- [ ] Design visual feedback for low stamina (screen desaturation? Odin's aura dims?)
- [ ] Sound design: ratcheting wind-up for Deep Wind, low-stamina breathing ambience

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Kinetic Resonance design doc. Audited existing code stubs and identified that stamina functions exist but are completely unwired. | Documenting the gap between PRD vision (momentum-based energy) and actual implementation (dead functions) to prioritize connecting the stamina loop. |
