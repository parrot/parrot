#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 027-option_or_data.t

use strict;
use warnings;

use Test::More tests =>  8;
use Carp;
use lib qw( lib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use_ok('Parrot::Configure::Step::List', qw|
    get_steps_list
| );

$| = 1;
is($|, 1, "output autoflush is set");

my $CC = "/usr/bin/gcc-3.3";
my $localargv = [
    qq{--cc=$CC},
];
my $args = process_options( {
    mode            => q{configure},
    argv            => $localargv,
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");
isa_ok($conf, "Parrot::Configure");

$conf->add_steps(get_steps_list());

$conf->options->set(%args);
is($conf->options->{c}->{cc}, $CC,
    "command-line option '--cc' has been stored in object");

my $val = $conf->option_or_data('cc');
is($val, $CC, 'option_or_data() returned expected value');

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

027-option_or_data.t - test C<Parrot::Configure::option_or_data()>

=head1 SYNOPSIS

    % prove t/configure/027-option_or_data.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

This file tests C<Parrot::Configure::option_or_data()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
