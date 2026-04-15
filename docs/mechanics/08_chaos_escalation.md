# Chaos Escalation System

**Category:** Mechanics — Background Simulation
**Status:** 🔴 Not Implemented (data schema exists)
**Related Code:** `project/systems/SaveManager.gd` (stores `realm_states.chaos`)

---

## 1. Overview

Chaos is the **entropy engine** of Project All-Sleep. While Odin sleeps (the game is closed), each realm slowly deteriorates. The rate is influenced by Upkeep resource availability, Proxy health, and environmental factors.

Chaos is the *reason you can't just sleep forever.* It's the ticking clock that pulls you back.

---

## 2. Chaos Tiers

| Level | Name | Visual Effect | Gameplay Impact |
|:------|:-----|:-------------|:---------------|
| 0-10% | **Pristine** | Full bloom, glowing nodes | Passive stamina regen active |
| 11-30% | **Restless** | Minor visual decay, dimmed lights | Reduced harvest yields |
| 31-60% | **Turbulent** | Chaos tile overlays begin spawning | Proxy efficiency halved |
| 61-90% | **Critical** | Dense overlay coverage, resource nodes lock | Proxies power down |
| 91-100% | **Ruined** | Full environmental takeover | Realm temporarily inaccessible |

### Chaos Types Per Realm
| Realm | Chaos State | Visual |
|:------|:-----------|:-------|
| Nidavellir | **The Deep Freeze** | Pale blue ice encases machinery |
| Alfheim | **The Overgrowth** | Aggressive thorny vines choke nodes |

---

## 3. Escalation Math (Proposed)

```
chaos_increase_per_tick = base_rate * (1.0 - upkeep_ratio) * buggy_proxy_multiplier

Where:
  base_rate = 0.5% per simulation tick (1 tick = 60 real seconds)
  upkeep_ratio = resources_in_local_storage / required_upkeep (0.0 to 1.0)
  buggy_proxy_multiplier = 2.0 per buggy proxy in realm, default 1.0
```

### De-escalation
- Player manually clears chaos tiles (Gungnir Resonance, manual interaction)
- Proxies with "Mend" directive slowly reduce chaos when operating
- Chaos naturally decays at 0.1%/tick when Upkeep is fully satisfied

---

## 4. Chaos Overlay System (Visual)

- **Implementation:** A spawner script that places ice/weed/vine sprites over existing TileMap cells.
- **Density:** Number of overlays scales with Chaos percentage.
- **Interaction:** Player can manually clear individual tiles (costs stamina) or use Gungnir for area clear.
- **Clearing:** Tile removal spawns Divine Sparks for stamina recovery.

---

## Active Task List

- [ ] Implement `ChaosManager.gd` singleton (or add to existing system)
- [ ] Connect to `TimeEngine.offline_calculation_complete` for offline escalation
- [ ] Implement per-realm chaos tier thresholds with gameplay effects
- [ ] Create Chaos Overlay spawner script for ice/weed tile generation
- [ ] Implement manual chaos tile clearing interaction (by Odin)
- [ ] Implement Proxy "Mend" directive for automated chaos reduction
- [ ] Wire chaos level to harvest yield modifiers
- [ ] Wire chaos level to Proxy power-down at Critical tier
- [ ] Add chaos percentage display to HUD (per-realm indicators)
- [ ] Define Upkeep resource requirements per realm per tick

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Chaos Escalation design doc with proposed math formula and tier system. | This system is the "stick" to the Proxy's "carrot." Without chaos, there's no pressure to automate well. The math formula is proposed but not validated — needs balancing playtests. |
