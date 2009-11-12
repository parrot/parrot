#!./parrot nqp.pbc

# inline

plan(2);

Q:PIR { say 'ok 1' };
my $x := Q:PIR { %r = box 'ok 2' };
say($x);

