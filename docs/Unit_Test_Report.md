# 🛡️ Unit Test Overview & Report: Cozy Odin

**Date:** 2026-04-18  
**Project Phase:** Phase 1 (MVP Foundation)  
**Overall Status:** ✅ **STABLE**

---

## 1. Executive Summary
Our testing strategy is focused on **System Integrity.** We prioritize testing the "Logistics and Save" layers, as these are the most critical for a commercial release. If these fail, players lose progress or economic balance.

---

## 2. Test Coverage Report

### 💾 Save & Offline Systems
*   **Target File:** `project/systems/SaveManager.gd`
*   **Test Suite:** `tests/units/test_save_manager.gd`
*   **Status:** ✅ **PASSING**
*   **Key Logic Verified:**
    *   **Data Structure**: Ensures all expected keys (inventory, vault, proxies) exist on boot.
    *   **Proxy Registration**: Verifies that proxies added in-game are correctly serialized to disk.
    *   **Offline Math**: Validates that 1 Proxy running for 1 Hour correctly generates the expected resource yield.

### 👥 Population & Living World
*   **Target File:** `project/systems/PopulationManager.gd`
*   **Test Suite:** `tests/units/test_population_manager.gd`
*   **Status:** ✅ **PASSING**
*   **Key Logic Verified:**
    *   **Chaos Mapping**: Ensures that critical chaos (100%) correctly results in zero NPCs, while pristine realms (0%) result in a full crowd.
    *   **Despawn Safety**: Confirms that when chaos increases, excess citizens are correctly removed from the scene tree without memory leaks.

---

## 3. Future Testing Roadmap

| Tier | Goal | Priority |
|:-----|:-----|:---------|
| **VFX / Shaders** | Verify "The Fade" (stamina-based color shifts) via shader parameter checks. | Medium |
| **Integration** | Test realm-to-realm travel (Bifrost) persistence. | **HIGH** |
| **AI / Proxies** | Verify "Efficiency Snapping" in the Alignment Bezel mini-game. | Medium |

---

## 4. How to Run Tests
Currently, tests are structured as lightweight GDScripts for Phase 1. To run them:
1.  Open the Godot Editor.
2.  Run the `run_tests()` method on the desired test script.
3.  View the console for `PASS / FAIL` feedback.
