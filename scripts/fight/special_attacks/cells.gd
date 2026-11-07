extends SpecialAttack

func cell_divisor() -> int:
	return get_config("cell_divisor", 2) as int


func attack_value() -> int:
	var data := fight_manager.get_data(controller_id() as String)
	return floor(data.cells/cell_divisor())
