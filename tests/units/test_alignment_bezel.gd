extends Node

# Unit Tests for AlignmentBezel (The Mini-game)

func run_tests():
	print("--- Starting AlignmentBezel Unit Tests ---")
	var bezel = load("res://ui/alignment_bezel/AlignmentBezel.gd").new()
	
	test_snap_logic(bezel)
	
	print("--- All AlignmentBezel Tests Passed! ---")

func test_snap_logic(bezel):
	# Perfect alignment is 0.0
	var efficiency = bezel.calculate_result(0.01) # Near perfect
	assert(efficiency > 1.8, "FAIL: Near-perfect snap should give high efficiency")
	
	var poor_efficiency = bezel.calculate_result(0.5) # Way off
	assert(poor_efficiency < 0.5, "FAIL: Poor snap should give low efficiency")
	print("PASS: Bezel Snap Logic Verified")
