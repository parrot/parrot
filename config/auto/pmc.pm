# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

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

    my @pmc = sort_pmcs( @{ $self->{srcpmc} } );

    my $pmc_list = join( ' ', grep { defined $_ } @pmc );

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
    lib/Parrot/Pmc2c/PMCEmitter.pm \\
    lib/Parrot/Pmc2c/MethodEmitter.pm \\
    lib/Parrot/Pmc2c/Library.pm \\
    lib/Parrot/Pmc2c/UtilFunctions.pm \\
    lib/Parrot/Pmc2c/PMC/default.pm \\
    lib/Parrot/Pmc2c/PMC/Null.pm \\
    lib/Parrot/Pmc2c/PMC/RO.pm
END

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
        if (contains_pccmethod($pmc_fname)) {
            $pccmethod_depend = 'lib/Parrot/Pmc2c/PCCMETHOD.pm';
            if ($pmc ne 'fixedintegerarray') {
                $pccmethod_depend .= ' include/pmc/pmc_fixedintegerarray.h';
            }
        }
        my $include_headers = get_includes($pmc_fname);
        my $cc_shared = $conf->data->get('cc_shared');
        my $cc_o_out  = $conf->data->get('cc_o_out');
        my $warnings  = $conf->data->get('ccwarn');
        my $optimize  = $conf->data->get('optimize');

        $TEMP_pmc_build .= <<END
src/pmc/$pmc.c : src/pmc/$pmc.dump
\t\$(PMC2CC) src/pmc/$pmc.pmc

src/pmc/$pmc.dump : vtable.dump $parent_dumps src/pmc/$pmc.pmc \$(PMC2C_FILES) $pccmethod_depend
\t\$(PMC2CD) src/pmc/$pmc.pmc

include/pmc/pmc_$pmc.h: src/pmc/$pmc.c

## SUFFIX OVERRIDE -Warnings
src/pmc/$pmc\$(O): include/pmc/pmc_$pmc.h src/pmc/$pmc.str \$(NONGEN_HEADERS) \\
    $parent_headers $include_headers include/pmc/pmc_continuation.h \\
    include/pmc/pmc_callcontext.h include/pmc/pmc_fixedintegerarray.h \\
    src/pmc/$pmc.c
\t\$(CC) \$(CFLAGS) $optimize $cc_shared $warnings -I\$(\@D) $cc_o_out \$@ -c src/pmc/$pmc.c

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

sub get_pmc_order {
    open my $IN, '<', 'src/pmc/pmc.num' or die "Can't read src/pmc/pmc.num";
    my %order;
    while (<$IN>) {
        next if /^#/;

        if (/(\w+\.\w+)\s+(\d+)/) {
            $order{$1} = $2;
        }
    }

    close $IN;

    return \%order;
}

sub sort_pmcs {
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

    return @sorted_pmcs;
}

sub contains_pccmethod {
    my $file = shift;
    open( my $fh, '<', $file ) or die "Can't read '$file': $!\n";

    local $_;
    while (<$fh>) {
        next unless /METHOD/;
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
        next unless /^\s*#include\s+["<](.*)[">]\s+$/;
        my $include = $1;
        if ($include =~ m{^(\.|parrot/)}) { # main parrot include dir
          $include = "include/" . $include;
        } elsif ($include =~ m/^pmc_|\.str$/) { # local pmc header
          $include = "src/pmc/" . $include;
        } elsif ($include =~ m/^pmc\/pmc_|\.h$/) { # local pmc header
          $include = "include/" . $include;
        } # else it's probably a system header, don't depend on it.
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
