extends Sigil

func max_sigils() -> int:
	return get_config("max_sigils", 3) as int


func on_card_played(
	played_card: Card, _pos: Vector2i, _placer_type: Action.IDType, _placer_id: String
) -> void:

	if played_card != attached_card:
		return
	var new_data := played_card.card_data.duplicate()
	new_data.sigils.remove_at(new_data.sigils.find("Amalgamation"))
	var row := BoardManager.Row.MINE if controller_id() == Global.uuid else BoardManager.Row.OPP
	var cards := fight_manager.get_cards(row)
	
	for friendly in cards:
		if friendly == played_card or friendly == null:
			continue
		new_data.attack = friendly.attack
		new_data.health += friendly.health
		for trai in friendly.traits: 
			if trai not in new_data.traits:
				new_data.sigils.append(trai)
		for sigil in friendly.sigils:
			if sigil not in new_data.sigils:
				new_data.sigils.append(sigil)
				if len(new_data.sigils) >= max_sigils():
					break
		remove_card(friendly.id)
	transform_card(played_card.id, new_data)
