# Copyright (C) 2004-2009, Parrot Foundation.

# $Id$

=head1 NAME

Parrot::Pmc2c - PMC to C Code Generation

=head1 SYNOPSIS

    use Parrot::Pmc2c;

=head1 DESCRIPTION

C<Parrot::Pmc2c> is used by F<tools/build/pmc2c.pl> to generate C code from PMC files.

=head2 Functions

=over

=cut

package Parrot::Pmc2c::Method;
use strict;
use warnings;
use Parrot::Pmc2c::Emitter ();
use Parrot::Pmc2c::PCCMETHOD ();

=item C<generate_body($pmc)>

Generate and emit the C code for the method body.

=cut

sub generate_body {
    my ( $self, $pmc ) = @_;
    my $emit = sub { $pmc->{emitter}->emit(@_) };

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

    if ( $self->mmds ) {
        for my $mmd ( @{ $self->mmds } ) {
            $mmd->generate_body($pmc);
        }
    }

    return 1;
}

sub generate_headers {
    my ( $self, $pmc ) = @_;

    my $hout = $self->decl( $pmc, 'HEADER' );

    if ( $self->mmds ) {
        for my $mmd ( @{ $self->mmds } ) {
            $hout .= $mmd->decl( $pmc, 'HEADER' );
        }
    }

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
    $args = ", $args" if $args =~ /\S/;
    $args =~ s/(\w+)\s*(\*)\s*/$1 $2/g;

    my ( $extern, $newl, $semi );
    if ( $for_header eq 'HEADER' ) {
        $newl   = ' ';
        $semi   = ';';
    }
    else {
        $newl   = "\n";
        $semi   = '';
    }
    my $pmcarg = 'PMC *pmc';
    $pmcarg    = "SHIM($pmcarg)" if $self->pmc_unused;

    return <<"EOC";
static $decs $ret${newl}Parrot_${pmcname}_$meth(PARROT_INTERP, $pmcarg$args)$semi
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
        sub { "pmc->vtable->$1(" . full_arguments($2) . ')' }
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

    # Rewrite SELF -> pmc, INTERP -> interp
    $body->subst( qr{\bSELF\b},   sub { 'pmc' } );
    $body->subst( qr{\bINTERP\b}, sub { 'interp' } );

    # Rewrite GET_ATTR, SET_ATTR with typename
    $body->subst( qr{\bGET_ATTR}, sub { 'GETATTR_' . $pmcname } );
    $body->subst( qr{\bSET_ATTR}, sub { 'SETATTR_' . $pmcname } );
}

=item C<rewrite_vtable_method($self, $pmc, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
vtable method bodies (see F<tools/build/pmc2c.pl>).

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
        die "$pmcname defines unknown vtable method '$name'\n" unless defined $super_table->{$name};
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
                return "Parrot_" . $super .
                  "_get_vtable(interp)->$name(" . full_arguments($1) .
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
        sub { "pmc->vtable->$1(" . full_arguments($2) . ')' }
    );

    # Rewrite SELF(args...). See comments above.
    $body->subst(
        qr{
        \bSELF\b       # Macro: SELF
        \(\s*(.*?)\)   # capture argument list
      }x,
        sub { "pmc->vtable->$name(" . full_arguments($1) . ')' }
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

    # Rewrite SELF -> pmc, INTERP -> interp
    $body->subst( qr{\bSELF\b},   sub { 'pmc' } );
    $body->subst( qr{\bINTERP\b}, sub { 'interp' } );

    # Rewrite GET_ATTR, SET_ATTR with typename
    $body->subst( qr{\bGET_ATTR}, sub { 'GETATTR_' . $pmcname } );
    $body->subst( qr{\bSET_ATTR}, sub { 'SETATTR_' . $pmcname } );

    # now use macros for all rewritten stuff
    $body->subst( qr{\b(?:\w+)->vtable->(\w+)\(}, sub { "VTABLE_$1(" } );

    return 1;
}

=item C<full_arguments($args)>

Prepends C<INTERP, SELF> to C<$args>.

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

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
