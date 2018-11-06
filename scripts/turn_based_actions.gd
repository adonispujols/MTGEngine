"""
< List of useful constants >
- list of phase indices:
* UNTAP_STEP = 0
* UPKEEP_STEP = 1
* DRAW_STEP = 2
* PRE_COMBAT_PHASE = 3
* BEGIN_COMBAT_STEP = 4
* DECLARE_ATTACKERS_STEP = 5
* DECLARE_BLOCKERS_STEP = 6
* FIRST_STRIKE_DAMAGE = 7
* COMBAT_DAMAGE_STEP = 8
* END_OF_COMBAT_STEP = 9
* POST_COMBAT_PHASE = 10
* END_ STEP = 11
* CLEANUP_STEP = 12
< /List of useful constants >
"""
# list of phase indices
const UNTAP_STEP = 0
const UPKEEP_STEP = 1
const DRAW_STEP = 2
const PRE_COMBAT_PHASE = 3
const BEGIN_COMBAT_STEP = 4
const DECLARE_ATTACKERS_STEP = 5
const DECLARE_BLOCKERS_STEP = 6
const FIRST_STRIKE_DAMAGE = 7
const COMBAT_DAMAGE_STEP = 8
const END_OF_COMBAT_STEP = 9
const POST_COMBAT_PHASE = 10
const END_STEP = 11
const CLEANUP_STEP = 12

# list holding methods
start_step_or_phase_methods = []

# methods
func start_next_step_or_phase(game):
	steps_and_pahses_methods[game.get_current_step_or_phase()]

"""
* start_next_step_or_phase(game object to work with)
^- Called when a phase/step ends.
- Keep updating until it's all implemented COMPLETELY
^- As [CR 703.1] states, these do NOT use the stack.
- simply calls steps_and_phases_methods[game.get_current_phase](game)
- we COULD create a game variable associated with this script so we DON'T need to pass the game param everywhere (but this seems rather clunky AND pot. buggy so no).
"""