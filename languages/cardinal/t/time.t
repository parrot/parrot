require 'test'
plan 10


todo 'fix Time.sec-year test, maybe fix Time.new.to_s output to a 100% correct format, then compare with the parsed string?', 7
is Time.new.to_s.length, 25, '.to_s on Time'
# parse Time.new.to_s a match things up with these methods?
# that might work, but right now the to_s is 100% correct
t = Time.new
pass '.sec on Time' if t.sec
pass '.hour on Time' if t.hour
pass '.mday on Time' if t.mday
pass '.day on Time' if t.day
pass '.month on Time' if t.month
pass '.year on Time' if t.year

t = Time.new
if !t.gmt?
   pass '.gmt? on Time'
   epoch1 = t.to_i
   t.gmtime
   epoch2 = t.to_i
   if epoch1 != epoch2
	pass '.gmtime on Time'
   end
else
   pass '.gmt? on Time'
   epoch1 = t.to_i
   t.gmtime
   epoch2 = t.to_i
   if epoch1 == epoch2
	pass '.gmtime on Time'
   end
end

#p tm.sec.class
#p "class=", t.class
#p tm.eql?(t)
#p tm === t

t1 = Time.new
t1_epoch = t1.to_i

t = Time.new
sec = t.sec
sleep 1
sec2 = Time.new.sec
proclaim sec < sec2, 'sleep'

t2_epoch = Time.new.to_i
isgt t2_epoch, t1_epoch, '.to_i on Time'

todo 'fix Floats in Cardinal', 11
class_name = sprintf("%s", t.to_f.class)
is class_name, 'Float', '.to_f on Time'
