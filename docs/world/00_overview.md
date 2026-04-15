# World Overview & Cosmology

**Category:** World Design
**Status:** Design Phase
**Related Code:** `project/systems/BifrostTransit.gd`, `project/levels/`

---

## 1. The Nine Realms

Project All-Sleep's world is the Norse cosmological tree (Yggdrasil) reimagined as a **logistics network**. Each realm is a dense, highly-themed hub connected via the Bifrost — a fast-travel system managed by Heimdall.

### Design Philosophy: "Theme Park Sizing"
> Realms contain **no empty space.** They are dense, 2-3 screen-sized hubs. Navigation from entrance to furthest node takes **under 15 seconds.**

This keeps sessions tight and prevents the "walking simulator" trap of open-world games.

---

## 2. Realm Map

```
                        ┌─────────────┐
                        │   ASGARD    │
                        │  (The Hub)  │
                        └──────┬──────┘
                               │
                          ┌────┴────┐
                    ┌─────┤ BIFROST ├─────┐
                    │     └─────────┘     │
              ┌─────┴──────┐       ┌──────┴─────┐
              │ NIDAVELLIR │       │  ALFHEIM   │
              │  (Dwarves) │       │   (Elves)  │
              └────────────┘       └────────────┘

              ─ ─ ─ PHASE 2 (Locked / Teased) ─ ─ ─

              Muspelheim ∙ Svartalfheim ∙ Vanaheim
              Jotunheim  ∙ Helheim     ∙ Midgard
```

### Bifrost Connections (Phase 1)
| From | To | Portal Color |
|:-----|:---|:------------|
| Asgard | Nidavellir | Orange *(forgefire)* |
| Asgard | Alfheim | Teal *(bioluminescent)* |
| Nidavellir | Asgard | Gold *(return portal)* |
| Alfheim | Asgard | Gold *(return portal)* |

Phase 2 realms appear on the Bifrost UI as **locked destinations** with visual error states (e.g., Jotunheim shows unbreakable ice overlay).

---

## 3. Resource Dependencies

```
Nidavellir ──(Star-Iron)──► Asgard Vault
         ◄──(Mana-Sap)──── Alfheim

Alfheim ──(Mana-Sap)──► Cool Dwarven Forges
        ◄──(Star-Iron)── Nidavellir Tools
```

If these trade routes break → diplomatic friction → Grand Trade Moot.

---

## 4. Individual Realm Docs

- [01_asgard.md](01_asgard.md) — The golden command center
- [02_nidavellir.md](02_nidavellir.md) — Industrial forge & Star-Iron
- [03_alfheim.md](03_alfheim.md) — Bioluminescent gardens & Mana-Sap
- [04_phase2_realms.md](04_phase2_realms.md) — Future expansion realms

---

## Active Task List

- [ ] Define exact Bifrost portal positions in each realm scene
- [ ] Design locked-realm error states for Phase 2 tease on Bifrost UI
- [ ] Implement Bifrost destination selector (currently direct Area2D triggers)
- [ ] Create "teaser drop" system (proxies finding useless Phase 2 items)
- [ ] Define resource dependency graph with exact quantities per cycle
- [ ] Design the Yggdrasil/Bifrost visual map UI for the hub

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created World Overview with realm map, Bifrost connections, and resource dependency graph. | Establishing the spatial and economic relationships between realms to guide both level design and economy system implementation. |
