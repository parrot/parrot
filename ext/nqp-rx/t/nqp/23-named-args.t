#! nqp

# test named parameters and arguments

plan(4);

sub f1 ($x, :$y) { $x - $y; }
say('ok ', f1(2, :y(1)), ' # named args passable');

sub f2 ($x, :$y) { $x; }
say('ok ', f2(2), ' # named args ignorable');

sub f3 (:$x, :$y) { $x - $y; }
say('ok ', f3(:y(2), :x(5)), ' # args reorderable');

sub f4 ($w, $x, :$y, :$z) { $w + $x + $y + $z; }
say('ok ', f4(:z(2), -3, :y(1), 4), ' # named/positional intermixable');


# XXX: test mandatory named args are actually mandatory
