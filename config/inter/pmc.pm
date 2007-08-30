# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/inter/pmc.pm - PMC Files

=head1 DESCRIPTION

Asks the user to select which PMC files to include.

=cut

package inter::pmc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use File::Basename qw/basename/;

use Parrot::Configure::Step ':inter';

our $description = 'Determining what pmc files should be compiled in';
our @args        = qw(ask pmc);

my %PMC_PARENTS;

# Return the (lowercased) name of the immediate parent of the given
# (lowercased) pmc name.
sub pmc_parent {
    my ($pmc) = @_;

    return $PMC_PARENTS{$pmc} if defined $PMC_PARENTS{$pmc};

    local $/;
    open( my $PMC, "<", "src/pmc/$pmc.pmc" )
        or die "open src/pmc/$pmc.pmc failed: $!";
    local $_ = <$PMC>;
    close $PMC;

    # Throw out everything but the pmclass declaration
    s/^.*?pmclass//s;
    s/\{.*$//s;

    return $PMC_PARENTS{$pmc} = lc($1) if m/extends\s+(\w+)/;
    return $PMC_PARENTS{$pmc} = 'default';
}

# Return an array of all
sub pmc_parents {
    my ($pmc) = @_;

    my @parents = ($pmc);
    push @parents, pmc_parent( $parents[-1] ) until $parents[-1] eq 'default';
    shift(@parents);

    return @parents;
}

sub get_pmc_order {
    open my $IN, '<', 'src/pmc/pmc.num' or die "Can't read src/pmc/pmc.num";
    my %order;
    while (<$IN>) {
        next if (/^#/);
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
    my $n         = scalar keys( %{$pmc_order} );
    my @sorted_pmcs;
    for (@pmcs) {
        if ( exists $pmc_order->{$_} ) {
            $sorted_pmcs[ $pmc_order->{$_} ] = $_;

            #if (exists $pmc_order->{"const$_"}) {
            #   $sorted_pmcs[$pmc_order->{"const$_"}] = "const$_";
            #}
        }
        else {
            $sorted_pmcs[ $n++ ] = $_;
        }
    }
    ## print "***\n", join(' ', @sorted_pmcs), "\n";
    return @sorted_pmcs;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my @pmc = (
        sort
            map { basename($_) } glob "./src/pmc/*.pmc"
    );

    @pmc = sort_pmcs(@pmc);

    my $pmc_list = $conf->options->get('pmc')
        || join( ' ', grep { defined $_ } @pmc );

    if ( $conf->options->get('ask') ) {
        print <<"END";


The following PMC files are available:
  @pmc
END
        {
            $pmc_list = prompt( 'Which PMC files would you like?', $pmc_list );
        }
    }

    # RT#43172 :leo do we really need an interactive step for this
    # user could deactivate vital PMCs like SArray
    # so there would be tests needed, that check for vital classes

    # names of class files for src/pmc/Makefile
    ( my $TEMP_pmc_o   = $pmc_list ) =~ s/\.pmc/\$(O)/g;
    ( my $TEMP_pmc_str = $pmc_list ) =~ s/\.pmc/\.str/g;

    # calls to pmc2c.pl for src/pmc/Makefile
    my $TEMP_pmc_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/pmc.pm'

E_NOTE

        $TEMP_pmc_build .= <<END;
PMC2C_FILES = \\
\t\tlib/Parrot/Pmc2c/Pmc2cMain.pm \\
\t\tlib/Parrot/Pmc2c/Parser.pm \\
\t\tlib/Parrot/Pmc2c/Dumper.pm \\
\t\tlib/Parrot/Pmc2c/PMC.pm \\
\t\tlib/Parrot/Pmc2c/Method.pm \\
\t\tlib/Parrot/Pmc2c/PCCMETHOD.pm \\
\t\tlib/Parrot/Pmc2c/PMCEmitter.pm \\
\t\tlib/Parrot/Pmc2c/MethodEmitter.pm \\
\t\tlib/Parrot/Pmc2c/Library.pm \\
\t\tlib/Parrot/Pmc2c/UtilFunctions.pm \\
\t\tlib/Parrot/Pmc2c/PMC/default.pm \\
\t\tlib/Parrot/Pmc2c/PMC/delegate.pm \\
\t\tlib/Parrot/Pmc2c/PMC/deleg_pmc.pm \\
\t\tlib/Parrot/Pmc2c/PMC/Null.pm \\
\t\tlib/Parrot/Pmc2c/PMC/Ref.pm \\
\t\tlib/Parrot/Pmc2c/PMC/SharedRef.pm \\
\t\tlib/Parrot/Pmc2c/PMC/STMRef.pm \\
\t\tlib/Parrot/Pmc2c/PMC/RO.pm
END

    foreach my $pmc ( split( /\s+/, $pmc_list ) ) {
        $pmc =~ s/\.pmc$//;
        next if ( $pmc =~ /^const/ );

        # make each pmc depend upon its parent.
        my $parent       = pmc_parent($pmc) . ".pmc";
        my $parent_dumps = '';
        $parent_dumps .= "src/pmc/$_.dump " foreach reverse( ( pmc_parents($pmc) ) );
        my $parent_headers = '';
        $parent_headers .= "src/pmc/pmc_$_.h " foreach ( pmc_parents($pmc) );
        $TEMP_pmc_build .= <<END
src/pmc/$pmc.c : src/pmc/$pmc.dump
\t\$(PMC2CC) src/pmc/$pmc.pmc

src/pmc/$pmc.dump : vtable.dump $parent_dumps src/pmc/$pmc.pmc \$(PMC2C_FILES) 
\t\$(PMC2CD) src/pmc/$pmc.pmc 

src/pmc/pmc_$pmc.h: src/pmc/$pmc.c

src/pmc/$pmc\$(O): src/pmc/$pmc.str \$(NONGEN_HEADERS) \\
\t\t$parent_headers

END
    }

    # src/pmc/$pmc\$(O): \$(NONGEN_HEADERS) $parent_headers src/pmc/pmc_$pmc.h

    # build list of libraries for link line in Makefile
    my $slash = $conf->data->get('slash');
    ( my $TEMP_pmc_classes_o   = $TEMP_pmc_o )   =~ s/^| / src${slash}pmc${slash}/g;
    ( my $TEMP_pmc_classes_str = $TEMP_pmc_str ) =~ s/^| / src${slash}pmc${slash}/g;
    ( my $TEMP_pmc_classes_pmc = $pmc_list )     =~ s/^| / src${slash}pmc${slash}/g;

    # Gather the actual names (with MixedCase) of all of the
    # non-abstract built-in PMCs.
    my @names;
PMC: foreach my $pmc_file ( split( /\s+/, $pmc_list ) ) {
        next if ( $pmc_file =~ /^const/ );
        my $name;
        open my $PMC, "<", "src/pmc/$pmc_file"
            or die "open src/pmc/$pmc_file: $!";
        my $const;
        while (<$PMC>) {
            if (/^pmclass (\w+)(.*)/) {
                $name = $1;
                my $decl = $2;
                $decl .= <$PMC> until ( $decl =~ s/\{.*// );
                $const = 1 if $decl =~ /\bconst_too\b/;
                next PMC if $decl =~ /\babstract\b/;
                next PMC if $decl =~ /\bextension\b/;
                last;
            }
        }
        close $PMC;
        die "No pmclass declaration found in $pmc_file"
            if !defined $name;

        # please note that normal and Const PMCs must be in this
        # order
        push @names, $name;
        push @names, "Const$name" if $const;
    }

    $conf->data->set(
        pmc                  => $pmc_list,
        pmc_names            => join( " ", @names ),
        TEMP_pmc_o           => $TEMP_pmc_o,
        TEMP_pmc_build       => $TEMP_pmc_build,
        TEMP_pmc_classes_o   => $TEMP_pmc_classes_o,
        TEMP_pmc_classes_str => $TEMP_pmc_classes_str,
        TEMP_pmc_classes_pmc => $TEMP_pmc_classes_pmc,
    );

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
