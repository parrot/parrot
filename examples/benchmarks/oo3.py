class Foo:
    def __init__(self):
	self.i = 10
	self.j = 20

class main:
    o = Foo()
    for i in range(1,500001):
	x = o.i
	y = o.j
    print o.i

