# 📖 The All-Sleep — World Bible & Documentation Hub

> The single source of truth for all game design, narrative, technical architecture, and development tracking.

---

## How to Use This Hub

Every document in this tree is a **living design document**. Each contains:
- A detailed breakdown of its topic
- An **Active Task List** (`- [ ]` checklist) of outstanding work
- An **AI Changelog** at the bottom tracking iterative design decisions

When starting agentic development on any feature, **read the relevant doc first** to absorb context and check the task list for what's next.

---

## 📑 Table of Contents

### 🔵 Foundation
| Document | Path | Description |
|:---------|:-----|:------------|
| **Master PRD** | [Master_PRD.md](Master_PRD.md) | V8 product requirements — the parent blueprint |
| **Sprite Manifest** | [../assets/docs/sprite_manifest.md](../assets/docs/sprite_manifest.md) | Complete asset catalog for all 16-bit pixel art |
| **Ideas Hub** | [IDEAS.md](IDEAS.md) | A sandbox for creative brainstorming and future features |

---

### ⚙️ Core Mechanics (`/mechanics`)
| Document | Path | Description |
|:---------|:-----|:------------|
| Core Loop & Progression | [mechanics/01_core_loop.md](mechanics/01_core_loop.md) | The fundamental play cycle and progression arc |
| The All-Sleep Engine | [mechanics/02_all_sleep_engine.md](mechanics/02_all_sleep_engine.md) | Offline time calculation, simulation ticks, chaos |
| Kinetic Resonance (Stamina) | [mechanics/03_kinetic_resonance.md](mechanics/03_kinetic_resonance.md) | Stamina system, Divine Sparks, The Deep Wind |
| Alignment Bezel | [mechanics/04_alignment_bezel.md](mechanics/04_alignment_bezel.md) | Proxy programming mini-game |
| Proxy Automation | [mechanics/05_proxy_automation.md](mechanics/05_proxy_automation.md) | Offline harvesting, efficiency, buggy states |
| Economy & Three Buckets | [mechanics/06_economy.md](mechanics/06_economy.md) | Resource allocation: Upkeep, Trade, Vault |
| Diplomacy & Mediation | [mechanics/07_diplomacy.md](mechanics/07_diplomacy.md) | Grand Trade Moot, Mediation Table, Treaty-Runes |
| Chaos Escalation | [mechanics/08_chaos_escalation.md](mechanics/08_chaos_escalation.md) | Realm deterioration math and environmental decay |

---

### 🌍 World Map & Regions (`/world`)
| Document | Path | Description |
|:---------|:-----|:------------|
| World Overview & Cosmology | [world/00_overview.md](world/00_overview.md) | The Nine Realms map, Bifrost connections, design philosophy |
| Asgard (Hub) | [world/01_asgard.md](world/01_asgard.md) | The golden command center — all hub facilities |
| Nidavellir (Dwarves) | [world/02_nidavellir.md](world/02_nidavellir.md) | Industrial forge, Star-Iron, The Deep Freeze |
| Alfheim (Light Elves) | [world/03_alfheim.md](world/03_alfheim.md) | Bioluminescent gardens, Mana-Sap, The Overgrowth |
| Phase 2 Realms (Overview) | [world/04_phase2_realms.md](world/04_phase2_realms.md) | Muspelheim, Svartalfheim, Vanaheim, Jotunheim, Helheim, Midgard |

---

### 📜 Storylines & Characters (`/narrative`)
| Document | Path | Description |
|:---------|:-----|:------------|
| Narrative Arc & Themes | [narrative/01_narrative_arc.md](narrative/01_narrative_arc.md) | The overarching story: Odin's pursuit of the Perfect System |
| Character Bible | [narrative/02_character_bible.md](narrative/02_character_bible.md) | Odin, Heimdall, Dagr, Brokk & Eitri, Regents |
| Dialogue System & Banks | [narrative/03_dialogue_system.md](narrative/03_dialogue_system.md) | Zero-token JSON dialogue architecture |
| Quest Trees & Objectives | [narrative/04_quest_trees.md](narrative/04_quest_trees.md) | Tutorial flow, realm quests, endgame conditions |

---

### 🏗️ Technical Architecture (`/architecture`)
| Document | Path | Description |
|:---------|:-----|:------------|
| System Architecture Map | [architecture/01_system_map.md](architecture/01_system_map.md) | How singletons, entities, and UI interconnect |
| Scene & Node Reference | [architecture/02_scene_reference.md](architecture/02_scene_reference.md) | Every `.tscn` scene and its node tree |
| Save Data Schema | [architecture/03_save_schema.md](architecture/03_save_schema.md) | The `save_data.json` contract |
| Shader & VFX Pipeline | [architecture/04_shader_pipeline.md](architecture/04_shader_pipeline.md) | Iridescent shader, Ghost Trail, particle systems |
| Input Map & Controls | [architecture/05_input_map.md](architecture/05_input_map.md) | All keybindings and action definitions |

---

### 🗂️ Legacy Feature PRDs (`/features`)
These were the original single-page feature specs. They are preserved for reference but are **superseded** by the more detailed documents above.

| Document | Path |
|:---------|:-----|
| Time & State Engine | [features/01_Time_And_State_Engine.md](features/01_Time_And_State_Engine.md) |
| Alignment Bezel UI | [features/02_Alignment_Bezel_UI.md](features/02_Alignment_Bezel_UI.md) |
| Proxy Automation | [features/03_Proxy_Automation.md](features/03_Proxy_Automation.md) |
| Odin Abilities & VFX | [features/04_Odin_Abilities_And_VFX.md](features/04_Odin_Abilities_And_VFX.md) |
| Economy & Mediation | [features/05_Economy_And_Mediation.md](features/05_Economy_And_Mediation.md) |

---

## 🔑 Quick Reference

### Codebase Map
```
project/
├── project.godot                        # Godot 4.6 config
├── systems/
│   ├── TimeEngine.gd          [AUTOLOAD] Offline calculator
│   ├── SaveManager.gd         [AUTOLOAD] JSON persistence
│   ├── EconomyManager.gd      [AUTOLOAD] Trade Moot & crises
│   ├── BifrostTransit.gd                Realm portal logic
│   └── Iridescent.gdshader              Holographic color-cycle shader
├── entities/
│   ├── player/  (Odin.gd, GhostTrail.gd)
│   ├── proxy/   (Proxy.gd — automation golem)
│   └── resources/ (HarvestableNode.gd, DivineSpark.tscn)
├── levels/
│   ├── asgard/     (Asgard.tscn)
│   ├── nidavellir/ (Nidavellir.tscn)
│   └── alfheim/    (Alfheim.tscn)
└── ui/
    ├── HUD.gd / HUD.tscn               Main overlay
    ├── alignment_bezel/                  3-dial mini-game
    ├── dashboard/                        (empty — Raven Dashboard)
    └── mediation_scale/                  (empty — Mediation Table)
```

### Implementation Status
| System | Script | Status |
|:-------|:-------|:-------|
| Offline Time Engine | `TimeEngine.gd` | ✅ Functional |
| Save/Load | `SaveManager.gd` | ✅ Functional |
| Economy Manager | `EconomyManager.gd` | ✅ Functional |
| Bifrost Transit | `BifrostTransit.gd` | ✅ Functional |
| Iridescent Shader | `Iridescent.gdshader` | ✅ Functional |
| Odin Controller | `Odin.gd` | ✅ Functional |
| Ghost Trail VFX | `GhostTrail.gd` | ✅ Functional |
| Proxy Entity | `Proxy.gd` | ✅ Functional |
| Harvestable Nodes | `HarvestableNode.gd` | ✅ Functional |
| Alignment Bezel | `AlignmentBezel.gd` | ✅ Functional |
| HUD | `HUD.gd` | ✅ Functional |
| Raven Dashboard | `ui/dashboard/` | 🔴 Empty |
| Mediation Scale | `ui/mediation_scale/` | 🔴 Empty |
| Chaos Overlay Spawner | — | 🔴 Not Started |
| Presence Aura | — | 🔴 Not Started |
| Gungnir Resonance | — | 🔴 Not Started |
| Bifrost Dash (Ability) | — | 🔴 Not Started |
| Kinetic Resonance | — | 🔴 Not Started |
| Dialogue System | — | 🔴 Not Started |
| Sprite Art | `assets/sprites/` | 🔴 Placeholder |

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created World Bible documentation hub with full directory scaffold, master index, and 17 template documents across 4 categories. | Establishing a structured, agentic-friendly documentation system for long-term game development. Every future code generation task should reference these docs for context before writing logic. |
