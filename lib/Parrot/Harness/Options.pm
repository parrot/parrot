# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

Parrot::Harness::Options - Handle options and argument processing in F<t/harness>

=head1 DESCRIPTION

This package exports subroutines on request only.  The subroutines are useful
in providing command-line options to Parrot's F<t/harness>.

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

    my %cl_to_longopt = (
        'gc-debug'          => 'gc_debug',
        'core-tests'        => 'core_tests_only',
        'runcore-tests'     => 'runcore_tests_only',
        'html'              => 'html',
        'code-tests'        => 'code',
        'run-exec'          => 'run_exec',
        'help'              => 'help',
        'archive'           => 'archive',
        'html'              => 'html',
    );

    my %longopts;
    foreach my $k (keys %cl_to_longopt) {
        my $cl_opt = '--' . $k;
        $longopts{$cl_to_longopt{$k}} = grep { $_ eq $cl_opt } @argv;
        @argv = grep { $_ ne $cl_opt } @argv;
    }

    if ( $longopts{archive} ) {
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
        'j' => '-runcore=fast',
        'G' => '-runcore=gcdebug',
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
    -b         ... run bounds checked
    --run-exec ... run exec core
    -f         ... run fast core
    -j         ... run fast core
    -r         ... run the compiled pbc
    -v         ... run parrot with -v : This is NOT the same as prove -v
                   All tests run with this option will probably fail
    -d         ... run debug
    -r         ... assemble to PBC run PBC
    -O[012]    ... optimize
    -D[number] ... pass debug flags to parrot interpreter
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
