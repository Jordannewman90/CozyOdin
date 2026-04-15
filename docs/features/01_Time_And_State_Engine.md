# Feature PRD: The Offline Time & State Engine

**Parent Module:** Core Architecture
**Target Component:** `project/systems/TimeEngine.gd` & `SaveManager.gd`

## 1. Overview
The Offline Time Engine is the mechanical heartbeat of "Project All-Sleep." It tracks how long the player has been away from the game based on the operating system clock, translating real-world offline time into simulation ticks for resource generation and chaos deterioration.

## 2. Technical Requirements

### The Save & Exit Protocol
* When the user hits "Save & Exit", the `SaveManager.gd` singleton intercepts the close request.
* It fetches the current OS Unix Timestamp (UTC).
* It serializes the exact `offline_start_time` alongside current inventory, realm chaos levels, and deployed Proxy states into `user://save_data.json`.
* The application safely terminates.

### The Boot Sequence (The Wake-Up)
* On application launch, `TimeEngine.gd` reads `user://save_data.json`.
* It fetches the current OS Unix Timestamp and subtracts the `offline_start_time`.
* This yields the `offline_duration` in seconds.
* The system chunks this duration into "Simulation Ticks" (e.g., 1 tick = 60 seconds).
* The Engine passes these ticks to the Proxy Automation system and the Chaos Escalation system to rapidly fast-forward the game state before the first frame is fully rendered.

## 3. Edge Cases & Anti-Cheat
* **Time Travel (System Clock Manipulation):** If `offline_duration` yields a negative number (the user set their OS clock backwards), the game logs a "Time Anomaly" state. It does not punish the player but simply skips the offline calculation shift.
* **Maximum Cap:** Offline calculation is capped at 7 real-world days (604,800 seconds) to prevent integer overflows and prevent the game state from breaking completely upon return after a year.

## 4. Required Godot Nodes & Data Structures
* `Node` (Autoload Singleton): `TimeEngine.gd`
* `Node` (Autoload Singleton): `SaveManager.gd`
* **JSON Schema:** Must include arrays for `[proxies_deployed]`, dicts for `{inventory_buckets}`, and variables for `realm_chaos_percentages`.
