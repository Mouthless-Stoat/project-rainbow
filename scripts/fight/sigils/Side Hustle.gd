extends Sigil


func on_card_strike(striker: Card, pos: Vector2i, to_face: bool) -> void:
	if striker != attached_card || !to_face:
		return
	draw_cards(DrawCardAction.Deck.SIDE, 1)
