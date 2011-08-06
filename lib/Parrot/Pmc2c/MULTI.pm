# Copyright (C) 2004-2011, Parrot Foundation.

package Parrot::Pmc2c::MULTI;
use strict;
use warnings;
use Parrot::Pmc2c::PCCMETHOD ();
use Carp qw(longmess croak);

=head1 NAME

Parrot::Pmc2c::MULTI - Parses and preps MULTI dispatch subs

=head1 SYNOPSIS

    use Parrot::Pmc2c::MULTI;

=head1 DESCRIPTION

Parrot::Pmc2c::MULTI - Parses and preps MULTI multiple dispatch declarations
called from F<Parrot:Pmc2c::Pmc2cMain>

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<rewrite_multi_sub($method, $pmc)>

B<Purpose:>  Parse and Build PMC multiple dispatch subs.

B<Arguments:>

=over 4

=item * C<self>

=item * C<method>

Current Method Object

=item * C<body>

Current Method Body

=back

=cut

sub rewrite_multi_sub {
    my ( $self, $pmc ) = @_;
    my @param_types = ();
    my @new_params = ();

    # Fixup the parameters, standardizing PMC types and extracting type names
    # for the multi name.
    for my $param ( split /,/, $self->parameters ) {
        my ( $type, $name, $rest ) = split /\s+/, &Parrot::Pmc2c::PCCMETHOD::trim($param), 3;

        die "Invalid MULTI parameter '$param': missing type or name\n"
             unless defined $name;
        die "Invalid MULTI parameter '$param': attributes not allowed on multis\n"
             if defined $rest;

        # Clean any '*' out of the name or type.
        if ($name =~ /[\**]?(\"?\w+\"?)/) {
            $name = $1;
        }
        $type =~ s/\*+//;

        # Capture the actual type for the sub name
        push @param_types, $type;

        # Pass standard parameter types unmodified.
        # All other param types are rewritten as PMCs.
        if ($type eq 'STRING' or $type eq 'PMC' or $type eq 'INTVAL') {
            push @new_params, $param;
        }
        elsif ($type eq 'FLOATVAL') {
            push @new_params, $param;
        }
        else {
            push @new_params, "PMC *$name";
        }
    }

    $self->parameters(join (",", @new_params));

    $self->{MULTI_sig}      = [@param_types];
    $self->{MULTI_full_sig} = join(',', @param_types);
    $self->{MULTI}          = 1;

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
