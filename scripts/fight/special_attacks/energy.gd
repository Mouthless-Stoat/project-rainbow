extends SpecialAttack

func energy_divisor() -> int:
	return get_config("energy_divisor", 2) as int


func attack_value() -> int:
	var data := fight_manager.get_data(controller_id() as String)
	return floor(data.energy/energy_divisor())
