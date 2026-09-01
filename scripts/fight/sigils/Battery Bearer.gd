extends Sigil

func is_empty_cell() -> bool:
	return get_config("battery_bearer_gives_empty_cells", false)


func on_card_played(
	played_card: Card, pos: Vector2i, _placer_type: Action.IDType, _placer_id: String
) -> void:
	if played_card != attached_card:
		return
	change_cells(1, controller_id(), is_empty_cell())
