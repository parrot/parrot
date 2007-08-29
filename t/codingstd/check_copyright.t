#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id: trailing_space.t 18563 2007-05-16 00:53:55Z chromatic $

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
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my ( @no_copyright_files, @outdated_copyright_files );

my @gmtime = gmtime(time);
my $current_year = $gmtime[5] + 1900;
my $copyright_text = 
    "Copyright \\(C\\) \\d\\d\\d\\d\\-$current_year, The Perl Foundation.";
print $copyright_text, "\n";

foreach my $file (@files) {
    my $buf;

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    next if exists $skip_files->{$path};

    # slurp in the file
    open( my $fh, '<', $path )
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }

    # does there exist a copyright statement at all?
    if ( $buf !~ m{Copyright \(C\) \d\d\d\d\-}m ) {
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
        $/ => "No copyright statement found in " . 
        scalar @no_copyright_files . " files:", 
        @no_copyright_files,
        "The copyright statement should read something like:",
        "  Copyright (C) C<start-year>-$current_year, The Perl Foundation.",
        "To find the C<start-year>, use a command such as:",
        "  svn log C<filename> | tail"
    );

ok( !scalar(@outdated_copyright_files), 'Copyright statement up to date' )
    or diag(
    join
        $/ => "Outdated copyright statement found in " . 
        scalar @outdated_copyright_files . " files:", 
        @outdated_copyright_files,
        "Please update to read something like:",
        "  Copyright (C) xxxx-$current_year, The Perl Foundation"
    );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
