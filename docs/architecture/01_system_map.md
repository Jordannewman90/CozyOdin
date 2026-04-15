# System Architecture Map

**Category:** Architecture — Technical Overview
**Status:** Living Document

---

## 1. High-Level Architecture

```mermaid
graph TB
    subgraph "Autoload Singletons (Always Active)"
        TE[TimeEngine.gd]
        SM[SaveManager.gd]
        EM[EconomyManager.gd]
    end

    subgraph "Entity Layer"
        OD[Odin.gd<br/>CharacterBody2D]
        PR[Proxy.gd<br/>CharacterBody2D]
        HN[HarvestableNode.gd<br/>Node2D]
        DS[DivineSpark.tscn<br/>GPUParticles2D]
    end

    subgraph "UI Layer"
        HUD[HUD.gd<br/>Control]
        AB[AlignmentBezel.gd<br/>Control]
        RD[Raven Dashboard<br/>🔴 Empty]
        MS[Mediation Scale<br/>🔴 Empty]
    end

    subgraph "Level Scenes"
        AS[Asgard.tscn]
        NI[Nidavellir.tscn]
        AL[Alfheim.tscn]
    end

    subgraph "Systems"
        BF[BifrostTransit.gd<br/>Area2D]
        IR[Iridescent.gdshader]
        GT[GhostTrail.gd]
    end

    %% Signal connections
    TE -->|offline_calculation_complete| PR
    TE -->|offline_calculation_complete| EM
    TE -->|offline_calculation_complete| HUD
    EM -->|crisis_started| HUD
    AB -->|configuration_locked| HUD
    HUD -->|save_and_quit| SM

    %% Data flow
    SM -.->|reads game_data| TE
    SM -.->|reads game_data| OD
    SM -.->|reads game_data| HUD
    OD -->|interact| HN
    OD -->|interact/deploy| PR
    HN -->|writes to vault| SM
    BF -->|change_scene| AS
    BF -->|change_scene| NI
    BF -->|change_scene| AL
    PR -->|simulated_harvest| HN
    IR -.->|shader applied| OD
    IR -.->|shader applied| PR
    IR -.->|shader applied| HN
    IR -.->|shader applied| BF
```

---

## 2. Signal Graph

| Signal | Source | Subscribers | Data |
|:-------|:------|:-----------|:-----|
| `offline_calculation_complete` | `TimeEngine` | `Proxy`, `EconomyManager`, `HUD` | `duration_seconds: float` |
| `crisis_started` | `EconomyManager` | `HUD` | `crisis_name: String, modifier: float` |
| `configuration_locked` | `AlignmentBezel` | `HUD` | `config: Dictionary` |

---

## 3. Data Flow

### On Boot
```
OS Clock → TimeEngine → offline_duration
                ↓
    SaveManager.game_data ← loaded from JSON
                ↓
    Proxy._on_offline_catch_up() → HarvestableNode.simulated_harvest()
    EconomyManager.update_economy_state() → crisis check
    HUD._on_offline_time_calculated() → display duration
```

### On Save & Quit
```
Odin.global_position → SaveManager.game_data["player_pos"]
SaveManager.save_game() → write JSON with current timestamp
get_tree().quit()
```

### On Bifrost Transit
```
Odin enters BifrostTransit Area2D → save game → change_scene_to_file()
```

---

## 4. Singleton Dependency Order

| Priority | Singleton | Depends On | Reason |
|:---------|:----------|:-----------|:-------|
| 1 | `SaveManager` | None | Must load data before anything reads it |
| 2 | `TimeEngine` | `SaveManager` | Needs `offline_start_time` from save data |
| 3 | `EconomyManager` | `TimeEngine` | Connects to `offline_calculation_complete` signal |

The `project.godot` autoload order must match this. `TimeEngine._ready()` uses `await get_tree().process_frame` to ensure `SaveManager` has loaded first.

---

## Active Task List

- [ ] Add planned singletons: `ChaosManager.gd`, `DialogueParser.gd`
- [ ] Formalize autoload order in `project.godot` (currently implicit via await)
- [ ] Document all planned signals for Chaos and Dialogue systems
- [ ] Create a visual scene tree reference for each level

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created System Architecture Map with full signal graph, data flow diagrams, and singleton dependency order. | This is the "map" for agentic development — any future code generation must reference this to know what signals to connect, what data to read, and what singletons exist. |
