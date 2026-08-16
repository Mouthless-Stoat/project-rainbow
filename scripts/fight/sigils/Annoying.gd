extends Sigil


func static_ability(is_reset: bool) -> void:
	
	var slot := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))

	if is_reset:
		slot.attack_buf = max(0, slot.attack_buf - 1)
	else:
		slot.attack_buf += 1
