extends Node

# Manual Test Script for PopulationManager

func run_tests():
	print("--- Starting PopulationManager Unit Tests ---")
	var pm = load("res://systems/PopulationManager.gd").new()
	
	test_chaos_mapping(pm)
	test_despawn_logic(pm)
	
	print("--- All PopulationManager Tests Passed! ---")

func test_chaos_mapping(pm):
	# Test Critical Chaos (90%)
	pm.update_population(90.0)
	assert(pm.target_count == 0, "FAIL: 90% chaos should have 0 citizens")
	
	# Test Warning Chaos (60%)
	pm.update_population(60.0)
	assert(pm.target_count == 1, "FAIL: 60% chaos should have 1 citizen")
	
	# Test Stable Chaos (25%)
	pm.update_population(25.0)
	assert(pm.target_count >= 2 and pm.target_count <= 3, "FAIL: 25% chaos should have 2-3 citizens")
	
	# Test Pristine Chaos (5%)
	pm.update_population(5.0)
	assert(pm.target_count >= 5 and pm.target_count <= 8, "FAIL: 5% chaos should have 5-8 citizens")
	
	print("PASS: Chaos-to-Population Mapping Verified")

func test_despawn_logic(pm):
	# Manually add mock citizens
	pm.current_citizens = [Node2D.new(), Node2D.new(), Node2D.new()]
	
	# Set target to 1
	pm.target_count = 1
	pm._adjust_citizens() # This should free 2 nodes
	
	assert(pm.current_citizens.size() == 1, "FAIL: Despawn logic failed to remove excess citizens")
	print("PASS: Despawn Logic Verified")
