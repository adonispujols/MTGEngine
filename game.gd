# field variables
# required parameters:
var _players

# other fields
var _AI_only
var _debug
var _current_step
var _player_making_choice
var _players_have_priority
var _player_with_priority
var _player_paying_mana_cost
var _player_resolving_mana_cost
var _active_player
var _NAP_have_acted
var _battlefield
var _stack
const _turn_based_actions = null

# Initializing member vars on object creation
func _init(players, first_player):
	_players = players
	_AI_only = false
	_debug = false
	_current_step = 0
	_player_making_choice = -1
	_players_have_priority = false
	_player_with_priority = first_player - 1
	_player_paying_mana_cost = -1
	_player_resolving_mana_cost = -1
	_active_player = first_player - 1
	_NAP_have_acted = false
	_battlefield = []
	var _stack_class = load("res://stack.gd")
	# ^ consider making into constant
	_stack = _stack_class.new()


# methods
func get_player(player_index):
	return _players[player_index]

func player_has_priority(player_index):
	return _player_with_priority == player_index

func pass_priority():
	players_lose_priority()
	if (_all_players_passed_with_no_actions()):
		if (_stack.is_empty()):
			drain_mana_pools()
			turn_based_actions.start_next_phase_or_step(this)
	else:
		_stack.resolve_next()
	if (player_has_priority(_active_player)):
		_NAP_have_acted = false
	give_next_player_priority()

func players_lose_priority():
	set_player_making_choice(-1)
	_players_have_priority = false

func _all_players_passed_with_no_actions():
	if (next_player_due_priority() == _active_player) and (_NAP_have_acted):
		return true
	else:
		return false

func next_player_due_priority():
	return ((_player_with_priority + 1) % _players.size())

func drain_mana_pools():
	for player in _players:
		player.drain_mana_pool()



"""
^ Essentially, check if we have the AP pass, NAP 1 pass, etc sequence.
^- in actual code: check if both current player with priority == active player and NAP_have_acted boolean is true.
"""


"""
^ can't take actions during playing/resolving something (game/rules will allow special exceptions)
- set_player_making_choice(-1)
^- no one is making actions
^- set players have priority = false


* Get player (index)
^- 0 (or 1st) is user player, 1 (or 2nd) is ai (typically)
^- we might have ai vs ai
^ How to do safely? ONLY FOR UTILS OR SO

* player has priority(player index)?
^- returns true or false, depending if true

"""















