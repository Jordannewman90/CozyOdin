# 📐 Development Rules — MANDATORY

> **Every AI agent working on this project MUST read and follow these rules before writing any code or making any changes.** No exceptions. No shortcuts. Delay is acceptable; skipping documentation is not.

---

## Rule 1: Read Before You Write

Before modifying **any** code file, you MUST:

1. Check `docs/INDEX.md` to identify which design doc(s) cover the system you're touching.
2. Read the relevant design doc(s) to understand the intended behavior, known issues, and active task list.
3. Check `docs/Designer_Questions.md` to see if there are unresolved questions that affect your work. If your task depends on an unanswered question, **ask the user — do not guess.**

---

## Rule 2: Update Docs When You Change Code

After completing **any** code change (feature, fix, refactor), you MUST update:

### A. The Relevant Design Doc(s)
- **Active Task List:** Check off (`- [x]`) any tasks you completed. Add new tasks you discovered.
- **Implementation Status:** If a system moved from 🔴 to 🟡 or ✅, update the status badge at the top.
- **Content:** If your implementation differs from the design doc's spec (you chose a different approach, discovered constraints, etc.), update the doc to reflect reality.

### B. The AI Changelog (in each affected doc)
Every design doc has an `## AI Changelog` table at the bottom. Add a row:

```markdown
| YYYY-MM-DD | What changed | Why this approach was chosen |
```

### C. The Root `AI_CHANGELOG.md`
Add an entry to `/AI_CHANGELOG.md` for every significant task completion:

```markdown
- **Change**: Brief summary of what was modified.
- **Reasoning**: Why this approach was chosen.
```

### D. The Docs Index (`docs/INDEX.md`)
If you created a new design doc or a system's implementation status changed, update the Implementation Status table in `INDEX.md`.

---

## Rule 3: Update Designer Questions

- If during development you discover a **new design ambiguity** that requires a human decision, add it to `docs/Designer_Questions.md` under the Open Questions section.
- If the user **answers** a question during conversation, move it to the Resolved section with the decision and date.
- **Never resolve a question yourself.** Only the user can make design decisions.

---

## Rule 4: Commit Discipline

- Every commit message should be descriptive and prefixed: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`
- Documentation updates can be bundled with the code commit — you don't need a separate commit just for docs.
- Push to remote after every logical unit of work.

---

## Rule 5: Task Scope Awareness

Before starting work, check if your change touches **multiple systems**. Use this map:

| If you're changing... | Also update these docs |
|:---------------------|:----------------------|
| `TimeEngine.gd` | `mechanics/02_all_sleep_engine.md`, `architecture/01_system_map.md` |
| `SaveManager.gd` | `architecture/03_save_schema.md`, any doc that reads save data |
| `EconomyManager.gd` | `mechanics/06_economy.md`, `mechanics/07_diplomacy.md` |
| `Odin.gd` | `mechanics/03_kinetic_resonance.md`, `architecture/05_input_map.md` |
| `Proxy.gd` | `mechanics/05_proxy_automation.md`, `architecture/02_scene_reference.md` |
| `AlignmentBezel.gd` | `mechanics/04_alignment_bezel.md` |
| `HUD.gd` | `architecture/02_scene_reference.md` |
| `BifrostTransit.gd` | `world/00_overview.md`, `architecture/01_system_map.md` |
| `Iridescent.gdshader` | `architecture/04_shader_pipeline.md` |
| Any `.tscn` scene file | `architecture/02_scene_reference.md` |
| Any new singleton | `architecture/01_system_map.md`, `project.godot` autoload order |
| Any new input action | `architecture/05_input_map.md`, `project.godot` |
| Any new resource type | `architecture/03_save_schema.md`, `mechanics/06_economy.md` |
| Any NPC or dialogue | `narrative/02_character_bible.md`, `narrative/03_dialogue_system.md` |
| Any realm-level change | The specific `world/0X_*.md` realm doc |

---

## Rule 6: Never Skip, Even Under Pressure

> "I'll update the docs later" is **not acceptable.**

If a session is running long or context is getting heavy:
- Update docs **before** your final response, not after.
- If you truly cannot (context window limit), explicitly tell the user: *"I was unable to update [specific doc]. This needs to be done before the next task."*

---

## Quick Checklist (Copy This Mentally Before Every Task)

```
□ Read relevant design doc(s)
□ Check Designer_Questions.md for blockers
□ Make code changes
□ Update design doc task list
□ Update design doc AI changelog
□ Update /AI_CHANGELOG.md
□ Update docs/INDEX.md status table (if status changed)
□ Commit with descriptive message
□ Push to remote
```

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created RULES.md to enforce documentation co-maintenance with code changes. | Without enforced rules, documentation drifts from reality within 2-3 sessions. This file exists to prevent "the docs say X but the code does Y" scenarios that break agentic development. |
