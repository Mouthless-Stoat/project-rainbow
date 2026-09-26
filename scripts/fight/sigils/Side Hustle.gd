extends Sigil

func get_max() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("side_hustle_max_cards", 99) as String)

func on_card_strike(striker: Card, pos: Vector2i, to_face: bool) -> void:
	if striker != attached_card || !to_face:
		return
	draw_cards(DrawCardAction.Deck.SIDE, min(striker.attack, get_max()) as int)
