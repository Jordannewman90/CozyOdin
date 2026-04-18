# Chaos Escalation System

**Category:** Mechanics — Background Simulation
**Status:** ✅ **Implemented** (Simulated in `SaveManager.gd`)
**Related Code:** `project/systems/SaveManager.gd` (Handles hourly decay and randomization)

---

Chaos is the **entropy engine** of *Project All-Sleep*. While Odin sleeps, each realm slowly deteriorates. In the MVP, Chaos manifests as **Pathway Blockages** (Ice/Vines) that physically restrict NPC movement.

> **Design Philosophy: Opening the World**
> "Farming" in *Cozy Odin* is the act of **Unblocking.** By clearing Chaos from specific pathways, Odin allows citizens to return to their workstations and homes. A realm's health is visually measured by how much of its infrastructure is "Open" to its people.

---

## 2. Chaos Tiers

| Level | Name | Visual Effect | Gameplay Impact |
|:------|:-----|:-------------|:---------------|
| 0-10% | **Pristine** | Full bloom, glowing nodes | Passive stamina regen active |
| 11-40% | **Unstable** | Minor visual decay, dimmed lights | Reduced harvest yields |
| 41-70% | **Turbulent** | Chaos tile overlays begin spawning | Proxy efficiency halved |
| 71-99% | **Collapse** | Dense overlay coverage, resource nodes lock | Proxies power down |
| 100% | **Ruined** | Full environmental takeover | **Automation Collapse.** Manual Purification Required. |

### Chaos Types Per Realm
| Realm | Chaos State | Visual |
|:------|:-----------|:-------|
| Nidavellir | **The Deep Freeze** | Pale blue ice encases machinery |
| Alfheim | **The Overgrowth** | Aggressive thorny vines choke nodes |

---

## 3. Offline Simulation Tiers
To protect the "Cozy Contract," the game uses an asymptotic decay for offline simulation:

| Time Delta | Sim Speed | Result |
|:-----------|:----------|:-------|
| **0–24 Hours** | 100% | Full yields and chaos growth (Daily check-in reward) |
| **24–48 Hours** | 50% | Simulation slows down (Grace period) |
| **48 Hours – 14 Days** | 5% | Stasis. World almost freezes. |
| **14+ Days** | 0% | **Deep Overgrowth Triggered.** (See Section 3.1) |

### 3.1 Deep Overgrowth (14+ Days Absence)
If the player is offline for more than 14 consecutive days:
*   **Chaos Cap:** Chaos % stops growing at **80% (Collapse).** It will never reach 100% purely from offline time.
*   **Primal Knots:** A special "Super-Node" spawns at the realm's entrance portal, physically blocking exploration until manually cleared by Odin.
*   **Stony Stasis:** All Runic Proxies turn to stone. They stop all work and require 50 Stamina (Kinetic Resonance) from Odin to re-awaken.

---

## 3. The Heroic Restoration Loop (Fail State)

When a realm reaches **100% Chaos (Ruined)**, it enters a "Halted" state. This is the only "Fail State" in *The All-Sleep*, designed to pull the player back into active gameplay without permanent loss.

### A. Automation Collapse
*   **Proxy Evacuation:** All Proxies in the Ruined realm are immediately unsummoned and returned to the Asgard Vault. 
*   **Lockdown:** No new Proxies can be deployed to the realm until it is stabilized.
*   **Infrastructure Freeze:** All automated resource generation in the realm ceases.

### B. Manual Purification
*   **Odin's Presence:** The player must travel to the Ruined realm via the Bifrost.
*   **"Farming" Chaos:** Odin must manually clear chaos nodes (Shattering ice/Pruning vines).
*   **Stability Threshold:** The realm remains in the Ruined state until Chaos is lowered below **50%**. 
*   **Recovery:** Once below 50%, the "Ruined" status is lifted, and Proxies can be redeployed to begin automated maintenance.

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
