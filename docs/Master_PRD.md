# Product Requirements Document (PRD)

**Project Name:** Project All-Sleep (Working Title)
**Document Status:** Master Blueprint (V8 - Complete Feature Set)
**Genre:** Cozy Time-Management / Farming Sim / Automation Puzzle
**Target Platform:** PC / Mac / Linux (Offline Standalone Executable)
**Art Style:** 16-bit Pixel Art (Featuring Iridescent/Holographic VFX)
**Estimated MVP Dev Time:** 90–140 Hours

---

## 1. Executive Summary

Project All-Sleep is an offline-first, cozy management game where the player acts as an exhausted Odin desperately seeking a true vacation. The core mechanic is the "All-Sleep", a background system that tracks the real-world time the player is offline. The overarching objective is to achieve the "Perfect System"—automating a complex supply chain across the Nine Realms using programmable Runic Proxies so flawlessly that the universe no longer falls into chaos when Odin closes the game.

---

## 2. Core Gameplay Loop

1. **The Wake-Up:** The game calculates real-world offline duration upon boot via local OS timestamps.
2. **The Status Report:** Review the Raven Dashboard (Hugin & Munin) for incident reports, broken dependencies, and realm Chaos Levels.
3. **Investigate & Restore:** Travel to realms to clear environmental hazards caused by offline decay or buggy proxies, utilizing Kinetic Resonance to maintain energy.
4. **Manage the Supply Chain:** Allocate harvested resources into three distinct economic buckets (Upkeep, Trade, Vault) to prep for the next sleep cycle.
5. **Mediation (Seasonal):** Every 7 in-game days during the "Grand Trade Moot," balance diplomatic grievances caused by cross-realm trade friction.
6. **Deploy & Configure:** Construct and program Runic Proxies via the "Alignment Bezel" mini-game to automate localized tasks.
7. **The All-Sleep:** Spend remaining Stamina, save, and close the game to restart the offline timer.

---

## 3. Living World: The Population Scaler

To provide visual feedback for realm restoration, the number of active NPCs scales dynamically with the local Chaos Level.

### A. Population Density
| Chaos % | NPC Count | Behavior |
|:--------|:----------|:---------|
| **0 - 10%** | 5 - 8 | Thriving. Citizens are dancing, sitting, or chatting. |
| **11 - 40%**| 2 - 3 | Functional. Citizens are walking between workstations. |
| **41 - 70%**| 1 | Survival. A lone scout or worried citizen near the portal. |
| **71 - 100%**| 0 | Abandoned. The realm is too dangerous for civilians. |

### B. The Bark System
Citizens do not have dialogue trees. They use overhead "Bark Bubbles" that trigger as Odin passes by, offering gratitude or commentary on the realm's health.

---

## 4. The Odin Experience: Power & Presence

Odin’s divine power isn’t a cheat code; it is a high-end, colorful "polish" applied to a chaotic world, governed by Stamina (Tension).

### A. The Iridescent Aesthetic & The Fade
When Odin channels magic, the 16-bit palette shifts to high-contrast cyan, magenta, violet, and gold.
*   **The Stamina Fade:** As Odin’s stamina drops, his magical armor (and the rainbow VFX) fades to a heavy, stone-gray. Only his "human" features (beard, helmet) remain vibrant.
*   **The Presence Aura:** Odin's passive proximity causes the environment to bloom—mana-flowers glow brighter and dwarven machinery hums flawlessly when he walks by.

### B. The Two-Voice System
*   **Public (The All-Father):** Stoic, silent, and commanding. He interacts with realm NPCs through nods and gestures.
*   **Private (The Husband):** Only speaks openly to **Frigg.** In private, he is dry, cynical, and vents about the frustrations of managing the realms.
*   **Divine Intuition:** Player-only internal monologue (Thought Bubbles) triggered by "Husband Favors" and environmental clues.

---

## 4. Divine Harmony & Home Life

A deep relationship system with Frigg that rewards "Average Husband Tasks" (Divine version).

*   **The Harmony Gauge:** A hidden metric of the relationship. High Harmony grants stamina recovery buffs and "Divine Ambrosia" gifts from Frigg.
*   **Discovery Layer:** Tasks are discovered through observation (sighs, broken vases, overhearing conversations), not a quest log.

---

## 5. Automation: Proxies & The Asgardian Temple

### The Asgardian Temple Expansion (Creative Expression)
The hub expands as Odin stabilizes the realms and improves his Harmony with Frigg.
*   **Tier 1: The Command Center (Start):** Functional throne room and Bifrost terminal.
*   **Tier 2: The Hearth & Workshop:** Unlock after Nidavellir. Adds the Proxy Smithing Wing.
*   **Tier 3: The Queen’s Balcony:** Unlock after Alfheim. Adds a customizable garden for Frigg.
*   **Tier 4: The Gallery of the All-Father:** Endgame trophy room for Gungnir and realm achievements.

---

## 6. The Search for the Shattered Spear (Narrative Arc)

*   **Act I Goal:** Gungnir is missing/shattered. Odin must "pull weeds by hand" and investigate Loki's tracks in Nidavellir and Alfheim to re-forge the staff.
*   **The Payoff:** Restoring Gungnir restores Odin's full rainbow palette and unlocks his magical move-set (Dash, Transmutation).

---

## 7. Realms & Environmental Design

**The "Theme Park" Sizing Philosophy:** Realms contain no empty space. They are dense, highly themed hubs (2 to 3 standard screens in size). Navigation from the entrance to the furthest node takes under 15 seconds.

### Phase 1 Scope (The MVP Realms)
1. **Asgard (The Central Hub)**
   * **The Vibe:** Majestic, golden, high-end logistical command center.
   * **Included Elements:** The Hlidskjalf (Throne), Proxy Crafting Bench, The Asgard Vault, Mediation Table, The Royal Chambers, and The Queen's Balcony.
2. **Nidavellir (Realm of the Dwarves)**
   * **The Vibe:** High-performance industrial forge. Precision engineering, anodized metal, matte black finishes, direct-drive rotary motors, and heavy torque.
   * **Narrative:** Home to the "Inert Shaft" of Gungnir (used as a stirring stick). Loki's "tags" appear in the mines.
   * **Chaos State:** The Deep Freeze. Pale blue ice encases machinery; requires shattering to restart vents.
3. **Alfheim (Realm of the Light Elves)**
   * **The Vibe:** Ethereal, tranquil, bioluminescent manicured gardens.
   * **Included Elements:** Dagr’s Nursery, Mana-Sap Trees, Sun-Silk Flowers.
   * **Narrative:** Where the spear is "Re-vibed" with Mana-Sap. Loki's "prank vines" grow here.
   * **Chaos State:** The Overgrowth. Aggressive, thorny vines choke out nodes and require pruning.
4. **The Tease (Future Content Breadcrumbs)**
   * Unplayable realms appear on the Bifrost UI with visual error states (e.g., Jotunheim covered in unbreakable ice).
   * Proxies occasionally dig up "useless" teaser drops (e.g., Cinder-Seeds needing volcanic heat).

### Phase 2 Scope (Expansion Realms)
* **Muspelheim (Fire):** Methodical heat requiring precise temperature control (Cinder-Wheat, Cooling Totems).
* **Svartalfheim (Dark Elves):** Dimly lit, precision-focused clockworks and shadow-gem mines.
* **Vanaheim (Vanir):** Lush, rain-heavy wetlands with bubbling "Wild Rot."
* **Jotunheim (Giants):** Massive scale, imposing ice cliffs, and "Eternal Fog."
* **Helheim (Underworld):** Gloomy mist-covered archive of forgotten things.
* **Midgard (Human Realm):** Pastoral village featuring a bewildered human "vibe coder" NPC who accidentally opened a local portal.

---

## 8. Technical Architecture & Development Workflow

* **Game Engine:** Godot Engine 4.x. Plain-text file structures (`.tscn`/`.gd`) make it the ideal environment for AI-assisted script generation via the internal IDE.
* **Platform Pipeline:** Primary development, IDE integration, and "vibe coding" performed on macOS to leverage local terminal efficiency. GitHub syncing to a Windows rig for Steam SDK integration, QA testing, and verifying Iridescent Shader rendering on PC GPUs.
* **Offline Time Engine:** The client writes a UNIX timestamp to a local JSON save file upon quitting and compares it to the OS clock on boot to calculate the `offline_duration`.
* **Zero-Token AI Dialogue:** Massive JSON dialogue banks are pre-generated during development. At runtime, Godot randomizes string pulls based on offline time and chaos variables, simulating dynamic LLM responses fully offline.

---

## 9. Art Direction & Sprite Manifest

* **Visual Style:** 16-bit pixel art.
* **UI & HUD:** Alignment Bezel (dark metal rings, neon inserts, spark feedback), Raven Dashboard, Mediation Scale.
* **Characters:** Odin (Walk/Idle, tool animations), Heimdall, Dagr, Brokk & Eitri. High-res emotional portrait boxes.
* **Proxies:** Base chunky golem chassis. Context overlays (e.g., dark iron + exhaust for Dwarves). Buggy/twitching idle states.
* **Environments:** Golden Asgard, Bioluminescent Alfheim, High-tech cavernous Nidavellir.
* **VFX & Juice:** Iridescent shaders for divine magic, resource pop-ups (+1 text), tool swoosh smears, movement dust, teleportation spawn beams, "blooming" environmental shifts.

---

## 10. Core Game Features (Dev Task List)

### A. Core Systems & Architecture
* **Offline Time Calculator:** Background script comparing OS clock to JSON save-state timestamps to calculate total offline delta.
* **State Manager:** Serialization logic to write inventory, proxy locations, and realm states to local storage.
* **JSON Dialogue Parser:** System to fetch and randomize NPC text strings based on time-away and realm chaos variables.
* **Bifrost Scene Manager:** Fast-travel logic linking realm scenes, including locked/error states.

### B. Player & Divine Mechanics
* **Kinetic Resonance Engine:** Logic for spawning Divine Sparks from cleared chaos tiles and triggering the "Deep Wind" UI at the throne.
* **Divine Controller:** Movement + Bifrost Dash smear-frame logic and stamina drain.
* **Presence Aura Script:** Area2D checks that swap environmental sprite luminosity based on Odin’s proximity.
* **Gungnir Resonance:** Circular Area2D shockwave that resets chaos tile IDs in a massive radius.

### C. Automation & AI Logic
* **Proxy Deployment Logic:** System to instantiate a proxy, assign coordinates, and bind its Bezel configuration to that specific instance.
* **Resource Simulation:** Background math allowing proxies to generate resources over time based on efficiency multipliers (50%, 25%, 10%).
* **Chaos Escalation Math:** Global timer increasing realm deterioration, heavily multiplied by deployed "buggy" proxies.

### D. UI & Mini-Games
* **Alignment Bezel Controller:** Rotating 3-ring chronograph logic. Includes input-timing windows, speed variables, UI screen-shake juice, and stamina deduction.
* **Three-Bucket Inventory UI:** Interface for sorting resources into Upkeep, Trade, and Vault categories.
* **Mediation Scale UI:** Weight-based resource balancing logic triggering Treaty-Rune generation.

### E. Environment & Dynamic Visuals
* **Iridescent Shader:** Custom Godot shader applying a holographic color-cycle to Odin’s magic effects.
* **Chaos Overlay Spawner:** Script that triggers weed or ice sprites on top of existing tilemaps based on deterioration tiers.
* **Proxy Palette Swapper:** Logic to change a proxy's base sprite sheet (adding exhaust pipes, vines, etc.) based on its configured context rune.
