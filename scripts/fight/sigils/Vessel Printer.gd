extends Sigil


func vessel_printer_draw() -> int:
	return get_config("vessel_printer_draw", 1) as int


func on_card_damaged(
	victim: Card, _amount: int, attacker_type: Action.IDType, attacker_id: String
) -> void:
	if victim != attached_card:
		return
		
	draw_cards(DrawCardAction.Deck.SIDE, vessel_printer_draw())
