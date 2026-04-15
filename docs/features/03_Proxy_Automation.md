# Feature PRD: Proxy Automation System

**Parent Module:** Automation Logic
**Target Component:** `project/entities/proxy/`, `project/systems/EconomyManager.gd`

## 1. Overview
Runic Proxies are the mechanical workhorses of Project All-Sleep. They are 16-bit golem agents that automate harvesting, mending, and logistics while the player is offline. Their efficiency is determined by the Alignment Bezel configuration.

## 2. Core Mechanics

### Efficiency Multipliers
A Proxy's base yield is modified by its "Health" and its "Configuration Accuracy":
* **Perfect Proxy:** 100% Base Yield. Zero Chaos escalation.
* **Buggy Proxy:** 10-25% Base Yield. Multiplies local Realm Chaos escalation by 2x.
* **Depleted Proxy:** Proxies require periodic "Runic Charge" (Upkeep). If not maintained, they power down into a "Stony Idle" state and stop all work.

### Simulation Math
When the `TimeEngine` returns an `offline_duration`, the Proxy System calculates the cumulative yield:
* `total_yield = (offline_duration / simulation_tick_rate) * yield_per_tick * efficiency_multiplier`
* The yield is then automatically split into the Three-Bucket Economy (Upkeep, Trade, Vault) based on pre-set percentages.

### Context Palette Swapping
Each Proxy uses a base chunky golem chassis. When a Context Rune is slotted:
* **Nidavellir Context:** Adds exhaust pipes and glowing orange metal accents.
* **Alfheim Context:** Adds bioluminescent vines and floral crown accents.

## 3. Automation Logic
* **Harvesting:** Targets specific resource nodes within its assigned Realm.
* **Mending:** Automatically targets and removes "Chaos Overlays" (Ice/Weeds) within its radius.
* **Logistics:** Moves resources from the Realm's local storage to the "Trade Routes" to satisfy dependencies for other realms.

## 4. Required Godot Nodes
* `CharacterBody2D` (Base Proxy Entity)
* `Sprite2D` (With dynamic palette/overlay logic)
* `Timer` (For local "Simulation Ticks" while the game is active)
