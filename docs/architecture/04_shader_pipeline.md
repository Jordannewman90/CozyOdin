# Shader & VFX Pipeline

**Category:** Architecture — Visual Systems
**Status:** 🟡 Partially Implemented
**Related Code:** `project/systems/Iridescent.gdshader`, `project/entities/player/GhostTrail.gd`

---

## 1. Iridescent Shader

**File:** `project/systems/Iridescent.gdshader`
**Type:** `canvas_item` fragment shader

### Parameters
| Uniform | Type | Range | Default | Purpose |
|:--------|:-----|:------|:--------|:--------|
| `speed` | float | 0.1–5.0 | 1.0 | Rainbow cycle speed |
| `intensity` | float | 0.0–1.0 | 0.5 | Blend strength vs. base texture |
| `holographic_strength` | float | 0.0–1.0 | 0.3 | Vertical scanline glimmer |

### How It Works
1. Generates a time-shifted RGB rainbow based on `UV.y` position
2. Blends rainbow into original texture color (preserving alpha)
3. Adds a vertical scanline "glimmer" effect for holographic feel

### Applied To
| Entity | Intensity | Speed | Notes |
|:-------|:----------|:------|:------|
| Odin | 0.4 | 2.0 | Always active — divine presence |
| Proxies | 0.3 | (default) | Subtle glow |
| HarvestableNodes | 0.3 | (default) | Resource glow |
| BifrostTransit | 0.8 | 3.0 | High intensity portal shimmer |

---

## 2. Ghost Trail System

**File:** `project/entities/player/GhostTrail.gd`
**Spawned By:** `Odin.gd` during movement

### Behavior
- Creates a `Sprite2D` clone of Odin at current position
- Applies the Iridescent shader (same material as Odin)
- Fades out over ~0.3 seconds via tween
- Spawn rate: every 0.05 seconds during movement

### Current Issues
- Trail uses Odin's current shader material, not color-shifted variants
- PRD specifies 4 distinct colors: Cyan → Magenta → Violet → Gold
- Trail doesn't cost stamina (should only appear during Bifrost Dash, not regular walking)

---

## 3. Planned VFX (Not Yet Implemented)

| VFX | Description | Trigger |
|:----|:-----------|:--------|
| **Presence Aura** | Environmental sprites bloom near Odin | Area2D proximity |
| **Gungnir Shockwave** | Expanding rainbow circle | Gungnir ability activation |
| **Prismatic Transmutation** | Geyser of colorful light from harvested node | Charged harvest |
| **Chaos Overlay Spawner** | Ice/vine tile sprites over TileMap | Chaos percentage thresholds |
| **Proxy Palette Swapper** | Dynamic sprite recolor based on context | Bezel configuration |
| **DivineSpark Absorption** | Spark particles flow toward Odin | Walking through sparks |

---

## Active Task List

- [ ] Separate Ghost Trail from regular movement (make it Bifrost Dash only)
- [ ] Implement 4-color trail sequence (Cyan → Magenta → Violet → Gold)
- [ ] Create Presence Aura shader/script (bloom nearby sprites)
- [ ] Create Gungnir Resonance expanding ring VFX
- [ ] Create Prismatic Transmutation harvest VFX
- [ ] Implement Chaos Overlay spawner (ice tiles, vine tiles)
- [ ] Add screen-shake utility function for high-impact moments
- [ ] Create particle emitter presets for: sparks, dust, pollen, steam

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Shader & VFX Pipeline doc. Audited Iridescent shader parameters and Ghost Trail behavior. Identified that trail runs during ALL movement, not just dashing. | VFX is what makes this game feel "divine." The Iridescent shader is the foundation — everything else builds on it. But the Ghost Trail needs to be gated behind the dash ability to maintain visual hierarchy. |
