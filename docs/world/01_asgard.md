# Asgard — The Central Hub

**Category:** World — Realm Design
**Status:** ✅ Scene Exists (V1)
**Related Code:** `project/levels/asgard/Asgard.tscn`

---

## 1. The Vibe

**Majestic, golden, high-end logistical command center.** Asgard is the player's home base — the place they return to between realm expeditions and where all management UIs are accessed.

**Color Palette:** Gold, white marble, crystalline blue accents, warm amber lighting.

---

## 2. Key Locations
*   **The Hlidskjalf (Throne):** Odin's command seat.
*   **The Royal Chambers (Private):** Where Odin and Frigg interact. Unlockable tiers.
*   **The Queen's Balcony:** A Tier 3 expansion for domestic gardening.
*   **The Bifrost Gate:** Guarded by Heimdall.

## 3. Narrative Subtext
*   **The Stirring Stick:** Somewhere in the scrap heaps of the forge lies a metal rod Brokk uses to stir slag. It is secretly Gungnir's inert shaft.
*   **Loki's Tags:** Green pixel graffiti appearing on the matte-black walls, mocking the dwarves' precision.

---

## 4. Layout Concept

```
┌──────────────────────────────────────────────────┐
│                    ASGARD                         │
│                                                   │
│   [Raven Dashboard]        [Throne/Hlidskjalf]   │
│                                                   │
│            [Proxy Bench]                          │
│                                                   │
│   [Vault]      ★ ODIN SPAWN ★     [Mediation]   │
│                                                   │
│       [Portal: Nidavellir]  [Portal: Alfheim]    │
│                                                   │
└──────────────────────────────────────────────────┘
```

---

## 5. NPCs

| NPC | Role | Location |
|:----|:-----|:---------|
| **Heimdall** | Bifrost guardian, intel provider | Near portals |
| **Hugin & Munin** | Ravens, deliver the offline status report | Dashboard area |

---

## 6. Chaos State

Asgard **does not have a chaos state.** It is always stable — the safe harbor. However, if all other realms reach Critical chaos, Asgard's lighting dims and Heimdall delivers urgent warnings.

---

## Active Task List

- [ ] Design Asgard TileMap layout with facility positions
- [ ] Implement Hlidskjalf throne interaction area
- [ ] Implement Proxy Crafting Bench (resource costs, UI)
- [ ] Create Vault visual (chest that shows resource counts when interacted)
- [ ] Position Heimdall NPC with context-aware dialogue
- [ ] Create Hugin & Munin sprites and wire to Raven Dashboard
- [ ] Add environmental polish: ambient particles, warm lighting
- [ ] Define spawn point alignment with save/load position

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Asgard realm design doc. Identified that the scene exists but most hub facilities are unimplemented — only the Bifrost portals function. | Asgard needs to become a true "management desk" — the place where every strategic decision happens. Currently it's just a room with portals. |
| 2026-04-16 | Added narrative subtext regarding world building. | Added: The Resonance Song (The world-trees hum in a specific frequency that can "re-vibe" divine artifacts), Loki's Overgrowth (Aggressive vines that seem to grow in the shape of a mocking grin). |
