extends Sigil


func on_card_strike(striker: Card, pos: Vector2i, to_face: bool) -> void:
	if striker != attached_card:
		return
	var guzzled_form := attached_card.card_data.duplicate()

	guzzled_form.health += striker.attack
