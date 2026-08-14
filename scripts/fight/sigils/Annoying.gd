extends Sigil


func static_ability(is_reset: bool) -> void:
	
	var pos := get_pos(attached_card.id)
	var slot := fight_manager.board_manager.get_slot(oppose_pos(pos))

	if is_reset:
		slot.attack_buf = max(0, slot.attack_buf - 1)
	else:
		slot.attack_buf += 1
