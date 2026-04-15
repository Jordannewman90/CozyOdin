# Dialogue System & JSON Banks

**Category:** Narrative — Technical
**Status:** 🔴 Not Implemented
**Related Code:** None yet

---

## 1. Overview

Project All-Sleep uses a **Zero-Token AI Dialogue** system. All NPC dialogue is pre-written in JSON banks during development. At runtime, Godot randomizes text pulls based on game state variables — simulating dynamic responses without any LLM calls.

**The game is fully offline.** No API calls, no internet, no tokens.

---

## 2. Architecture

```
dialogue/
├── heimdall.json         # Heimdall's line bank
├── dagr.json             # Dagr's line bank
├── brokk_eitri.json      # Brokk & Eitri's joint bank
└── ravens.json           # Hugin & Munin status report lines
```

### JSON Schema (Proposed)

```json
{
  "character": "heimdall",
  "lines": [
    {
      "id": "wake_short",
      "conditions": {
        "offline_hours": {"min": 0, "max": 4},
        "chaos_any_realm": {"max": 30}
      },
      "text": "A brief rest. The realms barely noticed your absence.",
      "speaker": "Heimdall"
    },
    {
      "id": "wake_long_chaos",
      "conditions": {
        "offline_hours": {"min": 24},
        "chaos_any_realm": {"min": 50}
      },
      "text": "Three days, All-Father. Nidavellir is freezing. The dwarves are... displeased.",
      "speaker": "Heimdall"
    }
  ]
}
```

### Condition Variables
| Variable | Source | Description |
|:---------|:------|:------------|
| `offline_hours` | `TimeEngine.offline_duration / 3600` | Hours since last session |
| `chaos_any_realm` | `SaveManager.game_data.realm_states` | Highest chaos % across all realms |
| `chaos_[realm]` | Per-realm chaos value | Specific realm's chaos level |
| `proxy_count` | `SaveManager.game_data.proxies.size()` | Total deployed proxies |
| `buggy_count` | Count of buggy proxies | Number of malfunctioning proxies |
| `vault_[resource]` | Vault inventory check | Resource quantity in Vault |
| `crisis_active` | `EconomyManager.active_crisis_name` | Current economic event |

---

## 3. Dialogue Parser (GDScript Spec)

```gdscript
# DialogueParser.gd (Proposed Autoload)
extends Node

var banks: Dictionary = {}

func _ready():
    load_bank("heimdall", "res://dialogue/heimdall.json")
    # ... etc

func get_line(character: String) -> Dictionary:
    var pool = banks[character]["lines"]
    var valid_lines = pool.filter(func(line): return check_conditions(line["conditions"]))
    return valid_lines[randi() % valid_lines.size()] if valid_lines.size() > 0 else {"text": "..."}

func check_conditions(conditions: Dictionary) -> bool:
    # Match each condition against live game state
    # Return true if all conditions pass
    pass
```

---

## 4. Raven Reports (Special Case)

Hugin and Munin deliver a combined "status report" on each wake-up. These are compound messages:

```
"[Hugin] All-Father, you've been asleep for 18 hours.
 Vault: 42 Star-Iron, 15 Mana-Sap.
 [Munin] The elves have been whispering. Dagr planted a new grove while you slept."
```

Hugin provides **data**. Munin provides **flavor.**

---

## Active Task List

- [ ] Create `dialogue/` directory in project root
- [ ] Define final JSON schema with all condition variables
- [ ] Implement `DialogueParser.gd` singleton
- [ ] Write Heimdall's dialogue bank (minimum 20 context-dependent lines)
- [ ] Write Dagr's dialogue bank (minimum 20 lines)
- [ ] Write Brokk & Eitri's dialogue bank (minimum 15 lines)
- [ ] Write Raven Report compound templates (minimum 30 Hugin/Munin pairs)
- [ ] Implement NPC interaction UI (text box with portrait)
- [ ] Wire dialogue triggers to NPC Area2D interaction zones

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Dialogue System spec with JSON schema, condition variables, and parser architecture. | The zero-token approach means all "intelligence" is in the conditional matching. A well-designed condition system makes 20 lines feel like 200 unique responses. |
