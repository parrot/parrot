class Foo:
    def __init__(self):
	self.i = 10
	self.j = 20

    def I(self):
	return self.i
    def J(self):
	return self.j

class main:
    o = Foo()
    for i in range(1,500001):
	x = o.I()
	y = o.J()
    print o.I()


