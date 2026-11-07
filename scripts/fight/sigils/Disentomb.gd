extends Sigil


func bone_cost() -> int:
	return get_config("Disentomb_cost", 1)


func corpse_data() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("corpse_card", "Skeleton") as String)


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
	create_and_add_token(corpse_data(), controller_id(), attached_card.id)
