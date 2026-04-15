# Asgard — The Central Hub

**Category:** World — Realm Design
**Status:** ✅ Scene Exists (V1)
**Related Code:** `project/levels/asgard/Asgard.tscn`

---

## 1. The Vibe

**Majestic, golden, high-end logistical command center.** Asgard is the player's home base — the place they return to between realm expeditions and where all management UIs are accessed.

**Color Palette:** Gold, white marble, crystalline blue accents, warm amber lighting.

---

## 2. Key Facilities

| Facility | Function | Implementation Status |
|:---------|:---------|:---------------------|
| **Hlidskjalf (Throne)** | Deep Wind stamina recovery station | 🔴 Not started |
| **Proxy Crafting Bench** | Create new Runic Proxies from resources | 🔴 Not started |
| **The Asgard Vault** | Visual representation of stored resources | 🔴 Not started |
| **Mediation Table** | Diplomatic dispute resolution | 🔴 Not started (empty dir) |
| **Bifrost Terminal** | Fast travel to other realms | ✅ Portal exists |
| **Raven Dashboard** | Hugin & Munin's offline event report | 🔴 Not started (empty dir) |

---

## 3. Layout Concept

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

## 4. NPCs

| NPC | Role | Location |
|:----|:-----|:---------|
| **Heimdall** | Bifrost guardian, intel provider | Near portals |
| **Hugin & Munin** | Ravens, deliver the offline status report | Dashboard area |

---

## 5. Chaos State

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
