extends Sigil

func rabbit_pelt() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("rabbit_pelt_card", "Rabbit Pelt") as String)
	
func wolf_pelt() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("wolf_pelt_card", "Wolf Pelt") as String)

func golden_pelt() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("golden_pelt_card", "Golden Pelt") as String)

func on_card_perished(card: Card) -> void:

	if card != attached_card:
		return
		
	var opposing_slot := fight_manager.board_manager.get_slot(oppose_pos(get_pos()))
	
	if opposing_slot.is_empty():
		return
	var opposing_card := opposing_slot.card
	var opposing_player := controller_id(get_pos(opposing_card.id))

	if opposing_card.rarity.name == "rare":
		var cd := golden_pelt()
		create_and_add_token(cd, opposing_player, card.id)
	elif opposing_card.attack == 0:
		var cd := rabbit_pelt()
		create_and_add_token(cd, opposing_player, card.id)
	else:
		var cd := wolf_pelt()
		create_and_add_token(cd, opposing_player, card.id)

	kill_card(opposing_card.id)
