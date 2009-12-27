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

my $files = `ack -fa {src,compilers,include} | grep '\\.[ch]\$'`;

our %deps;

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
    next if $file eq 'src/string/private_cstring.h';
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

# expand PARROT_H_HEADERS
$rules =~ m/^PARROT_H_HEADERS\s*:?=\s*(.*)$/m;
my $phh = $1;

$rules =~ s/\Q$(PARROT_H_HEADERS)/$phh/g;

foreach my $header (sort grep {/\.h$/} (keys %deps)) {
    # static headers shouldn't depend on anything else.
    if ($rules =~ /^$header\s*:\s*(.*)\s*$/m) {
        #is("", $1, "$header should have no dependencies");
    } 
}

my @files = keys %deps;
@files = @ARGV if @ARGV;

foreach my $file (sort grep {/\.c$/} @files) {
    my $rule = $file;
    $rule =~ s/\.c$//;

    $rules =~ /^$rule\Q$(O)\E\s*:\s*(.*)\s*$/m;
    my $declared = $1;

    my $failed = 0;
    if (!defined($declared)) {
        $failed = 1;
        is("", join(' ', (get_deps($file))), "$file has no dependencies");
        next;
    }
    else
    {
        $declared =~ s/\s+/ /g;
        foreach my $inc (sort (get_deps($file))) {
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
    $declared =~ s/\s+$//;
    $declared =~ s/\s+/ /g;
    if ($declared ne "") {
       is($declared, '', "$file has extra dependencies.");
    }
    elsif (!$failed) {
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

sub get_deps {
    my $file = shift;
    my %all_deps;

    if (! exists $deps{$file}) {
        return;
    }

    # add explicit deps
    my @pending_deps = @{$deps{$file}}; 

    while (@pending_deps) {
        my $dep = shift @pending_deps;
        if (!exists $all_deps{$dep}) {
            $all_deps{$dep} = 1;
            if (exists $deps{"include/$dep"}) {
                push @pending_deps, @{$deps{"include/$dep"}};
            }
        }
    }
    
    return keys %all_deps;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
