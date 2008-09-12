require 'test'
plan 2

speak = 'squaak'
bird = 'parrot'

action = speak + ' of a ' +  bird
is action, 'squaak of a parrot', 'chained + operator on new String' 
again = String.new()
again = bird + " wanna" + ' cracker, ' + speak + '!'
is again, 'parrot wanna cracker, squaak!', 'chained + operator on existing String'
