#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use File::Temp;
use Time::HiRes qw(sleep);

print "1..0 # SKIP non-blocking or threaded I/O not yet implemented\n";
exit 0;

# TAP Plan
print "1..4\n";

my $pir = File::Temp->new(TEMPLATE => 'thread_io_XXXX', SUFFIX => '.pir');
my $tmp = File::Temp->new(TEMPLATE => 'thread_io_XXXX', SUFFIX => '.tmp');

$pir->print(<<'EOF');
#! ./parrot

.sub main :main
    .local pmc insub, spinsub, spintask

    insub = get_global 'insub'
    $P0 = new 'Task', insub
    schedule $P0

    spinsub  = get_global 'spin'
    spintask = new 'Task', spinsub
    schedule spintask

    pass

    say "ok 2 - main task sleeping"
    sleep 0.5
    say "ok 4 - main task back"

    spintask.'kill'()
.end

.sub insub
    .local pmc stdin
    stdin = getstdin

    $P0 = stdin.'readline'()

    $S0 = $P0
    if $S0 == "grumblecake\n" goto good
    say "not ok 3"
    .return()

good:
    say "ok 3 - got input"
    .return()
.end

.sub spin
    say "ok 1 - spinning"
    $I0 = 0
spin_more:
    $I0 = $I0 + 1
    $I1 = $I0 % 4096
    if $I1 != 0 goto spin_more
    goto spin_more
.end

EOF

my $pir_file = $pir->filename;

open my $run, "|perl ${\$pir->filename} ${\$tmp->filename}";

sleep(0.05);
$run->print("grumblecake\n");
$run->flush;
sleep(0.25);

close($run);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
