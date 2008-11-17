require 'test'
plan 4

k = 0
callcc {|cont|
  outer = [ 0, 1, 2, 3, 4 ]
  outer.each(){ |i|
	ok i < 1, 'callcc for continuation' 
	inner = 1...10
        inner.each(){ |j|
		cont.call() if j == 3
		ok j < 3, 'callcc for continuation'
		k = k + 1
	}
  }
}
ok k < 3, '.call on continuation'
