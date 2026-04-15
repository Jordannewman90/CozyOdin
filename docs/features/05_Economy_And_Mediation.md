# Feature PRD: Economy & Mediation

**Parent Module:** Meta-Game Logic
**Target Component:** `project/ui/mediation_scale/`, `project/systems/EconomyManager.gd`

## 1. Overview
The logistics of the Nine Realms are precarious. Harvested resources must be balanced between local survival, cross-realm diplomacy, and Odin's personal treasury.

## 2. The Three-Bucket Economy
Harvested loot is automatically sorted (customizable by player) into three pools:
1. **Realm Upkeep:** Stays in the local realm's chest. Prevents offline chaos escalation.
2. **Trade Routes:** Shipped to other realms to maintain dependencies. Breaking these triggers the "Trade Moot."
3. **Asgard Vault:** Odin's private stash. Used for upgrades, crafting Proxies, and Mediation.

## 3. The Mediation Table & Scale
A scheduled "Grand Trade Moot" where realm leaders demand reparations for broken dependencies.
* **The UI:** A literal physical balancing scale on screen.
* **Gameplay:** Regents place "Grievance Weights" on one side. The player must drag and drop resources from their Vault onto the other side to balance the scale.
* **Reward:** A **Treaty-Rune**. Slotted into a Proxy, it grants 100% cultural immunity for 3 real-world days, allowing that Proxy to work in "Sensitive" realms without creating chaos.

## 4. Required Godot Nodes
* `Control` (Base UI)
* `PhysicsServer2D` or simple `Tween` logic to handle the scale's tilt.
* `ItemSlot` (Custom UI component for dragging resources).
