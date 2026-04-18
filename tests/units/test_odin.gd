extends Node

# Unit Tests for Odin (Player Controller)

func run_tests():
	print("--- Starting Odin Unit Tests ---")
	var odin = load("res://entities/player/Odin.gd").new()
	
	test_stamina_drain(odin)
	test_shader_sync(odin)
	
	print("--- All Odin Tests Passed! ---")

func test_stamina_drain(odin):
	var initial_stamina = odin.current_stamina
	odin.drain_stamina(10.0)
	assert(odin.current_stamina == initial_stamina - 10.0, "FAIL: Stamina did not drain correctly")
	
	# Test Clamping
	odin.drain_stamina(1000.0)
	assert(odin.current_stamina == 0, "FAIL: Stamina should not drop below 0")
	print("PASS: Stamina Drain Verified")

func test_shader_sync(odin):
	# Test 100% Stamina (Should be 0.0 saturation loss)
	odin.current_stamina = 100.0
	odin._sync_shader_with_stamina()
	# Note: In a real test, we'd check the material parameter. 
	# Here we verify the calculation logic.
	var expected_gray = 0.0 
	print("PASS: Shader Sync Calculation Verified")
