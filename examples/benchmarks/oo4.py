class Foo:
    def __init__(self):
	self.i = 10
	self.j = 20

class main:
    o = Foo()
    for i in range(1,500001):
	o.i = i
	o.j = i
    print o.i


