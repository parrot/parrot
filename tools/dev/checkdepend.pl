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

=head1 REQUIREMENTS

A built parrot (Configure and make) to generate all files so we can analyze
them. Ack is used to find the files. We are not currently requiring ack
for development, so this is an optional test.

=cut

die 'no Makefile found; This tool requires a full build for analysis.'
    unless -e 'Makefile';

my $files = `ack -fa {src,compilers,include} | grep '\\.[ch]\$'`;

our %deps;

foreach my $file (sort split /\n/, $files) {
    # For now, skip any files that have generated dependencies
    next if $file =~ m{src/(ops|dynoplibs|dynpmc|pmc)/};
    next if $file =~ m{src/string/(charset|encoding)/};

    open my $fh, '<', $file;
    my $guts;
    {
        local undef $/;
        $guts = <$fh>;
    }

    # Ingore anything inside a c-style comment.
    $guts =~ s{\Q/*\E.*?\Q*/}{}gm;

    my @includes = $guts =~ m/#include "(.*)"/g;

    # Canonicalize each of these includes.

    $deps{$file} = [ ];
    foreach my $include (@includes) {
        # same dir as file?
        my $file_dir = (File::Spec->splitpath($file))[1];
        my $make_dep = collapse_path(File::Spec->catfile($file_dir,$include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        # global 'include' dir?
        $make_dep = collapse_path(File::Spec->catfile('include',$include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        diag "couldn't find $include, included from $file";
    }
}

plan('no_plan');

open my $mf, '<', "Makefile";
my $rules;
{
    local undef $/;
    $rules = <$mf>;
}

# convert all \-newline continuations into single lines for ease of processing.
$rules =~ s/\\\n//g;

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
            next if $declared =~ s/\b\Q$inc\E\b//;

            is($declared, $inc, "$file is missing a dependency.");
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
            if (exists $deps{$dep}) {
                push @pending_deps, @{$deps{$dep}};
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
