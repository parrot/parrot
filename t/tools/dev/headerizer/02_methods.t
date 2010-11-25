#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 02_methods.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 15;
#use Cwd;
#use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Headerizer::Object;
#use IO::CaptureOutput qw| capture |;

my $self = Parrot::Headerizer::Object->new();
isa_ok( $self, 'Parrot::Headerizer::Object' );
ok( $self->valid_macro( 'PARROT_EXPORT' ),
    "valid_macro() confirmed validity of macro" );
ok(! $self->valid_macro( 'PARROT_FOOBAR' ),
    "valid_macro() confirmed invalidity of macro" );
my @valid_macros = $self->valid_macros;
ok( @valid_macros,
    "Headerizer object contains list of valid macros" );


pass("Completed all tests in $0");

#sub touch_parrot {
#    open my $FH, '>', q{parrot}
#        or die "Unable to open handle for writing: $!";
#    print $FH "\n";
#    close $FH or die "Unable to close handle after writing: $!";
#}

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
