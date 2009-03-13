#! perl
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Test::More tests => 2;

=head1 NAME

t/codingstd/copyright.t - checks for an appropriate copyright
statement in parrot source files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/copyright.t

    # test specific files
    % perl t/codingstd/copyright.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Ensures that the copyright statement exists in each source file and that it
is up to date.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;

my @c_files    = $DIST->get_c_language_files();
my @perl_files = $DIST->get_perl_language_files();
my @make_files = $DIST->get_make_language_files();
my @all_files  = ( @c_files, @perl_files, @make_files );

my @files = @ARGV ? <@ARGV> : @all_files;
my ( @no_copyright_files, @bad_format_copyright_files );

my $copyright_re =
    qr/Copyright \(C\) (?:\d{4}\-)?\d{4}, Parrot Foundation\.$/m;

foreach my $file (@files) {

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    my $buf = $DIST->slurp($path);

    # does there exist a copyright statement at all?
    if ( $buf !~ m{Copyright \(C\) \d{4}}m ) {
        push @no_copyright_files, $path;
        next;
    }

    # is the copyright text correct?
    if ( ! ($buf =~ $copyright_re) ) {
        push @bad_format_copyright_files, $path;
    }
}

# run the tests
ok( !scalar(@no_copyright_files), 'Copyright statement exists' )
    or diag(
    join
        $/ => "No copyright statement found in " . scalar @no_copyright_files . " files:",
    @no_copyright_files,
    "The copyright statement should read something like:",
    "  Copyright (C) C<start-year>-C<last-year-modified>, Parrot Foundation.",
    "To find the C<start-year>, use a command such as:",
    "  svn log C<filename> | grep 'lines' | tail -n 1",
    "To find the C<last-year-modified>, use a command such as:",
    "  svn log C<filename> | grep 'lines' | head -n 1"
    );

TODO:
{
    local $TODO = "Waiting for full transition to Parrot Foundation";
    ok( !scalar(@bad_format_copyright_files), 'Copyright statement in the right format' )
        or diag(
        join
            $/ => "Bad format in copyright statement found in "
            . scalar @bad_format_copyright_files
            . " files:",
        @bad_format_copyright_files,
        "Please update to read something like:",
        "  Copyright (C) C<start-year>-C<last-year-modified>, Parrot Foundation.",
        "To find the C<start-year>, use a command such as:",
        "  svn log C<filename> | grep 'lines' | tail -n 1",
        "To find the C<last-year-modified>, use a command such as:",
        "  svn log C<filename> | grep 'lines' | head -n 1"
        );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
