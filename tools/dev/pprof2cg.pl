#! perl

# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;

=head1 NAME

tools/dev/pprof2cg.pl

=head1 DESCRIPTION

Convert the output of Parrot's profiling runcore to a Callgrind-compatible
format.

=head1 SYNOPSIS

perl tools/dev/pprof2cg.pl parrot.pprof.1234

=head1 USAGE

Generate a profile by passing C<-Rprofiling> to parrot, for example C<./parrot
-Rprofiling perl6.pbc hello.p6>.  Once execution completes, C<parrot> will
print a message specifying the location of the parrot profile (pprof).  The
profile will be named parrot.pprof.XXXX, where XXXX is the PID of the parrot
process unless another name is specified by the B<PARROT_PROFILING_OUTPUT>
environment variable.

To generate a Callgrind-compatible profile, run this script with the pprof
filename as the first argument.  The output file usable by kcachegrind will be
in parrot.out.XXXX, where XXXX again is the PID of the original parrot process.

=head1 ENVIRONMENT VARIABLES

=head2 PARROT_PROFILING_OUTPUT

If the environment variable PARROT_PROFILING_OUTPUT is set, the profiling
runcore will attempt to use its value as the profile filename.  Note that it
does not check whether the file already exists and will happily overwrite
existing files.

=cut

main(@ARGV);

=head1 INTERNAL DATA STRUCTURES

=over 4

=item notes

Parrot's execution model is built on continuation-passing style and does not
precisely fit the straightforward function-based format that
Callgrind-compatible tools expect.  For this reason, the profiling runcore
captures information about context switches (CS lines in the pprof file) and
pprof2cg.pl maintains a context stack that functions similarly to a typical
call stack.  pprof2cg.pl then maps these context switches as if they were
function calls and returns.  See C<$call_stack> for more information.

=item C<$call_stack>

Variables which are named C<$call_stack> hold a reference to an array of hashes
which contain information about the currently active contexts.  When collecting
timing information about an op, it is necessary to add that information to all
function calls on the stack because Callgrind-compatible tools expect the cost
of a function call to include the cost of all calls made by that function, etc.

When a context switch is detected, C<process_line> looks at the context stack
to determine if the context switch looks like a function call (if the context
hasn't been seen before) or a return (if the context is somewhere on the
stack).  There are some other cases that the code handles, but these can be
ignored for now in the interest of simplicity.  If the context has been seen,
C<process_line> shifts contexts off the stack until it finds the context that
has been switched to.  When C<process_line> detects a new context, it adds a
fake op representing a function call to C<$stats> and unshifts a new context
onto the stack.

Each element of C<@$call_stack> contains the information needed to uniquely
identify the site of the original context switch.

=item C<$stats>

Variables which are named C<$stats> contain a reference to a deeply nested
HoHoH.. which contains all information gathered about a profiled PIR program.
The nested hashes and arrays refer to the file, namespace, line of source code
and op number, respectively.   The op number is used to allow multiple
instructions per line because PIR instructions often represent multiple
low-level instructions.  This also makes it easy to inject pseudo-ops to
represent function calls.

Each op always has a time value representing the total amount of time spent in
that op.  Ops may also have an op_name value that gives the name of the op.
When control flow similar to a function call is detected, a pseudo-op
representing a function call is injected.  These pseudo-ops have zero cost when
initialized and are used to determine the total time spent between when the
context becomes active and when control flow returns to or past the context.
Although they're not exactly like functions calls, they're close enough that it
may help to think of them as such.

Uncomment the print_stats line in main to see a representation of the data
contained in C<$stats>.

=back

=head1 FUNCTIONS

=over 4

=item C<main>

This function is minimal driver for the other functions in this file, taking
the name of a Parrot profile and writing a Callgrind-compatible profile to a
similarly-named file.

=cut

sub main {
    my $filename  = shift;
    my $stats     = {};

    die "Usage: $0 filename\n"
        unless defined $filename;

    $stats->{global_stats}{total_time} = 0;

    open(my $in_fh, '<', $filename) or die "couldn't open $filename for reading: $!";

    process_input($in_fh, $stats);

    close($in_fh) or die "couldn't close $filename: $!";

    unless ($filename =~ s/pprof/out/) {
        $filename = "$filename.out";
    }

    open(my $out_fh, '>', $filename) or die "couldn't open $filename for writing: $!";
    my $cg_profile = get_cg_profile($stats);
    print $out_fh $cg_profile;
    close($out_fh) or die "couldn't close $filename: $!";
    print "$filename can now be used with kcachegrind or other callgrind-compatible tools.\n";
}

=item C<process_input>

This function takes a file handle open to a Parrot profile and a reference
to a hash of fine-grained statistics about the current PIR program.  It
modifies the statistics according to the information from the Parrot profile.

=cut

sub process_input {
    my ($input, $stats) = @_;
    my $call_stack = [];

    while(my $line = <$input>) {
        if ($line =~ /^OP:(.*)$/) {
            # Decode string in the format C<{x{key1:value1}x}{x{key2:value2}x}>
            my %op_hash = $1 =~ /{x{([^:]+):(.*?)}x}/g
                or die "invalidly formed line '$line'";

            my $cur_ctx = $call_stack->[0]
                or die "input file did not specify an initial context";

            # If we've already seen this line, bump the op number.  Otherwise reset it.
            if (exists $cur_ctx->{line} && $op_hash{line} == $cur_ctx->{line}) {
                $cur_ctx->{op_num}++;
            }
            else {
                $cur_ctx->{op_num} = 0;
            }

            $cur_ctx->{line} = $op_hash{line};
            my $extra = { op_name => $op_hash{op} };
            my $time  = $op_hash{time};

            $stats->{global_stats}{total_time} += $time;
            store_stats($stats, $cur_ctx, $time, $extra);

            # Add the time spent by this op to each op on the call "stack".
            $stats->{ $_->{file} }{ $_->{ns} }{ $_->{line} }[ $_->{op_num} ]{time} += $time
                for @$call_stack[1 .. $#$call_stack];
        }
        #context switch
        elsif ($line =~ /^CS:(.*)$/) {

            # Decode string in the format C<{x{key1:value1}x}{x{key2:value2}x}>
            my %cs_hash = $1 =~ /{x{([^:]+):(.*?)}x}/g
                or die "invalidly formed line '$line'";

            if (!@$call_stack) {
                $call_stack->[0] = \%cs_hash;
            }
            else {
                my $cur_ctx      = $call_stack->[0];
                my $hash_ctx     = $cs_hash{ctx};
                my $is_redundant = $cur_ctx->{ctx} eq $hash_ctx;
                my $reused_ctx   = $is_redundant && $cur_ctx->{sub} ne $cs_hash{sub};

                # If we're calling a new sub with the same context, modify the
                # current context to have the name and address of the new sub.
                if ($reused_ctx) {
                    $cur_ctx->{ns}  = $cs_hash{ns};
                    $cur_ctx->{sub} = $cs_hash{sub};
                }

                # The new context is the same as the old one, so don't modify the call stack.
                elsif ($is_redundant) {
                    # This space intentionally left blank.
                }

                # If the new context isn't in the current call stack, unshift
                # it onto the start of the stack.
                elsif (!grep {$_->{ctx} eq $hash_ctx} @$call_stack) {
                    $cur_ctx->{op_num}++;
                    my $extra = {
                                 op_name => "CALL",
                                 target  => $cs_hash{ns}
                                };
                    store_stats($stats, $call_stack->[0], 0, $extra);
                    unshift @$call_stack, \%cs_hash;
                }
                else {
                    #shift contexts off the stack until one matches the current ctx
                    shift @$call_stack while $call_stack->[0]{ctx} ne $hash_ctx;
                }
            }
            #print Dumper($call_stack);
        }
        elsif ($line =~ /^VERSION:(\d+)$/) {
            my $version = $1;
            if ($version != 2) {
                die "profile was generated by an incompatible version of the profiling runcore.";
            }
        }
        elsif ($line =~ /^CLI:(.*)$/) {
            $stats->{'global_stats'}{'cli'} = $1;
        }
        elsif ($line =~ /^END_OF_RUNLOOP:(.*)$/) {
            # This is the end of an outermost runloop.  Several of these can
            # occur during the execution of a script, e.g. for :init subs.
            @$call_stack = ();
        }
        elsif ($line =~ /^AN:/) {
            #ignore annotations for now
        }
        elsif ($line =~ /^#/) {
            #comments are always ignored
        }
        else {
            die "Unrecognized line format: '$line'";
        }
    }
}

=item C<print_stats>

This function prints a complete, human-readable representation of the
statistical data that have been collected into the C<$stats> argument to
stdout.  It is primarily intended to ease debugging and is not necessary to
create a Callgrind-compatible profile.

=cut

sub print_stats {
    my $stats = shift;

    for my $file (grep {$_ ne 'global_stats'} sort keys %$stats) {
        for my $ns (sort keys %{ $stats->{$file} }) {
            for my $line_num (sort {$a<=>$b} keys %{ $stats->{$file}{$ns} }) {
                for my $op_num (0 .. $#{$stats->{$file}{$ns}{$line_num}}) {

                    print "$file  $ns  line/op:$line_num/$op_num ";

                    for my $attr (sort keys %{ $stats->{$file}{$ns}{$line_num}[$op_num] }) {
                        print "{ $attr => $stats->{$file}{$ns}{$line_num}[$op_num]{$attr} } ";
                    }
                    print "\n";
                }
            }
            print "\n";
        }
    }
}

=item C<store_stats>

This function adds statistical data to the C<$stats> hash reference.  The
C<$loc> argument specifies information such as the namespace, file, line
and op number where the data should go.  C<$time> is an integer representing
the amount of time spent at the specified location.  C<$extra> contains any
ancillary data that should be stored in the hash.  This includes data on
(faked) subroutine calls and op names.

=cut

sub store_stats {
    my ($stats, $loc, $time, $extra) = @_;

    my $by_op = ( $stats->{ $loc->{file} }{ $loc->{ns} }{ $loc->{line} }[ $loc->{op_num} ] ||= {} );

    if ($by_op->{hits}) {
        $by_op->{hits} ++;
        $by_op->{time} += $time;
    }
    else {
        $by_op->{hits} = 1;
        $by_op->{time} = $time;

        $by_op->{$_} = $extra->{$_} for keys %$extra;
    }
}

=item C<get_cg_profile>

This function takes a reference to a hash of statistical information about a
PIR program and returns a string containing a Callgrind-compatible profile.
Although some information in the profile may not be accurate (namely PID and
creator), tools such as kcachegrind are able to consume files generated by this
function.

=cut

sub get_cg_profile {

    my $stats = shift;
    my @output = ();

    push @output, <<"HEADER";
version: 1
creator: 3.4.1-Debian
pid: 5751
cmd: $stats->{'global_stats'}{'cli'}

part: 1
desc: I1 cache:
desc: D1 cache:
desc: L2 cache:
desc: Timerange: Basic block 0 - $stats->{'global_stats'}{'total_time'}
desc: Trigger: Program termination
positions: line
events: Ir
summary: $stats->{'global_stats'}{'total_time'}

HEADER

    for my $file (grep {$_ ne 'global_stats'} keys %$stats) {

        push @output, "fl=$file";

        for my $ns (keys %{ $stats->{$file} }) {
            push @output, "\nfn=$ns";

            for my $line (sort keys %{ $stats->{$file}{$ns} }) {

                my $curr_op    = 0;
                my $line_stats = $stats->{$file}{$ns}{$line};
                my $op_count   = scalar(@$line_stats);
                my $op_time    = 0;

                while ($curr_op < $op_count && $line_stats->[$curr_op]{'op_name'} ne 'CALL') {
                    $op_time += $line_stats->[$curr_op]{'time'};
                    $curr_op++;
                }
                push @output, "$line $op_time";

                if ($curr_op < $op_count && $line_stats->[$curr_op]{'op_name'} eq 'CALL') {
                    my $call_target = $line_stats->[$curr_op]{'target'};
                    my $call_count  = $line_stats->[$curr_op]{'hits'};
                    my $call_cost   = $line_stats->[$curr_op]{'time'};

                    push @output, "cfn=$call_target";
                    push @output, "calls=$call_count $call_cost";
                }

                if ($curr_op < $op_count) {
                    $op_time = 0;
                    while ($curr_op < $op_count) {
                        $op_time += $line_stats->[$curr_op]{'time'};
                        $curr_op++;
                    }
                    push @output, "$line $op_time";
                }
            }
        }
    }

    push @output, "totals: $stats->{'global_stats'}{'total_time'}";
    return join("\n", @output);
}

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
