var deck

func _init():
	deck = []

func size():
	return deck.size()

func push(card):
	deck.append(card)

func pop():
	return deck.pop_back()
	# ^ returns null if empty, it seems

# Fisher–Yates Shuffle
func shuffle():
	# XXX expect Godot 3.1 to support this (switch if same algorithm)
	randomize()
	var j = 0
	var temp
	for i in range(size() - 1, 1, -1):
		j = randi() % (i + 1) # random int for 0 <= j <= i
		temp = deck[j]
		deck[j] = deck[i]
		deck[i] = temp
