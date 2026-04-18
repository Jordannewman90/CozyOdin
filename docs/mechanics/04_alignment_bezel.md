# Alignment Bezel (Proxy Programming Mini-Game)

**Category:** Mechanics — UI System
**Status:** ✅ Implemented (V1)
**Related Code:** `project/ui/alignment_bezel/AlignmentBezel.gd`
**Supersedes:** [features/02_Alignment_Bezel_UI.md](../features/02_Alignment_Bezel_UI.md)

---

## 1. Overview

The Alignment Bezel is a timing-based mini-game that determines how well a Runic Proxy is programmed. It's designed to feel like calibrating a high-end mechanical chronograph — tactile, precise, and satisfying.

---

## 2. The Three-Dial System

| Ring | Name | Function | Speed | Tolerance |
|:-----|:-----|:---------|:------|:----------|
| Outer | **Directive** | What the proxy does (Harvest, Mend, Clear) | 45°/sec | ±15° |
| Inner | **Context** | The environment (Dwarven, Elven) | 120°/sec | ±15° |
| Center | **Guardrail** | Safety constraints (Max Yield, Do Not Disturb) | 240°/sec | ±8° |

### Lock Mechanic
- Player presses `E` / `ui_accept` to lock the current ring.
- **Alignment Accuracy**: The system calculates the angular offset from 0°.
    - **Perfect Lock (±5°)**: 100% Alignment.
    - **Near Miss (±20°)**: 70% Alignment.
    - **Slipped State (>45°)**: 25% Alignment.
- **Visual Feedback**: Green (Perfect) → Yellow (Close) → Red (Slipped).
- **No Chaos Penalty**: Proxies no longer increase realm chaos on a slip; they simply become less efficient.

### Efficiency Spectrum
A Proxy's final productivity is the average of its three ring scores.
- **95%+**: Divine Sync (100% Efficiency + Potential Rare Drop)
- **70-94%**: Stable (75% Efficiency)
- **40-69%**: Distracted (40% Efficiency)
- **0-39%**: Clumsy (10% Efficiency)

### Current Ring Options
| Ring | Current Options | Notes |
|:-----|:---------------|:------|
| Outer (Directive) | `Harvest` | Only one directive implemented |
| Inner (Context) | `Dwarven` | Only one context; defaults to Dwarven on success |
| Center (Guardrail) | `Safe` | Only one guardrail implemented |

---

## 3. Push-Your-Luck (Re-Spin)

- If a ring slips, player can spend **20% Stamina** to unlock and re-spin.
- **Not yet implemented.** Currently a slip is permanent and the Proxy is flagged buggy.

---

## 4. Current Implementation Audit

### What Works
- ✅ Three rings rotate at correct speeds
- ✅ Input timing detection with configurable tolerance windows
- ✅ Visual feedback: green (perfect) / red (slipped) modulation
- ✅ Screen shake on failure (position-based tween)
- ✅ Snap-to-zero tween on perfect lock
- ✅ `configuration_locked` signal emitted on completion
- ✅ HUD receives signal and applies configuration to nearest Proxy

### What's Missing
- 🔴 Only one directive/context/guardrail option — no actual variety
- 🔴 No stamina integration (re-spin mechanic)
- 🔴 No audio (ratcheting spin, thud on lock, screech on fail)
- 🔴 Rune labels don't dynamically display what you're locking
- 🔴 No visual indicator showing the "target zone" on each ring
- 🔴 HUD hardcodes applying config to the first proxy found (not targeted)

---

## Active Task List

- [ ] Implement efficiency scaling math: Calculate average offset of all 3 rings
- [ ] Implement "Divine Sync" bonus: 5% rare material chance at 100% alignment
- [ ] Add "Target Zone" visual indicator (glow/highlight at 12 o'clock position)
- [ ] Add dynamic label showing current rune name as ring spins
- [ ] Implement re-tuning mechanic with stamina cost at the Asgard Bench
- [ ] Add audio: spin ratchet, lock thud, fail "clunk" (not screech)
- [ ] Update Proxy visuals based on alignment tier (Glow vs Sparks vs Trips)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Alignment Bezel design doc with full implementation audit. Identified that the mechanic works but lacks content variety (single option per ring). | Separating "mechanic works" from "mechanic is fun" — the timing system is solid but needs real choices to be meaningful gameplay. |
