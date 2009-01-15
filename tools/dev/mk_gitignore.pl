##! perl
# $Id$
# Copyright (C) 2009, The Perl Foundation.

use strict;
use warnings;
use lib qw| lib |;

use Parrot::Manifest;

my $script = $0;

my $mani = Parrot::Manifest->new( { script => $script, } );

my $print_str     = $mani->prepare_gitignore();
$mani->print_gitignore($print_str);

__END__

=head1 NAME

tools/dev/mk_manifest_and_skip.pl - Recreate MANIFEST and MANIFEST.SKIP

=head1 SYNOPSIS

    % perl tools/dev/mk_manifest_and_skip.pl

=head1 DESCRIPTION

Recreates MANIFEST and MANIFEST.SKIP from the subversion properties
and the output of C<svn status>. .
So far tested with svn 1.2.0 and svn 1.4.2.  This also worked with svk 1.08,
but to keep our tasks manageable, we only guarantee support for Subversion.

This won't work for git-svn.

=head1 SEE ALSO

Parrot::Manifest.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
