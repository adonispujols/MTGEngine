var deck
var index
var hand
var maximum_hand_size
var max_lands_per_turn
var lands_played
var mana_pool
var has_priority
var making_choice
var active_player
var paying_mana_cost

func _init(_deck, player_index):
	deck = _deck
	index = player_index
	var Hand = load("res://scripts/hand.gd")
	hand = Hand.new()
	maximum_hand_size = 7
	max_lands_per_turn = 1
	lands_played = 0
	var ManaPool = load("res://scripts/game.gd")
	mana_pool = ManaPool.new()
	has_priority = false
	making_choice = false
	active_player = false
	paying_mana_cost = false

func index():
	return index

func active_player():
	return active_player

func make_active():
	active_player = true

func make_nonactive():
	active_player = false

func has_priority():
	return has_priority

func gain_priority():
	# state based actions check goes here, BEFORE they get priority
	has_priority = true
	making_choice = true

func lose_priority():
	# make gui option to pass priority go away (here or gui element itself)
	has_priority = false
	making_choice = false

func paying_mana_cost():
	return paying_mana_cost

func started_paying_mana_cost():
	paying_mana_cost = true

func stopped_paying_mana_cost():
	paying_mana_cost = false

#func started_making_choice():
#	making_choice = true
#
#func stopped_making_choice():
#	making_choice = false

func draw(amount):
	for x in range(amount):
		hand.add(deck.remove_top())

func untap_all_permanents():
	for card in game.get_permanents_of_player(index):
		card.untap()

func pay_costs(costs):
	for cost in costs:
		if !cost.pay():
			print("ERROR: Failed to pay cost. Player: ", player.index())
			get_tree().quit()
			# XXX useful to know WHICH cost triggered this
	return true
