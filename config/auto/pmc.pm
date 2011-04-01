# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

config/auto/pmc.pm - PMC Files

=head1 DESCRIPTION

Prepare PMC files for inclusion.

=cut

package auto::pmc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use File::Basename qw/basename/;
use File::Spec::Functions qw/catfile/;

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    return {
        description => 'Which pmc files should be compiled in',
        result      => '',
        PMC_PARENTS => {},
        srcpmc      => [ sort map { basename($_) } glob "./src/pmc/*.pmc" ],
    };
}

sub runstep {
    my ( $self, $conf ) = @_;

    # $pmc_list is a string holding a space-delimited list of currently active
    # PMCs, sorted (largely) on the basis of src/pmc/pmc.num.
    # (By 'current', we take into account the fact that there are PMCs listed
    # in src/pmc/pmc.num that no longer exist but whose index numbers are
    # never deleted.)
    my $pmc_list = get_sorted_pmc_str( @{ $self->{srcpmc} } );

    # names of class files for src/pmc/Makefile
    ( my $TEMP_pmc_o   = $pmc_list ) =~ s/\.pmc/\$(O)/g;
    ( my $TEMP_pmc_str = $pmc_list ) =~ s/\.pmc/\.str/g;

    # calls to pmc2c.pl for src/pmc/Makefile
    my $TEMP_pmc_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/auto/pmc.pm'

E_NOTE

    $TEMP_pmc_build .= <<END;
PMC2C_FILES = \\
    lib/Parrot/Pmc2c/Pmc2cMain.pm \\
    lib/Parrot/Pmc2c/Parser.pm \\
    lib/Parrot/Pmc2c/Dumper.pm \\
    lib/Parrot/Pmc2c/PMC.pm \\
    lib/Parrot/Pmc2c/Method.pm \\
    lib/Parrot/Pmc2c/PCCMETHOD.pm \\
    lib/Parrot/Pmc2c/MULTI.pm \\
    lib/Parrot/Pmc2c/Library.pm \\
    lib/Parrot/Pmc2c/UtilFunctions.pm \\
    lib/Parrot/Pmc2c/PMC/default.pm \\
    lib/Parrot/Pmc2c/PMC/Null.pm \\
    lib/Parrot/Pmc2c/PMC/RO.pm
END

    my %universal_deps;
    while (<DATA>) {
        next if /^#/;
        next if /^\s*$/;
        chomp;
        $universal_deps{$_} = 1;
    }

    for my $pmc ( split( /\s+/, $pmc_list ) ) {
        $pmc =~ s/\.pmc$//;

        # make each pmc depend upon its parent.
        my $parent_dumps = '';
        $parent_dumps .= "src/pmc/$_.dump "
            foreach reverse( ( $self->pmc_parents($pmc) ) );
        my $parent_headers = '';
        $parent_headers .= "include/pmc/pmc_$_.h "
            for $self->pmc_parents($pmc);

        # add dependencies that result from METHOD usage.
        my $pmc_fname = catfile('src', 'pmc', "$pmc.pmc");
        my $pccmethod_depend = '';
        my %o_deps    = %universal_deps;
        $o_deps{"src/pmc/$pmc.c"}         = 1;
        $o_deps{"src/pmc/$pmc.str"}       = 1;
        $o_deps{"include/pmc/pmc_$pmc.h"} = 1;

        if (contains_pccmethod($pmc_fname)) {
            $pccmethod_depend = 'lib/Parrot/Pmc2c/PCCMETHOD.pm';
            $o_deps{"include/pmc/pmc_fixedintegerarray.h"} = 1;
            if ($pmc ne 'fixedintegerarray') {
                $pccmethod_depend .= ' include/pmc/pmc_fixedintegerarray.h';
            }
        }

        my $include_headers = get_includes($pmc_fname);
        my $cc_shared = $conf->data->get('cc_shared');
        my $cc_o_out  = $conf->data->get('cc_o_out');
        my $warnings  = $conf->data->get('ccwarn');
        my $optimize  = $conf->data->get('optimize');

        foreach my $header (split ' ', $parent_headers) {
            $o_deps{$header} = 1;
        }
        foreach my $header (split ' ', $include_headers) {
            $o_deps{$header} = 1;
        }

        # includes of includes
        # (cheat. The right way to handle this is to do what
        # checkdepend.t does.)
        if (exists $o_deps{'include/parrot/oplib/core_ops.h'} ) {
            $o_deps{'include/parrot/runcore_api.h'} = 1;
        }

        my $o_deps = "    " . join(" \\\n    ", keys %o_deps);
        $TEMP_pmc_build .= <<END
src/pmc/$pmc.c : src/pmc/$pmc.dump
\t\$(PMC2CC) src/pmc/$pmc.pmc

src/pmc/$pmc.dump : vtable.dump $parent_dumps src/pmc/$pmc.pmc \$(PMC2C_FILES) $pccmethod_depend
\t\$(PMC2CD) src/pmc/$pmc.pmc

include/pmc/pmc_$pmc.h: src/pmc/$pmc.c

## SUFFIX OVERRIDE -Warnings
src/pmc/$pmc\$(O): \\
$o_deps
\t\$(CC) \$(CFLAGS) $optimize $cc_shared $warnings -I\$(\@D) $cc_o_out\$@ -c src/pmc/$pmc.c

END
    }


    # build list of libraries for link line in Makefile
    ( my $TEMP_pmc_classes_o   = $TEMP_pmc_o )   =~ s{^| }{ src/pmc/}g;
    ( my $TEMP_pmc_classes_str = $TEMP_pmc_str ) =~ s{^| }{ src/pmc/}g;
    ( my $TEMP_pmc_classes_pmc = $pmc_list )     =~ s{^| }{ src/pmc/}g;

    # Gather the actual names (with MixedCase) of all of the non-abstract
    # built-in PMCs in rough hierarchical order.
    my %parents;

PMC: for my $pmc_file ( split( /\s+/, $pmc_list ) ) {

        open my $PMC, "<", "src/pmc/$pmc_file"
            or die "open src/pmc/$pmc_file: $!";

        my ($const, $name);

        while (<$PMC>) {
            if (/^pmclass (\w+)(.*)/) {
                $name    = $1;
                my $decl = $2;
                $decl .= <$PMC> until $decl =~ s/\{.*//;

                $const = 1 if $decl =~ /\bconst_too\b/;
                next PMC   if $decl =~ /\bextension\b/;

                # the default PMC gets handled specially
                last       if $name eq 'default';

                my $parent = 'default';

                if ($decl =~ /extends (\w+)/) {
                    $parent = $1;
                }

                # set a marker not to initialize an abstract PMC
                if ($decl =~ /\babstract\b/) {
                    unshift @{ $parents{$name} }, '(abstract)';
                }

                # please note that normal and Const PMCs must be in this order
                push @{ $parents{$parent} }, $name;
                push @{ $parents{$parent} }, "Const$name" if $const;

                last;
            }
        }

        close $PMC;

        die "No pmclass declaration found in $pmc_file"
            unless defined $name;
    }

    my @names = ('default', $self->order_pmcs_by_hierarchy( \%parents ));

    $conf->data->set(
        pmc                  => $pmc_list,
        pmc_names            => join( ' ', @names ),
        TEMP_pmc_o           => $TEMP_pmc_o,
        TEMP_pmc_build       => $TEMP_pmc_build,
        TEMP_pmc_classes_o   => $TEMP_pmc_classes_o,
        TEMP_pmc_classes_str => $TEMP_pmc_classes_str,
        TEMP_pmc_classes_pmc => $TEMP_pmc_classes_pmc,
    );

    return 1;
}

# Return the (lowercased) name of the immediate parent of the given
# (lowercased) pmc name.
sub pmc_parent {
    my ($self, $pmc) = @_;

    return $self->{PMC_PARENTS}{$pmc} if defined $self->{PMC_PARENTS}{$pmc};

    local $/;
    open( my $PMC, '<', "src/pmc/$pmc.pmc" )
        or die "open src/pmc/$pmc.pmc failed: $!";
    local $_ = <$PMC>;
    close $PMC;

    # Throw out everything but the pmclass declaration
    s/^.*?pmclass//s;
    s/\{.*$//s;

    return $self->{PMC_PARENTS}{$pmc} = lc($1) if m/extends\s+(\w+)/;
    return $self->{PMC_PARENTS}{$pmc} = 'default';
}

# Return an array of all
sub pmc_parents {
    my ($self, $pmc) = @_;

    my @parents = ($pmc);
    push @parents, $self->pmc_parent( $parents[-1] )
        until $parents[-1] eq 'default';

    shift @parents;
    return @parents;
}

# Internal sub get_pmc_order parses src/pmc/pmc.num.  The hash it builds
# includes both active and deactivated PMCs.
sub get_pmc_order {
    open my $IN, '<', 'src/pmc/pmc.num' or die "Can't read src/pmc/pmc.num";
    my %order;
    while (<$IN>) {
        next unless (/^(\w+\.\w+)\s+(\d+)$/);
        $order{$1} = $2;
    }
    close $IN;
    return \%order;
}

sub get_sorted_pmc_str {
    my @pmcs      = @_;
    my $pmc_order = get_pmc_order();
    my $n         = keys %$pmc_order;
    my @sorted_pmcs;

    for my $pmc (@pmcs) {
        if ( exists $pmc_order->{$pmc} ) {
            $sorted_pmcs[ $pmc_order->{$pmc} ] = $pmc;
        }
        else {
            $sorted_pmcs[ $n++ ] = $pmc;
        }
    }

    # With the test for definedness below, we account for PMCs which have been
    # deactivated but whose index numbers remain in src/pmc/pmc.num.
    my $active_pmcs = [ grep { defined $_ } @sorted_pmcs ];

    # At this point we check to see whether any active_pmcs are missing from
    # the MANIFEST.  We warn about any such missing PMCs but (for the time
    # being at least) we proceed to compose $pmc_str.
    my $seen_manifest = pmcs_in_manifest();
    check_pmcs_against_manifest( $active_pmcs, $seen_manifest );
    return join(' ' => @{ $active_pmcs });
}

sub pmcs_in_manifest {
    my $manifest = shift || 'MANIFEST';
    my %seen_manifest = ();
    open my $MAN, '<', $manifest
        or die "Unable to open MANIFEST: $!";
    while (my $f = <$MAN>) {
        chomp $f;
        if ($f =~ m{^src/pmc/(.*\.pmc)}) {
            my $pmc = $1;
            $seen_manifest{$pmc}++;
        }
    }
    close $MAN or die "Unable to close MANIFEST: $!";
    return \%seen_manifest;
}

sub check_pmcs_against_manifest {
    my ($active_pmcs, $seen_manifest) = @_;
    my @missing_from_manifest = grep { ! exists $seen_manifest->{$_} }
        @{ $active_pmcs };
    if (@missing_from_manifest) {
        warn "PMCs found in /src/pmc not found in MANIFEST: @missing_from_manifest";
    }
}

sub contains_pccmethod {
    my $file = shift;
    open( my $fh, '<', $file ) or die "Can't read '$file': $!\n";

    local $_;
    while (<$fh>) {
        next unless /\bMETHOD\b/;
        return 1;
    }

    return;
}

# Given a PMC file name, get a list of all the includes it specifies
sub get_includes {
    my $file = shift;
    open( my $fh, '<', $file ) or die "Can't read '$file': $!\n";

    my @retval;
    local $_;
    while (<$fh>) {
        next unless /^\s*# *include\s+"(.*)"\s+$/;
        my $include = $1;
        if ($include =~ m{^parrot}) { # main parrot include dir
          next if $include eq "parrot/parrot.h"; # already implicit everywhere.
          next if $include eq "parrot/io.h";     # already implicit everywhere.
          $include = "include/" . $include;
        } elsif ($include =~ m/^pmc_|\.str$/) { # local pmc header
          $include = "src/pmc/" . $include;
        } elsif ($include =~ m/^pmc\/pmc_/) { # local pmc header
          $include = "include/" . $include;
        } elsif ($include =~ m{^\.\./}) { # relative to include/ dir...
          $include =~ s{^\.\./}{};
        }
        push @retval, $include;
    }

    return join(' ', @retval);
}

sub order_pmcs_by_hierarchy {
    my ($self, $parents) = @_;

    return $self->get_kids_for_parent( $parents, 'default' );
}

sub get_kids_for_parent {
    my ($self, $parents, $parent) = @_;

    my @kids;

    for my $kid (@{ $parents->{$parent} }) {
        # skip abstract PMCs
        next if $kid eq '(abstract)';
        push @kids, $kid unless exists $parents->{$kid}
                                &&     $parents->{$kid}[0] eq '(abstract)';

        # and avoid infinite loops
        next if $kid eq $parent;
        push @kids, $self->get_kids_for_parent($parents, $kid);
    }

    return @kids;
}

1;

__DATA__
include/parrot/cclass.h
include/parrot/multidispatch.h
include/parrot/call.h
include/parrot/exit.h
include/parrot/pobj.h
include/parrot/extend_vtable.h
include/parrot/memory.h
include/parrot/key.h
include/parrot/oo.h
include/parrot/feature.h
include/parrot/oplib.h
include/parrot/library.h
include/parrot/thread.h
include/parrot/thr_pthread.h
include/parrot/thr_windows.h
include/parrot/atomic.h
include/parrot/atomic/fallback.h
include/parrot/atomic/gcc_pcc.h
include/parrot/atomic/gcc_x86.h
include/parrot/atomic/sparc.h
include/parrot/string.h
include/parrot/settings.h
include/parrot/namespace.h
include/parrot/extend.h
include/parrot/pbcversion.h
include/parrot/core_types.h
include/parrot/interpreter.h
include/parrot/io.h
include/parrot/context.h
include/parrot/parrot.h
include/parrot/dynext.h
include/parrot/hash.h
include/parrot/enums.h
include/parrot/encoding.h
include/parrot/vtable.h
include/parrot/scheduler.h
include/parrot/pmc.h
include/parrot/datatypes.h
include/parrot/core_pmcs.h
include/parrot/misc.h
include/parrot/sub.h
include/parrot/pmc_freeze.h
include/parrot/global_setup.h
include/parrot/gc_api.h
include/parrot/nci.h
include/parrot/vtables.h
include/parrot/has_header.h
include/parrot/warnings.h
include/parrot/op.h
include/parrot/debugger.h
include/parrot/caches.h
include/parrot/config.h
include/parrot/platform_interface.h
include/parrot/hll.h
include/parrot/packfile.h
include/parrot/exceptions.h
include/parrot/string_funcs.h
include/parrot/compiler.h
include/pmc/pmc_callcontext.h
include/pmc/pmc_continuation.h

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
