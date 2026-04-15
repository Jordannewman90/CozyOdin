# Alfheim — Realm of the Light Elves

**Category:** World — Realm Design
**Status:** ✅ Scene Exists (V1)
**Related Code:** `project/levels/alfheim/Alfheim.tscn`

---

## 1. The Vibe

**Ethereal, tranquil, bioluminescent manicured gardens.** A place that feels alive — every plant glows, every surface breathes. The aesthetic tension: beautiful serenity vs. aggressive overgrowth when neglected.

**Color Palette:** Emerald green, soft teal, bioluminescent cyan, violet flower accents, warm gold sunbeams.

---

## 2. Key Elements

| Element | Type | Description |
|:--------|:-----|:------------|
| **Mana-Sap Trees** | Harvestable | Ancient trunks with glowing liquid sap veins |
| **Sun-Silk Flowers** | Decorative / Upkeep | Glowing flowers that wilt without care |
| **Dagr's Nursery** | NPC Station | Elven caretaker; lore, trading, Mana-Sap info |
| **Bifrost Portal** | Transit | Return portal to Asgard |

---

## 3. Resource: Mana-Sap

- **Base Name:** Mana-Sap
- **Harvest Method:** Manual interaction or Proxy (Elven context)
- **Uses:** Cools Dwarven forges (trade dependency), Proxy Elven charge, diplomatic gifts
- **Sprite:** `node_mana_sap.png` — 3-frame pulse animation
- **Note:** Not yet implemented in `SaveManager.gd` schema (only Star-Iron exists)

---

## 4. Chaos State: The Overgrowth 🌿

| Tier | Visual | Mechanic |
|:-----|:-------|:---------|
| Restless (11-30%) | Mild vine tendrils at tile edges | — |
| Turbulent (31-60%) | Thorny vines spawn on walkable tiles | Vines damage Odin on contact |
| Critical (61-90%) | Dense vine coverage; Mana-Sap nodes choked | Harvest yields halved |
| Ruined (91-100%) | Full overgrowth; realm sealed in thorns | Must be cleared from Asgard |

**Clearing:** Gungnir Resonance burns vines. Manual pruning interaction. Proxies with "Mend" + Elven context handle it most efficiently.

---

## 5. Layout Concept

```
┌──────────────────────────────────────────────────┐
│                   ALFHEIM                        │
│                                                   │
│   [Mana-Sap Tree]      [Sun-Silk Flowers]        │
│                                                   │
│           [Dagr's Nursery]                       │
│                                                   │
│   [Mana-Sap Tree]      [Mana-Sap Tree]          │
│                                                   │
│              [Bifrost Portal → Asgard]           │
│                                                   │
└──────────────────────────────────────────────────┘
```

---

## Active Task List

- [ ] Add `Mana-Sap` as a resource type in SaveManager schema
- [ ] Design Alfheim TileMap with bioluminescent garden aesthetics
- [ ] Place Mana-Sap HarvestableNodes
- [ ] Create Dagr NPC entity with dialogue
- [ ] Implement Overgrowth chaos overlay sprites (thorny vines)
- [ ] Create vine-contact damage mechanic
- [ ] Add ambient VFX: floating pollen, bioluminescent glow pulses, firefly particles
- [ ] Sound design: gentle wind, soft chimes, distant birdsong

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Alfheim realm design doc with Overgrowth chaos tiers. | Alfheim is the "nature" counterpoint to Nidavellir's "industry." Its chaos state (Overgrowth) is thematically the inverse of the Deep Freeze — too much life instead of too little. |
