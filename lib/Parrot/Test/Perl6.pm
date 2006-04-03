# $Id$

=head1 NAME

Parrot::Test::Perl6 -- testing routines for languages/perl6

=head1 DESCRIPTION

This module was reused and heavily refactored from Parrot::Test. Hopefully,
similar refactoring will be carried out in Parrot::Test someday soon.

=cut

package Parrot::Test::Perl6;

use strict;
use warnings;

use File::Basename;
use File::Spec;
use Parrot::Config;

require Exporter;
require Parrot::Test;
require Test::Builder;
require Test::More;

our @EXPORT = qw( plan skip );

my $lang = 'perl6';
my $streams = {
    output => sub{return ( STDOUT => $_[0], STDERR => $_[0] )},
    stdout => sub{return ( STDOUT => $_[0], STDERR => File::Spec->devnull )},
    stderr => sub{return ( STDOUT => File::Spec->devnull, STDERR => $_[0] )},
};
my $tests = {
    is   => 'is_eq',
    like => 'like',
    isnt => 'isnt_eq',
};


## create a map of test names and info
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


push @EXPORT => keys %{$test_map};

use base qw( Parrot::Test Exporter );


my $b = Test::Builder->new();

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


sub import {
    my($class, $plan, @args) = @_;
    $b->plan( $plan, @args );
    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}


sub set_test_info {
    my $next_test_num = 1 + $b->current_test();
    my $f_out  = Parrot::Test::per_test( '.out', $next_test_num );
    my $f_code = Parrot::Test::per_test( '.p6',  $next_test_num );
    $f_code = File::Spec->rel2abs( $f_code );

    return( $next_test_num, $f_out, $f_code );
}


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
