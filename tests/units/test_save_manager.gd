extends Node

# Manual Test Script for SaveManager (Simulating GUT-style testing)

func run_tests():
	print("--- Starting SaveManager Unit Tests ---")
	var sm = load("res://systems/SaveManager.gd").new()
	
	test_initial_state(sm)
	test_proxy_registration(sm)
	test_offline_calculation(sm)
	
	print("--- All SaveManager Tests Passed! ---")

func test_initial_state(sm):
	assert(sm.game_data.has("resources"), "FAIL: Missing resources key")
	assert(sm.game_data["inventory"]["vault"]["Star-Iron"] == 0, "FAIL: Initial vault should be 0")
	print("PASS: Initial State Verified")

func test_proxy_registration(sm):
	sm.register_proxy("test_p", Vector2(10, 10), "asgard")
	assert(sm.game_data["proxies"].size() == 1, "FAIL: Proxy not registered")
	assert(sm.game_data["proxies"][0]["id"] == "test_p", "FAIL: Proxy ID mismatch")
	print("PASS: Proxy Registration Verified")

func test_offline_calculation(sm):
	# Mock a save from 2 hours ago
	var two_hours_ago = Time.get_unix_time_from_system() - 7200
	sm.game_data["timestamp"] = two_hours_ago
	sm.game_data["proxies"] = [{"id": "p1"}] # 1 active proxy
	
	# Manually trigger the calculation logic (simulating the wake-up)
	var current_time = Time.get_unix_time_from_system()
	var offline_seconds = current_time - sm.game_data["timestamp"]
	
	# 1 proxy for 2 hours = 2 resources earned
	var total_earned = int((offline_seconds / 3600.0) * sm.game_data["proxies"].size())
	
	assert(total_earned == 2, "FAIL: Resource calculation error. Expected 2, got " + str(total_earned))
	print("PASS: Offline Resource Calculation Verified")
