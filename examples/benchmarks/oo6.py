class Foo:
    def __init__(self):
	self.i = 10
	self.j = 20
    def I(self, i):
	self.i = i
    def J(self, j):
	self.j = j

class main:
    o = Foo()
    for i in range(1,500001):
	o.I(i)
	o.J(i)
    print o.i


