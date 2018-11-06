extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	var game_class = load("test_game.gd")
#	var game = game_class.new()
#	game.x = 12341
#	print(game.x)
#	var utils = get_node("utils")
#	print(utils.x)
	var x = ["foo"]
	call(x[0], 345)
	pass

func foo(x):
	print("func done " + str(x))
