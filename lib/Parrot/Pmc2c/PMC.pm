# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$
#

=head1 NAME

Parrot::Pmc2c::PMC - PMC model object

=head1 SYNOPSIS

    use Parrot::Pmc2c::PMC;

=head1 DESCRIPTION

C<Parrot::Pmc2c::PMC> is used by F<tools/build/pmc2c.pl> to generate C code from PMC files.

=head2 Functions

=over

=cut

package Parrot::Pmc2c::PMC;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw();
use Storable ();
use Parrot::PMC;
use Parrot::Pmc2c::Method;

sub create {
    my ( $this, $pmc_classname ) = @_;

    my $classname = ref($this) || $this;

    # test to see if specific subclass exists
    eval "use ${classname}::$pmc_classname";
    $classname = $@ ? "$classname" : "${classname}::${pmc_classname}";
    my $self = Parrot::Pmc2c::PMC->new;
    bless $self, $classname;
}

sub new {
    my ( $class, $self ) = @_;

    $self ||= {};
    $self   = {
        (
            attributes => [],
            methods    => [],
            super      => {},
            variant    => '',
            mixins     => [],
            %{$self}
        )
    };

    bless $self, $class;
}

sub dump {
    my ($self) = @_;

    # gen_parent_lookup_info( $self, $pmc2cMain, $pmcs );
    # gen_parent_reverse_lookup_info( $self, $pmcs, $vtable_dump );

    Storable::store( $self, $self->filename('.dump') );
}

# methods
sub add_method {
    my ( $self, $method ) = @_;
    $self->{has_method}{ $method->name } = @{ $self->{methods} };
    push @{ $self->{methods} }, $method;
}

sub has_method {
    my ( $self, $methodname ) = @_;
    return exists $self->{has_method}{$methodname};
}

sub method_index {
    my ( $self, $methodname ) = @_;
    return $self->{has_method}{$methodname};
}

sub get_method {
    my ( $self, $methodname ) = @_;
    my $method_index = $self->method_index($methodname);
    return unless defined $method_index;
    return $self->{methods}[$method_index];
}

sub inherits_method {
    my ( $self, $vt_meth ) = @_;
    return $self->super_method($vt_meth);
}

sub parent_has_method {
    my ( $self, $parent_name, $vt_meth ) = @_;
    return exists $self->{has_parent}{$parent_name}{$vt_meth};
}

# parents
sub is_parent {
    my ( $self, $parent_name ) = @_;
    return grep /$parent_name/, @{ $self->{parents} };
}

sub add_parent {
    my ( $self, $parent ) = @_;
    my $parent_name = $parent->name;
    $self->{has_parent}{$parent_name} = { %{ $parent->{has_method} } };
    push @{ $self->{parents} }, $parent_name unless $self->is_parent($parent_name);
}

sub add_mixin {
    my ( $self, $mixin_name ) = @_;
    push @{ $self->{mixins} }, $mixin_name unless grep /$mixin_name/, @{ $self->{mixins} };
}

sub add_attribute {
    my ( $self, $attribute ) = @_;
    $self->{has_attribute}{ $attribute->name } = @{ $self->{attributes} };
    push @{ $self->{attributes} }, $attribute;
}

=item C<is_dynpmc>

Determines if a given PMC type is dynamically loaded or not.

=item C<implements_vtable($method)>

True if pmc generates code for vtable method C<$method>.

=cut

sub no_init {
    my ($self) = @_;
    return $self->flag('no_init');
}

sub singleton {
    my ($self) = @_;
    return $self->flag('singleton');
}

sub abstract {
    my ($self) = @_;
    return $self->flag('abstract');
}

sub is_const {
    my ($self) = @_;
    return $self->flag('const');
}

sub is_ro {
    my ($self) = @_;
    return $self->flag('ro');
}

our $dynpmc_list = { map { $_ => 1 } ( 'default', 'delegate', 'deleg_pmc', 'scalar' ) };

sub is_dynamic {
    my ( $self, $pmcname ) = @_;
    return $self->flag('dynpmc') unless $pmcname;
    return 0 if exists $dynpmc_list->{$pmcname};
    return 0 if exists $Parrot::PMC::pmc_types{$pmcname};
    return 1;
}

sub export {
    my ( $self ) = @_;

    return $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT' : 'PARROT_EXPORT';
}

sub implements_vtable {
    my ( $self, $vt_meth ) = @_;
    return 0 unless $self->has_method($vt_meth);
    return $self->get_method( $vt_meth )->is_vtable;
}

sub unimplemented_vtable {
    my ( $self, $vt_meth ) = @_;
    return 0 if $vt_meth eq 'class_init';
    return 0 if $self->has_method($vt_meth);
    return 1;
}

sub normal_unimplemented_vtable {
    my ( $self, $vt_meth ) = @_;
    return 0 if $vt_meth eq 'class_init';
    return 0 if $self->vtable->is_mmd($vt_meth);
    return 0 if $self->has_method($vt_meth);
    return 1;
}

# getters
sub parents {
    my ($self) = @_;
    return $self->{parents};
}

sub direct_parents {
    my ($self) = @_;
    return $self->{direct_parents};
}

sub mixins {
    my ($self) = @_;
    return $self->{mixins};
}

sub methods {
    my ($self) = @_;
    return $self->{methods};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

sub filename {
    my ( $self, $type, $is_dynamic ) = @_;
    return $self->{filename} unless $type;
    return Parrot::Pmc2c::UtilFunctions::filename( $self->{filename}, $type, $is_dynamic );
}

sub get_flags {
    my ($self) = @_;
    return $self->{flags};
}

# setters
# should only be called once by the pmc parser
sub set_parents {
    my ( $self, $value ) = @_;
    $value             ||= [];
    $self->{parents}        = $value;
    for my $dp (@{ $value }) {
        push @{$self->{direct_parents}}, $dp;
    }
    return 1;
}

sub set_flag {
    my ( $self, $name, $value ) = @_;
    $self->{flags}{$name} = ( $value or 1 );
    return $self->flag($name);
}

sub set_flags {
    my ( $self, $flags ) = @_;
    while ( my ( $name, $value ) = each( %{$flags} ) ) {
        $self->set_flag( $name, $value );
    }
}

sub set_filename {
    my ( $self, $value ) = @_;
    $self->{filename} = $value if $value;
    return 1;
}

# getters/setters
sub name {
    my ( $self, $value ) = @_;
    $self->{name} = $value if $value;
    return $self->{name};
}

sub ro {
    my ( $self, $value ) = @_;
    $self->{ro} = $value if $value;
    return $self->{ro};
}

sub flag {
    my ( $self, $name ) = @_;
    return $self->{flags}{$name};
}

sub preamble {
    my ( $self, $value ) = @_;
    $self->{preamble} = $value if $value;
    return $self->{preamble};
}

sub postamble {
    my ( $self, $value ) = @_;
    $self->{postamble} = $value if $value;
    return $self->{postamble};
}

sub super_attrs {
    my ( $self, $vt_name, $value ) = @_;
    $self->{super_attrs}{$vt_name} = $value if $value;
    return $self->{super_attrs}{$vt_name};
}

# applies to vtable entries only
sub method_attrs {
    my ( $self, $methodname ) = @_;
    my $attrs;

    # try self
    if ( $self->has_method($methodname) ) {
        $attrs = $self->get_method($methodname)->attrs;
    }

    # try parent
    elsif ( $self->inherits_method($methodname) ) {
        $attrs = $self->super_attrs($methodname);
    }
    return $attrs;
}

=item C<vtable_method_does_write($method)>

Returns true if the vtable method C<$method> writes our value.

=back

=cut

sub vtable_method_does_write {
    my ( $self, $methodname ) = @_;

    my $attrs = $self->method_attrs($methodname);
    return 1 if $attrs->{write};
    return 0 if $attrs->{read};
    return $self->vtable->attrs($methodname)->{write};
}

sub vtable_method_does_multi {
    my ( $self, $methodname ) = @_;

    return 1 if ($methodname =~ m/^
                (?:add|subtract|multiply|divide|floor_divide|modulus)
                (?:_int|_float)?
              $/x);
}

sub super_method {
    my ( $self, $vt_meth, $super_pmc ) = @_;
    if ($super_pmc) {
        my $super_pmc_name;
        if ( ref($super_pmc) ) {
            my $super_method = $super_pmc->get_method($vt_meth);
            $super_pmc_name = $super_method->parent_name;

            $self->add_mixin($super_pmc_name)
                unless $self->is_parent($super_pmc_name);

            $self->super_attrs( $vt_meth, $super_method->attrs );

            $self->inherit_attrs($vt_meth) if $self->get_method($vt_meth);

            my $super_mmd_rights = $super_method->mmd_rights;
            if ( $super_mmd_rights && @{$super_mmd_rights} ) {
                $self->{super_mmd_rights}{$vt_meth}{$super_pmc_name} =
                    $super_mmd_rights;
            }
        }
        else {
            $super_pmc_name = $super_pmc;
        }
        $self->{super}{$vt_meth} = $super_pmc_name;
    }

    return $self->{super}{$vt_meth};
}

=head3 C<inherit_attrs()>

    $class = inherit_attrs($class, $meth);

B<Purpose:>  Modify $attrs to inherit attrs from $super_attrs as appropriate.

B<Arguments:>  List of two arguments:

=over 4

=item *

Method name.

=back

B<Return Values:>  Reference to hash holding the data structure being built up
within C<dump_pmc()>.

B<Comments:> Called within C<gen_super_meths()>.


=cut

sub inherit_attrs {
    my ( $self, $vt_meth ) = @_;
    my $attrs              = $self->get_method($vt_meth)->attrs;
    my $super_attrs        = $self->super_attrs($vt_meth);

    if ( ( $super_attrs->{read} or $super_attrs->{write} )
        and not( $attrs->{read} or $attrs->{write} ) )
    {
        $attrs->{read}  = $super_attrs->{read}  if exists $super_attrs->{read};
        $attrs->{write} = $super_attrs->{write} if exists $super_attrs->{write};
    }
    return $;;
}

=head2 These are auxiliary subroutines called inside the methods described above.

=head3 C<dump_is_current()>

    dump_is_current($existing);

B<Purpose:>  Determines whether the dump of a file is newer than the PMC file.
(If it's not, then the PMC file has changed and the dump has not been updated.)

B<Arguments:>  String holding filename.

B<Return Values:>  Returns true if timestamp of existing is more recent than
that of PMC.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub dump_is_current {
    my ($self, $dumpfile)   = @_;
    $dumpfile ||= $self->filename('.dump');
    return 0 unless -e $dumpfile;

    my $pmcfile  = $self->filename('.pmc');
    return 1 unless -e $pmcfile;

    return ( stat $dumpfile )[9] >= ( stat $pmcfile )[9];
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
