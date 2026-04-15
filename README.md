# 🌌 Project All-Sleep

> *"The universe doesn't fall apart when Odin sleeps. It just tries to."*

**Project All-Sleep** is an offline-first, cozy management game where you play as an exhausted Odin desperately seeking a true vacation. Built with **Godot 4.6**, the core hook is the **All-Sleep** — a mechanic that tracks real-world time you spend offline and lets the Nine Realms drift toward chaos while you're away.

---

## 🎮 What Is This Game?

You've delegated the management of the Nine Realms to programmable **Runic Proxies** — mechanical golems you configure via a tactile mini-game called the **Alignment Bezel**. Your goal: build a supply chain so flawlessly automated that the realm doesn't *need* you anymore.

Then you can finally sleep.

### Core Loop

| Step | Description |
|:-----|:------------|
| **Wake Up** | Compare your offline duration to real-world OS time |
| **Status Report** | Review the Raven Dashboard for broken proxies and Chaos levels |
| **Investigate & Restore** | Clear environmental hazards (ice, overgrowth) using divine abilities |
| **Manage Supply Chain** | Allocate resources across Upkeep, Trade Routes, and the Vault |
| **Configure Proxies** | Use the Alignment Bezel to program golems for offline automation |
| **The All-Sleep** | Save and close — the offline timer starts again |

---

## ✨ Features

### ⚡ The All-Sleep Engine
- Real-world offline duration is calculated on each boot using OS timestamps
- Proxies automatically harvest resources while you're away — if you configured them correctly
- Buggy Proxies accelerate realm chaos, punishing sloppy automation

### 🔧 Alignment Bezel (Automation Mini-Game)
A timing-based, 3-dial mechanical chronograph UI used to program your Proxies:
- **Outer Dial (Directive):** What the proxy does — Harvest, Mend, etc.
- **Inner Dial (Context):** The environment — Dwarven Forge, Elven Woods, etc.
- **Center Bezel (Guardrail):** Strict constraints — Max Yield, Do Not Disturb, etc.
- Miss the timing window → get a *Slipped* proxy → chaos multiplier activated

### 🌈 Iridescent Aesthetics
- 16-bit pixel art with custom holographic shaders for all divine magic
- Odin's **Bifrost Dash** leaves a 4-frame rainbow smear trail
- **Presence Aura** causes the environment to bloom when Odin is nearby
- **Gungnir Resonance** shockwave resets entire chaos zones in one sweep

### 💎 Economy & Diplomacy
- Three-bucket resource allocation: **Upkeep** → **Trade Routes** → **Asgard Vault**
- Seasonal **Grand Trade Moot**: cross-realm diplomatic crises every 7 in-game days
- **Mediation Table** UI: physically balance a scale to buy down regent anger and earn **Treaty-Runes**

### 🌍 The Nine Realms (MVP)
| Realm | Vibe | Chaos State |
|:------|:-----|:------------|
| **Asgard** | Majestic golden hub & command center | — (home base) |
| **Nidavellir** | High-performance industrial dwarven forge | *The Deep Freeze* — ice encases machinery |
| **Alfheim** | Ethereal bioluminescent elven gardens | *The Overgrowth* — thorny vines choke nodes |

*Phase 2 expands to Muspelheim, Svartalfheim, Vanaheim, Jotunheim, Helheim, and Midgard.*

---

## 🛠️ Tech Stack

| Layer | Technology |
|:------|:-----------|
| Game Engine | [Godot 4.6](https://godotengine.org/) (GDScript) |
| Viewport | 640×360, pixel-perfect scaling |
| Rendering | GL Compatibility (cross-platform) |
| Save System | Local JSON with UNIX timestamps |
| Dialogue | Pre-generated JSON banks (zero runtime AI tokens) |
| Platform | PC / Mac / Linux |

### Core Singletons (Autoloads)
- **`TimeEngine.gd`** — Offline duration calculation via OS timestamp diff
- **`SaveManager.gd`** — Serializes inventory, proxy locations, and realm states
- **`EconomyManager.gd`** — Trade routes, Grand Trade Moot scheduling, diplomatic state

---

## 📁 Project Structure

```
CozyOdin/
├── project/                    # Godot 4 project root
│   ├── project.godot           # Engine config & input map
│   ├── systems/                # Core singletons (TimeEngine, SaveManager, EconomyManager)
│   ├── entities/               # Odin, Proxy, HarvestableNode scenes & scripts
│   ├── levels/                 # Asgard, Nidavellir, Alfheim scenes
│   └── ui/                     # HUD, AlignmentBezel, MediationTable
├── assets/
│   ├── sprites/                # 16-bit pixel art (see Sprite Manifest)
│   └── docs/
│       └── sprite_manifest.md  # Asset catalog & Aseprite implementation guide
└── docs/
    └── Master_PRD.md           # Full product requirements document (V8)
```

---

## 🚀 Getting Started

### Prerequisites
- [Godot Engine 4.6](https://godotengine.org/download) (standard or .NET build)

### Running the Game
1. Clone this repository:
   ```bash
   git clone https://github.com/Jordannewman90/CozyOdin.git
   ```
2. Open **Godot 4.6** → click **Import** → navigate to `project/project.godot`
3. Hit **▶ Play** — the game boots into Asgard

### Adding Art Assets
All placeholder sprites need to be replaced with 16-bit pixel art (`.png`, transparent background). See [`assets/docs/sprite_manifest.md`](assets/docs/sprite_manifest.md) for the full catalog, recommended resolution per asset, and import instructions.

---

## 🗺️ Roadmap

- [x] Core Offline Time Engine
- [x] Asgard hub level
- [x] Nidavellir realm + Bifrost travel
- [x] Alfheim realm
- [x] Alignment Bezel mini-game
- [x] Proxy deployment & offline simulation
- [x] Economy Manager + Grand Trade Moot
- [x] Iridescent shader + Ghost Trail VFX
- [ ] Sprite art pass (all placeholder assets)
- [ ] Kinetic Resonance stamina system (Deep Wind throne mechanic)
- [ ] Mediation Table full UI implementation
- [ ] Phase 2 realms (Muspelheim, Jotunheim, etc.)
- [ ] Steam SDK integration & build pipeline

---

## 📄 License

Private / All Rights Reserved — *Jordan Newman, 2026*
