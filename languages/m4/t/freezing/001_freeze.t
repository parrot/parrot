# $Id$

use strict;

use Test::More tests => 1; 

my $real_out;
my $parrot_m4 = 'cd .. && ./parrot languages/m4/m4.pbc';


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=languages/m4/examples/only_builtin.frozen --freeze-state=languages/m4/examples/hello.frozen languages/m4/examples/hello.m4; cat languages/m4/examples/hello.frozen; rm languages/m4/examples/hello.frozen`; 
is( $real_out, << 'END_OUT', '1 file' );
Hello
T8,8
translittranslit
T6,6
substrsubstr
T5,5
ifdefifdef
T6,6
m4exitm4exit
T8,8
sincludesinclude
T4,4
decrdecr
T8,8
errprinterrprint
T4,4
defndefn
T5,5
indexindex
T6,6
divertdivert
T6,6
syscmdsyscmd
T5,5
indirindir
T4,4
evaleval
T5,5
shiftshift
T7,7
traceontraceon
T6,6
regexpregexp
T9,9
changecomchangecom
T7,7
esyscmdesyscmd
T7,7
builtinbuiltin
T4,4
incrincr
T7,0
__gnu__
T8,8
maketempmaketemp
T6,6
definedefine
T8,8
undivertundivert
T6,6
m4wrapm4wrap
T9,9
debugfiledebugfile
T6,6
divnumdivnum
T11,11
changequotechangequote
T8,8
__file____file__
T6,6
sysvalsysval
T8,8
undefineundefine
T7,7
dumpdefdumpdef
T8,8
patsubstpatsubst
T7,7
includeinclude
T6,6
popdefpopdef
T8,0
__unix__
T8,8
__line____line__
T3,3
lenlen
T6,6
ifelseifelse
T8,8
traceofftraceoff
T3,3
dnldnl
T7,7
pushdefpushdef
T6,6
formatformat
T9,9
debugmodedebugmode
END_OUT
