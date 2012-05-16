#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(lib);

use File::Temp;
use Time::HiRes qw(sleep);
use Parrot::Config;

unless ( $PConfig{HAS_THREADS} ) {
    print "1..0 # SKIP non-blocking or threaded I/O not yet implemented\n";
    exit 0;
}

# TAP Plan
print "1..4\n";

my $pir = File::Temp->new(TEMPLATE => 'thread_io_XXXX', SUFFIX => '.pir');
my $tmp = File::Temp->new(TEMPLATE => 'thread_io_XXXX', SUFFIX => '.tmp');

$pir->print(<<'EOF');
#! ./parrot

.sub main :main
    .local pmc insub, intask, spinsub, spintask, counter
    counter = new ['Integer']
    counter = 0
    set_global 'counter', counter

    insub = get_global 'insub'
    intask = new 'Task', insub
    setattribute intask, 'data', counter
    schedule intask

    spinsub  = get_global 'spin'
    spintask = new 'Task', spinsub
    setattribute spintask, 'data', counter
    schedule spintask

    pass

    ok_main('main task sleeping', counter)
    sleep 0.5
    ok_main('main task back', counter)

    spintask.'kill'()
.end

.sub insub
    .param pmc counter
    .local pmc stdin, interp
    interp = getinterp
    stdin = getstdin

    $P0 = stdin.'readline'()

    $S0 = $P0
    if $S0 == "grumblecake\n" goto good
    say "not ok 3"
    .return()

good:
    ok('got input', counter)
    .return()
.end

.sub spin
    .param pmc counter
    ok('spinning', counter)
    $I0 = 0
spin_more:
    $I0 = $I0 + 1
    $I1 = $I0 % 4096
    if $I1 != 0 goto spin_more
    goto spin_more
.end

.sub ok
    .param pmc text
    .param pmc counter
    .local pmc interp, ok_task, ok_sub
    ok_sub = get_global 'ok_core'
    ok_task = new ['Task']
    setattribute ok_task, 'code', ok_sub
    setattribute ok_task, 'data', text
    push ok_task, counter
    interp = getinterp
    interp.'schedule_proxied'(ok_task, counter)
    wait ok_task
.end

.sub ok_core
    .param pmc text
    .local pmc counter, interp, task
    interp = getinterp
    task = interp.'current_task'()
    counter = pop task
    inc counter
    print 'ok '
    print counter
    print ' - '
    say text
.end

.sub ok_main
    .param pmc text
    .param pmc counter
    inc counter
    print 'ok '
    print counter
    print ' - '
    say text
.end

EOF

my $pir_file = $pir->filename;

open my $run, '|-', "perl ${\$pir->filename} ${\$tmp->filename}";

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
