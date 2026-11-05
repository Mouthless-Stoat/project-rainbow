extends Sigil


func gift_bearer_draw() -> int:
	return get_config("gift_bearer_draw", 1) as int


func on_card_perished(card: Card) -> void:
	if card != attached_card:
		return
		
	draw_cards(DrawCardAction.Deck.MAIN, gift_bearer_draw())
