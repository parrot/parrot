#! ruby

def addit(*a)
	res = 0.0
	a.each { |x|
		res += x.to_f
	}
	res
end

arg0 = 1000;
arg1 = 7.100;
arg2 = 87;
arg3 = "3.87";
arg4 = "21000000";

result = 0
500000.times {
	result = addit(arg0, arg1, arg2, arg3, arg4)
}
puts result

