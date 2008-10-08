require 'test'
plan 3


discrete_range = Range.new(-3, -1)
n = -3
discrete_range.each() do |i|
    is i, n, '.each on Range'
    n += 1
end


todo "test range over ascii chars"
#discrete_range = Range.new('a','c')
#discrete_range.each() do |c|
#	p c
#end

todo "test range over floats"
#def test_case()
	#continuous_range = Range.new(0.1, 0.3)
	#n = 0.1
	#continuous_range.each() do |i|
	#    nok i, n, '.each on Range'
	#    n += 0.1
	#end
	#rescue => type_err
  	#   pass 'continuous_range type error'
	#   print "rescued error=", type_err, "\n"
#end
#test_case()

todo "test range over custom objects"
