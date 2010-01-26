# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

tools/build/dynpmc.pl - Build script for dynamic PMCs

=head1 DESCRIPTION

This script is used for building dynamic PMCs.  It is deprecated,
L<http://trac.parrot.org/parrot/ticket/338>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../..";
use lib "$FindBin::Bin/../../lib";

use File::Copy qw(copy);
use Storable;

use Parrot::Config qw/%PConfig/;

# Config stuff
our $CC            = $PConfig{cc} . ' -c';
our $LD            = $PConfig{ld};
our $LDFLAGS       = $PConfig{ldflags} . ' ' . $PConfig{ld_debug} . ' ' . $PConfig{rpath_blib};
our $LD_LOAD_FLAGS = $PConfig{ld_load_flags};
our $LOAD_EXT      = $PConfig{load_ext};
our $O             = $PConfig{o};
our $CFLAGS        = $PConfig{ccflags} . ' '. $PConfig{cc_shared} . ' ' . $PConfig{cc_debug} . ' ' . $PConfig{ccwarn} . ' ' . $PConfig{cc_hasjit} . ' ' . $PConfig{cg_flag} . ' ' . $PConfig{gc_flag};
our $BUILD_DIR     = $PConfig{build_dir};

our $LIBPARROT = q[];
if ($PConfig{parrot_is_shared}) {
    $LIBPARROT = $PConfig{libparrot_ldflags};
}

# PMC2C Config
our $SLASH = $PConfig{slash};
our $PMC2C = "$^X \"" . join($SLASH, qw/tools build pmc2c.pl/) . '"';

# Actual commands
sub compile_cmd {
    my ($target, $source) = @_;

    my $dynpmc_include = '';
    if (defined $ENV{DYNPMC_INCLUDE} )
    {
        $dynpmc_include = $ENV{DYNPMC_INCLUDE};
        $dynpmc_include =~ s/,/" -I"/g;
        $dynpmc_include = '-I"' . $dynpmc_include . '" ';
    }

    return
        $CC . ' ' .
        $PConfig{cc_o_out} . $target . ' ' .
        '-I"' . $BUILD_DIR . $SLASH . 'include' .
        "$dynpmc_include $CFLAGS $source";
};

sub partial_link_cmd {
    my ($target, $libs, $sources) = @_;

    my $liblist;
    if ($^O =~ /mswin32/i) {
        # Need to put various libraries in the link line.
        if ($CC =~ /gcc/i) {
            $liblist = join( ' ', map { "-l$_" } keys %$libs );
            $liblist =~ s/-lgdbm/-llibgdbm/i;
        }
        else {
            $liblist = join( ' ', map { "$_.lib" } keys %$libs );
        }
        my $extraLibs = $PConfig{libs} . ' ' . $PConfig{icu_shared};
        $extraLibs =~ s/blib/..\\blib/g;
        $extraLibs =~ s/\Q$(A)\E/.lib/g;
        $liblist .= ' ' . $extraLibs;

        # Also note that we may need to look in the Parrot blib directory.
        if ($CC =~ /gcc/i) {
            $liblist .= qq{ -Wl,-L "$BUILD_DIR/blib/lib"};
        }
        else {
            $liblist .= qq{ /LIBPATH:"$BUILD_DIR/blib/lib"};
        }
    }
    else {
        $liblist = join( ' ', map { "-l$_" } keys %$libs );
        $liblist .= ' ' . $PConfig{libs} . ' ' . $PConfig{icu_shared};
    }

    if (defined $ENV{DYNPMC_LINK}) {
        push @{$sources}, split /,/, $ENV{DYNPMC_LINK};
    }

    return
        $LD . ' ' . $PConfig{ld_out} .
        $target . ' ' .
        join(' ', map {"\"$_\""} @$sources) .
        " $liblist $LDFLAGS $LD_LOAD_FLAGS $LIBPARROT";
}

our $NOW = time();

################### MAIN PROGRAM ################

my ($mode, @pmcs) = @ARGV;

if ($mode eq 'generate') {
    # Convert X.pmc -> X.dump and X.c and also create any lib-GROUP.c files

    generate_dump($_) foreach (@pmcs);
    generate_c($_) foreach (@pmcs);

    my ($group_files, $group_libs, $pmc_group, $pmc_libs) =
        gather_groups_and_libs(@pmcs);

    while (my ($group, $pmcs) = each %$group_files) {
        my @pmcfiles = map { "$_.pmc" } @$pmcs;
        if (needs_build("$group.c", @pmcfiles)) {
            run("$PMC2C --library $group --c " . join(" ",@pmcfiles))
              or die "pmc2c library creation failed ($?)\n";
        }
    }
}
elsif ($mode eq 'compile') {
    my ($group_files, $group_libs, $pmc_group, $pmc_libs) =
        gather_groups_and_libs(@pmcs);

    # Convert X.c -> X.o for all X.c
    compile($_) foreach (@pmcs);

    # lib-GROUP.c
    for my $group (keys %$group_files) {
        compile("$group", "lib-$group")
          or die "compile $group.c failed ($?)\n";
    }
}
elsif ($mode eq 'linklibs') {
    my ($group_files, $group_libs, $pmc_group, $pmc_libs) =
        gather_groups_and_libs(@pmcs);

    # Convert lib-GROUP.so + A.so + B.so ... -> GROUP.so
    while (my ($group, $pmcs) = each %$group_files) {
        partial_link($group, $group_libs->{$group}, [ "lib-$group", @$pmcs ] )
          or die "partial link of $group failed ($?)\n";
    }

    # Link non-grouped PMCs individually
    my @ungrouped_pmcs = grep { ! exists $pmc_group->{$_} } @pmcs;
    partial_link($_, $pmc_libs->{$_}, [ $_ ] ) foreach (@ungrouped_pmcs);
}
elsif ($mode eq 'copy') {
    # Copy *.so -> destination, where destination is the first
    # argument, given as --destination=DIRECTORY
    shift(@pmcs) =~ /--destination=(.*)/
      or die "copy command requires destination";
    my $dest = $1;

    my ($group_files, $group_libs, $pmc_group, $pmc_libs) =
        gather_groups_and_libs(@pmcs);
    my @ungrouped_pmcs = grep { ! exists $pmc_group->{$_} } @pmcs;

    my (@list_to_process) = (@ungrouped_pmcs, keys %$group_files);

    die "nothing found to copy" unless @list_to_process;

    foreach (@list_to_process) {
        copy("$_$LOAD_EXT", $dest) or die "Copy $_$LOAD_EXT failed ($?)\n";

        # Execute permissions on libraries is especially important on
        # some platforms
        if ($^O eq 'hpux' or $^O eq 'cygwin') {
            chmod 0755, "$dest@slash@$_$LOAD_EXT";
        }

    }
}
else {
    die "invalid command '$mode'\nmust be one of generate, compile, linklibs, or copy\n";
}

sub run {
    print join(" ", @_), "\n";

    return system(@_) == 0;
}

sub gather_groups_and_libs {
    my @pmcs = @_;

    my ( %group_files, %group_libs, %pmc_group, %pmc_libs );
    for my $pmc (@pmcs) {
        our $class = retrieve("$pmc.dump");

        # there can be many libs
        my %libs = %{ $class->{flags}{lib} || {} };
        $pmc_libs{$pmc} = \%libs;

        # There should be at most a single group
        my $group = $class->{flags}{group}
          or next;
        $pmc_group{$pmc} = $group;
        push @{ $group_files{$group} }, $pmc;
        $group_libs{$group} ||= {};
        foreach my $lib ( keys %libs ) {
            $group_libs{$group}->{$lib} = 1;
        }
    }

    return (\%group_files, \%group_libs, \%pmc_group, \%pmc_libs);
}

sub modtime {
    my $ago = (-M shift);

    if (defined $ago) {
        return $NOW - $ago;
    }
    else {
        return;
    }
}

sub needs_build {
    my ($target, @sources) = @_;

    my $target_mod = modtime($target)
      or return 1;
    for my $source (@sources) {
        return 1 if modtime($source) > $target_mod;
    }

    return 0;
}

sub generate_dump {
    my ($pmc) = @_;

    if (needs_build("$pmc.dump", "$pmc.pmc")) {
        run("$PMC2C --dump $pmc.pmc")
          or die "pmc2c dump failed ($?)\n";
    }

    return;
}

sub generate_c {
    my ($pmc) = @_;

    if (needs_build("$pmc.c", "$pmc.pmc")) {
        run("$PMC2C --c $pmc.pmc")
          or die "pmc2c code generation failed ($?)\n";
    }

    return;
}

sub compile {
    my ($src_stem, $dest_stem) = @_;

    $dest_stem ||= $src_stem;
    if (needs_build("$dest_stem$O", "$src_stem.c")) {
        run(compile_cmd("$dest_stem$O", "$src_stem.c"))
          or die "compile $src_stem.c failed ($?)\n";
    }
    return 1;
}

sub partial_link {
    my ($group, $libs, $stems) = @_;

    my @sources = map { "$_$O" } @$stems;
    if (needs_build("$group$LOAD_EXT", @sources)) {
        return run(partial_link_cmd("$group$LOAD_EXT", $libs, \@sources))
          or die "partial link $group$LOAD_EXT failed ($?)\n";
    }
    else {
        return 1;
    }
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
