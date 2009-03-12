require 'test'
plan 51

# add a test against the expected class type when we get .class worked out better
# our class hierarchy needs some work
def test_by_int(pos, neg, desc)
        isnt pos, '300', desc
 	isnt neg, '-300', desc
	is pos, 300, desc
	is neg, -300, desc
end

def test_by_str(pos, neg, desc)
	isnt pos, 300, desc
	isnt neg, -300, desc
	is pos, '300', desc
	is neg, '-300', desc
end

#int1 = Integer.new(300)
#int2 = Integer.new(-300)

int1 = 300
int2 = -300
test_by_int int1, int2, 'assignment of an Integer'

str1 = int1.to_s
str2 = int2.to_s
test_by_str str1, str2, '.to_s on Integer'

test1 = int1.to_i
test2 = int2.to_i
test_by_int test1, test2, '.to_i on Integer'

test1 = int1.to_int
test2 = int2.to_int
test_by_int test1, test2, '.to_int on Integer'

test1 = int1.floor
test2 = int2.floor
test_by_int test1, test2, '.floor on Integer'

test1 = int1.ceil
test2 = int2.ceil
test_by_int test1, test2, '.ceil on Integer'

test1 = int1.round
test2 = int2.round
test_by_int test1, test2, '.round on Integer'

test1 = int1.truncate
test2 = int2.truncate
test_by_int test1, test2, '.truncate on Integer'

test1 = int1.succ
test2 = int2.succ
is test1, 301, '.succ on Integer'
is test2, -299, '.succ on Integer'

test1 = int1.next
test2 = int2.next
is test1, 301, '.next on Integer'
is test2, -299, '.next on Integer'


is int1.numerator, int1, '.numerator on Integer'
is int2.numerator, int2, '.numerator on Integer'

is int1.denominator, 1, '.denominator on Integer'
is int2.denominator, 1, '.denominator on Integer'

test1 = int1.integer?
test2 = int2.integer?
proclaim test1, '.integer? on Integer'
proclaim test2, '.integer? on Integer'

test1 = 72.gcd 168
test2 = 19.gcd 36
is test1, 24, '.gcd on Integer'
is test2, 1, '.gcd on Integer'

one = 1
four = 4
j = 4
four.downto(1) do |i|
	is i, j, ".downto on Integer"
        j -= 1
end
j = 1
one.upto(3) do |i|
	is  i, j, ".upto on Integer"
	j += 1
end
