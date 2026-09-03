class_name UseHammerAction
extends Action

var card_id: String
var player_id: String


static func action_type() -> Type:
	return Type.USE_HAMMER


func _init(cid: String, pid: String) -> void:
	card_id = cid
	player_id = pid


func resolve(fight_manager:FightManager) -> void:
	fight_manager._push_action(KillCardAction.new(card_id))
	var card := fight_manager.card_manager.get_card_by_id(card_id)
	await fight_manager._activate_sigils(func(sigil: Sigil) -> void: sigil.on_card_hammered(card))


func as_dict() -> Dictionary:
	return {type = action_type(), card_id = card_id, player_id = player_id}


func duplicate() -> Action:
	return UseHammerAction.new(card_id, player_id)


static func from_dict(dict: Dictionary) -> Action:
	return UseHammerAction.new(dict.card_id as String, dict.player_id as String)
