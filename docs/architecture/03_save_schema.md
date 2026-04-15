# Save Data Schema

**Category:** Architecture — Data Contract
**Status:** ✅ Implemented (V1 — needs expansion)
**Related Code:** `project/systems/SaveManager.gd`

---

## 1. Current Schema

**File Location:** `user://save_data.json`

```json
{
  "resources": {
    "divine_sparks": 0
  },
  "inventory": {
    "vault": {
      "Star-Iron": 0
    }
  },
  "timestamp": 1713200000,
  "realm_states": {
    "asgard": {"chaos": 0},
    "nidavellir": {"chaos": 0},
    "alfheim": {"chaos": 0}
  },
  "player_pos": {"x": 320, "y": 180},
  "proxies": [],
  "squad": []
}
```

---

## 2. Field Reference

| Field | Type | Description | Used By |
|:------|:-----|:-----------|:--------|
| `resources.divine_sparks` | int | Collected spark count | Not currently used |
| `inventory.vault.*` | dict | Key-value resource counts in Vault | `HarvestableNode._add_to_vault()` |
| `timestamp` | int | UNIX timestamp at last save | `TimeEngine`, `EconomyManager` |
| `realm_states.*.chaos` | int | Chaos percentage per realm (0-100) | Not yet consumed |
| `player_pos` | dict | Odin's world position `{x, y}` | `Odin._ready()`, `BifrostTransit` |
| `proxies` | array | Deployed proxy records | `SaveManager.register_proxy()` |
| `squad` | array | Portable proxy inventory (max 3) | `Odin.gd` pick up / deploy |

### Proxy Record Schema
```json
{
  "id": "Proxy_001",
  "pos": {"x": 150, "y": 200},
  "realm": "nidavellir",
  "efficiency": 1.0,
  "is_buggy": false
}
```

### Squad Entry Schema
```json
{
  "id": "Proxy_001",
  "is_buggy": false,
  "current_context": 1
}
```

---

## 3. Known Issues

### `timestamp` vs `offline_start_time`
- **SaveManager** writes the field `timestamp`.
- **TimeEngine** reads the field `offline_start_time`.
- **Impact:** On first real boot, TimeEngine reads `0` and skips offline calculation. This is "fine" but means `timestamp` is never actually used for offline calculation after the first save.
- **Fix:** Either rename `timestamp` → `offline_start_time` in SaveManager, or update TimeEngine to read `timestamp`.

### Missing Fields (Planned)
| Field | Purpose | Needed For |
|:------|:--------|:-----------|
| `inventory.upkeep.*` | Resources left in realm storage | Three-Bucket economy |
| `inventory.trade.*` | Resources assigned to trade routes | Trade dependencies |
| `inventory.vault.Mana-Sap` | Second resource type | Alfheim harvesting |
| `milestones` | Tutorial/unlock flag tracking | Progression gating |
| `treaty_runes` | Active Treaty-Runes with expiry times | Mediation system |
| `dialogue_seen` | Set of dialogue IDs already displayed | Avoid repeats |

---

## 4. Schema Migration Strategy

When adding new fields:
1. Add them to `SaveManager.game_data` default dict.
2. On `load_game()`, merge loaded data with defaults — new fields get default values.
3. Old saves remain compatible (new fields just start at defaults).

**Current code does NOT do this** — `load_game()` fully replaces `game_data` with the loaded JSON, losing any new defaults. This needs fixing.

---

## Active Task List

- [ ] Fix `timestamp` / `offline_start_time` key mismatch
- [ ] Implement schema migration (merge loaded data with defaults, don't replace)
- [ ] Add `Mana-Sap` to default inventory
- [ ] Add `upkeep` and `trade` buckets to inventory schema
- [ ] Add `milestones` dictionary for progression flags
- [ ] Add `treaty_runes` array with expiry timestamps
- [ ] Add `dialogue_seen` set for de-duplication
- [ ] Consider save file versioning (add `schema_version` field)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Save Data Schema doc. Identified critical `timestamp`/`offline_start_time` mismatch and the missing schema migration pattern. | The save file is the game's memory. If it's buggy, every system downstream breaks. Fixing the merge pattern is prerequisite to adding any new features. |
