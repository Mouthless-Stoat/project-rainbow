@abstract class_name ShedderSigil
extends Sigil

@abstract func friend_data() -> Ruleset.CardData

func on_turn_end(player_id: String) -> void:
	if player_id != controller_id():
		return
	var neighbour := get_neighbour_slot()
	push_warning(neighbour)
	var slot := neighbour[int(not flip_h)]
	if slot == null or slot.card != null:
		flip_h = true
	slot = neighbour[int(not flip_h)]
	if slot == null or slot.card != null:
		return
	var old_slot := get_pos()
	var f_data := friend_data()
	move_card(attached_card.id, slot.pos)
	create_and_play_token(f_data, old_slot, attached_card.id)
