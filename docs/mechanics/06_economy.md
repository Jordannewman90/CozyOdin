# Economy & The Blessing System

**Category:** Mechanics — Economy
**Status:** 🟡 Partially Implemented
**Related Code:** `project/systems/EconomyManager.gd`, `project/ui/HUD.gd`

---

## 1. Overview

The economy in *Cozy Odin* is built on **Generosity, not Scarcity.** All resources (Star-Iron, Mana-Sap) go directly to Odin's inventory. The strategic layer exists in the **Choice to Give Back.**

---

## 2. The Blessing System

Instead of mandatory upkeep, Odin can "Bless" a realm via its **Offering Altar.**

| Action | Cost | Instant Gratification | Offline Reward |
|:-------|:-----|:----------------------|:---------------|
| **Small Offering** | 10 Iron | NPC Cheer / Mini-Glow | Slight Chaos reduction |
| **Greater Blessing** | 50 Iron | Sky-color shift / Music swell | **FESTIVAL UNLOCKED:** Massive Chaos clear + Gift Chest |
| **Divine Infusion** | 100 Iron | "Sun Rise" event / All NPCs bow | **GLOWING ERA:** Realm is immune to Chaos for 48 hours |

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

- [ ] Design and implement the **Offering Altar** interaction (Instant Gratification)
- [ ] Add Mana-Sap as a second resource type in SaveManager schema
- [ ] Implement **Festival Simulation** logic (Events that process during the All-Sleep)
- [ ] Create **Gift Chest** spawning system (Rewards found upon waking)
- [ ] Connect Festival success to massive Chaos reduction thresholds
- [ ] Add resource icons and counts to HUD

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Economy design doc. Identified that the EconomyManager exists but lacks the Three-Bucket core — all resources currently bypass allocation and go to Vault. | The Three-Bucket system is the strategic heart of the game loop. Without it, there's no tension in resource management. This is Priority 1 for economy work. |
