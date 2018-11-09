extends Node

# need to store all objects in a node for access from game later
# ^ game holds most, but some may need separate holding.
var game
var field1 = []
var field2 = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var GameClass = load("res://scripts/test_game.gd")
#	GameClass.test()
#	print("get constant: ", GameClass.x)
#	GameClass.const_test()
	game = GameClass.new()
#	print("game.x: ", game.x)
#	var utils = get_node("utils")
#	print(utils.x)
#	var x = ["foo", funcref(GameClass, "sorcery_speed")]
#	call(x[0], "param1")
#	# can add arguments as call_func(args)
#	x[1].call_func()
#	var d = {"W": 0}
#	d["W"] += 1
#	print("dict: ", d["W"])
#	# to close game:
#	print("ERROR FOUND")
#	get_tree().quit()

#	bar(self)
#	game.battlefield.append(field1)
#	game.battlefield.append(field2)
#	print(game.battlefield)
#	field1.append(14)
#	field2.append(26)
#	print(game.battlefield)
#	var found = {}
#	var j = 0
#	for x in range(100):
#		j = randi() % ((4 - 1) + 1) # should be in range (0, 3), inclusive
#		# where 4 is n, and (4 - 1) is i
#		if !found.has(j):
#			found[j] = 1
#	print("found all: ", found.has_all([0,1,2,3]))
#	print(found)
	randomize()
	var deck = [0, 1, 2, 3, 4]
	var j = 0
	var temp
	for i in range(deck.size() - 1, 1, -1):
		j = randi() % (i + 1) # random int for 0 <= j <= i
		temp = deck[j]
		print("i: ", i)
		deck[j] = deck[i]
		deck[i] = temp
		if temp == deck[j]:
			print("ERROR: temp = deck[j]")
	print(deck)
	get_tree().quit()
	pass
	
#func bar(object):
#	object.foo("bar called foo")
	
func foo(x):
	print("foo with param: ", x)

func _on_LineEdit_text_entered(new_text):
	print("$ " + new_text)
	if new_text == "print-game x":
		print("game.x: ", game.x)
		print("printed game!")
	get_node("LineEdit").clear()