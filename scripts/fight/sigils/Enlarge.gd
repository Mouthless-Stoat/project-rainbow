extends Sigil


func bone_cost() -> int:
	return get_config("enlarge_bone_cost", 2)


func attack_buff() -> int:
	return get_config("enlarge_attack_buff", 1)


func health_buff() -> int:
	return get_config("enlarge_health_buff", 1)


func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	return fight_manager.my_data.bones < bone_cost()


func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	add_action(ChangeBonesAction.new(-bone_cost(), controller_id()))
	change_stats(attached_card.id, attack_buff(), health_buff())
