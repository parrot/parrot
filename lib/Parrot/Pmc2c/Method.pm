# Copyright (C) 2004-2012, Parrot Foundation.
package Parrot::Pmc2c::Method;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( args_from_parameter_list passable_args_from_parameter_list );
use Parrot::Pmc2c::PCCMETHOD ();

=head1 NAME

Parrot::Pmc2c::Method

=head1 DESCRIPTION

Functions used in transformation of PMCs to C code.

=head1 METHODS

=head2 C<new()>

Parrot::Pmc2c::Method constructor.

=cut

use constant VTABLE_ENTRY => 'VTABLE_ENTRY';
use constant VTABLE       => 'VTABLE';
use constant NON_VTABLE   => 'NON_VTABLE';
use constant MULTI        => 'MULTI';

sub new {
    my ( $class, $self_hash ) = @_;
    my $self = {
        (
            attrs       => {},
            body        => "",
            parameters  => "",
            parent_name => "",
            decorators  => [],
            pmc_unused  => 0,
            interp_unused => 0,
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


#getters/setters
for my $x ( qw( name parent_name type return_type body symbol attrs decorators parameters ) ) {
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
    my $type = shift->type;
    return $type eq VTABLE || $type eq VTABLE_ENTRY;
}

sub is_multi {
    my ($self) = @_;
    return $self->type eq MULTI;
}

# if is_ro
sub pmc_unused {
    return shift->{pmc_unused};
}

# detect empty body, like return 1
sub interp_unused {
    my ($self) = @_;

    my $body = $self->body;
    if ($body->{data} and $body->{data} =~ /^\s+return 1;\s+$/) {
        $self->{interp_unused} = 1;
        $self->{pmc_unused} = 1;
    }
    return $self->{interp_unused};
}

sub vtable_method_has_manual_wb {
    my ( $method ) = @_;
    return $method->{attrs}->{manual_wb};
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

=over 4

=item C<generate_body($pmc)>

Generate and emit the C code for the method body.

=cut

sub generate_body {
    my ( $self, $pmc ) = @_;
    my $emit = sub { $pmc->{emitter}->emit(@_) };

    Parrot::Pmc2c::PCCMETHOD::rewrite_RETURNs( $self, $pmc );
    Parrot::Pmc2c::PCCMETHOD::rewrite_pccinvoke( $self, $pmc );

    my $body = $self->body;

    if ( $self->is_vtable ) {
        $self->rewrite_vtable_method($pmc);
    }
    else {
        $self->rewrite_nci_method($pmc);
    }

    $emit->( $self->decl( $pmc, 'CFILE' ) );
    $emit->("{\n");
    $emit->($body);
    $emit->("}\n");

    return 1;
}

sub generate_headers {
    my ( $self, $pmc ) = @_;

    my $hout = $self->decl( $pmc, 'HEADER' );

    return $hout;
}

=item C<decl($classname, $method, $for_header)>

Returns the C code for the PMC method declaration. C<$for_header>
indicates whether the code is for a header or implementation file.

=cut

sub decl {
    my ( $self, $pmc, $for_header ) = @_;

    my $pmcname = $pmc->name;
    my $ret     = $self->return_type;
    my $meth    = $self->name;
    my $args    = $self->parameters;
    my $decs    = join( $/, @{$self->decorators}, '' );

    # convert 'type*' to 'type *' per PDD07
    $ret =~ s/^(.*)\s*(\*)$/$1 $2/;

    # convert args to PDD07
    $self->{parameters} =~ s/(\w+)\s*(\*)\s*/$1 $2/g;
    $args = $self->parameters;
    $args = ", $args" if $args =~ /\S/;

    # SHIM UNUSED(args) in body
    my $body = $self->body;
    if ($body =~ /^\s*(return \d;|)$/s) { # empty body
        $self->{interp_unused} = 1;
        $self->{pmc_unused}    = 1;
    }
    my (%unused, $cnt);
    if ($body->{data} and $body->{data} !~ /^\s*#if/m) {
        if (!$self->attrs->{manual_wb} and $body->{data} =~ m|^\s*(/* no )?PARROT_GC_WRITE_BARRIER|m) {
            $self->attrs->{manual_wb} = 1;
        }
        while ($body->{data} =~ /^\s*UNUSED\((\w+)\);?\n/m) {
            my $key = $1;
            $cnt++;
            if ($cnt > 6) {
                # This happens when the $body->{data} =~ s/// lines below do not remove the line
                warn "Internal Error: UNUSED($key) detection recursion in $pmcname.$meth($args)\n"
                  .$body->{data}."\n";
                last;
            }
            if (($key eq 'INTERP' or $key eq 'interp') and !$self->{need_write_barrier}) {
                $unused{INTERP}++;
                $self->{interp_unused} = 1;
                $body->{data} =~ s/^\s*UNUSED\($key\);?\n//m;
                warn "Replace UNUSED(interp) with UNUSED(INTERP) in $pmcname METHOD $meth\n"
                  if $key eq 'interp'
                    and $self->{parent_name} ne 'Null'
                      and $body->{data} !~ /^\s*$/;
            } elsif ($body->{data} =~ /^\s*UNUSED\(SELF\)/m and !$self->{need_write_barrier}) {
                $unused{SELF}++;
                $self->{pmc_unused} = 1;
                $body->{data} =~ s/^\s*UNUSED\(SELF\);?\n//m;
            } elsif ($args =~ s/, (\w+ \*?$key)/, SHIM($1)/) {
                $unused{$key}++;
                $body->{data} =~ s/^\s*UNUSED\($key\);?\n//m;
                $self->{parameters} =~ s/(\w+ \*?$key)/SHIM($1)/;
            }
            else {
                $body->{data} =~ s|^(\s*)UNUSED\($key\);?\n|$1/**/UNUSED\($key\)\n|m;
                if ($self->{need_write_barrier} and $key =~ /^interp|SELF$/i) {
                    #warn "Useless use of SHIM UNUSED($key) in $pmcname METHOD $meth: kept for write barrier\n";
                    ; # XXX ignore this for while until GC WB is stable
                }
                else {
                    $unused{$key}++;
                    warn "Did not SHIM UNUSED($key) in $pmcname METHOD $meth\n";
                }
                last;
            }
        }
    }

    my $params = $self->parameters;
    for my $key ('INTERP', 'SELF',
                 map { /.*\b(\w+)$/ } split /,\s*/, $params) {
        my $inbody = $key eq 'INTERP' ? '(INTERP|interp)'
                                      : $key eq 'SELF' ? '(_self|SELF)'
                                                       : $key;
        if ($body->{data} and !exists($unused{$key}) and $body->{data} !~ /$inbody/) {
            if ($key eq 'INTERP' and ($self->interp_unused or $body->{data} =~ /(SUPER|STATICSELF|SELF\.)/)) {}
            elsif ($key eq 'SELF' and ($self->pmc_unused or $body->{data} =~ /(SUPER|STATICSELF)/)) {}
            elsif ($key =~ /^(INTERP|value)$/ and $pmcname =~ /^(BigInt|BigNum)$/
                   and $body->{data} =~ /NO_MULTIPLE_DISPATCH/) {}
            elsif ($self->attrs->{no_wb}) {
                warn "Possibly forgotten UNUSED($key) in $pmcname METHOD $meth\n"
                  if $pmcname !~ /^(default|Null|Proxy)$/; # These are valid problems but autogenerated
            }
        }
    }

    my ( $extern, $newl, $semi );
    if ( $for_header eq 'HEADER' ) {
        $newl   = ' ';
        $semi   = ';';
    }
    else {
        $newl   = "\n";
        $semi   = '';
    }
    my $interp = $self->interp_unused ? 'SHIM_INTERP' : 'PARROT_INTERP';
    my $pmcarg = $self->pmc_unused ? 'SHIM(PMC *_self)' : 'ARGMOD(PMC *_self)';
    my $static = $pmcname eq 'CallContext' ? "" : "static";

    return <<"EOC";
$static $decs $ret${newl}Parrot_${pmcname}_$meth($interp, $pmcarg$args)$semi
EOC
}

=item C<rewrite_nci_method($self, $pmc )>

Rewrites the method body performing the various macro substitutions for
nci method bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_nci_method {
    my ( $self, $pmc ) = @_;
    my $pmcname = $pmc->name;
    my $body    = $self->body;

    # Rewrite SELF.other_method(args...)
    $body->subst(
        qr{
      \bSELF\b       # Macro: SELF
      \.(\w+)        # other_method
      \(\s*(.*?)\)   # capture argument list
      }x,
        sub { "_self->vtable->$1(" . full_arguments($2) . ')' }
    );

    # Rewrite STATICSELF.other_method(args...)
    $body->subst(
        qr{
      \bSTATICSELF\b    # Macro STATICSELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${pmcname}"
                . ( $pmc->is_vtable_method($1) ? "" : "_nci" ) . "_$1("
                . full_arguments($2) . ")";
        }
    );

    # Rewrite SELF -> _self, INTERP -> interp
    $body->subst( qr{\bSELF\b},   sub { '_self' } );
    $body->subst( qr{\bINTERP\b}, sub { 'interp' } );

    # Rewrite GET_ATTR, SET_ATTR with typename
    $body->subst( qr{\bGET_ATTR}, sub { 'GETATTR_' . $pmcname } );
    $body->subst( qr{\bSET_ATTR}, sub { 'SETATTR_' . $pmcname } );
}

=item C<rewrite_vtable_method($self, $pmc, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
vtable function bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_vtable_method {
    my ( $self, $pmc ) = @_;
    my $name        = $self->name;
    my $pmcname     = $pmc->name;
    my $super       = $pmc->{super}{$name};
    my $super_table = $pmc->{super};
    my $body        = $self->body;
    my $sub;

    # Rewrite method body
    # Some MMD variants don't have a super mapping.
    if ($super) {
        my $supertype = "enum_class_$super";
        die "$pmcname defines unknown vtable function '$name'\n" unless defined $super_table->{$name};
        my $supermethod = "Parrot_" . $super_table->{$name} . "_$name";

        # Rewrite OtherClass.SUPER(args...)
        $body->subst(
            qr{
            (\w+)             # capture OtherClass
            \.SUPER\b         # Macro: SUPER
            \(\s*(.*?)\)      # capture argument list
          }x,
            sub { "interp->vtables[enum_class_${1}]->$name(" . full_arguments($2) . ')' }
        );

        # Rewrite SUPER(args...)
        $body->subst(
            qr{
            \bSUPER\b         # Macro: SUPER
            \(\s*(.*?)\)      # capture argument list
          }x,
            sub {
              if ($pmc->is_dynamic($super)) {
                #*_get_vtable_pointer is a minor hack invented only to handle
                #the use case when a dynpmc calls a parent dynpmc's vtable
                #function.  See TT #898 for more info.
                return "Parrot_" . $super .
                  "_get_vtable_pointer(interp)->$name(" . full_arguments($1) .
                  ')';
              }
              else {
                return "interp->vtables[$supertype]->$name(" . full_arguments($1) . ')';
              }
            }
        );
    }

    # Rewrite SELF.other_method(args...)
    $body->subst(
        qr{
        \bSELF\b       # Macro: SELF
        \.(\w+)        # other_method
        \(\s*(.*?)\)   # capture argument list
      }x,
        sub { "_self->vtable->$1(" . full_arguments($2) . ')' }
    );

    # Rewrite SELF(args...). See comments above.
    $body->subst(
        qr{
        \bSELF\b       # Macro: SELF
        \(\s*(.*?)\)   # capture argument list
      }x,
        sub { "_self->vtable->$name(" . full_arguments($1) . ')' }
    );

    # Rewrite OtherClass.SELF.other_method(args...)
    $body->subst(
        qr{
        (\w+)             # OtherClass
        \.\bSELF\b        # Macro SELF
        \.(\w+)           # other_method
        \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${1}"
                . ( $pmc->is_vtable_method($2) ? "" : "_nci" ) . "_$2("
                . full_arguments($3) . ')';
        }
    );

    # Rewrite OtherClass.STATICSELF.other_method(args...)
    $body->subst(
        qr{
        (\w+)             # OtherClass
        \.\bSTATICSELF\b  # Macro STATICSELF
        \.(\w+)           # other_method
        \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${1}"
                . ( $pmc->is_vtable_method($2) ? "" : "_nci" ) . "_$2("
                . full_arguments($3) . ')';
        }
    );

    # Rewrite OtherClass.object.other_method(args...)
    $body->subst(
        qr{
        (\w+)             # OtherClass
        \.\b(\w+)\b       # any object
        \.(\w+)           # other_method
        \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${1}"
                . ( $pmc->is_vtable_method($3) ? "" : "_nci" ) . "_$3("
                . full_arguments( $4, $2 ) . ')';
        }
    );

    # Rewrite SELF.other_method(args...)
    $body->subst(
        qr{
        \bSELF\b          # Macro SELF
        \.(\w+)           # other_method
        \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${pmcname}"
                . ( $pmc->is_vtable_method($1) ? "" : "_nci" ) . "_$1("
                . full_arguments($2) . ")";
        }
    );

    # Rewrite STATICSELF.other_method(args...)
    $body->subst(
        qr{
        \bSTATICSELF\b    # Macro STATICSELF
        \.(\w+)           # other_method
        \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${pmcname}"
                . ( $pmc->is_vtable_method($1) ? "" : "_nci" ) . "_$1("
                . full_arguments($2) . ")";
        }
    );

    # Rewrite SELF -> _self, INTERP -> interp
    $body->subst( qr{\bSELF\b},   sub { '_self' } );
    $body->subst( qr{\bINTERP\b}, sub { 'interp' } );

    # Rewrite GET_ATTR, SET_ATTR with typename
    $body->subst( qr{\bGET_ATTR}, sub { 'GETATTR_' . $pmcname } );
    $body->subst( qr{\bSET_ATTR}, sub { 'SETATTR_' . $pmcname } );

    # now use macros for all rewritten stuff
    $body->subst( qr{\b(?:\w+)->vtable->(\w+)\(}, sub { "VTABLE_$1(" } );

    # add GC write barrier for writers
    #if ($pmc->is_vtable_method($name)) {
    #}
    return 1;
}

=item C<full_arguments($args)>

Prepends C<INTERP, SELF> to C<$args>.

=back

=cut

sub full_arguments {
    my $args = shift;
    my $obj = shift || 'SELF';

    return "INTERP, $obj, $args" if ( $args =~ m/\S/ );
    return "INTERP, $obj";
}

sub full_method_name {
    my ( $self, $parent_name ) = @_;
    return "Parrot_${parent_name}_" . $self->name;
}

=head1 SEE ALSO

    lib/Parrot/Pmc2c/PMC/RO.pm
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

