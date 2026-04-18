# Implementation Plan: Alignment Efficiency Spectrum

This plan transitions the Alignment Bezel mini-game from a binary success/failure model to a variable efficiency spectrum. This aligns with "cozy" game design by removing punishment (chaos increase) and rewarding mastery (yield optimization).

## User Review Required

> [!IMPORTANT]
> The current implementation only allows for one Proxy to be targeted (the first one in the group). I will maintain this for now as per the "Don't change too much" philosophy, but we should consider a "Targeting Mode" in the future.

## Proposed Changes

### UI System

#### [MODIFY] [AlignmentBezel.gd](file:///Users/jnewman/.gemini/antigravity/scratch/CozyOdin/project/ui/alignment_bezel/AlignmentBezel.gd)
- Remove `is_buggy` from the `results` dictionary.
- Add `alignment_efficiency: float` to `results`.
- Modify `check_lock(ring)` to return a `float` (0.0 to 1.0) based on angular offset.
    - 0° offset = 1.0
    - Offset >= 45° = 0.1 (minimum efficiency)
- Update `lock_current_ring()` to accumulate these scores and calculate the final average.
- Update `status_label` to show "DIVINE SYNC", "STABLE", or "CLUMSY" based on the score.
- Update ring modulation to interpolate between Red (0.0), Yellow (0.7), and Green (1.0).

#### [MODIFY] [HUD.gd](file:///Users/jnewman/.gemini/antigravity/scratch/CozyOdin/project/ui/HUD.gd)
- Update `_on_bezel_configuration_locked` to read `results["alignment_efficiency"]`.
- Pass this value to the proxy via `proxy.efficiency = results["alignment_efficiency"]`.

---

### Entity System

#### [MODIFY] [Proxy.gd](file:///Users/jnewman/.gemini/antigravity/scratch/CozyOdin/project/entities/proxy/Proxy.gd)
- Replace `@export var is_buggy: bool` with `@export var efficiency: float = 1.0`.
- Update `_on_offline_catch_up(duration)`:
    - Remove the `if is_buggy: return` check.
    - Multiply `final_yield` by `efficiency`.
- Update `apply_visual_context()`:
    - Remove buggy red tint.
    - Add logic to tint or glow based on `efficiency` tiers (Divine Sync, Stable, Clumsy).
- Update `_process(delta)`:
    - Remove the position twitch for buggy proxies.
    - (Optional) Add a "Clumsy" trip/pause logic if efficiency is very low.

## Verification Plan

### Automated Tests
- I will use the Godot MCP server to:
    - Run the project.
    - Manually trigger the Bezel.
    - Verify that different timing results in different efficiency printouts in the console.

### Manual Verification
- Check that the Proxy no longer twitches when "Buggy."
- Check that the HUD log shows the correct "Alignment Locked" message with the percentage.
