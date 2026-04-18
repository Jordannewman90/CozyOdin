extends Node

# Unit Tests for Proxy (Automated Worker)

func run_tests():
	print("--- Starting Proxy Unit Tests ---")
	var proxy = load("res://entities/proxy/Proxy.gd").new()
	
	test_efficiency_impact(proxy)
	
	print("--- All Proxy Tests Passed! ---")

func test_efficiency_impact(proxy):
	# Test Base Rate
	proxy.efficiency = 1.0
	var base_yield = proxy.calculate_yield(3600) # 1 hour
	assert(base_yield == 1, "FAIL: Base yield should be 1 per hour")
	
	# Test Buffed Rate (Perfect Snap)
	proxy.efficiency = 2.0
	var buffed_yield = proxy.calculate_yield(3600)
	assert(buffed_yield == 2, "FAIL: Buffed efficiency should double yield")
	print("PASS: Proxy Efficiency Math Verified")
