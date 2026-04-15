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

## 3. The Odin Experience: Power & Presence

Odin’s divine power isn’t a cheat code; it is a high-end, colorful "polish" applied to a chaotic world, governed by Stamina (Tension).

### A. The Iridescent Aesthetic
When Odin channels magic, the 16-bit palette shifts from grounded, earthy tones to high-contrast cyan, magenta, violet, and brilliant gold.
* **The Presence Aura:** Odin's passive proximity causes the environment to bloom—mana-flowers glow brighter and dwarven machinery hums flawlessly when he walks by.

### B. Divine Abilities
* **The Bifrost Step:** A short-range mobility dash leaving behind a 4-frame "smear" of rainbow silhouettes and holographic pixel sparks.
* **Prismatic Transmutation:** A charged harvesting strike. The node shatters into a geyser of colorful light, instantly purifying raw materials into refined ingots.
* **The Gungnir Resonance:** A massive shockwave of liquid-rainbow light that instantly "re-codes" chaotic tiles (Ice/Weeds) back into their pristine, healthy state.

### C. Kinetic Resonance (The Stamina Loop)
Instead of consuming food items, Odin manages energy through a momentum-based "Flow State."
* **Spark Absorption:** Shattering chaos tiles releases holographic "Divine Sparks." Walking through these freshly blooming areas winds Odin’s Stamina bar back up.
* **Peaceful Trickle:** Walking through a perfectly healthy (0% Chaos) realm provides a slow, passive stamina regeneration.
* **The Deep Wind (Hard Reset):** When completely tapped out, Odin sits on the Hlidskjalf throne. The player holds a button to manually "wind" his energy back up, accompanied by a heavy, mechanical ratcheting sound.

---

## 4. Economy & Logistical Supply Chain

A strategic inventory management system where harvested resources must be meticulously allocated before logging off:
* **Realm Upkeep (The Burn Rate):** Resources required to remain in the realm's local storage to prevent immediate offline chaos (e.g., Elves need Sun-Silk left behind to fend off weeds).
* **Trade Routes (Dependencies):** Resources automatically exported to maintain cross-border relations (e.g., Elves exporting Mana-Sap to cool the Dwarven forges).
* **The Asgard Vault (Emergency Fund):** The personal surplus brought back to the hub, used for tool upgrades, crafting Proxies, and paying diplomatic fines.

---

## 5. Automation: Proxies & The Alignment Bezel

Manual grinding is eventually replaced by Runic Proxies—programmable, 16-bit golem agents.

### The Alignment Bezel (Configuration Mini-Game)
A timing-based, tactile UI resembling a high-end mechanical chronograph used to program Proxies.
* **The 3-Dial System:** Dials spin at varying speeds.
    * **Outer Dial (Directive):** What the proxy does (e.g., Harvest, Mend). Slowest rotation.
    * **Inner Dial (Context):** The environment (e.g., Dwarven Forge, Elven Woods). Medium rotation.
    * **Center Bezel (Guardrail):** Strict constraints (e.g., Max Yield, Do Not Disturb). Fastest rotation.
* **The "Slipped" State:** Missing the input timing locks in the wrong Rune. The Proxy becomes "buggy," displaying a twitching idle animation, harvesting at 10-25% capacity, and multiplying the Realm's Chaos Escalation rate.
* **Push-Your-Luck:** Unlocking the Bezel to re-spin the wheels costs Stamina.

---

## 6. Diplomacy & The Mediation Table

Realms rely on your automated exports. When a Proxy acts out of context (e.g., a Dwarf proxy strip-mining an Elven forest), dependencies break.

* **The Grand Trade Moot:** A scheduled, seasonal event where accumulated cross-realm friction boils over into active Rifts.
* **The Mediation Table:** Odin invites aggrieved Regents to Asgard. Using a physical scale UI, the player pays resources out of the Asgard Vault to buy down their anger.
* **The Treaty-Rune:** Successfully balancing the scale yields a Treaty-Rune. Slotted into a Proxy's Bezel, it acts as an ultimate Guardrail, granting 100% immunity to cultural offenses in a specific realm for 3 real-world days.

---

## 7. Realms & Environmental Design

**The "Theme Park" Sizing Philosophy:** Realms contain no empty space. They are dense, highly themed hubs (2 to 3 standard screens in size). Navigation from the entrance to the furthest node takes under 15 seconds.

### Phase 1 Scope (The MVP Realms)
1. **Asgard (The Central Hub)**
   * **The Vibe:** Majestic, golden, high-end logistical command center.
   * **Included Elements:** The Hlidskjalf (Throne), Proxy Crafting Bench, The Asgard Vault, Mediation Table, and the Bifrost Terminal.
2. **Nidavellir (Realm of the Dwarves)**
   * **The Vibe:** High-performance industrial forge. Precision engineering, anodized metal, matte black finishes, direct-drive rotary motors, and heavy torque.
   * **Included Elements:** Brokk & Eitri’s Shop, Star-Iron Nodes, active Thermal Vents.
   * **Chaos State:** The Deep Freeze. Pale blue ice encases machinery; requires shattering to restart vents.
3. **Alfheim (Realm of the Light Elves)**
   * **The Vibe:** Ethereal, tranquil, bioluminescent manicured gardens.
   * **Included Elements:** Dagr’s Nursery, Mana-Sap Trees, Sun-Silk Flowers.
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
