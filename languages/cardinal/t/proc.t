require 'test'
plan 8

proc = Proc.new{ |n| 
	is n, 1, '.call on Proc'
}
pass '.new on Proc'
is proc.class.to_s, 'Proc', '.class on Proc'
is proc.arity, 1, '.arity on Proc'
proc.call(1)
myself = proc.to_proc
is myself.class.to_s, 'Proc', '.to_proc on Proc'



def gen_times(factor)
	return Proc.new {|n| n*factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

is times3.call(12), 36, '.call on Proc'
is times5.call(5), 25, '.class on Proc'
is times3.call(times5.call(4)), 60, '.call on Proc' 
