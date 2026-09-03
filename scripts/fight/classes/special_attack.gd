@abstract class_name SpecialAttack
extends ActionHook

## The fight manager that is current "active".
## Just a reference to the fightmanager so you can access like the board, hand,
## play card and general utils offer by the fight manager.
var fight_manager: FightManager
## The card this sigil is attached to.
var attached_card: Card

@abstract func attack_value() -> int


func active_in_hand() -> bool:
	return false
