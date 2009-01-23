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

tools/dev/mk_gitignore.pl - Create the file F<.gitignore>.

=head1 SYNOPSIS

    % perl tools/dev/mk_gitignore.pl

=head1 DESCRIPTION

This is a helper for users of git-svn. In an svn-checkout it creates
a file called F<.gitignore> containing the files detailed in the subversion property
C<svn:ignore>. This file can then be copied to a git-svn working directory.

So beware, this works only for a svn checkout and the result is only useful
for a git-svn checkout.

=head1 SEE ALSO

Parrot::Manifest. F<tools/dev/mk_manifest_and_skip.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
