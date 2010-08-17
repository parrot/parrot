##! perl
# $Id$
# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;
use lib qw| lib |;

my ($mani, $gitignore);
open $mani,      '<', 'MANIFEST.SKIP' or die "Can't open MANIFEST.SKIP for reading";
open $gitignore, '>', '.gitignore' or die "Can't open .gitignore for writing";

while (<$mani>) {
    next if /\/$/;  # skip redundant directories
    # Convert MANIFEST.SKIP style regexes into git paths.
    s/^\^//;
    s/\.\*/*/g;
    s/\\\././g;
    s/\$$//;
    print $gitignore $_;
}

__END__

=head1 NAME

tools/dev/mk_gitignore.pl - Create the file F<.gitignore>.

=head1 SYNOPSIS

    % perl tools/dev/mk_gitignore.pl

=head1 DESCRIPTION

This is a helper for users of git-svn. It converts MANIFEST.SKIP into
.gitgnore.

So beware, result is only useful for a git-svn checkout.

=head1 SEE ALSO

Parrot::Manifest. F<tools/dev/mk_manifest_and_skip.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
