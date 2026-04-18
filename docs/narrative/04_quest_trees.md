# Quest Trees & Objectives

**Category:** Narrative — Progression
**Status:** 📋 Design Phase

---

## 1. Overview

Project All-Sleep doesn't use a traditional quest log. Instead, objectives are **implicit** — surfaced through NPC dialogue, Raven Reports, and environmental observation. The player always knows what needs attention by reading the game state.

However, the internal design needs defined **milestone triggers** to gate content unlocks.

---

## 2. Main Quest: The Search for the Shattered Spear (Phase 1)

This is the core progression arc for Act I. It gates the player's "Divine" abilities (Dash, Transmutation) behind the manual labor of cleaning the realms.

### Phase 1: The Accusation (Asgard)
*   **Narrative**: Odin wakes up gray-scaled and exhausted. He realizes Gungnir is missing.
*   **Trigger**: First interaction with the empty Spear-Rack near the throne.
*   **Dialogue**: Hugin & Munin suggest Loki was "snooping." Odin sets off in a huff.
*   **Objective**: Reach Nidavellir via the Bifrost.

### Phase 2: The Inert Rod (Nidavellir)
*   **Narrative**: Brokk & Eitri are using a "weird metal rod" to stir their slag. They don't realize it's Gungnir's core.
*   **Trigger**: Clearing the first major "Deep Freeze" chaos node in the Dwarven Forge.
*   **Objective**: Export 50 Star-Iron to the Asgard Vault to prove the "Forge is back online."
*   **Reward**: **The Inert Shaft** (Key Item). Odin can now "Chop/Smash" faster, but still no magic.

### Phase 3: The Song of the Sap (Alfheim)
*   **Narrative**: The shaft is cold and dead. The Elves explain that the spear's "soul" evaporated when the world became chaotic. 
*   **Trigger**: Entering Alfheim with the Inert Shaft.
*   **Objective**: Prune the "Overgrowth" chaos tiles around 5 World-Trees. As they bloom, they drip Mana-Sap onto the spear.
*   **Reward**: **The Pulsing Core** (Key Item update). The spear starts to glow cyan/magenta.

### Phase 4: The Divine Snap (Asgard)
*   **Narrative**: Returning to the Throne to unite the spear's form with Odin's presence.
*   **Trigger**: Sitting on the Hlidskjalf Throne with the Pulsing Core while at < 10% Stamina.
*   **Action**: A mandatory "Deep Wind" (Hold E).
*   **Payoff**: A color-surge resets Odin to Full Rainbow. **Gungnir Restored.**
*   **Unlocks**: Bifrost Dash (Space), Prismatic Transmutation (Harvesting boost).

---

## 3. Tutorial Flow (Technical Milestones)

| Step | Milestone | Narrative Context | Unlocks |
|:-----|:----------|:------------------|:--------|
| 1 | First Boot | "I'm too old for this." | Movement |
| 2 | Empty Rack | "Loki has my spear!" | The Search Quest |
| 3 | Nidavellir | "Found the thief's tracks." | World Travel |
| 4 | Forge Restart | "Brokk found a 'stirring stick'." | Proxy Bench |
| 5 | Alfheim | "The Elves are singing to my rod." | Resource Trade |
| 6 | Restoration | "The All-Father is back." | Divine Dash / Transmute |

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
