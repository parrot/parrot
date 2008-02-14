# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Harness::Options - Handle options and argument processing in F<t/harness>

=head1 DESCRIPTION


=cut

package Parrot::Harness::Options;
use strict;
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
    
    $longopts{run_exec} = grep { $_ eq '--run-exec' } @argv;
    @argv = grep { $_ ne '--run-exec' } @argv;
    
    $longopts{help} = grep { $_ eq '--help' } @argv;
    @argv = grep { $_ ne '--help' } @argv;
    
    return (\%longopts, @argv);
}

sub get_test_prog_args {
    my ($optsref, $gc_debug, $run_exec) = @_;
    my %opts = %{ $optsref };
    my $args = join(' ', map { "-$_" } keys %opts );
    $args =~ s/-O/-O$opts{O}/ if exists $opts{O};
    $args =~ s/-D/-D$opts{D}/;
    $args .= ' --gc-debug'    if $gc_debug;
    # XXX find better way for passing run_exec to Parrot::Test
    $args .= ' --run-exec'    if $run_exec;
    return $args;
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
    -v         ... run verbose
    -d         ... run debug
    -r         ... assemble to PBC run PBC
    -O[012]    ... optimize
    -D[number] ... pass debug flags to parrot interpreter
    --running-make-test
    --gc-debug
    --core-tests
    --runcore-tests
    --html
EOF
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

