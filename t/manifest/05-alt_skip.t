#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$
# 05-alt_skip.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use lib (qw| lib |);

SKIP: {
    skip
        q{Relevant only when working in checkout from repository},
         5
        unless (-e 'DEVELOPING');

    use_ok('Parrot::Manifest');

    my $script = $0;
    my $g      = q{something_other_than_MANIFEST.SKIP};

    my $mani = Parrot::Manifest->new(
        {
            script => $script,
            skip   => $g,
        }
    );
    isa_ok( $mani, 'Parrot::Manifest' );

    my $print_str = $mani->prepare_manifest_skip();
    ok( $print_str, "prepare_manifest_skip() returned" );

    ok( !-f $g, "No $g found" );
    my $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
    ok( $need_for_skip, "Need to regenerate $g" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

05-alt_skip.t - What happens when MANIFEST.SKIP has a different name

=head1 SYNOPSIS

    % prove t/manifest/05-alt_skip.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Manifest.pm> and packages which inherit from that package.

F<05-alt_skip.t> tests whether Parrot::Manifest correctly determines
whether we could, in principal, supply a file other than MANIFEST.SKIP to
C<Parrot::Manifest::new()>.

=head1 AUTHOR

James E Keenan (jkeenan@cpan.org)

=head1 SEE ALSO

Parrot::Manifest, Parrot::Manifest::Files, Parrot::Manifest::Skip,
F<tools/dev/mk_manifest_and_skip.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

