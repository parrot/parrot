#! perl

# Copyright (C) 2009-2012, Parrot Foundation.

use strict;
use warnings;

use Cwd qw(abs_path getcwd realpath);
use Fatal qw(open);
use File::Find;
use File::Spec;
use Test::More;
use lib qw( lib );
use Parrot::Config;

=head1 NAME

t/src/checkdepend.t

=head1 DESCRIPTION

A script to check that every file has makefile deps on its includes.

 checkdepend.pl [--dump]

If called with C<--dump>, no tests are run, and the pre-processed makefile
is dumped (in lieu of having C<cc>'s C<-E> for C<make>. This option is only
intended to be used by developers examining the build process.

The test's output shows the extra dependencies recorded for "got", and the
missing dependencies for "expected" - any dependencies that match up exactly
are not reported on. The number in parentheses indicates how many were found.
(Useful for identifying when a requirement is included multiple times.)

=head1 REQUIREMENTS

A built parrot (Configure and make) to generate all files so we can analyze
them. (That's why it's in t/src/ instead of t/codingstd)

=head1 BUGS

See L<http://trac.parrot.org/parrot/wiki/BuildTaskList>. Only checks C<.c>
and C<.h> files at the moment.

=cut

if (! -e 'Makefile') {
    plan(skip_all =>
        'no Makefile found; This test requires a full build for analysis.');
    exit;
}

my @incfiles = [];
find( { wanted => \&wanted, no_chdir => 1 },
      qw/src compilers include frontend/ );

our %deps;

foreach my $file (sort grep /\.[hc]$/, @incfiles) {
    # skip pmcs - we don't handle inheritance correctly
    next if $file =~ m{^src/(?:dyn)?pmc/};
    next if ($file eq 'src/nci/core_thunks.c' and
        ! defined $Parrot::Config::PConfig{PARROT_HAS_CORE_NCI_THUNKS});
    next if ($file eq 'src/nci/extra_thunks.c' and
        ! defined $Parrot::Config::PConfig{PARROT_HAS_EXTRA_NCI_THUNKS});

    open my $fh, '<', $file;
    my $guts;
    {
        local $/;
        $guts = <$fh>;
    }

    # Ignore anything inside a c-style comment.
    $guts =~ s{\Q/*\E.*?\Q*/}{}gm;

    my @includes = $guts =~ m/# *include "(.*)"/g;

    # Canonicalize each of these includes.

    $deps{$file} = [ ];
    foreach my $include (@includes) {
        my $found;

        my @include_dirs;
        push @include_dirs, (File::Spec->splitpath($file))[1];
        push @include_dirs, 'include';
        push @include_dirs, 'include/pmc';

        for my $path (@include_dirs) {
            next if $found;

            my $make_dep = File::Spec->catfile($path, $include);
            if (defined($make_dep) && -f $make_dep) {
                $make_dep = collapse_path($make_dep);
                push @{$deps{$file}}, $make_dep;
                $found = 1;
            }
        }

        # skip bogus warnings
        if (!$found
            and ($file ne 'src/gc/malloc.c' or $include ne '/usr/include/malloc.h'
                 or defined $Parrot::Config::PConfig{HAVE_USR_INCLUDE_MALLOC_H}))
        {
            diag "couldn't find $include, included from $file";
        }
    }
    # always require an explicit .o -> .c dep. This is lazy and not always
    # needed. However, missing it when it is needed causes pain.
    if ($file =~ /\.c$/) {
        push @{$deps{$file}}, $file;
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

my $test_count = grep {/\.(c)$/} (keys %deps);

plan( tests => $test_count );

#foreach my $header (sort grep {/\.h$/} (keys %deps)) {
#    # static headers shouldn't depend on anything else.
#    if ($rules =~ /^$header\s*:\s*(.*)\s*$/m) {
#        #is("", $1, "$header should have no dependencies");
#    }
#}

my @files = keys %deps;
@files = @ARGV if @ARGV;

check_files($rules, \@files, '.c', $vars{O});

sub check_files {

    my ($rules, $possible_files, $src_ext, $obj_ext) = @_;

    foreach my $file (sort grep {/$src_ext$/} @$possible_files) {
        my ($active_makefile, $active_line_num);
        my $rule = $file;
        $rule =~ s/$src_ext$//;
        $rule =~ s{/}{\\}g if $^O eq 'MSWin32';

        #find the applicable rule for this file
        my $rule_deps = '';
        for (@$rules) {
            if ($_->{line} =~ m{^\Q$rule$obj_ext\E\s*:\s*(.*)\s*$}) {
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

        my @rule_deps     = split /\s+/, $rule_deps;
        @rule_deps  = grep {s{\\}{/}g} @rule_deps if  $^O eq 'MSWin32';
        my @expected_deps = (get_deps($file));

        is_list_same(\@rule_deps, \@expected_deps, "$file $extra_info.");
    }
}


sub collapse_path {
    my $path = shift;
    return $path unless defined $path;

    my $cwd = getcwd();
    # With a symlinked builddir need to collapse x/../y sections into y.
    # It is safe with our directory structure
    if ( -l $path ) {
        my $up = File::Spec->updir();
        my $upsep = File::Spec->catfile($up, '');
        if (index($path, $upsep) > -1) {
            my ($vol,$dir,$fname) = File::Spec->splitpath($path);
            my @dirs = File::Spec->splitdir($dir);
            my @newdirs;
            while (@dirs) {
                my $d = shift @dirs;
                if ($d eq $up) {
                    warn unless @newdirs;
                    pop @newdirs;
                }
                else {
                    push @newdirs, $d;
                }
            }
            my $newpath = File::Spec->catfile
              ($vol ? ($vol, File::Spec->catdir(@newdirs), $fname)
                    : (File::Spec->catdir(@newdirs), $fname));
            return $newpath;
        }
        return File::Spec->abs2rel( $path, $cwd ) ;
    }
    my $abspath = abs_path($path);
    return $path unless defined $abspath;
    $abspath =~ s/^\Q$cwd\E\///;
    return $abspath;
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

# I'd rather use Test::Differences, but this lets us skip a dependency.

sub is_list_same {
    my $got = shift;
    my $exp = shift;
    my $test = shift;

    # keep track of the number of times something appears to
    # avoid redundant includes)

    my(%got, %exp);
    for my $file (@$got) { $got{$file}++ };
    for my $file (@$exp) { $exp{$file}++ };

    # Remove any elements found in both
    my @gots = keys %got;
    foreach my $file (@gots) {
        if (exists $exp{$file}) {
            if ($exp{$file} == $got{$file}) {
                delete $got{$file};
                delete $exp{$file};
            }
        }
    }

    my $extras  = scalar(keys %got);
    my $missing = scalar(keys %exp);

    if ($extras == 0 && $missing == 0) {
        pass($test);
        return;
    }

    my $got_msg = "";
    for my $file (keys %got) {
        $got_msg .= "$file($got{$file})\n";
    }
    my $exp_msg = "";
    for my $file (keys %exp) {
        $exp_msg .= "$file($exp{$file})\n";
    }

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    is ($got_msg, $exp_msg, $test);
    return;
}

sub wanted {
    if ($File::Find::name =~ /\.(c|h)$/) {
        push @incfiles, $File::Find::name;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
