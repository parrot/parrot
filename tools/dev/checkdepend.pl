#! perl

# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use Cwd qw(abs_path getcwd realpath);
use Fatal qw(open);
use File::Spec;
use Test::More;
use Test::Harness;

=for comment

A braindead script to check that every .c file has makefile deps
on its includes.

Requires: a standard (possibly non -j) make run to generate all
required C files first.

=cut

my $files = `ack -fa . | grep '\\.c\$'`;

my %deps;

foreach my $file (split /\n/, $files) {
    open my $fh, '<', $file;
    my $guts;
    {
        local undef $/;
        $guts = <$fh>;
    }
    my @includes = $guts =~ m/#include "(.*)"/g;
    $file =~ s/\.c$//;
    $deps{$file} = [ @includes ];
}

plan('no_plan');

open my $mf, '<', "Makefile";
my $rules;
{
    local undef $/;
    $rules = <$mf>;
}
$rules =~ s/\\\n/ /g;
$rules =~ s/\Q$(SRC_DIR)\E/src/g;
$rules =~ s/\Q$(O)\E//g;

foreach my $file (keys %deps) {
    $rules =~ /^$file\s*:\s*(.*)\s*$/m;
    my $declared = $1;
    my $failed = 0;
    if (!defined($declared)) {
        $failed = 1;
    }
    else
    {
        $declared =~ s/\s+/ /g;
        foreach my $inc (@{$deps{$file}}) {
            # incs can be relative, but makefile is from top level
            my $file_dir = (File::Spec->splitpath($file))[1];
            my $make_dep = collapse_path(File::Spec->catfile($file_dir,$inc));

            if (! defined $make_dep) {
                # this means we didn't construct the right relative path.
                # probably looking in include/ instead of  .
                diag "skipping $inc...\n";
                next;
            }

            if ($declared !~ /\b\Q$make_dep\E\b/) {
              # this isn't the actual comparison, just to give nice output
              # on failure.
              is($declared,$inc,$file);
              $failed = 1;
            }
        }
    }
    pass("$file has proper deps") unless $failed;
}

sub collapse_path {
    my $path = shift;
    return $path unless defined $path;

    my $cwd = getcwd();
    $path = abs_path($path);
    return $path unless defined $path;

    $path =~ s/^\Q$cwd\E\///;
    return $path;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
