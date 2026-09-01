extends ShedderSigil


func friend_data() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("squirrel_card", "Squirrel") as String)
