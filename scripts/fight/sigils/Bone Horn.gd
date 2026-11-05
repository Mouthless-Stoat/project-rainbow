extends Sigil


func energy_cost() -> int:
	return get_config("energy_horn_cost", 1)


func horn_yield() -> int:
	return get_config("horn_yield", 3) as int
	

func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	return fight_manager.my_data.energy < energy_cost()


func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	add_action(ChangeEnergyAction.new(-energy_cost(), controller_id()))
	change_bone(horn_yield(), controller_id())
