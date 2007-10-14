#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Test::More tests => 2;

=head1 NAME

t/codingstd/check_copyright.t - checks for an appropriate copyright
statement in parrot source files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/check_copyright.t

    # test specific files
    % perl t/codingstd/check_copyright.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Ensures that the copyright statement exists in each source file and that it
is up to date.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;

my $skip_files = $DIST->generated_files();
my @c_files    = $DIST->get_c_language_files();
my @perl_files = $DIST->get_perl_language_files();
my @all_files  = ( @c_files, @perl_files );

my @files = @ARGV ? @ARGV : @all_files;
my ( @no_copyright_files, @outdated_copyright_files );

my @gmtime       = gmtime(time);
my $current_year = $gmtime[5] + 1900;
my $copyright_text =
    "Copyright \\(C\\) (\\d{4}\\-$current_year|$current_year), The Perl Foundation.";

foreach my $file (@files) {

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    next if exists $skip_files->{$path};

    my $buf = $DIST->slurp($path);

    # does there exist a copyright statement at all?
    if ( $buf !~ m{Copyright \(C\) \d{4}}m ) {
        push @no_copyright_files, $path;
        next;
    }

    # is the copyright text correct?
    if ( $buf !~ m{$copyright_text}m ) {
        push @outdated_copyright_files, $path;
    }
}

# run the tests
ok( !scalar(@no_copyright_files), 'Copyright statement exists' )
    or diag(
    join
        $/ => "No copyright statement found in " . scalar @no_copyright_files . " files:",
    @no_copyright_files,
    "The copyright statement should read something like:",
    "  Copyright (C) C<start-year>-$current_year, The Perl Foundation.",
    "To find the C<start-year>, use a command such as:",
    "  svn log C<filename> | grep 'lines' | tail -n 1"
    );

SKIP:
{
    skip( "Waiting for decision as to whether copyright dates are necessary", 1 );
    ok( !scalar(@outdated_copyright_files), 'Copyright statement up to date' )
        or diag(
        join
            $/ => "Outdated copyright statement found in "
            . scalar @outdated_copyright_files
            . " files:",
        @outdated_copyright_files,
        "Please update to read something like:",
        "  Copyright (C) xxxx-$current_year, The Perl Foundation."
        );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
