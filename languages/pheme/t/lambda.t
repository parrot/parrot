(include_file lib/PhemeTest.pir)

(plan 3)

(define carcar
	(lambda (l)
		(car (cdr l))))

(is
	(cdr (biz baz buzz))
	(baz buzz)
	"cdr gives final two elements")

(is
	(car (cdr (biz baz buzz)))
	baz
	"car gives first element")

(is
	(carcar (biz baz buzz))
	baz
	"head of two element list is first element")
