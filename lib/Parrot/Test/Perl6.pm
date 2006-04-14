# $Id$

=head1 NAME

Parrot::Test::Perl6 -- testing routines for languages/perl6

=head1 SYNOPSIS

    use Parrot::Test::Perl6 tests => 3;

    perl6_output_is(<<'CODE', <<'OUTPUT', 'hello, world!');
    say 'hello, world!';
    CODE
    hello, world!
    OUTPUT

    perl6_stderr_like($code, qr/$expected/, $desc);

    perl6_stdout_isnt($code, qr/$expected/, $desc);

=head1 DESCRIPTION

This module provides Perl6 test functions. It has been heavily refactored
from Parrot::Test. Hopefully,similar refactoring will be carried out in
Parrot::Test someday soon.

=cut


package Parrot::Test::Perl6;

use strict;
use warnings;

use File::Basename;
use File::Spec;
use Parrot::Config;
use base qw( Exporter );

require Exporter;
require Parrot::Test;
require Test::Builder;
require Test::More;


our @EXPORT = qw( plan skip );

my $std_streams = {
    output => sub{return ( STDOUT => $_[0], STDERR => $_[0] )},
    stdout => sub{return ( STDOUT => $_[0], STDERR => File::Spec->devnull )},
    stderr => sub{return ( STDOUT => File::Spec->devnull, STDERR => $_[0] )},
};
my $std_tests = {
    is   => 'is_eq',
    like => 'like',
    isnt => 'isnt_eq',
};

my $std_extensions = {
    output => '.out',
    code   => '.p6',
};


my $test_map = generate_test_map( 'perl6', $std_streams, $std_tests );
push @EXPORT => keys %{$test_map};


my $b = Test::Builder->new();


sub import {
    my($class, $plan, @args) = @_;
    $b->plan( $plan, @args );
    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}


=head2 Functions

=over 4

=item C<generate_test_map( $language, $streams, $tests )>

Creates a map of test names and categorical information. Returns a hash reference keyed on test names, with values containing the component info.

=cut

sub generate_test_map {
    my( $lang, $streams, $tests ) = @_;
    $streams ||= $std_streams;
    $tests ||= $std_tests;

    my $test_map = {};
    for my $t ( keys %{$tests} ) {
        for my $s ( keys %$streams ) {
            $test_map->{join( '_' => $lang, $s, $t )} = {
                lang   => $lang,
                stream => { name => $s, data => $streams->{$s}, },
                test   => { name => $t, data => $tests->{$t},   },
            };
        }
    }
    return $test_map;
}


sub set_test_info {
    my( $options ) = @_;

    for(qw/ output code /) {}
    my $next_test_num = 1 + $b->current_test();
    my $f_out  = Parrot::Test::per_test( '.out', $next_test_num );
    my $f_code = Parrot::Test::per_test( '.p6',  $next_test_num );
    $f_code = File::Spec->rel2abs( $f_code );

    return( $next_test_num, $f_out, $f_code );
}


my $path_to_parrot = $INC{"Parrot/Config.pm"};
$path_to_parrot =~ s:lib/Parrot/Config.pm$::;
$path_to_parrot = File::Spec->curdir()
    if $path_to_parrot eq '';

my $parrot = File::Spec->catfile(
    $path_to_parrot, 'parrot' . $PConfig{exe}
);

my $perl6 = File::Spec->catfile(
    $path_to_parrot, qw/ languages perl6 p6shell.pir /,
);


sub _generate_functions {
    my( $package ) = @_;

    for my $func ( keys %$test_map ) {
        no strict 'refs';

        *{ $package . '::' . $func } = sub ($$;$%) {
            my( $code, $expected, $desc, %extra ) = @_;

            Parrot::Test::convert_line_endings( $code );

            ## set a default description
            $desc = sprintf '(%s line %s)' => (caller())[1,2]
                unless $desc;

            my( $test_num, $f_out, $f_code ) = set_test_info();

            ## get test arguments from environment
            my $args = $ENV{TEST_PROG_ARGS} || '';

            Parrot::Test::write_code_to_file($code, $f_code);

            ## build the command and set the run options
            my $cmd = qq{$parrot $args $perl6 "$f_code"};
            my $run_options = {
                CD => '.',
                $test_map->{$func}->{stream}->{data}->($f_out),
            };

            ## run the command and capture the exit code
            my $exit_code = Parrot::Test::run_command(
                $cmd,
                %{$run_options},
            );

            ## read in the command output
            my $actual_output = Parrot::Test::slurp_file( $f_out );

            ## tell Test::Builder if the test is marked TODO
            my $call_pkg = $b->exported_to() || '';
            local *{ $call_pkg . '::TODO' } = \$extra{todo}
                if defined $extra{todo};

            ## run Test::Builder's test on actual vs. expected output
            my $method = $test_map->{$func}->{test}->{data};
            my $pass = $b->$method( $actual_output, $expected, $desc );

            ## print diagnostic info if the test fails
            $b->diag("'$cmd' failed with exit code $exit_code")
                  if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $f_out;
            }

            return $pass;
        };
    }
}


__PACKAGE__->_generate_functions( );


$_ ^=~ { AUTHOR => 'particle' };

# vim: expandtab sw=4
