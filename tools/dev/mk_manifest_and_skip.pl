##! perl
# $Id$
# Copyright (C) 2006-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw| lib |;

use Parrot::Manifest;

my $script = $0;

if (-e '.git') {
    print "Sorry, this script is not compatible with git-svn\n";
    print "Patches Welcome!\n";
    exit 1;
}

my $mani = Parrot::Manifest->new( { script => $script, } );

my $manifest_lines_ref = $mani->prepare_manifest();
my $need_for_files     = $mani->determine_need_for_manifest($manifest_lines_ref);
$mani->print_manifest($manifest_lines_ref) if $need_for_files;

my $print_str     = $mani->prepare_manifest_skip();
my $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
$mani->print_manifest_skip($print_str) if $need_for_skip;

#################### DOCUMENTATION ####################

=head1 NAME

tools/dev/mk_manifest_and_skip.pl - Recreate MANIFEST and MANIFEST.SKIP

=head1 SYNOPSIS

    % perl tools/dev/mk_manifest_and_skip.pl

=head1 DESCRIPTION

Recreates MANIFEST and MANIFEST.SKIP from the subversion properties
and the output of C<svn status>. .
So far tested with svn 1.2.0 and svn 1.4.2. 

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
