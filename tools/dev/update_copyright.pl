#! perl

# Copyright (C) 2008, Parrot Foundation.

use strict;
use warnings;
use Fatal qw( open close );

=head1 NAME

F<tools/dev/update_copyright.pl>

=head1 DESCRIPTION

Given a list of files as command line arguments, update the copyright
notice to go from the earliest year noted to the current year.

Edits the files in place. You should update the copyright on a modified
file before you commit it back to the repository.

=cut

use lib 'lib';
use Parrot::Test;

# Accept a little fuzz in the original copyright notice..
my $copyright_re = qr/
  Copyright \s+ \(C\) \s+
  (\d\d\d\d)\s*(?:-\s*\d\d\d\d)? \s* ,? \s*
  The \s+ Perl \s+ Foundation\.?
/xi;

my $year = (localtime())[5]+1900;

# loop over all the files specified on the command line
foreach my $file (@ARGV) {
    my $contents = Parrot::Test::slurp_file( $file );
    if ( $contents =~ $copyright_re) {
        my $old_year = $1;
        if ($old_year eq $year) {
            warn "$file already up to date.\n";
            next;
        }
        else {
            $contents =~ s/$copyright_re/Copyright (C) $old_year-$year, Parrot Foundation./;
            open my $ofh, '>', $file;
            print {$ofh} $contents;
            close $ofh;
        }
    }
    else {
        warn "$file doesn't have a valid copyright line.\n";
    }
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
