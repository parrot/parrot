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

package Parrot::Pmc2c::PMC::RO;
use strict;
use warnings;
use base qw( Parrot::Pmc2c::PMC );

use Parrot::Pmc2c::Emitter ();
use Parrot::Pmc2c::PMCEmitter ();
use Parrot::Pmc2c::Method ();
use Parrot::Pmc2c::UtilFunctions
    qw( gen_ret dont_edit count_newlines dynext_load_code c_code_coda );
use Text::Balanced 'extract_bracketed';

=item C<make_RO($type)>

Create a RO version of the PMC

=cut

sub new {
    my ( $class, $parent ) = @_;
    my $classname = ref($parent) || $class;

    my $self = bless Parrot::Pmc2c::PMC->new(
        {
            parents => [ $parent->name, @{ $parent->parents } ],    # prepend self to parrent
            flags => { ( %{ $parent->get_flags } ), 'is_ro' => 1 }, # copy flags, set is_const
            name       => $parent->name . "_ro",                    # set pmcname
            vtable     => $parent->vtable,                          # and alias vtable
            parentname => $parent->name,                            # set parentname
        }
    ), $classname;

    $parent->set_flag('has_ro');

    {

      # autogenerate for nonstandard types
      # (RT#44433 is this appropriate or do we want them to each be explicitly cleared to have RO ?)
        no strict 'refs';
        if ( !@{ ref($self) . '::ISA' } ) {
            @{ ref($self) . '::ISA' } = "Parrot::Pmc2c::PMC::RO";
        }
    }

    # RT#44435 support getting implementations from central superclass instead
    # (e.g. some ro_fail pseudoclass that generates an exception)
    foreach my $vt_method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $vt_method->name;
        if ( $vt_method_name eq 'find_method' ) {
            my $ro_method = Parrot::Pmc2c::Method->new(
                {
                    name        => $vt_method_name,
                    parent_name => $parent->name,
                    return_type => $vt_method->return_type,
                    parameters  => $vt_method->parameters,
                    type        => Parrot::Pmc2c::Method::VTABLE,
                }
            );
            my $find_method_parent;
            if ( $parent->implements_vtable($vt_method_name) ) {
                $find_method_parent = $parent->name;
            }
            else {
                $find_method_parent = $parent->{super}{$vt_method_name};
            }
            my $real_findmethod = 'Parrot_' . $find_method_parent . '_find_method';
            my $body            = <<"EOC";
    PMC *const method = $real_findmethod(interp, pmc, method_name);
    if (!PMC_IS_NULL(VTABLE_getprop(interp, method, CONST_STRING_GEN(interp, "write"))))
        return PMCNULL;
    else
        return method;
EOC
            $ro_method->body( Parrot::Pmc2c::Emitter->text($body) );
            $self->add_method($ro_method);
        }
        elsif ( $parent->vtable_method_does_write($vt_method_name) ) {
            my $ro_method = Parrot::Pmc2c::Method->new(
                {
                    name        => $vt_method_name,
                    parent_name => $parent->name,
                    return_type => $vt_method->return_type,
                    parameters  => $vt_method->parameters,
                    type        => Parrot::Pmc2c::Method::VTABLE,
                }
            );
            my $pmcname = $parent->name;
            my $ret     = gen_ret($ro_method);
            my $body    = <<EOC;
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_WRITE_TO_CONSTCLASS,
            "$vt_method_name() in read-only instance of $pmcname");
EOC

            # don't return after a Parrot_ex_throw_from_c_args
            #      $body .= "    $ret\n" if $ret;
            $ro_method->body( Parrot::Pmc2c::Emitter->text($body) );
            $self->add_method($ro_method);
        }
        else {
            if ( $parent->implements_vtable($vt_method_name) ) {
                my $parent_method = $parent->get_method($vt_method_name);
                $self->{super}{$vt_method_name} = $parent_method->parent_name;
            }
            else {
                $self->{super}{$vt_method_name} = $parent->{super}{$vt_method_name};
            }
        }
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
