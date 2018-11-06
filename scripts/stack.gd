#extends "stack.gd"

var stack

func _init():
	stack = []

func push(object):
	stack.push_back(object)

func _pop():
	return stack.pop_back()

func is_empty():
	return stack.empty()

func resolve_next():
	pass
#	_pop().resolve()