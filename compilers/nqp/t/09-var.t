#!./parrot nqp.pbc

# check variables

say('1..14');

my $o1 := 'ok 1'; print($o1); say(" # direct binding and scoping");

my $o2; $o2 := 'ok 2'; print($o2); say(" # first scope and declare, then bind");

my $o3 := 'ok 3';
my $p3 := $o3;
print($p3); say(" # bind to another variable");

my $o4 := 'ok 4';
my $p4 := $o4;
$o4 := 'not ok 4';
print($p4); say(" # rebind the original, the bound one does not change");

my $o5 := 'ok 5';
my $p5 := $o5;
my $o5 := 'not ok 5';
unless $p5 {
    print("not ");
}
say("ok 5 # rebind and redeclare the original.  The value is lost");

my $r1 := 'not ok 6';
my $r2 := 'ok 6';
my $r3;
$r3 := $r1;
$r3 := $r2;
print($r3); say(' # variables can be rebound');

my $b1 := 'ok 8';

{
    my $b1 := 'ok 7';
    print($b1); say(' # my scoping works inside a block');
}

print($b1); say(' # block does not stomp on out scope');

my $b2 := 'ok 9';

{
    print($b2); say(' # variables scoped outside of block persists inside the block');
}

my $b3;
{
    my $b4 := 'ok 10';
    $b3 := $b4;
}
print($b3); say(' # variable is bound to the value, not the symbol in the block');

my $b5 := '';
{
    my $b5 := 'not ';
}
print($b5);say('ok 11 # $b5, defined inside block, does not exist outside');

{
    our $m1 := 'ok 12 ';
}

our $m1;
unless $m1 {
    print('not ');
}
say('ok 12 # our variables have package scope, exists outside of block');

our $m2;
$m2 := 'ok 13';
{
    print($m2); say(' # our variables exist inside blocks');
}

our $m3;
$m3 := 'not ok 14';
{
    $m3 := 'ok 14';
}
print($m3); say(' # our variables written inside block keep their values outside');
