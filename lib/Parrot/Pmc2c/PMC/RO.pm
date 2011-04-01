# Copyright (C) 2004-2011, Parrot Foundation.
package Parrot::Pmc2c::PMC::RO;
use strict;
use warnings;
use base qw( Parrot::Pmc2c::PMC );
use Parrot::Pmc2c::Emitter ();
use Parrot::Pmc2c::Method ();
use Parrot::Pmc2c::UtilFunctions qw( return_statement );
use Text::Balanced 'extract_bracketed';

sub new {
    my ( $class, $parent ) = @_;
    my $classname = ref($parent) || $class;

    my $self = bless Parrot::Pmc2c::PMC->new(
        {
            # prepend self to parent
            parents => [ $parent->name, @{ $parent->parents } ],
            # copy flags, set is_ro
            flags => { ( %{ $parent->get_flags } ), 'is_ro' => 1 },
            # set pmcname
            name       => $parent->name . "_ro",
            # and alias vtable
            vtable     => $parent->vtable,
            # set parentname
            parentname => $parent->name,
        }
    ), $classname;

    $parent->set_flag('has_ro');

    {

      # autogenerate for nonstandard types
      # (TT #1240: is this appropriate or do we want them to each be
      # explicitly cleared to have RO ?)
        no strict 'refs';
        if ( !@{ ref($self) . '::ISA' } ) {
            @{ ref($self) . '::ISA' } = "Parrot::Pmc2c::PMC::RO";
        }
    }

    foreach my $vt_method ( @{ $self->vtable->methods } ) {
        my $name = $vt_method->name;

        # Generate RO variant only if we override method constantness
        # with ":write"
        next unless $parent->{has_method}{$name}
                    && $parent->vtable_method_does_write($name)
                    && !$parent->vtable->attrs($name)->{write};

        # All parameters passed in are shims, because we're
        # creating an exception-thrower.
        my @parameters = map { "SHIM($_)" }
                         split( /\s*,\s*/, $vt_method->parameters );

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

=head1 NAME

Parrot::Pmc2c::PMC::RO - Create RO version of PMC

=head1 SYNOPSIS

    use Parrot::Pmc2c::PMC::RO;

=head1 DESCRIPTION

C<Parrot::Pmc2c::PMC::RO> is currently used in F<lib/Parrot/Pmc2c/PMC.pm> and
F<lib/Parrot/Pmc2c/PMC/default.pm>.

=head2 Functions

=over 4

=item C<new()>

Constructor.

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
