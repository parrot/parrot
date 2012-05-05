#! perl -T

# Copyright (C) 2012, Parrot Foundation.

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Distribution ();

=head1 NAME

t/codingstd/case_sensitive_files.t - Checks for name conflicts on case-insensitive filesystems

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/case_sensitive_files.t

=head1 DESCRIPTION

Checks that there are no files in the distribution that would conflict
with other files on case-insensitive filesystems.

If we have a F<readme.pod> in the distro, and then we add a F<README.pod>
in the same directory, that's a problem.  The creator F<README.pod>
might not notice, but this will cause problems for a Mac or Windows user
who checks out the repo or unpacks a tarball.

=cut

my @files = map { $_->path } Parrot::Distribution->new->get_all_files();

plan tests => scalar @files;

my %paths;
foreach my $path (@files) {
    my $lc_path = lc $path;

    if ( my $conflict = $paths{ $lc_path } ) {
        fail( "$path conflicts with $conflict" );
    }
    else {
        pass( "No conflict in: $path" );
        $paths{ $lc_path } = $path;
    }
}
done_testing();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
