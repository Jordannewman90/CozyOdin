# Quest Trees & Objectives

**Category:** Narrative — Progression
**Status:** 📋 Design Phase

---

## 1. Overview

Project All-Sleep doesn't use a traditional quest log. Instead, objectives are **implicit** — surfaced through NPC dialogue, Raven Reports, and environmental observation. The player always knows what needs attention by reading the game state.

However, the internal design needs defined **milestone triggers** to gate content unlocks.

---

## 2. Tutorial Flow (Act I)

| Step | Trigger | Action | Unlocks |
|:-----|:--------|:-------|:--------|
| 1 | First boot | Heimdall introduction; teach WASD + interaction | Basic movement |
| 2 | First harvest | Walk to Star-Iron node in Asgard, press E | Resource collection |
| 3 | First sleep | Press "Go to Sleep" button | Offline timer starts |
| 4 | Second boot | TimeEngine calculates first offline duration | Raven Report system |
| 5 | Bifrost unlocks | Vault reaches 5+ Star-Iron | Nidavellir accessible |
| 6 | First realm visit | Enter Nidavellir | Realm-specific harvesting |
| 7 | First Proxy | Vault reaches 20+ Star-Iron | Proxy Crafting Bench, Bezel |
| 8 | First automation | Deploy a configured Proxy | Offline harvesting works |
| 9 | First long sleep | Close game, return after 4+ hours | Full status report |
| 10 | Alfheim opens | Complete first Moot or reach 50+ total resources | Third realm |

---

## 3. Recurring Objectives

These aren't "quests" but perpetual maintenance goals:

### Daily (Per Session)
- Review Raven Report
- Check and clear Chaos tiles in any deteriorated realm
- Verify Proxy status (buggy? stony?)
- Adjust resource allocation if a Moot is approaching

### Seasonal (Every 7 In-Game Days)
- Attend the Grand Trade Moot
- Mediate any active disputes
- Evaluate if Treaty-Runes need renewal

### Long-Term
- Unlock all Phase 1 realms
- Achieve zero Chaos across all realms for 3+ consecutive sleeps
- Fully automate all Phase 1 trade routes
- Collect teaser items from Phase 2 realms

---

## 4. Endgame Detection: "The Perfect System"

**Win Condition (Proposed):**
```
All Phase 1 realms at 0% Chaos
  AND all trade routes satisfied for 3 consecutive sleep cycles
  AND no buggy Proxies deployed
  AND Asgard Vault above minimum threshold
```

This triggers the Act IV ending sequence — Odin rests on the throne, credits roll, Phase 2 teases begin.

---

## Active Task List

- [ ] Define exact resource thresholds for tutorial milestone triggers
- [ ] Implement milestone tracking in SaveManager (flags for each unlock)
- [ ] Write tutorial dialogue for each step
- [ ] Create "implicit quest" UI hints (subtle HUD indicators, not a quest log)
- [ ] Define "Perfect System" win condition math precisely
- [ ] Implement win condition checker that runs after each wake-up
- [ ] Design the credits / ending sequence
- [ ] Define whether the game hard-ends or continues post-credits

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Quest Trees doc with 10-step tutorial flow, recurring objectives, and proposed endgame win condition. | The game needs invisible rails, not visible quests. Players should feel guided by the game state, not by a checklist UI. But internally, we need precise triggers for content gating. |
