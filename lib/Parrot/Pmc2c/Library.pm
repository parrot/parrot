# Copyright (C) 2004-2011, Parrot Foundation.

=head1 NAME

Parrot::Pmc2c::Library - PMC to C Code Generation

=head1 SYNOPSIS

    use Parrot::Pmc2c::Library;

=head1 DESCRIPTION

Parrot::Pmc2c::Library is a wrapper around a collection of PMCs linked in the
same dynamic library.

=head2 Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Library;

use strict;
use warnings;
use File::Basename qw(basename);
use Parrot::Pmc2c::PMC ();
use Parrot::Pmc2c::UtilFunctions qw(dont_edit dynext_load_code c_code_coda spew);

=item C<generate_library($library_name, $pmcs)>

    Parrot::Pmc2c::Library->generate_library( $library_name, $pmcs );

=cut

sub generate_library {
    my ( $class, $library_name, $pmcs ) = @_;

    my $basename = basename($library_name);
    spew( $library_name . '.c', gen_c( $basename, $pmcs ) );
    spew( $library_name . '.h', gen_h( $basename ) );
}

=item C<gen_h>

Writes the header file for the library.

=cut

sub gen_h {
    my $lc_library_name = lc shift;
    my $guardname = uc( join( '_', 'PARROT_LIB', $lc_library_name, 'H_GUARD' ) );

    my $hout = dont_edit('various files');
    $hout .= <<"EOH";

#ifndef $guardname
#define $guardname

PARROT_DYNEXT_EXPORT Parrot_PMC Parrot_lib_${lc_library_name}_load(PARROT_INTERP);
EOH
    $hout .= c_code_coda;

    #endif $guardname

    return $hout;
}

=item C<gen_c>

Writes the C file for the library.

=cut

sub gen_c {
    my ( $library_name, $pmcs ) = @_;
    my $cout = dont_edit('various files');

    $cout .= <<"EOC";
#define PARROT_IN_EXTENSION
#define CONST_STRING(i, s)     Parrot_str_new_constant(i, s)
#define CONST_STRING_GEN(i, s) Parrot_str_new_constant(i, s)
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"
EOC
    my %pmcs = ( map { $_->{name} => $_ } @{$pmcs} );

    foreach my $name ( keys %pmcs ) {
        my $lcname = lc $name;
        $cout .= <<"EOC";
#include "pmc_$lcname.h"
EOC
    }
    $cout .= "\n";
    $cout .= dynext_load_code( $library_name, %pmcs );
    $cout .= c_code_coda;

    return $cout;
}

=back

=head1 SEE ALSO

=over 4

=item F<tools/build/pmc2c.pl>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
