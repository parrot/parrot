#!/usr/bin/perl -ws

#
# Create a symlink tree shadowing the Parrot source tree.  Nifty for
# having just one (read-only) copy of the sources but several different
# build trees.  The -v option displays the created symlinks.
#
# jhi@iki.fi
#

use strict;

use File::Basename;
use File::Spec;

my $toolsrcdir  = dirname($0);
my $toolsrcbase = basename($0);

use vars qw($v);

if ($toolsrcdir ne '' && -d $toolsrcdir && lc $toolsrcbase eq 'symlink.pl') {
    my $trydir  = File::Spec->catdir("include", "parrot");
    my $tryfile = File::Spec->catfile("src", "parrot.c");
    die "$0: Do not run this under the original Parrot tree.\n"
	if (-d $trydir) && (-f $tryfile && ! -l $tryfile);
} else {
    die "$0: I am very confused.\n";
}

my @toolsrcdir = File::Spec->splitdir($toolsrcdir);
my @topsrcdir = @toolsrcdir[0..$#toolsrcdir - 2]; # tools/dev/ assumed!
my $topsrcdir = File::Spec->catdir(@topsrcdir);
my $manifest = File::Spec->catfile($topsrcdir, "MANIFEST");
if (open(MANIFEST, $manifest)) {
    my %dstdir;
    while (<MANIFEST>) {
	next if /^\#/;
	if (/^(.+?)\s+\[/) {
	    my $manifile = $1;
	    my @manifile = split('/', $manifile);
	    my $dstfile = File::Spec->catfile(@manifile);
	    unless (-f $manifile) {
		next;
		warn "$0: cannot find $dstfile\n";
	    }
	    if (@manifile > 1) {
		for my $i (0..$#manifile-1) {
		    my $dstdir  = File::Spec->catdir(@manifile[0..$i]);
		    if (!-d $dstdir && !$dstdir{$dstdir}++) {
			unless (mkdir($dstdir, 0755)) {
			    warn "$0: mkdir $dstdir failed: $!\n";
			}
		    }
		}
	    }
	    my $readlink;
	    if (-e $dstfile) {
		if (-l $dstfile) {
		    unless(defined($readlink = readlink($dstfile))) {
			warn "$0: readlink $dstfile failed: $!\n";
		    }
		} else {
		    warn "$0: $dstfile exists but is not a symlink\n";
		}
	    }
	    my $srcfile = File::Spec->catfile($topsrcdir, @manifile);
	    if (!defined $readlink || $readlink ne $srcfile) {
		print "$dstfile\n" if $v;
		if (defined $readlink) {
		    unless (unlink($dstfile)) {
			warn "$0: unlink $dstfile failed: $!\n";
		    }
		}
		unless (symlink($srcfile, $dstfile)) {
		    warn "$0: symlink $srcfile $dstfile failed: $!\n";
		}
	    }
	}
    }
    close(MANIFEST);
} else {
    die "$0: Failed to open $manifest: $!\n";
}

exit(0);

