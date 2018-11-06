# required parameters:
var _players

# other fields
var _AI_only
var _debug
var _current_step_or_phase
var _player_making_choice
var _a_player_has_priority
var _player_with_priority
var _player_paying_mana_cost
var _player_resolving_mana_cost
var _active_player
var _NAP_have_acted
var _battlefield
var _stack
const TurnBasedActions = preload("turn_based_actions.gd")

# Initializing member vars on object creation
func _init(players, first_player):
	_players = players
	_AI_only = false
	_debug = false
	_current_step_or_phase = 0
	_player_making_choice = -1
	_a_player_has_priority = false
	_player_with_priority = first_player - 1
	_player_paying_mana_cost = -1
	_player_resolving_mana_cost = -1
	_active_player = first_player - 1
	_NAP_have_acted = false
	_battlefield = []
	var Stack = load("stack.gd")
	# XXX ^ make class calls into constants?
	# XXX ^ preload class calls?
	_stack = Stack.new()

# methods
func get_player(player_index):
	return _players[player_index]

func player_has_priority(player_index):
	return _player_with_priority == player_index

func pass_priority():
	players_lose_priority()
	if _all_players_passed_with_no_actions():
		if _stack.is_empty():
			drain_mana_pools()
			TurnBasedActions.start_next_step_or_phase(this)
	else:
		_stack.resolve_next()
	if player_has_priority(_active_player):
		_NAP_have_acted = false
	give_next_player_priority()

func players_lose_priority():
	set_player_making_choice(-1)
	_a_player_has_priority = false

func _all_players_passed_with_no_actions():
	return (next_player_due_priority() == _active_player) and _NAP_have_acted

func next_player_due_priority():
	return (_player_with_priority + 1) % _players.size()

func drain_mana_pools():
	for player in _players:
		player.drain_mana_pool()

func give_next_player_priority():
	give_player_priority(next_player_due_priority)

func give_player_priority(player_index):
	# check for state based actions
	_player_with_priority = player_index
	set_player_making_choice(player_index)
	_a_player_has_priority = true
	# give option to pass priority

func set_player_making_choice(player_index):
	_player_making_choice = player_index

func is_players_turn(player_index):
	return _active_player == player_index


func set_player_paying_mana_cost(player_index):
	set_player_making_choice(player_index)
	_player_paying_mana_cost = player_index

func is_resolving_mana_cost(player_index):
	return player_index == _player_resolving_mana_cost

func set_resolving_mana_cost(player_index):
	set_player_making_choice(player_index)
	_player_resolving_mana_cost = player_index

func set_step_or_phase(step_or_phase_index):
	_current_step_or_phase = step_or_phase_index

func start_game():
	_turn_based_actions.untap_step_start(this)

func get_current_step_or_phase():
	return _current_step_or_phase

func change_active_player_to_next_player():
	_active_player = (_active_player + 1) % _players.size()

func is_user_making_choice():
	return (_player_making_choice == 0) and !_AI_only

func is_ai_making_choice():
	return (_player_making_choice != 0) or AI_only

func is_debug_on():
	return _debug
