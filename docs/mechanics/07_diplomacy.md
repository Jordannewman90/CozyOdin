# Diplomacy & The Mediation Table

**Category:** Mechanics — Meta-Game
**Status:** 🔴 Not Implemented
**Related Code:** `project/ui/mediation_scale/` (empty), `project/systems/EconomyManager.gd`
**Supersedes:** Section in [features/05_Economy_And_Mediation.md](../features/05_Economy_And_Mediation.md)

---

## 1. Overview

The diplomatic system creates long-term consequences for automation mistakes. When Proxies act out of context (a Dwarf proxy strip-mining an Elven forest) or trade routes break, **friction accumulates** until it boils over at the Grand Trade Moot.

---

## 2. The Grand Trade Moot

- **Trigger:** Every 7 in-game days (or when cross-realm friction exceeds a threshold).
- **Current config:** `moot_interval: 86400` (24 hours real-time) in `EconomyManager.gd`.
- **Event:** Accumulated grievances from all realms are presented simultaneously.
- **Consequence of ignoring:** Realm Regents impose trade sanctions → reduced yield modifiers.

---

## 3. The Mediation Table (UI)

A physical balancing scale displayed on screen.

### Gameplay Flow
1. Aggrieved Regents place **Grievance Weights** on one side of the scale.
2. Player drags resources from the **Asgard Vault** onto the other side.
3. Goal: **Balance the scale** within a tolerance margin.
4. Over-paying wastes resources. Under-paying leaves unresolved friction.

### Reward: Treaty-Rune
- Successfully balancing yields a **Treaty-Rune**.
- Slotted into a Proxy's Alignment Bezel, it provides **100% cultural immunity** in a specific realm for **3 real-world days**.
- Effectively an "override" that prevents a Proxy from generating diplomatic friction.

---

## 4. Faction Regents

| Realm | Regent | Personality | Negotiation Style |
|:------|:-------|:-----------|:-----------------|
| Nidavellir | **Brokk & Eitri** | Pragmatic, transactional | Demand exact resource quantities |
| Alfheim | **Dagr** | Idealistic, emotional | Demand shows of respect + resources |
| Asgard | **Heimdall** | Stoic, observational | Provides intel, doesn't negotiate |

---

## Active Task List

- [ ] Design Mediation Scale UI scene (`mediation_scale/MediationScale.tscn`)
- [ ] Implement weight-based balancing logic (tween or simple physics)
- [ ] Create drag-and-drop resource slot system
- [ ] Implement Grievance Weight calculation (based on trade deficits + proxy cultural offenses)
- [ ] Create Treaty-Rune item and Bezel slotting mechanic
- [ ] Wire Moot trigger to actual diplomatic state (not just time-based)
- [ ] Write Regent dialogue for Mediation encounters
- [ ] Design Regent portrait sprites for the Mediation UI
- [ ] Define "sanctions" penalty system for unresolved Moots

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Diplomacy & Mediation design doc. This system is entirely unimplemented — the directory exists but is empty. | Documenting the full design intent from the PRD so that when implementation begins, the UI, logic, and reward systems are clearly specified. |
