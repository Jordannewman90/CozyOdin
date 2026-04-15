# Economy & The Three-Bucket System

**Category:** Mechanics — Economy
**Status:** 🟡 Partially Implemented
**Related Code:** `project/systems/EconomyManager.gd`, `project/ui/HUD.gd`
**Supersedes:** Section in [features/05_Economy_And_Mediation.md](../features/05_Economy_And_Mediation.md)

---

## 1. Overview

The economy is a strategic inventory management system. Every resource harvested must be allocated across three buckets before logging off. This is the **tension engine** — harvesting is easy, but *distributing correctly* is the puzzle.

---

## 2. The Three Buckets

| Bucket | Purpose | Consequence of Neglect |
|:-------|:--------|:----------------------|
| **Realm Upkeep** | Resources left in local realm storage | Immediate offline chaos escalation |
| **Trade Routes** | Auto-exported to maintain cross-realm dependencies | Triggers diplomatic friction → Grand Trade Moot |
| **Asgard Vault** | Odin's personal treasury | Can't upgrade tools, craft Proxies, or pay Mediation fines |

### Resource Types (MVP)
| Resource | Source Realm | Primary Use |
|:---------|:------------|:------------|
| Star-Iron | Nidavellir | Tool upgrades, Proxy crafting |
| Mana-Sap | Alfheim | Trade fuel, Proxy Elven context charge |
| Divine Sparks | Chaos clearing | Stamina restoration (not storable) |

---

## 3. Current Implementation State

### What Exists
- ✅ `EconomyManager.gd` tracks crisis states and yield modifiers
- ✅ Crisis pool with 5 named events (Dwarven Surge, Elven Embargo, Mana Bloom, etc.)
- ✅ `moot_interval` set to 24 hours (real-time)
- ✅ HUD displays countdown to next Moot and crisis banners

### What's Missing
- 🔴 No Three-Bucket allocation UI (resources currently go straight to Vault)
- 🔴 No "Upkeep" drain — realms don't consume resources to stay stable
- 🔴 No Trade Route dependencies — resources don't flow between realms
- 🔴 Crisis events are randomly selected, not driven by actual trade deficits
- 🔴 No resource variety beyond Star-Iron (Mana-Sap exists in PRD but not in code)

---

## 4. Crisis Events

| Crisis | Yield Modifier | Trigger |
|:-------|:--------------|:--------|
| Dwarven Surge | 1.5x | Market demand spike |
| Elven Embargo | 0.5x | Trade routes blocked |
| Mana Bloom | 2.0x | Divine energy surge |
| Mana Drought | 0.3x | Alfheim yields crashing |
| Lush Bloom | 1.8x | Alfheim thriving |

---

## Active Task List

- [ ] Design and implement Three-Bucket allocation UI
- [ ] Add Mana-Sap as a second resource type in SaveManager schema
- [ ] Implement Realm Upkeep consumption logic (resources drain from local storage offline)
- [ ] Implement Trade Route dependency system (Realm A exports X to Realm B)
- [ ] Connect crisis triggers to actual trade deficit data (not just random)
- [ ] Define exact Upkeep/Trade/Vault percentage splits (player-configurable? fixed?)
- [ ] Add resource icons and counts to HUD

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Economy design doc. Identified that the EconomyManager exists but lacks the Three-Bucket core — all resources currently bypass allocation and go to Vault. | The Three-Bucket system is the strategic heart of the game loop. Without it, there's no tension in resource management. This is Priority 1 for economy work. |
