extends Sigil


func bone_cost() -> int:
	return get_config("bone_gun_cost", 1)


func gun_damage() -> int:
	return get_config("bone_gun_damage", 1)


func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	return fight_manager.my_data.bones < bone_cost()


func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	var oppose_card := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))

	add_action(ChangeBonesAction.new(-bone_cost(), controller_id()))
	damage_card(card.id, gun_damage(), Action.IDType.CARD, oppose_card.card.id)
