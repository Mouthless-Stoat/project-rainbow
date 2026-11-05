extends Sigil

func scopophobic_buff() -> int:
	return get_config("Scopophobic_buff", 1) as int


func static_ability(is_reset: bool) -> void:
		
	if is_reset:
		attached_card.attack_buf = max(0, attached_card.attack_buf - scopophobic_buff())
		
	else:
		var oppose_card := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))
		if oppose_card == null:
			attached_card.attack_buf += scopophobic_buff()
