# Proxy Automation System

**Category:** Mechanics — Automation
**Status:** ✅ Implemented (V1)
**Related Code:** `project/entities/proxy/Proxy.gd`, `project/systems/EconomyManager.gd`
**Supersedes:** [features/03_Proxy_Automation.md](../features/03_Proxy_Automation.md)

---

## 1. Overview

Runic Proxies are the mechanical workforce of the Nine Realms. They are 16-bit golem agents that automate harvesting while the player is offline. Their efficiency is determined by the Alignment Bezel configuration, and their behavior directly impacts realm stability.

---

## 2. Proxy Lifecycle

```
Crafted at Proxy Bench → Programmed via Bezel → Deployed to Realm → Operates Offline → Picked Up / Re-Deployed
```

### States
| State | Efficiency | Chaos Impact | Visual |
|:------|:-----------|:-------------|:-------|
| **Divine Sync** | 100% | Slows Chaos | Normal sprite, iridescent glow |
| **Stable** | 75% | None | Standard sprite, gold sparks |
| **Distracted** | 40% | None | Paces aimlessly |
| **Clumsy** | 10% | None | Red tint, "tripping" animation |
| **Stony Idle** | 0% | None | Grey, motionless |

---

## 3. Offline Simulation Math

When `TimeEngine.offline_calculation_complete` fires:

```
base_harvest = offline_duration / 300.0    # 1 resource per 5 minutes
final_yield = int(base_harvest * EconomyManager.yield_modifier)
```

- Buggy proxies skip harvesting entirely (`if is_buggy: return`).
- Economy crises modify yield via `yield_modifier` (0.3x to 2.0x range).
- Proxy finds the nearest `harvestable` node and calls `simulated_harvest(final_yield)`.

### Current Limitation
Resources go directly to the Vault. The Three-Bucket split (Upkeep/Trade/Vault) is designed but **not yet implemented** in the harvest path.

---

## 4. The Squad System

- Odin can carry up to **3 Proxies** in his "squad" (portable inventory).
- **Pick up:** Press `E` near a deployed Proxy → serialized to `SaveManager.game_data.squad[]`.
- **Deploy:** Press `Q` → last squad member instantiated at Odin's position + offset.
- Squad persists across saves.

---

## 5. Context Palette System

| Context | Visual Overlay | Color Modulate | Intended Realm |
|:--------|:--------------|:---------------|:---------------|
| NONE | Hidden | Default | Unconfigured |
| DWARVEN | Visible | `Color(0.8, 0.4, 0.2)` — warm orange | Nidavellir |
| ELVEN | Visible | `Color(0.2, 0.8, 0.4)` — cool green | Alfheim |

---

## Active Task List

- [ ] Implement Three-Bucket split in harvest path (Upkeep % / Trade % / Vault %)
- [ ] Implement Chaos escalation from buggy proxies (currently they just skip harvesting)
- [ ] Add "Stony Idle" state when proxy runs out of Runic Charge (Upkeep resource)
- [ ] Implement "real-time" harvesting (Timer-based while game is open, not just offline)
- [ ] Add more Context enums as Phase 2 realms are added
- [ ] Proxy crafting system at the Asgard Proxy Bench (currently proxies are scene-placed)
- [ ] Visual "working" animation cycle for deployed proxies
- [ ] Proxy efficiency display in HUD (which proxies are operating, at what %)
- [ ] Save/load proxy configurations across sessions (currently only squad is saved)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Proxy Automation design doc with full simulation math audit and squad system documentation. | Documenting the actual offline harvest formula and identifying that the Three-Bucket split is the critical missing economic connection. |
