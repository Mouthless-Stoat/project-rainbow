class_name ChangeCellsAction
extends Action

var amount: int
var player_id: String
var give_empty_cells: bool


static func action_type() -> Type:
	return Action.Type.CHANGE_CELLS


func _init(a: int, pid: String, b: bool = false) -> void:
	amount = a
	player_id = pid
	give_empty_cells = b


func resolve(fight_manager: FightManager) -> void:
	var data := fight_manager.get_data(player_id)
	data.cells += amount
	if !give_empty_cells:
		data.energy += amount
	if amount < 0:
		data.energy = min(data.energy, data.cells)
	await fight_manager._activate_sigils(
		func(sigil: Sigil) -> void: sigil.on_cell_changed(amount, player_id)
	)


func as_dict() -> Dictionary:
	return {type = action_type(), amount = amount, player_id = player_id, give_empty_cells = give_empty_cells}


static func from_dict(dict: Dictionary) -> Action:
	return ChangeCellsAction.new(dict.amount as int, dict.player_id as String, dict.give_empty_cells as bool)
