var players
var first_player
var step_or_phase
var passes_count
var battlefield
var stack
# XXX should NOT hold this in memory (it's a waste). how to get around it?
const TurnBasedActions = preload("turn_based_actions.gd")

# Initializing member vars on object creation
func _init(_players, _first_player):
	players = _players
	first_player = _first_player
	step_or_phase = 0
	passes_count = 0
	battlefield = []
	for player in range(players.size()):
		battlefield.append([])
	var Stack = load("stack.gd")
	# XXX ^ make class calls into constants?
	# XXX ^ preload class calls?
	stack = Stack.new()

func get_player(player_index):
	return players[player_index]

func get_active_player():
	for player in players:
		if player.is_active_player():
			return player

func get_player_due_priority():
	for player in players:
		if player.is_due_priority():
			return player

func pass_priority(player):
	if !player.has_priority():
		print("Passed without priority. Player: ", player.index())
	player.lose_priority()
	if all_players_passed_no_actions(player.index()) and stack.empty():
		empty_mana_pools()
		TurnBasedActions.start_next_step_or_phase(this)
	else:
		if !stack.empty():
			stack.resolve_next()
		get_player((player.get_index + 1) % players.size()).gain_priority()

func all_players_passed_no_actions(player_index):
	var passed = false
	if (get_player((player.get_index + 1) % players.size()).is_active_player()):
		if passes_count == players.size():
			passed = true
		passes_count = 0
	else:
		passes_count += 1

func start_game():
	TurnBasedActions.special_untap_step_start(self, get_player(first_player))

func change_active_player_to_next():
	previous_active_player_index = get_active_player.get_index()
	get_active_player.becomes_nonactive()
	get_player((player.get_index + 1) % players.size()).becomes_active()

func empty_mana_pools():
	for player in players:
		player.mana_pool.clear()

func step_or_phase():
	return step_or_phase

func get_all_permanents_of_player(player_index):
	return battefield[player_index]

func put_on_battlefield(card, player):
	battefield[player.index()].append(card_object)
	player.hand.remove(card.index())
