# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/thr-primes.imc - Threads

=head1 SYNOPSIS

    % ./parrot examples/assembly/thr-primes.imc

=head1 DESCRIPTION

A threaded primes example.

From C<perldoc perlthrtut>:

    1  #!/usr/bin/perl -w
    2  # prime-pthread, courtesy of Tom Christiansen
    3
    4  use strict;
    5
    6  use threads;
    7  use Thread::Queue;
    8
    9  my $stream = new Thread::Queue;
    10 my $kid    = new threads(\&check_num, $stream, 2);
    11
    12 for my $i ( 3 .. 1000 ) {
    13     $stream->enqueue($i);
    14 }
    15
    16 $stream->enqueue(undef);
    17 $kid->join;
    18
    19 sub check_num {
    20     my ($upstream, $cur_prime) = @_;
    21     my $kid;
    22     my $downstream = new Thread::Queue;
    23     while (my $num = $upstream->dequeue) {
    24         next unless $num % $cur_prime;
    25         if ($kid) {
    26            $downstream->enqueue($num);
    27                  } else {
    28            print "Found prime $num\n";
    29                $kid = new threads(\&check_num, $downstream, $num);
    30         }
    31     }
    32     $downstream->enqueue(undef) if $kid;
    33     $kid->join           if $kid;
    34 }

=cut

# translate to PIR by leo

# Runs here (i386/linux 256MB mem) w.
#  ARENA_DOD_FLAGS = 1    MAX=500   (~  95 threads)
#  ARENA_DOD_FLAGS = 0    MAX=1000  (~ 168 threads)


.sub _main
    .param pmc argv
    .const int MAX = 500
    .sym int max
    .sym pmc kid
    .sym pmc Check_num
    .sym pmc stream
    .sym int argc
    argc = argv
    max = MAX
    if argc < 2 goto no_arg
      $S0 = argv[1]
      max = $S0
no_arg:

    #sweepoff
#       9  my $stream = new Thread::Queue;
    stream = new TQueue
#       10 my $kid    = new threads(\&check_num, $stream, 2);
    Check_num = global "_check_num"
    kid = new ParrotThread
    $P2 = new Integer
    $P2 = 2
    .sym pmc Thread_new
    find_method Thread_new, kid, "thread3"
    .pcc_begin
    .arg Check_num
    .arg stream
    .arg $P2
    .invocant kid
    .nci_call Thread_new
    .pcc_end

#       12 for my $i ( 3 .. 1000 ) {
    .sym int i
    i = 3
lp:
#       13     $stream->enqueue($i);
    $P3 = new Integer
    $P3 = i
    push stream, $P3
    inc i
    if i <= max goto lp
#       14 }

#       16 $stream->enqueue(undef);
    $P4 = new Undef
    push stream, $P4

#       17 $kid->join;
    .sym int tid
    tid = kid
    .sym pmc Thread_join
    find_method Thread_join, kid, "join"
    .pcc_begin
    .arg tid
    .nci_call Thread_join
    .pcc_end
    end
.end

#       19 sub check_num {
#       20     my ($upstream, $cur_prime) = @_;
# XXX still no comments inside pcc param block
.sub _check_num
   .param pmc sub
   .param pmc upstream
   .param pmc cur_prime

#       21     my $kid;
    .sym pmc kid
    kid = new Undef
#       22     my $downstream = new Thread::Queue;
    .sym pmc downstream
    downstream = new TQueue
#       23     while (my $num = $upstream->dequeue) {
    .sym pmc Num		# num is a reserved word
lp:
    shift Num, upstream
    $I0 = defined Num
    unless $I0 goto ewhile
#       24         next unless $num % $cur_prime;
    $P0 = new Integer
    $P0 = Num % cur_prime
    unless $P0 goto lp
#       25         if ($kid) {
    $I1 = defined kid
    unless $I1 goto no_kid1
#       26            $downstream->enqueue($num);
    push downstream, Num
    goto lp
#       27                  } else {
no_kid1:
#       28            print "Found prime $num\n";
    print "Found prime "
    print Num
    print "\n"

#       29                $kid = new threads(\&check_num, $downstream, $num);
    kid = new ParrotThread
    .sym pmc Thread_new
    find_method Thread_new, kid, "thread3"
    .pcc_begin
    .arg sub
    .arg downstream
    .arg Num
    .invocant kid
    .nci_call Thread_new
    .pcc_end
    goto lp
#       31     }
ewhile:

#       32     $downstream->enqueue(undef) if $kid;
    $I1 = defined kid
    unless $I1 goto no_kid2

    $P4 = new Undef
    push downstream, $P4

#       33     $kid->join           if $kid;
    .sym int tid
    tid = kid
    .sym pmc Thread_join
    find_method Thread_join, kid, "join"
    .pcc_begin
    .arg tid
    .nci_call Thread_join
    .pcc_end

no_kid2:
#       34 }
    # sleep 1	# turn on for watching memory usage
   .pcc_begin_return
   .pcc_end_return
.end
