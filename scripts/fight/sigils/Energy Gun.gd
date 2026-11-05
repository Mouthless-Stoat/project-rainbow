extends Sigil
func energy_cost() -> int:
	return get_config("energy_gun_cost", 1)

func gun_damage() -> int:
	return get_config("energy_gun_damage", 1)

func is_active_sigil() -> bool:
	return true


func is_disable() -> bool:
	var oppose_card := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))
	if not oppose_card.is_empty():
		return fight_manager.my_data.energy < energy_cost()
	return true

func on_sigil_activate(
	card: Card, sigil: Sigil, _source_id: String, _source_type: Action.IDType
) -> void:
	if card != attached_card or sigil != self:
		return

	var oppose_card := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))

	add_action(ChangeEnergyAction.new(-energy_cost(), controller_id()))
	damage_card(oppose_card.card.id, gun_damage(), Action.IDType.CARD, attached_card.id)
