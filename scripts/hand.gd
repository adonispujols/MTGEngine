var hand

func _init():
	hand = []

func size():
	return hand.size()

func add(card):
	hand.append(card)

func get(card_index):
	return hand[card_index]

func remove(card_index):
	var card = get(card_index)
	hand.remove(card_index)
	# XXX ^ remove(index) doesn't return anything
	return card
