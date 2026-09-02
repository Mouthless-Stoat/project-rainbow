extends Sigil

func trymove(card_pos: Vector2i, offset: int, row: Array[BoardManager.Slot]) -> bool:
	var readpos : int = card_pos.x
	while(readpos >= 0 && readpos < row.size()):
		move_card(row[readpos].card.id, Vector2i(readpos + offset, card_pos.y)) #move the card. The first card should always be the hefty boi, so no need to worry about it being null.
		readpos += offset
		if row[readpos].card == null: #if we find an empty space, break the chain.
			break

	return (readpos < 0 || readpos >= row.size()) #if we got outside of the array, the shove-chain has hit a wall



func on_turn_end(player_id: String) -> void:
	if player_id != controller_id():
		return
	var pos := fight_manager.board_manager.get_card_pos(attached_card.id)
	var slots := fight_manager.board_manager.get_row(pos.y)
	push_warning(slots)
	if !trymove(pos, 1 if flip_h else -1, slots):
		flip_h = !flip_h
	trymove(pos, 1 if flip_h else -1, slots)
