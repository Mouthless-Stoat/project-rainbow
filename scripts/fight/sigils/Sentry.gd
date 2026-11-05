extends Sigil


func sentry_damage() -> int:
	return get_config("sentry_damage", 1) as int

func on_card_moved(card: Card, from: BoardManager.Slot, to: BoardManager.Slot) -> void:
	var opposing : Card = fight_manager.board_manager.get_slot(oppose_pos(get_pos())).card
	if card == opposing || card == attached_card:
		damage_card(opposing.id, sentry_damage(), Action.IDType.CARD, attached_card.id)

func on_card_played(
	card: Card, pos: Vector2i, placer_type: Action.IDType, placer_id: String
) -> void:
	var opposing : Card = fight_manager.board_manager.get_slot(oppose_pos(get_pos())).card
	if card == opposing:
		damage_card(opposing.id, sentry_damage(), Action.IDType.CARD, attached_card.id)
