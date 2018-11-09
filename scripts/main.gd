extends Node

# need to store all objects in a node for access from game later
# ^ game holds most, but some may need separate holding.
var game

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var game_class = load("res://scripts/test_game.gd")
#	game_class.test()
#	print("get constant: ", game_class.x)
#	game_class.const_test()
#	game = game_class.new()
#	print("game.x: ", game.x)
#	var utils = get_node("utils")
#	print(utils.x)
# Store a function reference.
#var my_func = funcref(my_node, "my_function")
# Call stored function reference.
#my_func.call_func(args)
#	var x = ["foo", funcref(game_class, "sorcery_speed")]
#	call(x[0], "param1")
#	x[1].call_func()
#	var d = {"W": 0}
#	d["W"] += 1
#	print("dict: ", d["W"])
#	print("ERROR FOUND")
#	get_tree().quit()
	#^ closes game
#	bar(self)
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