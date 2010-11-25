#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 02_methods.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 15;
use lib qw( lib );
use Parrot::Headerizer::Object;
use IO::CaptureOutput qw| capture |;

my $self = Parrot::Headerizer::Object->new();
isa_ok( $self, 'Parrot::Headerizer::Object' );
ok( $self->valid_macro( 'PARROT_EXPORT' ),
    "valid_macro() confirmed validity of macro" );
ok(! $self->valid_macro( 'PARROT_FOOBAR' ),
    "valid_macro() confirmed invalidity of macro" );
my @valid_macros = $self->valid_macros;
ok( @valid_macros,
    "Headerizer object contains list of valid macros" );

my $warnings = {
    'file1' => {
        'func_alpha'    => [
            'alpha warning 1',
            'alpha warning 2',
            'alpha warning 3',
        ],
        'func_beta'      => [
            'beta warning 1',
            'beta warning 2',
        ],
    },
    'file2' => {
        'func_gamma'    => [
            'gamma warning 1',
            'gamma warning 2',
            'gamma warning 3',
        ],
    },
};
$self->{warnings} = $warnings;
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_warnings(); },
        \$stdout,
        \$stderr,
    );
    for my $func( qw| alpha gamma | ) {
        for (1..3) {
            like( $stdout, qr/func_alpha: alpha warning $_/s,
                "Got expected output" );
        }
    }
    for (1..2) {
        like( $stdout, qr/func_beta: beta warning $_/s,
            "Got expected output" );
    }
    like( $stdout, qr/8 warnings in 3 funcs in 2 C files/,
        "Got expected summary of headerizer warnings" );
}

$self->{warnings} = {};
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_warnings(); },
        \$stdout,
        \$stderr,
    );
    ok(! $stdout, "No warnings, hence no warnings printed" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02_methods.t - Test functions in Parrot::Headerizer::Object.

=head1 SYNOPSIS

    % prove t/tools/dev/headerizer/02_methods.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines found in 
F<lib/Parrot/Headerizer.pm>.  By doing so, they help test the functionality
of the F<tools/dev/headerizer.pl> utility.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/headerizer.pl>; F<lib/Parrot/Headerizer.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
