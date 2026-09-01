extends Sigil


func check_if_needs_die() -> void:
	var moxes : Card.Costs.Mox = fight_manager.get_moxes()
	if moxes.green <= 0 && moxes.orange <= 0 && moxes.blue <= 0 :
		kill_card(attached_card.id)

## NOTE: If there are other methods by which a state could exist where a player has no gems (IE: Removing sigils, bouncing cards, exiling cards, etc...) ADD THOSE BELOW!
## Same format, just the hook, and call [check_if_needs_die()]

func on_card_perished(striker: Card) -> void:
	check_if_needs_die()

func on_card_transformed(card: Card, card_data: Ruleset.CardData) -> void:
	check_if_needs_die()
