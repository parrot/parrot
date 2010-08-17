# Copyright (C) 2004-2008, Parrot Foundation.
# $Id$
package Parrot::Pmc2c::Method;
use strict;
use warnings;
use constant VTABLE_ENTRY => 'VTABLE_ENTRY';
use constant VTABLE       => 'VTABLE';
use constant NON_VTABLE   => 'NON_VTABLE';
use constant MULTI        => 'MULTI';
use Parrot::Pmc2c::UtilFunctions qw( args_from_parameter_list passable_args_from_parameter_list );

=head1 NAME

Parrot::Pmc2c::Method

=head1 DESCRIPTION

Functions used in transformation of PMCs to C code.

=head1 METHODS

=head2 C<new()>

Parrot::Pmc2c::Method constructor.

=cut

sub new {
    my ( $class, $self_hash ) = @_;
    my $self = {
        (
            attrs       => {},
            mmds        => [],
            body        => "",
            parameters  => "",
            mmd_rights  => [],
            parent_name => "",
            decorators  => [],
            pmc_unused  => 0,
            %{ $self_hash || {} }
        )
    };

    # this is usually wrong, but *something* calls new on an object somewhere
    bless $self, ref $class || $class;

    return $self;
}

sub clone {
    my ( $self, $self_hash ) = @_;
    return $self->new( { ( %{$self}, %{ $self_hash || {} } ) } );
}

sub add_mmd_rights {
    my ( $self, $value ) = @_;
    push @{ $self->{mmd_rights} }, $value;

    return;
}

sub mmd_rights {
    my ($self) = @_;
    return $self->{mmd_rights};
}

#getters/setters
for my $x qw( name parent_name type return_type body mmds symbol mmd_prefix mmd_table mmd_name
    right attrs decorators parameters ) {
    my $code = <<'EOC';
sub REPLACE {
    my ( $self, $value ) = @_;
    $self->{REPLACE} = $value if defined $value;
    return $self->{REPLACE}
}
EOC
        $code =~ s/REPLACE/$x/g;
        eval $code;
    }

sub is_vtable {
    my ($self) = @_;
    my $type = $self->type;
    return $type eq VTABLE || $type eq VTABLE_ENTRY;
}

sub is_mmd {
    my ($self) = @_;

    return 1 if $self->{mmd_name};
    return 1 if $self->mmds and scalar @{ $self->mmds };
    return 0;
}

sub is_multi {
    my ($self) = @_;

    return 1 if $self->{MULTI};
    return 0;
}

sub pmc_unused {
    my ($self) = @_;

    return $self->{pmc_unused};
}

=head2 C<trans($type)>

Used in C<signature()> to normalize argument types.

=cut

sub trans {
    my ( $self, $type ) = @_;

    return 'v' unless $type;

    my $char = substr $type, 0, 1;

    return $1  if $char =~ /([ISP])/;
    return 'N' if $char eq 'F';
    return 'V' if $type =~ /void\s*\*/;
    return 'v' if $type =~ /void\s*$/;
    return 'P' if $type =~ /opcode_t\*/;
    return 'I' if $type =~ /int(val)?/i;
    return '?';
}

=head2 C<signature()>

Returns the method signature for the methods $parameters

=cut

sub signature {
    my ($self) = @_;

    my $args             = passable_args_from_parameter_list( $self->parameters );
    my ($types, $vars)   = args_from_parameter_list( $self->parameters );
    my $return_type      = $self->return_type;
    my $return_type_char = $self->trans($return_type);
    my $sig              = $self->trans($return_type) .
                           join '', map { $self->trans($_) } @{$types};
    my $return_prefix    = '';
    my $method_suffix    = '';

    if ( $return_type ne 'void' ) {
        $return_prefix = "return ($return_type)";

        # PMC* and STRING* don't need a special suffix
        if ( $return_type !~ /\*/ ) {
            $method_suffix = "_ret" . lc substr $return_type, 0, 1;

            # change UINTVAl type to reti
            $method_suffix =~ s/_retu/_reti/;
        }
    }

    my $null_return = '';
    $null_return = "return ($return_type) NULL;" if $return_type_char =~ /P|I|S|V/;
    $null_return = 'return (FLOATVAL) 0;'        if $return_type_char =~ /N/;
    $null_return = 'return;'                     if $return_type_char =~ /v/;

    return ( $return_prefix, $method_suffix, $args, $sig, $return_type_char, $null_return );
}

=head2 C<pcc_signature()>

Returns a PCC-style method signature for the method's parameters, as well as
some additional information useful in building a call to that method.

=cut

sub pcc_signature {
    my ($self) = @_;

    my $args             = passable_args_from_parameter_list( $self->parameters );
    my ($types, $vars)   = args_from_parameter_list( $self->parameters );
    my $return_type      = $self->return_type;
    my $return_type_char = $self->trans($return_type);
    my $sig              = join ('', map { $self->trans($_) } @{$types}) .
                           '->';

    my $result_decl    = '';
    my $return_stmt    = '';

    if ( $return_type eq 'void' ) {
        $return_stmt = "return ($return_type) NULL;" if $return_type_char =~ /P|I|S|V/;
        $return_stmt = 'return (FLOATVAL) 0;'        if $return_type_char =~ /N/;
        $return_stmt = 'return;'                     if $return_type_char =~ /v/;
    }
    else {
        $result_decl = "$return_type result;";
        $result_decl = "$return_type result = PMCNULL;" if $return_type_char eq 'P';
        $args .= ', &result';
        $sig .= $return_type_char;
        $return_stmt = "return ($return_type) result;";
    }

    return ( $sig, $args, $result_decl, $return_stmt );
}

=head1 SEE ALSO

    lib/Parrot/Pmc2c/PMC/RO.pm
    lib/Parrot/Pmc2c/PMCEmitter.pm
    lib/Parrot/Pmc2c/VTable.pm
    lib/Parrot/Pmc2c/PMC.pm
    lib/Parrot/Pmc2c/Parser.pm

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

