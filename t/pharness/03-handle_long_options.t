#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 03-handle_long_options.t

use strict;
use warnings;

use lib qw( lib );
use Test::More;
eval {
    use Parrot::Config qw( %PConfig );
};
plan( skip_all => 't/harness only runs once configuration has completed' )
    if $@;
plan( tests =>  6 );
use Carp;
use Parrot::Harness::Options qw( handle_long_options );

my (@argv, $longopts);
@argv = qw(
    -wv
    -O2
    --running-make-test
    --gc-debug
    t/postconfigure/*.t
); # */

($longopts, @argv) = handle_long_options(@argv);
ok($longopts->{running_make_test}, "Captured long option");
ok($longopts->{gc_debug}, "Captured long option");
my %still_argv = map {$_, 1} @argv;
ok($still_argv{'-wv'}, "Combined short options still present in @ARGV");
ok($still_argv{'-O2'}, "Short options with values still present in @ARGV");
ok($still_argv{'t/postconfigure/*.t'}, "Arguments still present in @ARGV");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-handle_long_options.t - test Parrot::Harness::Options

=head1 SYNOPSIS

    % prove t/pharness/03-handle_long_options.t

=head1 DESCRIPTION

This file holds tests for Parrot::Harness::Options::handle_long_options().

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Harness::Options, F<t/harness>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
