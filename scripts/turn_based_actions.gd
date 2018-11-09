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
const start_step_or_phase_methods = ["upkeep_step_start", "draw_step_start",
		"pre_combat_phase_start", "begin_combat_step_start", "begin_combat_step_start",
		"declare_attackers_step_start", "first_strike_damage_step_start",
		"combat_damage_step_start", "end_combat_step_start", "post_combat_phase_start",
		"end_step_start", "cleanup_step_start", "untap_step_start"]

func start_next_step_or_phase(game):
	call(start_step_or_phase_methods[game.step_or_phase()], game) # START ON UPKEEP, untap last

func special_untap_step_start(game, first_player):
	game.step_or_phase = 0
	# XXX ^ evil set (along with rest of step_or_phase = x)
	first_player.becomes_active()
	game.get_active_player().untap
	upkeep_step_start(game)

func untap_step_start(game):
	game.step_or_phase = 0
	game.change_active_player_to_next()
	game.get_active_player().untap_all_permanents()
	upkeep_step_start(game)

func upkeep_step_start(game):
	game.step_or_phase = 1
	game.get_active_player.gain_priority()

func draw_step_start(game):
	game.step_or_phase = 2
	game.get_active_player().draw(1)
	game.get_active_player.gain_priority()

func pre_combat_phase_start(game):
    game.step_or_phase = 3
    game.get_active_player.gain_priority()

func begin_combat_step_start(game):
    game.step_or_phase = 4
    game.get_active_player.gain_priority()

func declare_attackers_step_start(game):
    game.step_or_phase = 5
    game.get_active_player.gain_priority()

func declare_blockers_step_start(game):
    game.step_or_phase = 6
    game.get_active_player.gain_priority()

func first_strike_damage_step_start(game):
    game.step_or_phase = 7
    game.get_active_player.gain_priority()

func combat_damage_step_start(game):
    game.step_or_phase = 8
    game.get_active_player.gain_priority()

func end_combat_step_start(game):
    game.step_or_phase = 9
    game.get_active_player.gain_priority()

func post_combat_phase_start(game):
    game.step_or_phase = 10
    game.get_active_player.gain_priority()

func end_step_start(game):
    game.step_or_phase = 11
    game.get_active_player.gain_priority()

func cleanup_step_start(game):
    game.step_or_phase = 12
    untap_step_start(game)
