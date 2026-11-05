extends Sigil

func get_max() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("looter_max_cards", 99) as String)

func on_card_strike(striker: Card, pos: Vector2i, to_face: bool) -> void:
	if striker != attached_card || !to_face:
		return
	draw_cards(DrawCardAction.Deck.MAIN, min(striker.attack, get_max()) as int)
