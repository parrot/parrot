#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# auto/llvm-01.t

use strict;
use warnings;
use File::Temp qw( tempdir );
use Test::More tests =>  41;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::llvm');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::llvm};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
like( $step->result(), qr/yes|no/,
  "Result was either 'yes' or 'no'" );

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my $ret = capture(
        sub { $step->runstep($conf) },
        \$stdout
    );
    ok( $ret, "runstep() returned true value" );
    like( $step->result(), qr/yes|no/,
        "Result was either 'yes' or 'no'" );
    SKIP: {
        skip 'No sense testing for verbose output if LLVM not present',
        2 unless ( $step->result() =~ /yes/ );
        like( $stdout, qr/llvm-gcc/s,
            "Got expected verbose output" );
        like( $stdout, qr/Low Level Virtual Machine/s,
            "Got expected verbose output" );
    }
}

$step->set_result( undef );
$conf->data->set( 'has_llvm' => undef );
auto::llvm::_handle_result($step, $conf, 1);
is( $step->result(), 'yes', "Got expected 'yes' result" );
ok( $conf->data->get( 'has_llvm' ),
    "'has_llvm' set to true value, as expected" );

$step->set_result( undef );
$conf->data->set( 'has_llvm' => undef );
auto::llvm::_handle_result($step, $conf, 0);
is( $step->result(), 'no', "Got expected 'no' result" );
ok( ! $conf->data->get( 'has_llvm' ),
    "'has_llvm' set to false  value, as expected" );

###### _examine_llvm_gcc_version() #####
my $verbose = 0;
my $rv;

$rv = $step->_examine_llvm_gcc_version($conf, $verbose);
like($rv, qr/^1|0$/,
    "Got a valid return value from _examine_llvm_gcc_version()");

my $prog = 'lli';
$rv = $step->_examine_llvm_component_version( $conf, $verbose, $prog );
like($rv, qr/^1|0$/,
    "Got a valid return value from _examine_llvm_component_version()");

##### 4 methods #####
$verbose = 0;

$step->set_result( undef );
$step->_handle_failure_to_compile_into_bitcode( $conf, $verbose );
is( $step->result(), 'no',
    "Got expected result: _handle_failure_to_compile_into_bitcode()" );

$step->set_result( undef );
$step->_handle_failure_to_execute_bitcode( $conf, $verbose );
is( $step->result(), 'no',
    "Got expected result: _handle_failure_to_execute_bitcode()" );

$step->set_result( undef );
$step->_handle_failure_to_compile_to_assembly( $conf, $verbose );
is( $step->result(), 'no',
    "Got expected result: _handle_failure_to_compile_to_assembly()" );

$step->set_result( undef );
$step->_handle_failure_to_assemble_assembly( $conf, $verbose );
is( $step->result(), 'no',
    "Got expected result: _handle_failure_to_assemble_assembly()" );

$verbose = 1;
my ($stdout, $stderr);
capture(
    sub { $step->_handle_failure_to_compile_into_bitcode( $conf, $verbose ); },
    \$stdout,
    \$stderr,
);
like( $stdout,
    qr/Unable to compile C file into LLVM bitcode file/,
    "Got expected verbose output from _handle_failure_to_compile_into_bitcode()",
);

capture(
    sub { $step->_handle_failure_to_execute_bitcode( $conf, $verbose ); },
    \$stdout,
    \$stderr,
);
like( $stdout,
    qr/Unable to run LLVM bitcode file with 'lli'/,
    "Got expected verbose output from _handle_failure_to_execute_bitcode()",
);

capture(
    sub { $step->_handle_failure_to_compile_to_assembly( $conf, $verbose ); },
    \$stdout,
    \$stderr,
);
like( $stdout,
    qr/Unable to compile program to native assembly using 'llc'/,
    "Got expected verbose output from _handle_failure_to_compile_to_assembly()",
);

capture(
    sub { $step->_handle_failure_to_assemble_assembly( $conf, $verbose ); },
    \$stdout,
    \$stderr,
);
like( $stdout,
    qr/Unable to assemble native assembly into program/,
    "Got expected verbose output from _handle_failure_to_assemble_assembly()",
);

##### _handle_native_assembly_output() #####

my $output = '';
{
    local $@ = '';
    $output = 'hello world';
    $verbose = 0;
    ok( $step->_handle_native_assembly_output( $conf, $output, $verbose ),
        "_handle_native_assembly_output() returned true value" );
    is( $step->result(), 'yes', "Got expected 'yes' result" );
}

{
    local $@ = 'error';
    $output = 'hello world';
    $verbose = 0;
    ok( $step->_handle_native_assembly_output( $conf, $output, $verbose ),
        "_handle_native_assembly_output() returned true value" );
    is( $step->result(), 'no', "Got expected 'no' result" );
}

{
    local $@ = '';
    $output = 'goodbye, cruel world';
    $verbose = 0;
    ok( $step->_handle_native_assembly_output( $conf, $output, $verbose ),
        "_handle_native_assembly_output() returned true value" );
    is( $step->result(), 'no', "Got expected 'no' result" );
}

{
    local $@ = 'error';
    $output = 'hello world';
    $verbose = 1;
    capture(
        sub { $step->_handle_native_assembly_output(
                $conf, $output, $verbose); },
        \$stdout,
        \$stderr,
    );
    is( $step->result(), 'no', "Got expected 'no' result" );
    like(
        $stdout,
        qr/Unable to execute native assembly program successfully/,
        "Got expected verbose output: native assembly program",
    );
}

{
    local $@ = '';
    $output = 'goodbye, cruel world';
    $verbose = 1;
    capture(
        sub { $step->_handle_native_assembly_output(
                $conf, $output, $verbose); },
        \$stdout,
        \$stderr,
    );
    is( $step->result(), 'no', "Got expected 'no' result" );
    like(
        $stdout,
        qr/Unable to execute native assembly program successfully/,
        "Got expected verbose output: native assembly program",
    );
}

##### _cleanup_llvm_files() #####

my ( $bcfile, $sfile, $nativefile );
my $count_unlinked;

$count_unlinked =
    auto::llvm::_cleanup_llvm_files( $bcfile, $sfile, $nativefile );
is( $count_unlinked, 0, "no files existed, hence none unlinked" );

( $bcfile, $sfile, $nativefile ) = ( '', '', '' );
$count_unlinked =
    auto::llvm::_cleanup_llvm_files( $bcfile, $sfile, $nativefile );
is( $count_unlinked, 0, "no files existed, hence none unlinked" );

{
    my $tdir = tempdir( CLEANUP => 1 );
    $bcfile = qq|$tdir/bcfile|;
    open my $FH, '>', $bcfile
        or die "Unable to open handle for writing: $!";
    print $FH qq|bcfile hello world\n|;
    close $FH or die "Unable to close handle after writing: $!";
    $count_unlinked =
        auto::llvm::_cleanup_llvm_files( $bcfile, $sfile, $nativefile );
    is( $count_unlinked, 1, "one file existed, hence one unlinked" );
}

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/llvm-01.t - tests Parrot::Configure step auto::llvm

=head1 SYNOPSIS

    prove t/steps/auto/llvm-01.t

=head1 DESCRIPTION

This file holds tests for auto::llvm.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
