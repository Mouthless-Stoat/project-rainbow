class_name DiscardHandAction
extends Action

var player_id: String


static func action_type() -> Type:
	return Type.DISCARD_HAND


func _init(pid: String) -> void:
	player_id = pid


func resolve(fight_manager: FightManager) -> void:
	if player_id == Global.uuid:
		var card_in_hand := fight_manager.card_manager.get_cards_by_zone(Card.Zone.HAND)
		for card in card_in_hand:
			fight_manager.card_manager.move_card(card.id, Card.Zone.GRAVEYARD)
		fight_manager.my_data.hand_size = 0
		ConnectionManager.send(
			ConnectionManager.GameMessage.DISCARD_ACQUIRED,
			{cards = card_in_hand.map(func(c: Card) -> String: return c.id)}
		)
	else:
		var packet: Dictionary = {}
		while packet == {} or packet.type != ConnectionManager.GameMessage.DISCARD_ACQUIRED:
			packet = await ConnectionManager.recieved_packet
		fight_manager.opp_data.hand_size = 0
	# TODO: Implemenent a hook for this
	fight_manager._no_activation()


func as_dict() -> Dictionary:
	return {type = action_type(), player_id = player_id}


static func from_dict(dict: Dictionary) -> Action:
	return DiscardHandAction.new(dict.player_id as String)
