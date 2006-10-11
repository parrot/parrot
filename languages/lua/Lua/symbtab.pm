use strict;
use warnings;

package Lua::symbtab;
{

    sub new {
        my $proto    = shift;
        my $class    = ref($proto) || $proto;
        my ($parser) = @_;
        my $self     = {};
        bless $self, $class;
        $self->{parser} = $parser;
        $self->{table}  = {};
        return $self;
    }

}

################################################################################

package SymbTabVar;
use base qw(Lua::symbtab);
{

    sub Lookup {
        my $self = shift;
        my ($symb) = @_;
##    warn "Lookup $symb\n";
        if ( exists $self->{table}{$symb} ) {
            my $defn = $self->{table}{$symb};
##        warn "\tfound 1 in $self\n";
            return $defn;
        }
        else {
            my $parser = $self->{parser};
            for my $symbtab ( @{ $parser->YYData->{scope} } ) {
                if ( $symbtab->isa('SymbTabVar') ) {
                    if ( exists $symbtab->{table}{$symb} ) {
                        my $defn = $symbtab->{table}{$symb};
##                    warn "\tfound 2 in $symbtab\n";
                        return $defn;
                    }
                }
            }
            return;
        }
    }

    sub Insert {
        my $self   = shift;
        my ($defn) = @_;
        my $symb   = $defn->{name};
##    warn "Insert $symb in $self\n";
        unless ( exists $self->{table}{$symb} ) {
            $self->{table}{$symb} = $defn;
        }
        return;
    }

    sub LookupU {
        my $self = shift;
        my ($symb) = @_;

        #    warn "LookupU $symb\n";
        my $parser = $self->{parser};
        for ( @{ $parser->YYData->{scopef} } ) {
            if ( ref $_ eq 'ARRAY' ) {
                for my $symbtab ( @{$_} ) {
                    if ( defined($symbtab) and $symbtab->isa('SymbTabVar') ) {
                        if ( exists $symbtab->{table}{$symb} ) {
                            my $defn = $symbtab->{table}{$symb};

                        #                        warn "\tfound in $symbtab\n";
                            return $defn;
                        }
                    }
                }
            }
        }
        return;
    }

    sub LookupS {
        my $self = shift;
        my ($symb) = @_;
        if ( exists $self->{table}{$symb} ) {
            my $defn = $self->{table}{$symb};
            return $defn;
        }
        return;
    }

}

################################################################################

package SymbTabConst;
use base qw(Lua::symbtab);
{

    sub Lookup {
        my $self = shift;
        my ($symb) = @_;
        if ( exists $self->{table}{$symb} ) {
            my $defn = $self->{table}{$symb};
            return $defn;
        }
        else {
            return;
        }
    }

    sub Insert {
        my $self = shift;
        my ( $symb, $defn ) = @_;
        $self->{table}{$symb} = $defn;
        return;
    }

}

###############################################################################

package defn;
{

    sub new {
        my $proto = shift;
        my $class = ref($proto) || $proto;
        my $self  = {};
        bless $self, $class;
        my ( $symb, $klass, $type, $subtype, $name ) = @_;
        $self->{symbol}  = $symb;
        $self->{class}   = $klass;
        $self->{type}    = $type if ( defined $type );
        $self->{subtype} = $subtype if ( defined $subtype );
        $self->{name}    = $name if ( defined $name );
        return $self;
    }

}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

