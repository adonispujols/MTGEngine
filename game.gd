
#var _var1
#
#func _init(var1):
#	_var1 = var1
#
#func set_val(arg):
#	_var1 = arg
#
#func get_val():
#	return _var1

# field variables
# required parameters:
var _players

# other fields
var _current_step
var _players_have_priority
var _player_with_priority
var _player_with_paying_costs_priority
var _active_player
var _NAP_have_acted
var _battlefield
var _stack


# Initializing member vars on object creation
func _init(players, first_player):
	_players = players
	
	_current_step = 0
	_players_have_priority = false
	_player_with_priority = first_player - 1
	_player_with_paying_costs_priority = -1
	_active_player = first_player - 1
	_NAP_have_acted = false
	_battlefield = []
	var _stack_class = load("res://stack.gd")
	_stack = _stack_class.new()



# methods

"""
Funcs:
* Get players
^ How to do safely?

* Get player (index)
^- 0 (or 1st) is user player, 1 (or 2nd) is ai (typically)
^- we might have ai vs ai
* Get player with priority
^ return getPlayer(player with priority)
^- Do we need to know who has priority? Game is called by checking player with index.

* player has priority(player index)?
^- returns true or false, depending if true

* Pass priority
^ Should only pass IF you have priority to begin with!
^- for team games, need to wait until all players in team to pseudo-pass priority to "truly" pass priority(they share priority, but must decided together to pass it).
- players_lose_priority()
^- the only player/team with priority losses it with pass, and we'll see what happens before anyone regains it
- If all_players_passed_with no actions():
^- if (stack empty):
^^- drain_mana_pools()
^^-- all mana pools are at the end of each step and phase.
^^- call turn_based_actions.start_next_phase_or_step(this)
^^^- this will handle BOTH ending this step/phase AND starting the next one!
^- else (i.e., stack is not empty):
^^-- again, no one has priority during resolution of spell.
^^-stack.resolve_next()
^^-- let the stack handle popping and stuff
- if active player has priority, set NAP_have_acted == false
^- reset nap have acted
- (after all this) give next player priority().
^ This is called from input
^ Only user with priority may call this (might need to protect function from illegal calls?)

* all_players_passed_no_actions?:
^ Essentially, check if we have the AP pass, NAP 1 pass, etc sequence.
^- in actual code: check if both current player with priority == active player and NAP_have_acted boolean is true.

* Give_next_player_priority
- check for state based actions
- then and only then, give back priority: players have priority == true

- set player with priority = player index ++ mod player size (so we go around indices)
^- something like that
- players have priority = true

* give active player priority
^- set player with priority (active player)
- need to so explicitly, else the last turn's AP would regain it.

* players_lose_priority
^ can't take actions during playing/resolving something (game/rules will allow special exceptions)
^- set players have priority = false

* is_player's_turn (index)
^- returns if player's turn == index
* get current phase
^- return current phase

* game.set_step_or_phase(phase index)
^- sets phase = phase index
^- primarily used by turn based actions

* start game
^- call turn_based_actions.untap_step_start(this)
^- for now  we're just force calling untap_step_start.

* get current phase
^- returns the phase index int

* set_current_turn_to_active_player()
^- active_player ++ mod player size.
^- some sort of wraparound

* drain_mana_pools()
^- all mana pools are at the end of each step and phase.


* end phase/step
- if get current phase == end phase
^- set current phase == 0
^- set whose turn is it to next player
- else:
^- set current phase++
- call turn-based-action(phase)
- give whose turn it is priority
^- give priority (whose turn it is)
"""


