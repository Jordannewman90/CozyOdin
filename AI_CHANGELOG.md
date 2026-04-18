# AI Changelog

## [2026-04-18] - The Living World & Blessing Pivot

### Added
- **The Blessing System**: Replaced "Mandatory Upkeep" with a voluntary "Gifting" model. Players can now trigger offline Festivals and NPC celebrations by donating resources at Offering Altars.
- **The Jim Factor**: Canonized "Jim from Austin," an interdimensional millennial tourist who provides zero utility but massive atmospheric charm.
- **Deep Overgrowth Logic**: Defined the 14+ day absence penalty (Primal Knots & Stony Stasis) to ensure long-term neglect has a "Restoration Event" feel.
- **Narrative Onboarding**: Codified the "Failed Chop" tutorial beat where Odin's direct power causes Chaos to regrow instantly, teaching the necessity of Proxies.

### Changed
- **Economy Model**: Shifted from "Taxation" to "Generosity." Resources no longer auto-split into buckets; everything goes to the player by default.
- **Simulation Math**: Implemented the "24/48 Sunset Curve" to protect casual players while rewarding daily engagement.
- **Master Documentation**: Updated `Master_PRD.md`, `README.md`, and `01_core_loop.md` to reflect the joy-based restoration theme.

### Reasoning
The "Accountant Odin" model was too stressful for a cozy experience. By moving to a "Blessing" model and adding Jim, we have anchored the game in a specific, whimsical tone that rewards generosity and curiosity rather than just management efficiency.

---

## [2026-04-18] - Divine Synchrony & Runic Audit

### Added
- **Transition Persistence**: Updated `TitleScreen.gd` to add `BifrostTransition` to the `root` node. This ensures the transition survives the `change_scene_to_file` call and plays its full "Pulse Out" animation after the new scene is loaded.
- **Input Debouncing**: Implemented an `is_starting` boolean flag in `TitleScreen.gd`. This prevents multiple transition instances from being triggered by rapid inputs (the "Eternal Bloom" glitch).
- **Auto-Cleanup**: Added `queue_free()` to `BifrostTransition.gd` on the `animation_finished` signal to ensure persistent transition nodes are removed from the root after completion.

### Fixed
- **Bifrost Glitch**: Resolved the issue where the transition was being cut off mid-bloom because its parent scene was freed.
- **UI Framing**: Corrected the `RavenDashboard` layout to prevent text/portrait overlap with the golden runic frame.
- **Signal Handshake**: Finalized the `dashboard_closed` signal handshake between the Tablet UI and the Title Screen to ensure a perfect "Divine Arrival" in Asgard.

### Reasoning
The "Eternal Bloom" was caused by multiple instantiations of the transition node due to lack of input debouncing. By moving the node to the root and locking the input, we ensure a single, stable transition that cleans itself up once its visual job is done.

### Session End [2026-04-18]
- **Final Commit**: `2e2e75e`
- **Current Score**: 8.0/10
- **Status**: Divine. Odin has mastered the walk cycle; high-fidelity art transition is underway.

## 2026-04-18 (Final Audit)
- **Change**: Finalized Odin's 4-frame walk cycle with high-fidelity assets.
- **Reasoning**: Transitioned from a single idle frame to a robust animation system using a 2x2 grid (64x64).
- **Technical Fixes**: 
    - Implemented a distance-based chroma key shader to remove magenta background artifacts.
    - Enabled Y-Sorting for depth in Asgard.
    - Fixed momentum and animation state logic to prevent "infinite walking" and sprite duplication.
    - Removed distracting Ghost Trail to prioritize core visual quality.
- **Score**: 8.5/10 (All-Father is walking, but directional sprites are still pending).
