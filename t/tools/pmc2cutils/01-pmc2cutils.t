#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$
# 01-pmc2cutils.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 20;

use_ok('Parrot::Pmc2c::Pmc2cMain');

my ( %opt, @include, @args );
my $self;

$self = Parrot::Pmc2c::Pmc2cMain->new(
    {
        include => \@include,
        opt     => \%opt,
        args    => [@args],
        bin     => $Bin,
    }
);
isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
can_ok( $self, q{find_file} );
can_ok( $self, q{dump_vtable} );
can_ok( $self, q{read_dump} );
can_ok( $self, q{gen_c} );
can_ok( $self, q{dump_pmc} );

can_ok( 'Parrot::Pmc2c::UtilFunctions', q{open_file} );

can_ok( 'Parrot::Pmc2c::Parser', q{parse_pmc} );
can_ok( 'Parrot::Pmc2c::Parser', q{parse_flags} );
can_ok( 'Parrot::Pmc2c::Parser', q{parse_method_attrs} );
can_ok( 'Parrot::Pmc2c::Parser', q{extract_balanced} );

eval {
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        [
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        ]
    );
};
like(
    $@,
    qr/Must pass a hash ref to Parrot::Pmc2c::Pmc2cMain::new/,
    "Constructor correctly failed due to lack of hash ref as argument"
);

eval { $self = Parrot::Pmc2c::Pmc2cMain->new( { opt => \%opt, args => [@args], } ); };
like(
    $@,
    qr/Must have key 'include' which is a reference to an array of directories/,
    "Constructor correctly failed due to lack of 'include' key"
);

eval { $self = Parrot::Pmc2c::Pmc2cMain->new( { include => {}, opt => \%opt, args => [@args], } ); };
like(
    $@,
    qr/Must have key 'include' which is a reference to an array of directories/,
    "Constructor correctly failed due to 'include' key's value not being array ref"
);

eval { $self = Parrot::Pmc2c::Pmc2cMain->new( { include => \@include, args => [@args], } ); };
like(
    $@,
    qr/Must have key 'opt' which is a reference to a hash of option values/,
    "Constructor correctly failed due to lack of 'opt' key"
);

eval {
    $self = Parrot::Pmc2c::Pmc2cMain->new( { include => \@include, opt => [], args => [@args], } );
};
like(
    $@,
    qr/Must have key 'opt' which is a reference to a hash of option values/,
    "Constructor correctly failed due to 'opt' key's lack of hash ref as argument"
);

eval { $self = Parrot::Pmc2c::Pmc2cMain->new( { include => \@include, opt => \%opt, } ); };
like(
    $@,
    qr/Must have key 'args' which is a reference to a list of the remaining arguments/,
    "Constructor correctly failed due to lack of 'args' key"
);

eval {
    $self = Parrot::Pmc2c::Pmc2cMain->new( { include => \@include, opt => \%opt, args => {}, } );
};
like(
    $@,
    qr/Must have key 'args' which is a reference to a list of the remaining arguments/,
    "Constructor correctly failed because 'args' key had wrong type for value"
);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-pmc2cutils.t - test Parrot::Pmc2c::Pmc2cMain basic functionality

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/01-pmc2cutils.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<01-pmc2cutils.t> consists solely of:

=over 4

=item 1

calls to C<Test::More::isa_ok()> and C<can_ok()> on the
constructor and publicly available methods of Parrot::Pmc2c::Pmc2cMain; and

=item 2

tests of how the constructor handles bad arguments.

=back

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
