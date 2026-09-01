extends Sigil


func static_ability(is_reset: bool) -> void:
	var neighbour_slot := get_neighbour_slot(false)
	var row : BoardManager.Row = fight_manager.board_manager.get_card_pos(attached_card.id).y as BoardManager.Row
	for slot in fight_manager.board_manager.get_row(row):
		if slot.card != null && slot.card.tribes.has(Ruleset.Tribe.GEMS):
			if is_reset:
				slot.attack_buf = max(0, slot.attack_buf - 1)
			else:
				slot.attack_buf += 1
