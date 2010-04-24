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
use Test::Differences;

=head1 NAME

tools/dev/checkdepend.pl

=head1 DESCRIPTION

A script to check that every file has makefile deps on its includes.

 checkdepend.pl [--dump]

If called with C<--dump>, no tests are run, and the pre-processed makefile
is dumped (in lieu of having C<cc>'s C<-E> for C<make>. This option is only
intended to be used by developers examining the build process.

=head1 REQUIREMENTS

A built parrot (Configure and make) to generate all files so we can analyze
them. App::Ack is used to find the files, and Test::Differences is used to
make the test output usable - these non standard modules make this an
optional test.

=head1 BUGS

See L<http://trac.parrot.org/parrot/wiki/BuildTaskList>

=cut

die 'no Makefile found; This tool requires a full build for analysis.'
    unless -e 'Makefile';

my @incfiles = split /\n/, `ack -fa src compilers include  | ack '\\.(c|h|pir)\$'`;

our %deps;

foreach my $file (sort grep /\.[hc]$/, @incfiles) {
    # For now, skip any files that have generated dependencies
    next if $file =~ m{src/(ops|dynoplibs|dynpmc|pmc)/};
    next if $file =~ m{src/string/(charset|encoding)/};

    open my $fh, '<', $file;
    my $guts;
    {
        local $/;
        $guts = <$fh>;
    }

    # Ignore anything inside a c-style comment.
    $guts =~ s{\Q/*\E.*?\Q*/}{}gm;

    my @includes = $guts =~ m/#include "(.*)"/g;

    # Canonicalize each of these includes.

    $deps{$file} = [ ];
    foreach my $include (@includes) {
        # same dir as file?
        my $file_dir = (File::Spec->splitpath($file))[1];
        my $make_dep = collapse_path(File::Spec->catfile($file_dir, $include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        # global 'include' dir?
        $make_dep = collapse_path(File::Spec->catfile('include', $include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        diag "couldn't find $include, included from $file";
    }
    # always require an explicit .o -> .c dep. This is lazy and not always
    # needed. However, missing it when it is needed causes pain.
    if ($file =~ /\.c$/) {
        push @{$deps{$file}}, $file;
    }
}

foreach my $file (sort grep /\.pir$/, @incfiles) {
    open my $fh, '<', $file;
    my $guts;
    {
        local $/;
        $guts = <$fh>;
    }

    # Ignore anything inside a # - comment.
    $guts =~ s{^#.*$}{}gm;
    # Ignore anything inside pod.
    $guts =~ s{^=.*^=cut$}{}gsm;
    # Ignore anything inside strings that are assigned to a variable.
    # (Avoid clobbering the strings used in .include 'foo.pir', etc.)
    $guts =~ s{=\s*'[^']*'\s*$}{}gm;
    $guts =~ s{=\s*"(?:[^"\\]|\\.)*"\s*$}{}gm;
    # TT #1418:  also, heredocs (wheeeee!)

    my @includes;
    while ($guts =~ m/(?:\.include|\bload_bytecode)\s+(["'])(.*)\1/g) {
        push @includes, $2;
    }

    # Canonicalize each of these includes.

    $deps{$file} = [ ];
    foreach my $include (@includes) {
        # same dir as file?
        my $file_dir = (File::Spec->splitpath($file))[1];
        my $make_dep = collapse_path(File::Spec->catfile($file_dir, $include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        # global 'runtime' dir?
        $make_dep = collapse_path(File::Spec->catfile('runtime/parrot/include', $include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }
        $make_dep = collapse_path(File::Spec->catfile('runtime/parrot/library', $include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        # relative to top level?
        $make_dep = collapse_path(File::Spec->catfile($include));
        if (defined($make_dep) && -f $make_dep) {
            push @{$deps{$file}}, $make_dep;
            next;
        }

        diag "couldn't find $include, included from $file";
    }
}

sub get_rules {

    my ($filename, $rules) = @_;

    open my $mf, '<', "$filename";
    my $global_line_num = @$rules;
    my $file_line_num   = 1;
    my $escape_start    = 1;

    foreach (<$mf>) {
        my $line = $_;
        chomp $line;
        if ($_ =~ /^include\s+(.*)$/m) {
            get_rules($1, $rules);
            $global_line_num = @$rules;
            $file_line_num++;
        }
        else {
            $rules->[$global_line_num] =
            {
                filename => $filename,
                line     => $line,
                line_num => $file_line_num,
            };

            # Convert all \-newline continuations into single lines for ease of
            # processing.  Leave blank lines to keep line numbers accurate.
            if (exists $rules->[$escape_start]{line} &&
                $rules->[$escape_start]{line}    !~ /\\$/ &&
                $rules->[$global_line_num]{line} =~ /\\$/) {

                $escape_start = $global_line_num;
            }

            if ($rules->[$escape_start]{line} && $rules->[$escape_start]{line} =~ /\\$/ &&
                $escape_start != $global_line_num) {

                $rules->[$escape_start]{line} =~ s/\\$//;
                $rules->[$escape_start]{line} .= $rules->[$global_line_num]{line};
                $rules->[$global_line_num]{line} = '';
            }

            $file_line_num++;
            $global_line_num++;
        }
    }
    close $mf;
}

our $rules = [];
get_rules('Makefile', $rules);

#expand all variables
our %vars;
foreach (@$rules) {
    #expand any known variables
    while ($_->{line} =~ /\$\(([A-Z_]+)\)/) {
        my $var_name = $1;
        if (exists $vars{$var_name}) {
            $_->{line} =~ s/\$\($var_name\)/$vars{$var_name}/g;
        }
        else {
            $_->{line} =~ s/\$\($var_name\)//g;
        }
    }

    #store any new definitions
    if ($_->{line} =~ /^(\w+)\s+=\s+(.*)$/) {
        $vars{$1} = $2;
    }
}

if (@ARGV && $ARGV[0] eq '--dump') {
    print "$_->{line}\n" for (@$rules);
    exit 0;
}

my $test_count = grep {/\.(c|pir)$/} (keys %deps);

plan( tests => $test_count );

#foreach my $header (sort grep {/\.h$/} (keys %deps)) {
#    # static headers shouldn't depend on anything else.
#    if ($rules =~ /^$header\s*:\s*(.*)\s*$/m) {
#        #is("", $1, "$header should have no dependencies");
#    }
#}

my @files = keys %deps;
@files = @ARGV if @ARGV;

check_files($rules, \@files, '.c',   $vars{O});
check_files($rules, \@files, '.pir', '.pbc');

sub check_files {

    my ($rules, $possible_files, $src_ext, $obj_ext) = @_;

    foreach my $file (sort grep {/$src_ext$/} @$possible_files) {
        my ($active_makefile, $active_line_num);
        my $rule = $file;
        $rule =~ s/$src_ext$//;

        #find the applicable rule for this file
        my $rule_deps = '';
        for (@$rules) {
            if ($_->{line} =~ /^$rule$obj_ext\s*:\s*(.*)\s*$/) {
                $rule_deps = $1;
                $active_makefile = $_->{filename};
                $active_line_num = $_->{line_num};
            }
            last if $rule_deps;
        }

        my $extra_info = "(no rule found for this file)";
        if ($rule_deps) {
            $extra_info = "($active_makefile: line $active_line_num)";
        }

        $rule_deps        = join "\n", sort split /\s+/, $rule_deps;
        my $expected_deps = join "\n", sort (get_deps($file));

        eq_or_diff_text($rule_deps, $expected_deps, "$file $extra_info.", {context => 0});
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
