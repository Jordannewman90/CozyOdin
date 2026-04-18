# 🎨 Master Asset Checklist

> The definitive list of **every visual asset** that needs to be created for the Project All-Sleep vertical slice. This includes sprites, tilemaps, UI elements, VFX, portraits, and audio placeholders.
>
> **Art Spec:** 16-bit pixel art. `.png`, transparent backgrounds. 16×16 (tiles), 32×32 (characters/nodes). Cozy, Ghibli-inspired, high-fantasy tech.
>
> See also: [Sprite Manifest](../assets/docs/sprite_manifest.md) (original per-file guide with Aseprite workflow)

---

## Status Key

- ✅ Done
- 🟡 In Progress
- 🔴 Not Started
- 📋 Blocked (waiting on design decision)

---

## 1. Characters (32×32)

### Odin (The All-Father)
**Directory:** `assets/sprites/player/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `odin_idle_down.png` | Sheet | 4 | 🔴 | Standing still, robes shifting |
| `odin_walk_down.png` | Sheet | 4 | 🔴 | Walking toward camera |
| `odin_walk_up.png` | Sheet | 4 | 🔴 | Walking away from camera |
| `odin_walk_side.png` | Sheet | 4 | 🔴 | Left/right (flip L in engine) |
| `odin_exhausted.png` | Static | 1 | 🔴 | Slumped posture, zero stamina |
| `odin_interact.png` | Sheet | 3 | 🔴 | Swing animation for harvesting |
| `odin_dash_smear.png` | Sheet | 4 | 🔴 | Bifrost Dash silhouettes (Cyan→Magenta→Violet→Gold) |

### Runic Proxies (Golems)
**Directory:** `assets/sprites/proxies/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `proxy_base.png` | Sheet | 4 | 🔴 | Chunky golem chassis, idle/work cycle |
| `proxy_dwarven.png` | Sheet | 4 | 🔴 | Metallic, exhaust pipes, steam joints |
| `proxy_elven.png` | Sheet | 4 | 🔴 | Organic, wooden, glowing vine accents |
| `proxy_buggy.png` | Sheet | 2 | 🔴 | Red eyes, static glitch frame |
| `proxy_stony_idle.png` | Static | 1 | 🔴 | Grey, powered-down, motionless |
| `proxy_picked_up.png` | Static | 1 | 🔴 | Folded "carry" mode in Odin's hands |

### NPCs
**Directory:** `assets/sprites/npcs/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `heimdall_idle.png` | Sheet | 4 | 🔴 | Stoic guardian, near Bifrost |
| `dagr_idle.png` | Sheet | 4 | 🔴 | Elven caretaker, gentle demeanor |
| `brokk_idle.png` | Sheet | 4 | 🔴 | Stocky dwarf smith, hammer at side |
| `eitri_idle.png` | Sheet | 4 | 🔴 | Lean dwarf smith, precision tools |
| `frigg_idle.png` | Sheet | 4 | 🔴 | Wise goddess, reading/observing |
| `hugin.png` | Static | 1 | 🔴 | Raven sprite (thought) |
| `munin.png` | Static | 1 | 🔴 | Raven sprite (memory) |

### NPC Portraits (High-Res)
**Directory:** `assets/sprites/portraits/`

| Asset | Type | Size | Status | Notes |
|:------|:-----|:-----|:-------|:------|
| `portrait_heimdall.png` | Static | 64×64+ | 🔴 | Dialogue box portrait, neutral expression |
| `portrait_dagr.png` | Static | 64×64+ | 🔴 | Warm, welcoming expression |
| `portrait_dagr_upset.png` | Static | 64×64+ | 🔴 | Offended / Mediation state |
| `portrait_brokk.png` | Static | 64×64+ | 🔴 | Pragmatic, focused |
| `portrait_eitri.png` | Static | 64×64+ | 🔴 | Precise, analytical |

---

## 2. Resource Nodes (32×32)

**Directory:** `assets/sprites/resources/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `node_star_iron.png` | Sheet | 3 | 🔴 | Molten metallic rock, inner pulse glow |
| `node_mana_sap.png` | Sheet | 3 | 🔴 | Ancient tree trunk, glowing liquid sap |
| `node_depleted.png` | Static | 1 | 🔴 | Grey, cracked remains of harvested node |
| `particle_spark.png` | Static | 1 | 🔴 | Single glow pixel for Divine Spark impacts |
| `particle_spark_sheet.png` | Sheet | 4 | 🔴 | Animated Divine Spark (holographic float) |

---

## 3. TileMaps & Level Art (16×16 tiles)

### Asgard — The Golden Hub
**Directory:** `assets/sprites/world/asgard/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `tile_asgard_floor.png` | Tile | 🔴 | Crystalline white/gold floor |
| `tile_asgard_wall.png` | Tile | 🔴 | Golden marble walls |
| `tile_asgard_throne.png` | Tile/Object | 🔴 | Hlidskjalf throne (multi-tile) |
| `tile_asgard_vault.png` | Tile/Object | 🔴 | Treasure chest / vault visual |
| `tile_asgard_bench.png` | Tile/Object | 🔴 | Proxy Crafting Bench |
| `tile_asgard_edge.png` | Tile | 🔴 | Decorative border / cliff edge |
| **Full TileMap layout** | Scene | 🔴 | Complete Asgard level layout in Godot |

### Nidavellir — The Dwarven Forge
**Directory:** `assets/sprites/world/nidavellir/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `tile_nidavellir_floor.png` | Tile | 🔴 | Dark rock / brushed metal floor |
| `tile_nidavellir_wall.png` | Tile | 🔴 | Cavern walls with forge glow |
| `tile_nidavellir_vent.png` | Tile/Object | 🔴 | Thermal vent (active state) |
| `tile_nidavellir_vent_frozen.png` | Tile/Object | 🔴 | Thermal vent (Deep Freeze chaos) |
| `tile_nidavellir_machinery.png` | Tile/Object | 🔴 | Forge machinery / anvils |
| `tile_nidavellir_shop.png` | Tile/Object | 🔴 | Brokk & Eitri's shop counter |
| `chaos_ice_overlay.png` | Tile | 🔴 | Ice crystal overlay for Deep Freeze |
| `chaos_ice_heavy.png` | Tile | 🔴 | Dense ice (Critical chaos tier) |
| **Full TileMap layout** | Scene | 🔴 | Complete Nidavellir level layout |

### Alfheim — The Elven Gardens
**Directory:** `assets/sprites/world/alfheim/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `tile_alfheim_floor.png` | Tile | 🔴 | Vibrant moss / grass |
| `tile_alfheim_wall.png` | Tile | 🔴 | Tree bark / natural border |
| `tile_alfheim_flowers.png` | Tile/Object | 🔴 | Sun-Silk flower patches |
| `tile_alfheim_nursery.png` | Tile/Object | 🔴 | Dagr's Nursery structure |
| `tile_alfheim_pond.png` | Tile | 🔴 | Bioluminescent water |
| `chaos_vine_overlay.png` | Tile | 🔴 | Thorny vine overlay for Overgrowth |
| `chaos_vine_heavy.png` | Tile | 🔴 | Dense thorns (Critical chaos tier) |
| **Full TileMap layout** | Scene | 🔴 | Complete Alfheim level layout |

### Bifrost & Transitions
**Directory:** `assets/sprites/world/bifrost/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `bifrost_spiral.png` | Sheet | 8 | 🔴 | Circular iridescent portal swirl |
| `bifrost_locked.png` | Static | 1 | 🔴 | Locked portal (Phase 2 tease) |
| `bifrost_error_ice.png` | Static | 1 | 🔴 | Jotunheim error state overlay |
| `bifrost_error_fire.png` | Static | 1 | 🔴 | Muspelheim error state overlay |
| `bifrost_error_static.png` | Static | 1 | 🔴 | Generic "signal lost" overlay |

---

## 4. UI Elements

### HUD
**Directory:** `assets/sprites/ui/hud/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `stamina_bar_frame.png` | Static | 🔴 | Ornate bar frame (golden, divine) |
| `stamina_bar_fill.png` | Static | 🔴 | Iridescent fill texture |
| `stamina_bar_empty.png` | Static | 🔴 | Depleted state (grey/dark) |
| `icon_vault.png` | Static | 🔴 | Small chest icon for inventory |
| `icon_star_iron.png` | Static | 🔴 | Resource icon: Star-Iron |
| `icon_mana_sap.png` | Static | 🔴 | Resource icon: Mana-Sap |
| `icon_moot.png` | Static | 🔴 | Scale/balance icon for Trade Moot |
| `icon_squad.png` | Static | 🔴 | Proxy squad indicator icon |
| `button_sleep.png` | Static | 🔴 | "Go to Sleep" button skin |

### Alignment Bezel
**Directory:** `assets/sprites/ui/bezel/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `bezel_dial_outer.png` | Static | 🔴 | Largest gear ring (Directive) |
| `bezel_dial_mid.png` | Static | 🔴 | Middle gear ring (Context) |
| `bezel_dial_inner.png` | Static | 🔴 | Center core ring (Guardrail) |
| `bezel_rune_harvest.png` | Static | 🔴 | Rune icon: Harvest directive |
| `bezel_rune_mend.png` | Static | 🔴 | Rune icon: Mend directive |
| `bezel_rune_clear.png` | Static | 🔴 | Rune icon: Clear directive |
| `bezel_rune_dwarven.png` | Static | 🔴 | Rune icon: Dwarven context |
| `bezel_rune_elven.png` | Static | 🔴 | Rune icon: Elven context |
| `bezel_target_zone.png` | Static | 🔴 | 12 o'clock scanner/target highlight |
| `bezel_lock_spark.png` | Sheet | 3 | 🔴 | Perfect lock spark animation |
| `bezel_background.png` | Static | 🔴 | Dark brushed metal backdrop |

### Raven Dashboard
**Directory:** `assets/sprites/ui/dashboard/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `dashboard_bg.png` | Static | 🔴 | Parchment/scroll background |
| `dashboard_raven_hugin.png` | Static | 🔴 | Small raven icon for Hugin lines |
| `dashboard_raven_munin.png` | Static | 🔴 | Small raven icon for Munin lines |
| `dashboard_realm_indicator.png` | Static | 🔴 | Per-realm status pip (color-coded) |

### Mediation Table
**Directory:** `assets/sprites/ui/mediation/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `scale_frame.png` | Static | 🔴 | The balancing scale structure |
| `scale_pan_left.png` | Static | 🔴 | Left pan (grievance weights) |
| `scale_pan_right.png` | Static | 🔴 | Right pan (player resources) |
| `weight_grievance.png` | Static | 🔴 | Generic grievance weight icon |
| `item_slot.png` | Static | 🔴 | Draggable resource slot frame |
| `treaty_rune.png` | Static | 🔴 | Treaty-Rune reward item |

### Dialogue Box
**Directory:** `assets/sprites/ui/dialogue/`

| Asset | Type | Status | Notes |
|:------|:-----|:-------|:------|
| `dialogue_box.png` | 9-patch | 🔴 | Text box frame (dark, ornate) |
| `dialogue_arrow.png` | Static | 🔴 | "Next line" indicator arrow |
| `portrait_frame.png` | Static | 🔴 | Frame around NPC portrait |

---

## 5. VFX & Particles

**Directory:** `assets/sprites/vfx/`

| Asset | Type | Frames | Status | Notes |
|:------|:-----|:-------|:-------|:------|
| `vfx_presence_bloom.png` | Sheet | 4 | 🔴 | Environmental bloom when Odin is near |
| `vfx_gungnir_ring.png` | Sheet | 6 | 🔴 | Expanding rainbow shockwave circle |
| `vfx_transmutation.png` | Sheet | 4 | 🔴 | Geyser of colorful light (charged harvest) |
| `vfx_teleport_beam.png` | Sheet | 4 | 🔴 | Bifrost spawn/despawn beam |
| `vfx_dust_puff.png` | Sheet | 3 | 🔴 | Movement dust particles |
| `vfx_resource_popup.png` | Static | 1 | 🔴 | "+1 Star-Iron" floating text template |
| `vfx_deep_wind.png` | Sheet | 6 | 🔴 | Circular winding meter for throne regen |

---

## 6. Miscellaneous

| Asset | Directory | Type | Status | Notes |
|:------|:----------|:-----|:-------|:------|
| `icon.svg` | `project/` | Static | 🔴 | Application icon (used by Godot) |
| `splash_screen.png` | `assets/` | Static | 🔴 | Boot splash screen / logo |
| `cursor_default.png` | `assets/sprites/ui/` | Static | 📋 | Custom cursor (if desired) |

---

## Summary

| Category | Total Assets | Done | Remaining |
|:---------|:------------|:-----|:----------|
| Characters (Odin) | 7 | 0 | 7 |
| Characters (Proxies) | 6 | 0 | 6 |
| Characters (NPCs) | 6 | 0 | 6 |
| NPC Portraits | 5 | 0 | 5 |
| Resource Nodes | 5 | 0 | 5 |
| TileMaps (Asgard) | 7 | 0 | 7 |
| TileMaps (Nidavellir) | 9 | 0 | 9 |
| TileMaps (Alfheim) | 8 | 0 | 8 |
| Bifrost & Transitions | 5 | 0 | 5 |
| UI — HUD | 9 | 0 | 9 |
| UI — Alignment Bezel | 11 | 0 | 11 |
| UI — Raven Dashboard | 4 | 0 | 4 |
| UI — Mediation Table | 6 | 0 | 6 |
| UI — Dialogue Box | 3 | 0 | 3 |
| VFX & Particles | 7 | 0 | 7 |
| Miscellaneous | 3 | 0 | 3 |
| **TOTAL** | **101** | **0** | **101** |

---

## Active Task List

- [ ] Prioritize assets by implementation blocker (what's needed for first playable?)
- [ ] Define color palette swatches for each realm (Asgard gold, Nidavellir charcoal, Alfheim emerald)
- [ ] Decide on Aseprite vs. alternative pixel art tool
- [ ] Create template sprite sheet grid (16×16 and 32×32 frame guides)
- [ ] Determine if any assets can be procedurally generated (e.g., chaos overlays via shader)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Master Asset Checklist consolidating all visual assets from PRD, World Bible, and Sprite Manifest. Total: 101 assets across 16 categories. | The original `sprite_manifest.md` covered ~25 sprites. This comprehensive list ensures nothing is missed during the art pass and gives a clear scope for commissioning or AI-assisted asset generation. |
