# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Harness::Options - Handle options and argument processing in F<t/harness>

=head1 DESCRIPTION


=cut

package Parrot::Harness::Options;

use strict;
use warnings;

use base qw( Exporter );
our @EXPORT_OK = qw(
    handle_long_options
    get_test_prog_args
    Usage
);

sub handle_long_options {
    my @argv = @_;

    my %longopts;
    $longopts{running_make_test} = grep { $_ eq '--running-make-test' } @argv;
    @argv = grep { $_ ne '--running-make-test' } @argv;

    $longopts{gc_debug} = grep { $_ eq '--gc-debug' } @argv;
    @argv = grep { $_ ne '--gc-debug' } @argv;

    $longopts{core_tests_only} = grep { $_ eq '--core-tests' } @argv;
    @argv = grep { $_ ne '--core-tests' } @argv;

    $longopts{runcore_tests_only} = grep { $_ eq '--runcore-tests' } @argv;
    @argv = grep { $_ ne '--runcore-tests' } @argv;

    $longopts{html} = grep { $_ eq '--html' } @argv;
    @argv = grep { $_ ne '--html' } @argv;

    $longopts{code} = grep { $_ eq '--code-tests' } @argv;
    @argv = grep { $_ ne '--code-tests' } @argv;

    $longopts{run_exec} = grep { $_ eq '--run-exec' } @argv;
    @argv = grep { $_ ne '--run-exec' } @argv;

    $longopts{help} = grep { $_ eq '--help' } @argv;
    @argv = grep { $_ ne '--help' } @argv;

    $longopts{archive} = grep { $_ eq '--archive' } @argv;
    @argv = grep { $_ ne '--archive' } @argv;

    if( $longopts{archive} ) {
        $longopts{send_to_smolder} = grep { $_ eq '--send-to-smolder' } @argv;
        @argv = grep { $_ ne '--send-to-smolder' } @argv;
    }

    return (\%longopts, @argv);
}

sub get_test_prog_args {
    my ($optsref, $gc_debug, $run_exec) = @_;

    my %opts = remap_runcore_opts( $optsref );
    my $args = join(' ', map { "-$_" } keys %opts );

    $args =~ s/-O/-O$opts{O}/ if exists $opts{O};
    $args =~ s/-D/-D$opts{D}/;
    $args .= ' --gc-debug'    if $gc_debug;
    ## no critic qw(Bangs::ProhibitFlagComments)
    # XXX find better way
    # for passing run_exec to Parrot::Test
    $args .= ' --run-exec'    if $run_exec;

    return $args;
}

# Given a hashref of options, convert to a hash; convert
# some keys that used to map directly to parrot options. These keys
# are not expected to have any values, so we cheat and push a parrot
# commandline line option key/value into the key, and ignore the value.

sub remap_runcore_opts
{
    my ($opts_ref) = @_;

    my %remap      = (
        'j' => '-runcore=jit',
        'g' => '-runcore=cgoto',
        'C' => '-runcore=cgp',
        'S' => '-runcore=switch',
        'b' => '-runcore=bounds',
        'f' => '-runcore=fast',
        'r' => '-run-pbc',
    );

    my %mapped;
    foreach my $opt (keys %$opts_ref) {
        if (exists $remap{$opt}) {
            $mapped{$remap{$opt}} = undef;
        }
        else {
            $mapped{$opt} = $opts_ref->{$opt};
        }
    }
    return %mapped;
}

sub Usage {
    print <<"EOF";
perl t/harness [options] [testfiles]
    -w         ... warnings on
    -g         ... run CGoto
    -j         ... run JIT
    -C         ... run CGP
    -S         ... run Switched
    -b         ... run bounds checked
    --run-exec ... run exec core
    -f         ... run fast core
    -v         ... run parrot with -v : This is NOT the same as prove -v
                   All tests run with this option will probably fail
    -d         ... run debug
    -r         ... assemble to PBC run PBC
    -O[012]    ... optimize
    -D[number] ... pass debug flags to parrot interpreter
    --running-make-test
    --gc-debug
    --core-tests
    --runcore-tests
    --html
    --code-tests
    --archive  ... create a TAP archive of the test run
    --send-to-smolder ... send the TAP archive to the Parrot Smolder server
EOF

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
