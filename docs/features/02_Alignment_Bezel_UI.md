# Feature PRD: Alignment Bezel UI

**Parent Module:** Automation & UI
**Target Component:** `project/ui/alignment_bezel/`

## 1. Overview
The Alignment Bezel is the configuration mini-game required to program Runic Proxies. It is a tactile, rotating UI designed to feel like a high-end mechanical chronograph. Success yields a perfectly optimized Proxy; failure yields a "buggy" Proxy that operates poorly and damages local realm relations.

## 2. Visual & Audio Design
* **Visuals:** Dark brushed metal rings, neon-holographic runic inserts. When a rune locks perfectly, it pulses with Iridescent shader effects.
* **Audio:** Heavy, mechanical ratcheting sounds (`click_clack.wav`) as rings spin. A deep resonant "thud" on a successful lock, and a grinding metallic screech on a failure.

## 3. Core Mechanics

### The Rotational Math
The UI consists of three concentric rings that spin automatically when the UI is opened.
* **Ring 1 (Outer - Directive):** Dictates the action (Harvest, Mend, Clear). Rotates slowly (e.g., 45 degrees/sec).
* **Ring 2 (Inner - Context):** Dictates the environment (Dwarven Forge, Elven Woods). Rotates at medium speed (e.g., 90 degrees/sec).
* **Ring 3 (Center - Guardrail):** Dictates the safety constraints (Max Yield 50, Leave 10 in storage). Rotates rapidly (e.g., 180 degrees/sec).

### The Input Window
The player must press the "Lock" button when the highlighted Rune on the spinning dial passes exactly through the 12 o'clock "Scanner" position.
* **Perfect Lock:** +/- 5 degree margin of error. Grants 100% Proxy efficiency.
* **Slipped State (Failure):** Missed window locks in the adjacent, incorrect rune. Grants 10-25% efficiency and flags the Proxy as "Buggy".

### Push-Your-Luck Stamina Cost
If the player locks a bad rune on Ring 1 or 2, they can choose to spend a chunk of Odin's Stamina to "Unlock" and re-spin the Bezel. This prevents UI frustration but physically drains the player character.

## 4. Required Godot Nodes & Data Structures
* `Control` Node (Base Layout)
* `TextureRect` (Pivot points centered, representing the 3 Rings).
* `AnimationPlayer` (For UI screen-shake juice and locking sparks).
* `Tween` (For handling the rotation mathematically rather than relying on `_process(delta)` physics).
