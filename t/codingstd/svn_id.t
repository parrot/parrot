#! perl
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use Cwd;
use File::Spec ();
use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Test::More            tests => 1;

=head1 NAME

t/codingstd/svn_id.t - checks for an svn Id keyword line in parrot source files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/svn_id.t

    # test specific files
    % perl t/codingstd/svn_id.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Makes sure that the Subversion (svn) Id keyword line (that which gets
expanded to show filename, last modification date and last author
information) exists within Parrot source files.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my $cwd = cwd();

# Certain files, for various reasons, cannot have an
# SVN Id tag.  We exclude them from examination by this test.

my %known_exceptions = map {
        $_ => 1,
        ( File::Spec->catdir( $cwd, $_ ) ) => 1,
    } qw(
        examples/pir/quine_ord.pir
    );

my @files = grep { ! $known_exceptions{$_} }
    ( @ARGV
        ? <@ARGV>
        : map { $_->path } (
            $DIST->get_c_language_files(),
            $DIST->get_make_language_files(),
            $DIST->get_perl_language_files(),
            $DIST->get_pir_language_files(),
        )
);
my @no_id_files;

foreach my $file (@files) {

    my $buf = $DIST->slurp($file);

    if ( $buf !~ m/\$Id
                   (?:
                    \$       # unexpanded tag, for git-svn users or for new files
                    |
                    :.*\$    # expanded tag, colon required
                   )
                  /xm ) {
        push @no_id_files, $file;
        next;
    }
}

# run the tests
ok( !scalar(@no_id_files), 'Id keyword line exists' )
    or diag(
    join
        $/ => "No Id keyword line found in " . scalar @no_id_files . " files:",
    @no_id_files
    );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
