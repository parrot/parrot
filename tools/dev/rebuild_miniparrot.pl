#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/rebuild_miniparrot.pl - Rebuild a new miniparrot distribution

=head1 SYNOPSIS

    % perl tools/dev/rebuild_miniparrot.pl [option]

=head1 DESCRIPTION

This script is used to build a new miniparrot distribution in the
F<miniparrot> directory, along with its build scripts.

It is assumed that it will run on a Unix box. It's not particularly
necessary to be portable, since it only has to be run when packaging a
release, or during development.

=head2 Options

=over 4

=item C<--action=sub>

Run the specified subroutine.

=back

=cut

################################################################################


use strict;
no  strict 'refs';
use Config;
use Getopt::Long;
use File::Copy;
use File::Basename;
use File::Path;
use File::Find;

my ($action, $executable);
GetOptions("action=s"     => \$action,
           "executable=s" => \$executable);

if ($action) {
    &{$action}();
} else {
    (-d "miniparrot") || mkdir("miniparrot");

    print "** $0: reconfiguring parrot for miniparrot build\n";
    run_command("perl Configure.pl --miniparrot --floatval=double");

    print "** $0: initiating parrot prebuild\n";
    run_command("make miniparrot-prebuild");
}

print "\n\n";
exit(0);

###########################################################################

sub prebuild_classes {
    my @src;

    foreach my $obj (@ARGV) {
        my $src = $obj;
        $src =~ s/classes\/(.*)\.o/$1\.c/g;

	push @src, $src;
    }

    run_command("cd classes; make @src");
}

sub clean {
    print "** $0: removing files in miniparrot directory\n";
    find(sub {
	     return if ($File::Find::dir =~ /CVS/);
	     unlink($_) if (-f $_);
         }, 'miniparrot');
}


sub copy_src_from_obj {
    print "** $0: copying object source files to miniparrot directory\n";

    foreach my $obj (@ARGV) {
        my $src = $obj;
        $src =~ s/\.o/\.c/g;
        copy_file($src, "miniparrot/$src");
    }
}

sub copy_src {
    print "** $0: copying source files to miniparrot directory\n";

    foreach my $file (@ARGV) {
        copy_file($file, "miniparrot/$file");
    }
}

sub write_buildscripts {
    my @compiled_files;
    foreach my $obj (@ARGV) {
	my $src = $obj;
	$src =~ s/\.o/\.c/g;
	push @compiled_files, [ $src, $obj ];
    }

    print "** $0: writing parrot build scripts\n";

    ## GCC ##

    print "- miniparrot/build_gcc.sh\n";
    open(F, ">miniparrot/build_gcc.sh") ||
        die "Unable to write miniparrot/build_gcc.sh: $!\n";
    print F "#!/bin/sh\n";
    print F "\nset -x -e\n";
    foreach (@compiled_files) {
	print F "gcc -DMINIPARROT -I./include -c $_->[0] -o $_->[1]\n";
    }
    my @obj_files = map { $_->[1] } @compiled_files;
    print F "gcc -lm -o parrot " . (join ' ', @obj_files) . "\n";
    close(F);
}


############################################################################
sub run_command {
    my ($command) = @_;

    print "- $command\n";
    system($command);

    if ($? >> 8) {
        die "Error " . ($? >>8). " running $command\n";
    }
}

sub copy_file {
    my ($from, $to) = @_;

    my $directory = dirname($to);

    if (! -d $directory) {
        print "- mkpath $directory\n";
        mkpath($directory);
    }

    print "- copy $from => $to\n";
    copy($from, $to);

}
