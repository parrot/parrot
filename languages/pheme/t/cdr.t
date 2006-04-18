(include_file lib/PhemeTest.pir)

(plan 2)

(is
	(cdr (biz baz buzz)) (baz buzz)
	tail-of-three-elem-list-should-be-two-elem-list)

(is
	(cdr (biz baz)) (baz)
	tail-of-two-elem-list-should-be-one-elem-list)
