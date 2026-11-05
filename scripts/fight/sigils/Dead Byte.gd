extends Sigil

func byte_damage() -> int:
	return get_config("dead_byte_damage", 1)


func on_card_perished(card: Card) -> void:
	if card != attached_card:
		return
	
	TipScaleAction.new(byte_damage() * (-1 if card.pos.y == BoardManager.Row.MINE else 1))
