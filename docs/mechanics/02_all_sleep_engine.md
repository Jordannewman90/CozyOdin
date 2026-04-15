# The All-Sleep Engine (Offline Time & State)

**Category:** Mechanics — Core System
**Status:** ✅ Implemented (V1)
**Related Code:** `project/systems/TimeEngine.gd`, `project/systems/SaveManager.gd`
**Supersedes:** [features/01_Time_And_State_Engine.md](../features/01_Time_And_State_Engine.md)

---

## 1. Overview

The All-Sleep Engine is the mechanical heartbeat of the game. It translates *real-world offline time* into *game simulation ticks*, driving resource generation, chaos escalation, and diplomatic timers.

The core philosophy: **the game is always "running" — even when it's closed.**

---

## 2. How It Works

### Save & Exit Protocol
1. Player presses "Go to Sleep" button in the HUD.
2. `HUD.gd` triggers a fade-to-black transition.
3. Odin's world position is captured: `SaveManager.game_data["player_pos"]`
4. `SaveManager.save_and_quit()` writes the full game state + current UNIX timestamp to `user://save_data.json`.
5. Application terminates.

### Boot Sequence (The Wake-Up)
1. `SaveManager._ready()` loads `save_data.json` on engine boot.
2. `TimeEngine._ready()` waits one frame (for SaveManager to hydrate), then calls `calculate_offline_time()`.
3. `offline_duration = current_OS_time - saved_offline_start_time`
4. Edge case handling:
   - **Negative duration** (clock manipulation) → clamped to `0`, logged as anomaly
   - **> 7 days** (604,800 seconds) → capped to prevent overflow
5. Signal `offline_calculation_complete(duration)` is emitted.
6. All subscribers (Proxy system, Chaos system, Economy) react.

### Simulation Ticks
- Default tick rate: **1 tick = 60 seconds** of real time
- `get_simulation_ticks()` returns `int(offline_duration / 60.0)`
- Each tick processes: Proxy harvesting, Chaos escalation, Trade Route fulfillment

---

## 3. Current Implementation

```gdscript
# TimeEngine.gd — Key logic
signal offline_calculation_complete(duration_seconds: float)
var offline_duration: float = 0.0

func calculate_offline_time():
    var start_time = SaveManager.game_data.get("offline_start_time", 0)
    if start_time == 0: return  # First run
    var current_time = Time.get_unix_time_from_system()
    offline_duration = current_time - start_time
    # Clamp: negative → 0, > 7 days → cap
    offline_calculation_complete.emit(offline_duration)
```

### Signal Subscribers (Current)
| System | Reaction to `offline_calculation_complete` |
|:-------|:------------------------------------------|
| `Proxy.gd` | Calculates offline harvest yield |
| `EconomyManager.gd` | Checks if a Grand Trade Moot has elapsed |
| `HUD.gd` | Displays "You've been asleep for X" message |

---

## 4. Save Data Schema

See [architecture/03_save_schema.md](../architecture/03_save_schema.md) for the full JSON contract.

Key fields used by this system:
```json
{
  "timestamp": 1713200000,
  "player_pos": {"x": 320, "y": 180},
  "realm_states": {
    "asgard": {"chaos": 0},
    "nidavellir": {"chaos": 15},
    "alfheim": {"chaos": 8}
  }
}
```

---

## 5. Known Gaps & Future Work

- **`offline_start_time` vs `timestamp`:** The current SaveManager writes `timestamp` but TimeEngine reads `offline_start_time`. These need to be unified (likely just alias `timestamp`).
- **Chaos simulation** is not yet connected to the offline signal — only Proxy harvesting reacts.
- **Wake-Up report screen** (Raven Dashboard) doesn't exist yet — the player just sees a duration label.

---

## Active Task List

- [ ] Unify `timestamp` / `offline_start_time` key mismatch in SaveManager vs TimeEngine
- [ ] Connect Chaos Escalation system to `offline_calculation_complete` signal
- [ ] Build the "Status Report" screen (Raven Dashboard) that summarizes all offline events
- [ ] Add visual "wake-up sequence" with cinematic fade-in instead of instant load
- [ ] Implement per-realm simulation tick processing (different chaos rates per biome)
- [ ] Add "time anomaly" UI feedback to the player (not just a console print)
- [ ] Consider save file versioning / migration for future schema changes

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created detailed All-Sleep Engine doc with current implementation audit, signal subscriber map, and identified key timestamp mismatch bug. | Documenting the actual runtime behavior vs. the original feature PRD to create an accurate baseline for future development. |
