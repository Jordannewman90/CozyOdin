extends Node

# Unit Tests for HarvestableNode

func run_tests():
	print("--- Starting HarvestableNode Unit Tests ---")
	var node = load("res://entities/resources/HarvestableNode.gd").new()
	
	test_harvest_damage(node)
	
	print("--- All HarvestableNode Tests Passed! ---")

func test_harvest_damage(node):
	node.health = 3
	node.take_damage(1)
	assert(node.health == 2, "FAIL: Node health did not decrease")
	
	# Test Depletion
	node.take_damage(2)
	assert(node.health == 0, "FAIL: Node should be depleted at 0 health")
	print("PASS: Node Harvest Logic Verified")
