extends Sigil


func on_card_played(
	played_card: Card, pos: Vector2i, _placer_type: Action.IDType, _placer_id: String
) -> void:
	if played_card == attached_card:
		return
		
	var attached_pos := get_pos(attached_card.id)
		
	if attached_pos.y != pos.y:
		return
	
	flip_h = attached_pos.x > pos.x
	
	var direction := Vector2i.RIGHT if attached_pos.x > pos.x else Vector2i.LEFT
	
	for slot in fight_manager.board_manager.get_active_row(true):
		pos += direction
		if pos == attached_pos:
			break
		elif fight_manager.board_manager.is_slot_empty(pos):
			move_card(attached_card.id, pos)
			break
