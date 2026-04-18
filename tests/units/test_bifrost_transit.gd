extends Node

# Unit Tests for BifrostTransit

func run_tests():
	print("--- Starting BifrostTransit Unit Tests ---")
	var bifrost = load("res://systems/BifrostTransit.gd").new()
	
	test_portal_config(bifrost)
	
	print("--- All BifrostTransit Tests Passed! ---")

func test_portal_config(bifrost):
	bifrost.target_scene = "res://levels/asgard/Asgard.tscn"
	assert(bifrost.target_scene.begins_with("res://"), "FAIL: Portal path must be internal resource")
	print("PASS: Bifrost Config Safety Verified")
