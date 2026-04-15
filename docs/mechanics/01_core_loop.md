# Core Loop & Progression

**Category:** Mechanics
**Status:** Design Complete — Implementation In Progress
**Related Code:** All `project/systems/` singletons, `Odin.gd`, `Proxy.gd`

---

## 1. The Fundamental Cycle

Project All-Sleep's core loop is a **cozy management cycle** structured around the real-world act of closing and reopening the game. Every session follows this rhythm:

```
┌─────────────────────────────────────────────────────────┐
│                   THE ALL-SLEEP CYCLE                    │
│                                                          │
│   CLOSE GAME ──► Real Time Passes ──► OPEN GAME         │
│       │                                    │             │
│   Save State                         Calculate Delta    │
│   Record Timestamp                   Simulate Proxies   │
│   Set Proxy Tasks                    Escalate Chaos     │
│       │                                    │             │
│       └──────── PLAY SESSION ◄─────────────┘             │
│                     │                                    │
│         ┌───────────┼───────────┐                        │
│         │           │           │                        │
│     Investigate  Manage      Deploy                     │
│     & Restore    Economy     Proxies                    │
│         │           │           │                        │
│         └───────────┼───────────┘                        │
│                     │                                    │
│              CLOSE GAME (repeat)                         │
└─────────────────────────────────────────────────────────┘
```

### Phase Breakdown

| Phase | Player Action | Systems Involved |
|:------|:-------------|:-----------------|
| **1. The Wake-Up** | Game boots, OS clock is read | `TimeEngine.gd` |
| **2. Status Report** | Review Raven Dashboard for offline events | `HUD.gd`, Dashboard UI |
| **3. Investigate & Restore** | Travel to realms, clear chaos tiles | `BifrostTransit.gd`, Chaos Overlays |
| **4. Manage Supply Chain** | Allocate resources into 3 buckets | Economy UI, `EconomyManager.gd` |
| **5. Mediation** (Seasonal) | Balance diplomatic grievances | Mediation Scale UI |
| **6. Deploy & Configure** | Program and position Runic Proxies | `AlignmentBezel.gd`, `Proxy.gd` |
| **7. The All-Sleep** | Save, close, start offline timer | `SaveManager.gd` |

---

## 2. Progression Arc

The player's journey follows a deliberate escalation:

### Act I — The Drowsy King (Tutorial)
- Odin wakes for the first time. Only Asgard is accessible.
- Player learns movement, harvesting, and the Save & Sleep flow.
- Bifrost unlocks → Nidavellir becomes reachable.
- **Goal:** Understand the offline time loop.

### Act II — The Delegator
- Player discovers resource shortages after waking up from longer sleeps.
- Alignment Bezel becomes available → First Proxy is crafted.
- Alfheim unlocks. Cross-realm trade dependencies begin.
- Grand Trade Moot fires for the first time.
- **Goal:** Learn automation and start delegating work to Proxies.

### Act III — The Architect
- All Phase 1 realms stabilized. Player is managing multiple Proxies across realms.
- Buggy Proxies create cascading failures that teach the player about guardrails.
- Mediation Table becomes critical for maintaining trade routes.
- **Goal:** Build a self-sustaining system.

### Act IV — The Perfect System (Endgame)
- Player achieves zero Chaos escalation across all realms for 3+ consecutive sleep cycles.
- Odin can finally take a true vacation.
- Phase 2 realms begin "pinging" the Bifrost — setting up expansion content.
- **Goal:** The universe runs without you.

---

## 3. Session Pacing

**Target Session Length:** 15–30 minutes

| Activity | Approx. Time | Feel |
|:---------|:------------|:-----|
| Wake-Up & Status Report | 1–2 min | Anticipation / Discovery |
| Realm Investigation | 5–10 min | Active / Hands-On |
| Supply Chain Management | 3–5 min | Strategic / Thoughtful |
| Proxy Configuration | 3–5 min | Tactile / Skill-Based |
| Exploration / Vibes | 2–5 min | Cozy / Ambient |
| The All-Sleep | 30 sec | Ritual / Closure |

---

## Active Task List

- [ ] Define exact unlock conditions for each Act transition (what triggers Bifrost opening, Bezel availability, etc.)
- [ ] Write tutorial dialogue for Act I (first boot experience)
- [ ] Implement "First Wake-Up" special case in `TimeEngine.gd` (skip offline calc, show tutorial instead)
- [ ] Design the "Perfect System" win condition detection math
- [ ] Define session pacing hooks (what makes the player *want* to come back after closing?)
- [ ] Create onboarding flow for the Raven Dashboard
- [ ] Determine if there's a "fail state" or if the game is purely cozy (can you lose realms permanently?)

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created core loop template with 4-act progression arc, session pacing targets, and cycle diagram. | Establishing the macro game design structure to guide all feature implementation order and unlock gating. |
