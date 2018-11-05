extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var game_class = load("res://test_game.gd")
#	var game = game_class.new()
#	game.x = 12341
#	print(game.x)
#	var utils = get_node("utils")
#	print(utils.x)
	game_class.thing()
	pass