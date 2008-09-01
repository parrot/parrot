# check compare ops
puts '1..9';

puts 'ok 1' if 1 < 2;
puts 'ok 2' if 1 > 2 or 2; #will print because of the or 2
puts 'ok 3' if 1 <= 2;
puts 'ok 4' if 2 >= 1;
puts 'ok 5' if 1 == 1;
puts 'ok 6' unless 1 == 2;
puts 'ok 7' if 1 < 2;
puts 'ok 8' if 4 > 3;
puts 'ok 9' if 1 != 2;
puts 'nok 10' if 1 != 1;
