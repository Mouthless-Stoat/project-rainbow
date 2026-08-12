extends Sigil

func fish_data() -> Ruleset.CardData:
	var bad_fish := get_config("bad_fish_card", "Bad Fish") as String
	var more_fish := get_config("more_fish_card", "More Fish") as String
	var good_fish := get_config("good_fish_card", "Good Fish") as String
	return Global.get_card_by_name([bad_fish, bad_fish, more_fish, good_fish].pick_random() as String)


func on_card_perished(card: Card) -> void:
	
	if card != attached_card:
		return

	create_and_add_token(fish_data(), controller_id(), attached_card.id)
