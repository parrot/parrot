# Copyright (C) 2004-2008, Parrot Foundation.

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
use Parrot::Pmc2c::UtilFunctions qw( return_statement );
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
            flags => { ( %{ $parent->get_flags } ), 'is_ro' => 1 }, # copy flags, set is_ro
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

    foreach my $vt_method ( @{ $self->vtable->methods } ) {
        my $name = $vt_method->name;

        # Generate ro variant only iff we override method constantness with ":write"
        next unless $parent->{has_method}{$name}
                    && $parent->vtable_method_does_write($name)
                    && !$parent->vtable->attrs($name)->{write};

        # All parameters passed in are shims, because we're
        # creating an exception-thrower.
        my @parameters = split( /\s*,\s*/, $vt_method->parameters );
        @parameters = map { "SHIM($_)" } @parameters;

        my $ro_method = Parrot::Pmc2c::Method->new(
            {
                name        => $name,
                parent_name => $parent->name,
                return_type => $vt_method->return_type,
                parameters  => join( ', ', @parameters ),
                type        => Parrot::Pmc2c::Method::VTABLE,
                pmc_unused  => 1,
            }
        );
        my $pmcname = $parent->name;
        my $ret     = return_statement($ro_method);
        my $body    = <<EOC;
Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_WRITE_TO_CONSTCLASS,
        "$name() in read-only instance of $pmcname");
EOC

        # don't return after a Parrot_ex_throw_from_c_args
        $ro_method->body( Parrot::Pmc2c::Emitter->text($body) );
        $self->add_method($ro_method);
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
