extends Sigil


func energy_cost() -> int:
	return get_config("energy_sniper_cost", 1)

func sniper_damage() -> int:
	return get_config("energy_sniper_damage", 1)

func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	return fight_manager.my_data.energy < energy_cost()


func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	var slot := await request_target(
		controller_id(), func(s: BoardManager.Slot) -> bool: return s.pos.y == BoardManager.Row.OPP
	)
	add_action(ChangeEnergyAction.new(-energy_cost(), controller_id()))
	
	damage_card(card.id, sniper_damage(), Action.IDType.CARD, slot.card.id)
