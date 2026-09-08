class_name RemoveCardAction
extends Action

var card_id: String


static func action_type() -> Type:
	return Action.Type.REMOVE_CARD


func _init(cid: String) -> void:
	card_id = cid


func resolve(fight_manager: FightManager) -> void:
	var card := fight_manager.card_manager.get_card_by_id(card_id)
	if card.zone != Card.Zone.BOARD:
		push_warning("Card can't be removed if they aren't on the board!!")
		fight_manager._no_activation()
		return
	var slot := fight_manager.board_manager.get_slot_with_card(card_id)
	fight_manager._no_activation()
	for sigil in card._sigils:
		sigil.static_ability(true)
	## fight_manager.card_manager.move_card(card_id, Card.Zone.GRAVEYARD)
	slot.card = null
	card.visible = false


func as_dict() -> Dictionary:
	return {type = action_type(), card_id = card_id}


static func from_dict(dict: Dictionary) -> Action:
	return RemoveCardAction.new(dict.card_id as String)
