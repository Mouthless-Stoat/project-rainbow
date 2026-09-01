extends Sigil

func mox_value() -> Card.Costs.Mox:
	var all: Card.Costs.Mox = Card.Costs.Mox.o()
	all.green = 1;
	all.blue = 1;
	return all
