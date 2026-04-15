# Nidavellir — Realm of the Dwarves

**Category:** World — Realm Design
**Status:** ✅ Scene Exists (V1)
**Related Code:** `project/levels/nidavellir/Nidavellir.tscn`

---

## 1. The Vibe

**High-performance industrial forge.** Precision engineering, anodized metal, matte black finishes, direct-drive rotary motors, and heavy torque. Think: a luxury watch factory inside a volcano.

**Color Palette:** Charcoal, molten orange, brushed steel, ember glow.

---

## 2. Key Elements

| Element | Type | Description |
|:--------|:-----|:------------|
| **Star-Iron Nodes** | Harvestable | Molten metallic rock with inner pulse glow |
| **Thermal Vents** | Environmental | Active vents that power machinery; freeze during chaos |
| **Brokk & Eitri's Shop** | NPC Station | Dwarven brothers; trade, upgrade, and lore |
| **Bifrost Portal** | Transit | Return portal to Asgard |

---

## 3. Resource: Star-Iron

- **Base Name:** Star-Iron
- **Harvest Method:** Manual interaction or Proxy (Dwarven context)
- **Uses:** Tool upgrades, Proxy construction, Mediation payments
- **Sprite:** `node_star_iron.png` — 3-frame pulse animation

---

## 4. Chaos State: The Deep Freeze ❄️

| Tier | Visual | Mechanic |
|:-----|:-------|:---------|
| Restless (11-30%) | Frost crystals on edges of machinery | — |
| Turbulent (31-60%) | Ice patches spawn on floor tiles | Movement slowed on ice |
| Critical (61-90%) | Thermal Vents freeze; machines go dark | Star-Iron nodes locked |
| Ruined (91-100%) | Full ice coverage; realm temporarily sealed | Must be cleared from Asgard |

**Clearing:** Gungnir Resonance shatters ice tiles. Manual interaction chips individual tiles. Proxies with "Mend" directive slowly thaw.

---

## 5. Layout Concept

```
┌──────────────────────────────────────────────────┐
│                  NIDAVELLIR                       │
│                                                   │
│   [Star-Iron Node]     [Thermal Vent]            │
│                                                   │
│        [Brokk & Eitri Shop]                      │
│                                                   │
│   [Star-Iron Node]     [Star-Iron Node]          │
│                                                   │
│              [Bifrost Portal → Asgard]           │
│                                                   │
└──────────────────────────────────────────────────┘
```

---

## Active Task List

- [ ] Design Nidavellir TileMap with industrial forge aesthetics
- [ ] Place multiple Star-Iron HarvestableNodes with varying positions
- [ ] Implement Thermal Vent interactive element
- [ ] Create Brokk & Eitri NPC entities with dialogue
- [ ] Implement Deep Freeze chaos overlay sprites (ice tiles)
- [ ] Create ice-encased machinery sprites
- [ ] Add ambient VFX: sparks, steam, molten metal drips
- [ ] Sound design: heavy machinery hum, metallic clanking

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Nidavellir realm design doc with Deep Freeze chaos tier breakdown. | Nidavellir is the "industry" realm — its chaos state (Deep Freeze) is the visual and mechanical opposite of its healthy state (molten heat). This contrast needs strong sprite work to sell. |
