# AI Changelog

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
