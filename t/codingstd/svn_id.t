#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
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

my @c_files    = $DIST->get_c_language_files();
my @perl_files = $DIST->get_perl_language_files();
my @make_files = $DIST->get_make_language_files();
my @all_files  = ( @c_files, @perl_files, @make_files );

my @files = @ARGV ? <@ARGV> : @all_files;
my @no_id_files;

foreach my $file (@files) {

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    my $buf = $DIST->slurp($path);

    if ( $buf !~ m/\$Id
                   (?:
                    \$       # unexpanded tag, for git-svn users or for new files
                    |
                    :.*\$    # expanded tag, colon required
                   )
                  /xm ) {
        push @no_id_files, $path;
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
