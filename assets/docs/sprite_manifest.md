# Project All-Sleep: Sprite Manifest & Implementation Guide 🎨

This document catalogs every visual asset required to complete the **Vertical Slice** of Project All-Sleep. All sprites should be designed at **16-bit resolution** (16x16 or 32x32 pixels) with a high-contrast palette to complement the iridescent shaders.

---

## 🏗️ Technical Requirements
*   **Format**: `.png` (Transparent background)
*   **Grid**: 16x16 (World Tiles), 32x32 (Characters/Nodes)
*   **Scale**: 1:1 (Godot handles pixel-perfect scaling internally)
*   **Art Style**: Cozy, Ghibli-inspired, high-fantasy tech.

---

## 1. The All-Father (Odin)
Location: `assets/sprites/player/`

| Filename | Type | Animation | Frames | Description |
| :--- | :--- | :--- | :--- | :--- |
| `odin_idle_down.png` | Sheet | Loop | 4 | Standing still, heavy robes slightly shifting. |
| `odin_walk_down.png` | Sheet | Loop | 4 | Walking towards camera. |
| `odin_walk_up.png` | Sheet | Loop | 4 | Walking away from camera. |
| `odin_walk_side.png` | Sheet | Loop | 4 | Walking left/right (Flip L in engine). |
| `odin_exhausted.png` | Sprite | Static | 1 | Slumped posture for when stamina is zero. |
| `odin_interact.png` | Sheet | Burst | 3 | Swing animation for manual harvesting. |

---

## 2. Runic Proxies (Golems)
Location: `assets/sprites/proxies/`

| Filename | Type | Animation | Frames | Description |
| :--- | :--- | :--- | :--- | :--- |
| `proxy_dwarven.png` | Sheet | Idle/Work | 4 | Metallic, boxy, steam-leaking joints. |
| `proxy_elven.png` | Sheet | Idle/Work | 4 | Fluid, wooden/organic, glowing vines. |
| `proxy_buggy.png` | Sheet | Glitch | 2 | Red-glowing eyes, occasional static frame. |
| `proxy_picked_up.png`| Sprite | Static | 1 | Folded "carry" mode when Odin holds them. |

---

## 3. Resource Nodes
Location: `assets/sprites/resources/`

| Filename | Type | Animation | Frames | Description |
| :--- | :--- | :--- | :--- | :--- |
| `node_star_iron.png` | Sheet | Pulse | 3 | Molten metallic rock with inner glow. |
| `node_mana_sap.png` | Sheet | Pulse | 3 | Ancient tree trunk with glowing liquid sap. |
| `node_depleted.png` | Sprite | Static | 1 | Grey, cracked remains of a harvested node. |
| `particle_spark.png` | Sprite | Static | 1 | Single glow pixel for impact effects. |

---

## 4. World & Environment
Location: `assets/sprites/world/`

| Filename | Type | Animation | Frames | Description |
| :--- | :--- | :--- | :--- | :--- |
| `bifrost_spiral.png` | Sheet | Loop | 8 | Circular iridescent portal swirling effect. |
| `tile_asgard.png` | Sprite | Static | 1 | Crystalline white/gold floor tile. |
| `tile_nidavellir.png` | Sprite | Static | 1 | Molten dark rock/metal floor tile. |
| `tile_alfheim.png` | Sprite | Static | 1 | Vibrant moss/grass floor tile. |

---

## 5. UI & Interaction
Location: `assets/sprites/ui/`

| Filename | Type | Animation | Frames | Description |
| :--- | :--- | :--- | :--- | :--- |
| `bezel_dial_outer.png`| Sprite | Static | 1 | Largest gear ring for Alignment Bezel. |
| `bezel_dial_mid.png` | Sprite | Static | 1 | Middle gear ring. |
| `bezel_dial_inner.png`| Sprite | Static | 1 | Center core for Alignment Bezel. |
| `icon_vault.png` | Sprite | Static | 1 | Small chest icon for HUD inventory. |
| `icon_moot.png` | Sprite | Static | 1 | Small scale/balance icon for Trade Moot. |

---

## 🚀 Implementation Strategy
1.  **Drafting**: Use a tool like **Aseprite** at 400% zoom.
2.  **Exporting**: Save sheets as `.png` with "Frame Tag" metadata if possible.
3.  **Importing**: Place files in their respective folders. **Godot will auto-import them.**
4.  **Replacing**: Open the scene (e.g., `Odin.tscn`), select the `Sprite2D` node, and drag your new `.png` into the `Texture` slot.

**Your Vertical Slice logic is ready. These sprites are the final layer to turn it into a Game.**
