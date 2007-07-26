# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$
package Parrot::Pmc2c::Method;
use strict;
use warnings;
use constant VTABLE_ENTRY => 'VTABLE_ENTRY';
use constant VTABLE => 'VTABLE';
use constant NON_VTABLE => 'NON_VTABLE';
use base qw( Exporter );
our @EXPORT_OK = qw();
use Carp;
use Parrot::Pmc2c::UtilFunctions qw(count_newlines);

sub new {
    my ( $class, $self_hash ) = @_;
    my $self = {(
        attrs => {},
        mmds => [],
        body => "",
        parameters => "",
        mmd_rights => [],
        parent_name => "",
        %{ $self_hash || {} }
      )};
    bless $self, (ref($class) || $class);
    $self;
}

sub clone {
    my ( $self, $self_hash ) = @_;
    return $self->new( {( %{ $self },
                          %{ $self_hash || {} }
                       )} );
}

sub add_mmd_rights {
    my ( $self, $value ) = @_;
    push @{ $self->{mmd_rights} }, $value;
}

sub mmd_rights {
    my ( $self ) = @_;
    return $self->{mmd_rights};
}

#getters/setters
for my $x qw( name parent_name type return_type body mmds symbol mmd_prefix mmd_table mmd_name
        right attrs parameters ) {
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
    my ( $self ) = @_;
    my $type = $self->type;
    return $type eq VTABLE || $type eq VTABLE_ENTRY;
}

sub is_mmd {
    my ( $self ) = @_;

    return 1 if $self->{mmd_name};
    return 1 if $self->mmds and scalar @{ $self->mmds };
    return 0;
}


=head1 C<trans($type)>

Used in C<signature()> to normalize argument types.

=cut


sub trans {
    my ( $self, $type ) = @_;

    return "v" if (!$type);
    my $char = substr $type, 0, 1;
    return $1 if ( $char =~ /([ISP])/ );
    return 'N' if ( $char eq 'F' );
    return 'v' if ( $type eq 'void' );
    return 'V' if ( $type =~ /void\s*\*\s*/ );
    return 'P' if ( $type =~ /opcode_t\*/);
    return "I" if ( $type =~ /int(val)?/i);
    return '?';
}

=head1 C<signature()>

Returns the method signature for the methods $parameters

=cut

sub signature {
    my ( $self ) = @_;

    my $return_type = $self->return_type;
    my $n = 0;
    my ( @types, @args );

    for my $x (split / /, $self->parameters) {
        push @{ ($n++ & 1) ? \@args : \@types }, $x;
    }

    my $args = @args ? ", " . join( ' ', @args ) : '';
    my $return_type_char = $self->trans($return_type);
    my $sig = $self->trans($return_type) . join '', map { $self->trans($_) } @types;
    my $return_prefix = '';
    my $method_suffix = '';

    if ( $return_type ne 'void' ) {
        $return_prefix = "return ($return_type)";
        if ( $return_type !~ /\*/ ) { # PMC* and STRING* don't need a special suffix
            $method_suffix = "_ret" . lc substr $return_type, 0, 1;
            $method_suffix =~ s/_retu/_reti/; #change UINTVAl type to reti
        }
    }

    my $null_return = '';
    $null_return = "return ($return_type) NULL;" if ($return_type_char =~/P|I|S|V/);
    $null_return = 'return (FLOATVAL) 0;'        if ($return_type_char =~/N/);
    $null_return = 'return;'                     if ($return_type_char =~/v/);

    return ( $return_prefix, $method_suffix, $args, $sig, $return_type_char, $null_return );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

