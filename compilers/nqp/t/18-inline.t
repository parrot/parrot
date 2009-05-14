#!./parrot nqp.pbc

# inline

plan(7);

PIR q<    say 'ok 1' >;
PIR q:to:'OK2';
    say 'ok 2'
OK2

PIR q:to:<OK4>;
        say 'ok 3'
        say 'ok 4'
    OK4    

PIR q:to:"OK5";
    say 'ok 5'
OK5

Q:PIR { say 'ok 6' };
my $x := Q:PIR { %r = box 'ok 7' };
say($x);

