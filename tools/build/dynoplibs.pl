# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

tools/build/dynoplibs.pl - Build script for dynamic op libraries

=head1 DESCRIPTION

This script is used for building dynamic op libraries. It is deprecated,
L<http://trac.parrot.org/parrot/ticket/338>.

=cut

use strict;
use warnings;

use lib qw(lib);

use File::Copy qw(copy);
use Parrot::Config qw(%PConfig);

our $LDFLAGS = join(' ',  map {$PConfig{$_}} qw/ldflags ld_debug rpath_blib linkflags/);
our $LD_LOAD_FLAGS = $PConfig{ld_load_flags};
our $LOAD_EXT = $PConfig{load_ext};
our $O = $PConfig{o};
our $CFLAGS = join(' ', map {$PConfig{$_}} qw/ccflags cc_shared cc_debug ccwarn cc_hasjit cg_flag gc_flag/);
our $SLASH = $PConfig{slash};

our $LIBPARROT = q[];
if ($PConfig{parrot_is_shared}) {
    $LIBPARROT = $PConfig{libparrot_ldflags};
}

# OPS2C Config
our $OPS2C = "$^X -I \"" .
             $PConfig{build_dir} . $SLASH . 'lib" "' .
             $PConfig{build_dir} . $SLASH . 'tools' . $SLASH . 'build' .
             $SLASH . 'ops2c.pl"';
our %cores = (
    C       => '',
    CSwitch => '_switch'
);

if ($PConfig{cg_flag}) {
    $cores{CGP}   = '_cgp';
    $cores{CGoto} = '_cg';
}

# Actual commands
sub compile_cmd {
    my ($target, $source) = @_;

    return
        $PConfig{cc} . ' -c ' .
        $PConfig{cc_o_out} . $target . ' ' .
        '-I"' . $PConfig{build_dir} . $SLASH . $PConfig{include} . '" ' .
        "$CFLAGS $source";
};

sub partial_link_cmd {
    my ($target, $libs, $sources) = @_;

    my $liblist;
    if ($^O =~ /mswin32/i) {
        # Need to put various libraries in the link line.
        $liblist = join( ' ', map { "$_.lib" } keys %$libs );
        my $extraLibs = $PConfig{libs} . ' ' . $PConfig{icu_shared};
        $extraLibs =~ s/blib/..\\blib/g;
        $extraLibs =~ s/\Q$(A)\E/.lib/g;
        $liblist .= ' ' . $extraLibs;
    }
    else {
        $liblist = join( ' ', map { "-l$_" } keys %$libs );
    }

    return
        $PConfig{ld} . ' ' . $PConfig{ld_out} .
        $target . ' ' .
        join(' ', map {"\"$_\""} @$sources) .
        " $liblist $LDFLAGS $LD_LOAD_FLAGS $LIBPARROT";
}

our $NOW = time();

################### MAIN PROGRAM ################

my ($mode, @oplibs) = @ARGV;

if ($mode eq 'generate') {
    # Convert X.ops -> ops_X.c, ops_X_cgp.c, ops_X_cg.c and ops_X_switch.c
    my $core;
    generate_c($_) foreach (@oplibs);
}
elsif ($mode eq 'compile') {
    # Convert X.c -> X.o for all X.c
    my $core_suffix;
    foreach $core_suffix (values %cores) {
        compile($_ . "_ops$core_suffix") foreach (@oplibs);
    }
}
elsif ($mode eq 'linklibs') {
    my @objs = grep { /$O$/} @oplibs;
    @oplibs  = grep {!/$O$/} @oplibs;

    # Convert X.o -> X.so
    my $core_suffix;
    foreach $core_suffix (values %cores) {
        partial_link({}, $_ . "_ops$core_suffix", @objs) foreach (@oplibs);
    }
}
elsif ($mode eq 'copy') {
    # Copy *.so -> destination, where destination is the first
    # argument, given as --destination=DIRECTORY
    shift(@oplibs) =~ /--destination=(.*)/
      or die "copy command requires destination";
    my $dest = $1;

    my $core_suffix;
    foreach $core_suffix (values %cores) {
        foreach (@oplibs) {
            my $src = $_ . "_ops$core_suffix$LOAD_EXT";
            copy($src, $dest)
                or die "Copy $src failed ($?)\n";

            # Execute permissions on libraries is especially important on
            # some platforms
            if ($^O eq 'hpux' or $^O eq 'cygwin') {
                chmod 0755, "$dest$SLASH$src";
            }
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

sub generate_c {
    my ($oplib) = @_;

    foreach (keys %cores) {
        if (needs_build($oplib . "_ops$cores{$_}.c", "$oplib.ops")) {
            run("$OPS2C $_ --dynamic $oplib.ops")
                or die "ops2c code generation failed ($?)\n";
        }
    }

    return;
}

sub compile {
    my ($src_stem, $dest_stem) = @_;

    $dest_stem ||= $src_stem;
    if (needs_build("$dest_stem$O", "$src_stem.c")) {
        return run(compile_cmd("$dest_stem$O", "$src_stem.c"))
          or die "compile $src_stem.c failed ($?)\n";
    }
    else {
        return 1;
    }
}

sub partial_link {
    my ($libs, $stem, @objs) = @_;

    if (needs_build("$stem$LOAD_EXT", "$stem$O", @objs)) {
        return run(partial_link_cmd("$stem$LOAD_EXT", $libs, [ "$stem$O", @objs ]))
          or die "partial link $stem$LOAD_EXT failed ($?)\n";
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
