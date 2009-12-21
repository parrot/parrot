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

my $files = `ack -fa . | grep '\\.c\$'`;

my %deps;

foreach my $file (sort split /\n/, $files) {
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
$rules =~ s/\Q$(IO_DIR)\E/src\/io/g;
$rules =~ s/\Q$(PMC_INC_DIR)\E/include/g;
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
            # Skip #include "parrot/foo.h". It's in GENERAL_H_FILES rule.
            next if $inc =~ m{^parrot/}o;

            # incs can be relative, but makefile is from top level
            my $file_dir = (File::Spec->splitpath($file))[1];
            my $make_dep = collapse_path(File::Spec->catfile($file_dir,$inc));

            # If it's include from src
            next if defined($make_dep) && ($declared =~ /\b\Q$make_dep\E\b/);

            # Try to costruct "global" include
            $make_dep = collapse_path(File::Spec->catfile('include', $inc));
            next if defined($make_dep) && ($declared =~ /\b\Q$make_dep\E\b/);

            # Try to costruct "pmc" include
            $make_dep = collapse_path(File::Spec->catfile('include', 'pmc', $inc));
            next if defined($make_dep) && ($declared =~ /\b\Q$make_dep\E\b/);

            # this isn't the actual comparison, just to give nice output
            # on failure.
            is($declared, $inc, $file);
            $failed = 1;
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
