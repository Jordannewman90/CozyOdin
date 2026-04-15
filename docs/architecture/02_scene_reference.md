# Scene & Node Reference

**Category:** Architecture — Scene Trees
**Status:** Living Document (auto-audit from codebase)

---

## 1. Level Scenes

### Asgard.tscn
```
Asgard (Node2D)
├── TileMap
├── Odin (→ entities/player/Odin.tscn)
├── HarvestableNode (→ entities/resources/HarvestableNode.tscn)
├── Proxy (→ entities/proxy/Proxy.tscn)
├── BifrostToNidavellir (→ systems/BifrostTransit.tscn)
├── BifrostToAlfheim (→ systems/BifrostTransit.tscn)
└── HUD (→ ui/HUD.tscn)
```

### Nidavellir.tscn
```
Nidavellir (Node2D)
├── TileMap
├── Odin (→ entities/player/Odin.tscn)
├── HarvestableNode (Star-Iron)
├── HarvestableNode (Star-Iron)
├── BifrostToAsgard (→ systems/BifrostTransit.tscn)
└── HUD (→ ui/HUD.tscn)
```

### Alfheim.tscn
```
Alfheim (Node2D)
├── TileMap
├── Odin (→ entities/player/Odin.tscn)
├── HarvestableNode (Mana-Sap — planned)
├── BifrostToAsgard (→ systems/BifrostTransit.tscn)
└── HUD (→ ui/HUD.tscn)
```

---

## 2. Entity Scenes

### Odin.tscn
```
Odin (CharacterBody2D)
├── Sprite2D (Iridescent shader applied)
├── CollisionShape2D
└── InteractionArea (Area2D)
    └── CollisionShape2D
```

### Proxy.tscn
```
Proxy (CharacterBody2D)
├── Sprite2D (Iridescent shader applied)
├── ContextOverlay (Sprite2D — palette-swapped)
├── CollisionShape2D
└── Area2D (for player interaction)
    └── CollisionShape2D
```

### HarvestableNode.tscn
```
HarvestableNode (Node2D)
├── Sprite2D (Iridescent shader applied)
└── Area2D (group: "harvestable")
    └── CollisionShape2D
```

### DivineSpark.tscn
```
DivineSpark (GPUParticles2D)
└── (Particle emission settings — holographic sparks)
```

---

## 3. UI Scenes

### HUD.tscn
```
HUD (Control)
├── StaminaBar (ProgressBar)
├── OfflineLabel (Label)
├── SleepButton (Button)
├── OpenBezelButton (Button)
├── SquadLabel (Label)
├── MootLabel (Label)
├── CrisisBanner (PanelContainer)
│   └── Label
└── FadeOverlay (ColorRect)
```

### AlignmentBezel.tscn
```
AlignmentBezel (Control)
├── Rings (Control — centered container)
│   ├── OuterRing (TextureRect — rotation pivot centered)
│   ├── InnerRing (TextureRect)
│   └── CenterBezel (TextureRect)
├── Status (Label)
└── Instructions (Label)
```

---

## 4. System Scenes

### BifrostTransit.tscn
```
BifrostTransit (Area2D)
├── ColorRect (Iridescent shader applied)
└── CollisionShape2D
```

---

## Active Task List

- [ ] Audit actual .tscn files to verify these trees match (manual check in Godot editor)
- [ ] Document planned scenes: Raven Dashboard, Mediation Scale, Proxy Crafting Bench
- [ ] Add NPC scene template (base class for Heimdall, Dagr, Brokk & Eitri)
- [ ] Document Chaos Overlay scene (ice tile, vine tile)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Scene & Node Reference by auditing all .tscn and .gd files in the project. | Having an explicit node tree reference prevents "where do I add this?" questions during agentic development. Every scene modification should update this doc. |
