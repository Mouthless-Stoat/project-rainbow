extends ShedderSigil


func friend_data() -> Ruleset.CardData:
	return Global.get_card_by_name(get_config("skeleton_card", "Skeleton") as String)
