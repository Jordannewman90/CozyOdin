# Feature PRD: Odin Abilities & VFX

**Parent Module:** Player Experience
**Target Component:** `project/entities/player/`, Custom Shaders

## 1. Overview
Odin is the "polish" in a chaotic world. His presence and abilities aren't just for gameplay; they defines the **Iridescent Aesthetic** of the game.

## 2. Divine Abilities

### The Presence Aura
* **Logic:** An `Area2D` circle around Odin.
* **Effect:** Environmental sprites (flowers, machinery) inside this circle receive a +20% Luminosity boost. Mana-flowers "bloom" (an additional animation frame) when Odin is near. This makes the world feel "alive" just by Odin being there.

### The Bifrost Step (Dash)
* **Mechanic:** Short-range teleport.
* **VFX:** Creates a 4-frame "smear" trail. Each frame is a silhouette of Odin in a different holographic color (Cyan -> Magenta -> Violet -> Gold).
* **Cost:** Consumes 10% Stamina.

### Gungnir Resonance
* **Mechanic:** A massive area-of-effect shockwave.
* **VFX:** A circular ripple of liquid-rainbow light expanding from Odin.
* **Logic:** Instantly changes the TileID of any "Chaos Tiles" (Ice/Weeds) back to "Healthy" state within a 3-screen radius.

## 3. Kinetic Resonance (Stamina)
Odin's energy comes from his "Flow State."
* **Divine Sparks:** Clearing chaos tiles releases floating holographic particles. Walking through these restores 5% Stamina.
* **The Deep Wind:** Hand-held mechanical ratcheting interaction at the throne. Requires holding `E` while a circular meter fills. UI displays a physical "winding" animation.

## 4. Technical Requirements
* **Iridescent Shader:** A vertex/fragment shader that cycles colors based on a noise texture.
* **Ghost Trail Component:** A reusable script that instances `Sprite2D` silhouettes and fades them out to create the Bifrost dash trail.
