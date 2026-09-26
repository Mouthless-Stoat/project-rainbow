extends Sigil


@warning_ignore("unused_parameter")
func on_card_played(
	card: Card, pos: Vector2i, placer_type: Action.IDType, placer_id: String
) -> void:
	if card != attached_card:
		return
	var to_draw : int = 0;
	var row : BoardManager.Row = pos.y as BoardManager.Row
	for c : Card in fight_manager.get_cards(row):
		if c.tribes.has(Ruleset.Tribe.GEMS):
			to_draw += 1
	if row == BoardManager.Row.MINE_BACK:
		for c : Card in fight_manager.get_cards(BoardManager.Row.MINE):
			if c.tribes.has(Ruleset.Tribe.GEMS):
				to_draw += 1
	if row == BoardManager.Row.OPP_BACK:
		for c : Card in fight_manager.get_cards(BoardManager.Row.OPP):
			if c.tribes.has(Ruleset.Tribe.GEMS):
				to_draw += 1
	draw_cards(DrawCardAction.Deck.MAIN, to_draw)
