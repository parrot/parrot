##! perl
# $Id$
use strict;
use warnings;
use lib ( qw| lib | );
use Parrot::Manifest;

my $script = $0;

my $mani = Parrot::Manifest->new($script);

my $manifest_lines_ref = $mani->prepare_manifest();
$mani->print_manifest($manifest_lines_ref);

my $ignore_ref = $mani->prepare_manifest_skip();
$mani->print_manifest_skip($ignore_ref);

=head1 NAME

tools/dev/mk_manifest_and_skip.pl - Recreate MANIFEST and MANIFEST.SKIP

=head1 SYNOPSIS

    % perl tools/dev/mk_manifest_and_skip.pl

=head1 DESCRIPTION

Recreates MANIFEST and MANIFEST.SKIP from the svn/svk directories.
So far tested with svn 1.2.0, svn 1.4.2, and svk 1.08.

=head1 SEE ALSO

Parrot::Manifest.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
