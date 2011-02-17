#! perl
# Copyright (C) 2006-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw| lib |;

use Parrot::Manifest;

my $script = $0;

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

Recreates MANIFEST and MANIFEST.SKIP from the output of C<git status>.

    git add file1 file2
    git commit -m "commit msg"
    perl tools/dev/mk_manifest_and_skip.pl
    git add MANIFEST
    git commit -m "update manifest"
    git push

=head1 SEE ALSO

Parrot::Manifest.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
