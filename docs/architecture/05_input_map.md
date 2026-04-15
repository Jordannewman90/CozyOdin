# Input Map & Controls

**Category:** Architecture — Input
**Status:** ✅ Defined in project.godot
**Related Code:** `project/project.godot` [input] section

---

## 1. Current Input Map

| Action | Physical Key | Used By | Purpose |
|:-------|:------------|:--------|:--------|
| `move_left` | `A` | `Odin.gd` | Movement |
| `move_right` | `D` | `Odin.gd` | Movement |
| `move_up` | `W` | `Odin.gd` | Movement |
| `move_down` | `S` | `Odin.gd` | Movement |
| `interact` | `E` | `Odin.gd`, `AlignmentBezel.gd` | Harvest, pick up proxy, lock bezel ring |
| `deploy` | `Q` | `Odin.gd` | Deploy proxy from squad |

---

## 2. Planned Input Actions

| Action | Proposed Key | Purpose |
|:-------|:------------|:--------|
| `bifrost_dash` | `Shift` | Bifrost Step (short-range teleport) |
| `gungnir` | `Space` | Gungnir Resonance (AoE shockwave) |
| `open_map` | `M` or `Tab` | Open Bifrost realm selector / world map |
| `open_inventory` | `I` | Open Three-Bucket resource allocation UI |
| `pause` | `Escape` | Pause menu |

---

## 3. Gamepad Support (Future)

| Action | Gamepad |
|:-------|:--------|
| Movement | Left Stick |
| Interact | A / Cross |
| Deploy | X / Square |
| Dash | RB / R1 |
| Gungnir | LB / L1 |
| Map | Back / Select |

---

## Active Task List

- [ ] Add `bifrost_dash`, `gungnir`, `open_map`, `open_inventory`, `pause` to project.godot
- [ ] Implement pause menu
- [ ] Design controller layout and add gamepad bindings
- [ ] Create in-game controls reference / key binding screen
- [ ] Consider key rebinding support

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Input Map doc by parsing project.godot. Identified 6 existing bindings and proposed 5 additional. | Centralizing input documentation prevents binding conflicts and ensures new abilities get proper keybinds before implementation. |
