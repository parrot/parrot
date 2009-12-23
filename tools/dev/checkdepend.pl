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

=head1 NAME

tools/dev/checkdepend.pl

=head1 DESCRIPTION

A braindead script to check that every F<.c> file has makefile deps
on its includes.

Requires: a standard (possibly non C<-j>) C<make> run to generate all
required C files first.

=cut

my $files = `ack -fa {src,compilers} | grep '\\.[ch]\$'`;

my %deps;

foreach my $file (sort split /\n/, $files) {
    open my $fh, '<', $file;
    my $guts;
    {
        local undef $/;
        $guts = <$fh>;
    }
    # For now, skip any files that have generated dependencies
    next if $file =~ m{src/(ops|dynoplibs|dynpmc|pmc)/};
    next if $file =~ m{src/string/(charset|encoding)/};
    my @includes = $guts =~ m/#include "(.*)"/g;
    $deps{$file} = [ @includes ];
}

plan('no_plan');

die 'no Makefile.  run `perl Configure.pl` to generate one.' unless -e "Makefile";
open my $mf, '<', "Makefile";
my $rules;
{
    local undef $/;
    $rules = <$mf>;
}

# convert all \-newline continuations into single lines for ease of processing.
$rules =~ s/\\\n/ /g;

# replace all _DIR variables with their expansions.
while ($rules =~ s/^([A-Z_]+_DIR)\s*:?=\s*(\S*)$//m) {
    my ($var,$val) = ($1, $2);
    $rules =~ s/\$\($var\)/$val/g;
}

foreach my $file (sort keys %deps) {
    my $rule = $file;

    my $declared = "";
    if ($rule =~ s/\.c$//) {
        $rules =~ /^$rule\Q$(O)\E\s*:\s*(.*)\s*$/m;
        $declared = $1;
    } elsif ($rule =~ s/\.h$//) {
        $rules =~ /^$rule\.h\s*:\s*(.*)\s*$/m;
        $declared = $1;
    } else {
        die "unexpected file $file\n";
    }

    my $failed = 0;
    if (!defined($declared)) {
        $failed = 1;
        is("", join(' ', @{$deps{$file}}), "$file has no dependencies");
        next;
    }
    else
    {
        $declared =~ s/\s+/ /g;
        foreach my $inc (sort @{$deps{$file}}) {
            # incs can be relative, but makefile is from top level
            my $file_dir = (File::Spec->splitpath($file))[1];
            my $make_dep = collapse_path(File::Spec->catfile($file_dir,$inc));

            # If it's include from src
            next if defined($make_dep) && ($declared =~ s/\b\Q$make_dep\E\b//);

            # Try to construct "global" include
            $make_dep = collapse_path(File::Spec->catfile('include', $inc));
            next if defined($make_dep) && ($declared =~ s/\b\Q$make_dep\E\b//);

            # this isn't the actual comparison, just to give nice output
            # on failure.
            is($declared, $inc, "$file is missing this dependency.");
            $failed = 1;

        }
    }
    $declared =~ s/^\s+//;
    if ($declared ne "") {
       is($declared, '', "$file has extra dependencies.");
    } elsif (!$failed) {
        pass($file);
    }
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
