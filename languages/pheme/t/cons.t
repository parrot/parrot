(include_file lib/PhemeTest.pir)

(plan 6)

(is
	(cons banana (and honey sandwich))
	(banana and honey sandwich)
	"cons of atom to list should add atom to list head")

(is
	(car (cons banana (and honey sandwich)))
	banana
	"cons of atom to list should add atom to list head")

(is
	(car (cons (banana) (and honey sandwich)))
	(banana)
	"cons of list to list should add list to list head")

(is
	(cons
		((help) me)
		(learn (this) (consing stuff)))
	(((help) me) learn (this) ((consing stuff)))
	"cons of list to list should add list to list head")

(is
	(cons (alpha beta (gamma)) ())
	((alpha beta (gamma)))
	"cons onto empty list should wrap sexpr in another cons")

(is
	(cons a (car ((b) c d)))
	(a b)
	"cons onto list should prepend element to list")
