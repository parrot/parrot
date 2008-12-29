# Copyright (C) 2004-2008, The Perl Foundation.

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

    $emit->( $pmc->export . ' ' . $self->decl( $pmc, 'CFILE' ) );
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
    my $decs    = $self->decorators;

    # convert 'type*' to 'type *' per PDD07
    $ret =~ s/^(.*)\s*(\*)$/$1 $2/;

    # convert args to PDD07
    $args = ", $args" if $args =~ /\S/;
    $args =~ s/(\w+)\s*(\*)\s*/$1 $2/g;

    my ( $decorators, $export, $extern, $newl, $semi, $interp, $pmcvar );
    $decorators = join($/, @$decs, '');
    if ( $for_header eq 'HEADER' ) {
        $export = $pmc->export;
        $extern = '';
        $newl   = ' ';
        $semi   = ';';
        $interp = '';
        $pmcvar = '';
    }
    else {
        $export = '';
        $extern = '';
        $newl   = "\n";
        $semi   = '';
        $interp = 'interp';
        $pmcvar = 'pmc';
    }

    return <<"EOC";
$decorators$export $extern$ret${newl}Parrot_${pmcname}_$meth(PARROT_INTERP, PMC *$pmcvar$args)$semi
EOC
}

=item C<proto($type,$parameters)>

Determines the prototype (argument signature) for a method body
(see F<src/call_list>).

=cut

my %calltype = (
    'char'     => 'c',
    'short'    => 's',
    'char'     => 'c',
    'short'    => 's',
    'int'      => 'i',
    'INTVAL'   => 'I',
    'float'    => 'f',
    'FLOATVAL' => 'N',
    'double'   => 'd',
    'STRING*'  => 'S',
    'STRING *' => 'S',
    'char*'    => 't',
    'char *'   => 't',
    'PMC*'     => 'P',
    'PMC *'    => 'P',
    'short*'   => '2',
    'short *'  => '2',
    'int*'     => '3',
    'int *'    => '3',
    'long*'    => '4',
    'long *'   => '4',
    'void'     => 'v',
    'void*'    => 'b',
    'void *'   => 'b',
    'void**'   => 'B',
    'void **'  => 'B',

    #"BIGNUM*" => "???" # RT#43731
    #"BIGNUM *"=> "???" # RT#43731
);

sub proto {
    my ( $type, $parameters ) = @_;

    # reduce to a comma separated set of types
    $parameters =~ s/\w+(,|$)/,/g;
    $parameters =~ s/ //g;

    # type method(interp, self, parameters...)
    my $ret = $calltype{ $type or "void" };
    $ret .= "JO" . join( '', map { $calltype{$_} or "?" } split( /,/, $parameters ) );

    # RT#43733
    # scan src/call_list.txt if the generated signature is available

    # RT#43735 report errors for "?"
    # --leo

    return $ret;
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
    \bSELF\b         # Macro: SELF
      \.(\w+)        # other_method
      \(\s*(.*?)\)   # capture argument list
      }x,
        sub { "pmc->vtable->$1(" . full_arguments($2) . ')' }
    );

    # Rewrite STATICSELF.other_method(args...)
    $body->subst(
        qr{
      \bSTATICSELF\b          # Macro STATICSELF
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

        # Rewrite DYNSUPER(args)
        $body->subst(
            qr{
            \bDYNSUPER\b      # Macro: DYNSUPER
            \(\s*(.*?)\)      # capture argument list
          }x,
            sub { "interp->vtables[$supertype].$name(" . full_arguments($1) . ')' }
        );

        # Rewrite OtherClass.SUPER(args...)
        $body->subst(
            qr{
            (\w+)             # capture OtherClass
            \.SUPER\b         # Macro: SUPER
            \(\s*(.*?)\)      # capture argument list
          }x,
            sub { "Parrot_${1}_$name(" . full_arguments($2) . ')' }
        );

        # Rewrite SUPER(args...)
        $body->subst(
            qr{
            \bSUPER\b         # Macro: SUPER
            \(\s*(.*?)\)      # capture argument list
          }x,
            sub { "$supermethod(" . full_arguments($1) . ')' }
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
