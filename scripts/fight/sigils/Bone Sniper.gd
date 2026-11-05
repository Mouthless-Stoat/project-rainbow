extends Sigil


func bone_cost() -> int:
	return get_config("bone_sniper_cost", 1)

func sniper_damage() -> int:
	return get_config("bone_sniper_damage", 1)

func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	return fight_manager.my_data.bones < bone_cost()


func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	var slot := await request_target(
		controller_id(), func(s: BoardManager.Slot) -> bool: return s.pos.y == BoardManager.Row.OPP
	)
	add_action(ChangeBonesAction.new(-bone_cost(), controller_id()))
	
	damage_card(card.id, sniper_damage(), Action.IDType.CARD, slot.card.id)
