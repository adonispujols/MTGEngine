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

# list holding method names as strings
const start_step_or_phase_methods = []

# methods
static func start_next_step_or_phase(game):
	call(start_step_or_phase_methods[game.get_current_step_or_phase()], game)

static func untap_step_start(game):
	game.set_step_or_phase(0)
	game.change_active_player_to_next_player()
	# untap all permanents of active player
	game.get_active_player().untap
	
static func 
static func 
static func 
static func 
static func 
static func 
static func 
static func 
static func 
static func 
static func 
"""
* untap_step_start(game)
- game.set_step_or_phase(0)
^- this COULD be made more efficient/automated on end_phase... call BUT risks making code buggy (so we won't).
- game.change_active_player_to_next_player():
^- set the active player to the next player
- untap all permanents (if able/barring costs)
^- in ruling: to "determine what to untap" means to check if there are any effect preventing something from untapping.
- skip immediately to untap step because NO ONE receives priority during this step [CR 502.3]:
- "No player receives priority....Triggers during this step are held until next time a player would receive priority, which is usually during the upkeep step. (See rule 503, “Upkeep Step.”)"
"""