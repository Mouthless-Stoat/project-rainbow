extends SpawnFriendSigil


func friend_data() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("chime_card", "Chime") as String)

func on_card_damaged(
	victim: Card, amount: int, attacker_type: Action.IDType, attacker_id: String
) -> void:
	var victim_pos := get_pos(victim.id)
	if controller_id() != controller_id(victim_pos):
		return
	print(victim.card_data.name)
	print("vs")
	print(friend_data().name)
	if victim.card_data.name != friend_data().name:

		return
	add_action(PreCardStrikeAction.new(attached_card.id, oppose_pos(victim_pos), false))
