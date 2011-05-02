#! perl
# Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

tools/dev/make_cover.pl - Create .gcov file and HTML report

=head1 DESCRIPTION

This script is called from make to create the coverage reports.

=cut

use strict;
use warnings;

require Devel::Cover; # Only to read version

# Get the source file from a gcov file
sub get_source_path {
    my $gcov_file = shift;

    open(my $h, '<', $gcov_file) or return;
    my $line = <$h>;
    close($h);

    $line =~ m'^[^:]+:[^:]+:Source:(.*)$' or return;
    my $source_path = $1;
    $source_path =~ s'^\./'';

    return $source_path;
}

system("cover -delete");

# Take a list of directories as arguments

for my $dir (@ARGV) {
    # Run gcov with all C files in $dir

    for my $path (glob("$dir/*.c")) {
        # Remove old gcov files
        system("rm -f *.gcov");

        # gcov must be run from build dir
        system("gcov -o $dir $path") == 0 or next;

        # Feed resulting gcov files to gcov2perl

        for my $gcov_file (glob("*.gcov")) {
            my $source_path = get_source_path($gcov_file);

            if (!defined($source_path)
            ||  $source_path =~ m'^/'
            ||  ! -f $source_path) {
                unlink($gcov_file);
                next;
            }

            if ($Devel::Cover::VERSION < 0.68) {
                # Older versions of gcov2perl expect the source file in the
                # same directory as the gcov file. So we move the gcov file
                # to the source file directory, and run gcov2perl in that
                # directory.

                my $source_dir = $source_path;
                $source_dir =~ s'/[^/]+\z'' or $source_dir = '.';

                rename($gcov_file, "$source_dir/$gcov_file");
                system("cd $source_dir && gcov2perl $gcov_file");
                unlink("$source_dir/$gcov_file");
            }
            else {
                system("gcov2perl $gcov_file");
                unlink($gcov_file);
            }
        }
    }
}

# Generate HTML report
system("cover -no-gcov");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
