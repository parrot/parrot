# Copyright (C) 2004-2011, Parrot Foundation.
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
use Parrot::Pmc2c::Emitter ();
use Parrot::Pmc2c::Method ();
use Parrot::Pmc2c::UtilFunctions qw(
    dont_edit
    dynext_load_code
    c_code_coda
    gen_multi_name
);
use Text::Balanced 'extract_bracketed';
use Parrot::Pmc2c::PMC::RO ();

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
        attributes  => [],
        methods     => [],
        super       => {},
        variant     => '',
        mixins      => [],
        %{$self},
        dynpmc_list => { map { $_ => 1 }
            ( 'default', 'delegate', 'deleg_pmc', 'scalar' ) },
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
    die "FATAL ERROR: Duplicated VTABLE function: " . $method->name
        if exists $self->{has_method}{$method->name};
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

True if pmc generates code for vtable C<$method>.

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

sub is_dynamic {
    my ( $self, $pmcname ) = @_;
    return $self->flag('dynpmc') unless $pmcname;
    return 0 if exists $self->{dynpmc_list}->{$pmcname};
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

sub hdr_preamble {
    my ( $self, $value ) = @_;
    $self->{hdr_preamble} = $value if $value;
    return $self->{hdr_preamble};
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

Returns true if the vtable C<$method> writes our value.

=back

=cut

sub vtable_method_does_write {
    my ( $self, $methodname ) = @_;

    my $attrs = $self->method_attrs($methodname);
    return 1 if $attrs->{write};
    return 0 if $attrs->{read};
    return $self->vtable->attrs($methodname)->{write};
}

sub vtable_method_has_manual_wb {
    my ( $self, $methodname ) = @_;

    my $attrs = $self->method_attrs($methodname);
    return $self->vtable->attrs($methodname)->{manual_wb};
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

sub vtable {
    my ( $self, $value ) = @_;
    $self->{vtable} = $value if $value;
    return $self->{vtable};
}


sub prep_for_emit {
    my ( $this, $pmc, $vtable_dump ) = @_;

    $pmc->vtable($vtable_dump);
    $pmc->init();

    return $pmc;
}

sub generate {
    my ($self) = @_;
    my $emitter = $self->{emitter} =
        Parrot::Pmc2c::Emitter->new( $self->filename(".c") );

    $self->generate_c_file;
    $emitter->write_to_file;

    $emitter = $self->{emitter} =
        Parrot::Pmc2c::Emitter->new( $self->filename(".h", $self->is_dynamic) );

    $self->generate_h_file;
    $emitter->write_to_file;
}

=over 4

=item C<generate_c_file()>

Generates the C implementation file code for the PMC.

=cut

sub generate_c_file {
    my ($self) = @_;
    my $c      = $self->{emitter};

    $c->emit( dont_edit( $self->filename ) );
    if ($self->is_dynamic) {
        $c->emit("#define PARROT_IN_EXTENSION\n");
        $c->emit("#define CONST_STRING(i, s) Parrot_str_new_constant((i), s)\n");
        $c->emit("#define CONST_STRING_GEN(i, s) Parrot_str_new_constant((i), s)\n");
    }

    $self->gen_includes;

    # The PCC code needs Continuation-related macros from these headers.
    $c->emit("#include \"pmc_continuation.h\"\n");
    $c->emit("#include \"pmc_callcontext.h\"\n");

    $c->emit( $self->preamble );

    $c->emit( $self->hdecls );
    $c->emit( $self->{ro}->hdecls ) if ( $self->{ro} );
    $self->gen_methods;

    my $ro = $self->ro;
    if ($ro) {
        $ro->{emitter} = $self->{emitter};
        $ro->gen_methods;
    }

    $c->emit("#include \"pmc_default.h\"\n");

    $c->emit( $self->update_vtable_func );
    $c->emit( $self->get_vtable_func );
    $c->emit( $self->get_mro_func );
    $c->emit( $self->get_isa_func );
    $c->emit( $self->pmc_class_init_func );
    $c->emit( $self->init_func );
    $c->emit( $self->postamble );

    return 1;
}

=item C<generate_h_file()>

Generates the C header file code for the PMC.

=cut

sub generate_h_file {
    my ($self)  = @_;
    my $h       = $self->{emitter};
    my $uc_name = uc $self->name;
    my $name    = $self->name;

    $h->emit( dont_edit( $self->filename ) );
    $h->emit(<<"EOH");

#ifndef PARROT_PMC_${uc_name}_H_GUARD
#define PARROT_PMC_${uc_name}_H_GUARD

EOH

    $h->emit("#define PARROT_IN_EXTENSION\n") if ( $self->is_dynamic );

    # Emit header preamble
    $h->emit($self->hdr_preamble) if $self->hdr_preamble;

    # Emit available functions for work with vtables.
    my $export = 'PARROT_EXPORT ';
    if ($self->is_dynamic) {
        $export = 'PARROT_DYNEXT_EXPORT ';
        $h->emit("${export}VTABLE* Parrot_${name}_get_vtable_pointer(PARROT_INTERP);\n");
        $h->emit("${export}void    Parrot_${name}_class_init(PARROT_INTERP, int, int);\n");
    }

    if ($name ne 'default') {
        $h->emit("${export}VTABLE* Parrot_${name}_update_vtable(ARGMOD(VTABLE*));\n");
        $h->emit("${export}VTABLE* Parrot_${name}_ro_update_vtable(ARGMOD(VTABLE*));\n");
    }
    $h->emit("${export}VTABLE* Parrot_${name}_get_vtable(PARROT_INTERP);\n");
    $h->emit("${export}VTABLE* Parrot_${name}_ro_get_vtable(PARROT_INTERP);\n");
    $h->emit("${export}PMC*    Parrot_${name}_get_mro(PARROT_INTERP, ARGMOD(PMC* mro));\n");
    $h->emit("${export}Hash*   Parrot_${name}_get_isa(PARROT_INTERP, ARGMOD_NULLOK(Hash* isa));\n");


    $self->gen_attributes;
    $h->emit(<<"EOH");

#endif /* PARROT_PMC_${uc_name}_H_GUARD */

EOH
    $h->emit( c_code_coda() );
    return 1;
}

=item C<hdecls()>

Returns the C code function declarations for all the methods for inclusion
in the PMC's C header file.

=cut

sub hdecls {
    my ($self) = @_;

    my $hout;
    my $name    = $self->name;
    my $lc_name = $self->name;

    # generate decls for all vtables in this PMC
    foreach my $vt_method_name ( @{ $self->vtable->names } ) {
        if ( $self->implements_vtable($vt_method_name) ) {
            $hout .=
                $self->get_method($vt_method_name)->generate_headers($self);
        }
    }

    # generate decls for all nci methods in this PMC
    foreach my $method ( @{ $self->{methods} } ) {
        next if $method->is_vtable;
        $hout .= $method->generate_headers($self);
    }

    my $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : '';

    # class init decl
    $hout .= "${export}void    Parrot_${name}_class_init(PARROT_INTERP, int, int);\n";

    $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_EXPORT ';

    $hout .= "${export}VTABLE* Parrot_${lc_name}_update_vtable(ARGMOD(VTABLE*));\n"
        unless $name eq 'default';

    $hout .= "${export}VTABLE* Parrot_${lc_name}_get_vtable(PARROT_INTERP);\n";

    $hout .= "${export}VTABLE* Parrot_${lc_name}_get_vtable_pointer(PARROT_INTERP);\n"
        if ($self->is_dynamic);

    $self->{hdecls} .= $hout;

    return $self->{hdecls};
}

=back

=head2 Instance Methods

=over

=item C<init()>

Initializes the instance.

=cut

sub init {
    my ($self) = @_;

    #!( singleton or abstract ) everything else gets readonly version of
    # methods too.

    $self->ro( Parrot::Pmc2c::PMC::RO->new($self) )
        unless $self->abstract or $self->singleton;
}

=item C<gen_includes()>

Returns the C C<#include> for the header file of each of the PMC's superclasses.

=cut

sub gen_includes {
    my ($self) = @_;
    my $c      = $self->{emitter};

    $c->emit(<<"EOC");
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"
EOC

    $c->emit(qq{#include "pmc_fixedintegerarray.h"\n})
        if $self->flag('need_fia_header');

    foreach my $parent_name ( $self->name, @{ $self->parents } ) {
        $c->emit( '#include "pmc_' . lc $parent_name . ".h\"\n" );
    }

    foreach my $mixin_name ( @{ $self->mixins } ) {
        $c->emit( '#include "pmc_' . lc $mixin_name . ".h\"\n" );
    }

    $c->emit( '#include "' . lc $self->name . ".str\"\n" )
        unless $self->is_dynamic;
}

=item C<pre_method_gen>

Generate switch-bases VTABLE for MULTI

=cut

sub pre_method_gen {
    my ($self) = @_;

    $self->gen_switch_vtable;

    1;
}

=item C<post_method_gen>

Generate write barriers.

=cut

sub post_method_gen {
    my ($self) = @_;

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $name = $method->name;
        next if $name eq 'class_init';
        next unless $self->implements_vtable($name);
        # Skip non-updating methods
        next unless $self->vtable_method_does_write($name);

        # Skip methods with manual WBs.
        next if $self->vtable_method_has_manual_wb($name);

        $method = $self->get_method($name);

        #warn "Rewriting " . $self->name . "." . $name;
        $self->add_method(
            $method->clone({
                name => $name.'_orig',
                type => "ORIG",
            })
        );

        # Rewrite body with write barrier.
        my $body;
        my $need_result = $method->return_type && $method->return_type !~ 'void';

        $body .= $method->return_type . " result;\nresult = " if $need_result;

        # Get parameters.      strip type from param
        my $parameters = join ', ',
                         'INTERP', 'SELF', map { /\s*\*?(\S+)$/; $1 }
                         split (/,/, $method->parameters);
        $body .= $method->full_method_name($self->name) . "_orig($parameters);\n";

        $body .= "PARROT_GC_WRITE_BARRIER(interp, _self);\n";
        $body .= "return result;" if $need_result;

        $method->body(Parrot::Pmc2c::Emitter->text($body) );
    }

    # generate PCC-variants for multis
    foreach ( @{ $self->find_multi_functions } ) {
        my ($name, $fsig, $ns, $func, $method) = @$_;
        (my $new_name = $method->full_method_name($self->name) . '_pcc') =~ s/.*?_multi_/multi_/;
        my $new_method = $method->clone({
                            name        => $new_name,
                            type        => "MULTI_PCC",
                            parameters  => '',
                            return_type => 'void'
        });

        # Get parameters. Strip type from param
        my @parameters = map { /\s*\*?(\S+)$/; $1 } (split /,/, $method->parameters);

        my $need_result = $method->return_type && $method->return_type !~ 'void';

        (my $pcc_sig) = $method->pcc_signature;
        my ($pcc_args, $pcc_ret) = $pcc_sig =~ /(.*)->(.*)/;

        # Get paramete storage. Types are already provided, but we need semi-colon delimitation.
        (my $body = $method->parameters) =~ s/,/;/g;
        $body .= ";\n";
        $body .= $method->return_type . " _result;\n" if $need_result;
        $body .= "PMC *_call_obj = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));\n";

        # pcc params
        $body .= "Parrot_pcc_fill_params_from_c_args(interp, _call_obj, \"Pi$pcc_args\", &_self" .
                    (join '', map { ", &$_" } @parameters) . ");\n";

        # C call
        $body .= "_result = " if $need_result;
        my $parameters = join ', ', 'INTERP', 'SELF', @parameters;
        $body .= $method->full_method_name($self->name) . "($parameters);\n";

        # pcc return
        $body .= <<EOC if $need_result;
{
    /*
     * Use the result of Parrot_pcc_build_call_from_c_args because it is marked
     * PARROT_WARN_UNUSED_RESULT. Then explicitly don't use the result.
     * This apparently makes sense.
     */
    PMC *unused = Parrot_pcc_build_call_from_c_args(interp, _call_obj, "$pcc_ret", _result);
    UNUSED(unused);
}
EOC

        $new_method->body(Parrot::Pmc2c::Emitter->text($body));
        $self->add_method($new_method);
    }
}
=item C<gen_methods()>

Returns the C code for the pmc methods.

=cut

sub gen_methods {
    my ($self) = @_;

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next if $vt_method_name eq 'class_init';

        if ( $self->implements_vtable($vt_method_name) ) {
            $self->get_method($vt_method_name)->generate_body($self);
        }
    }

    # methods
    foreach my $method ( @{ $self->methods } ) {
        next if $method->is_vtable;
        $method->generate_body($self);
    }
}

=item C<gen_attributes()>

Returns the C code for the attribute struct definition.

=cut

sub gen_attributes {
    my ($self)     = @_;
    my $attributes = $self->attributes;

    if ( @{$attributes} ) {

        Parrot::Pmc2c::Attribute::generate_start( $attributes->[0], $self );

        foreach my $attribute ( @{$attributes} ) {
            $attribute->generate_declaration($self);
        }

        Parrot::Pmc2c::Attribute::generate_end( $attributes->[0], $self );

        foreach my $attribute ( @{$attributes} ) {
            $attribute->generate_accessor($self);
        }
    }
}

=item C<find_multi_functions()>

Returns an arrayref of MULTI function names declared in the PMC. Used to
initialize the multiple dispatch function list.

=cut

sub find_multi_functions {
    my ($self)  = @_;

    my $pmcname = $self->name;
    my ( @multi_names );

    foreach my $method ( @{ $self->methods } ) {
        next unless $method->is_multi;
        my $full_sig     = $pmcname . "," . $method->{MULTI_full_sig};
        my $functionname = 'Parrot_' . $pmcname . '_' . $method->name;
        push @multi_names, [ $method->symbol, $full_sig,
                             $pmcname, $functionname, $method ];
    }
    return ( \@multi_names );
}

sub build_full_c_vt_method_name {
    my ( $self, $vt_method_name ) = @_;

    my $implementor;
    if ( $self->implements_vtable($vt_method_name) ) {
        return $self->get_method($vt_method_name)
            ->full_method_name( $self->name . $self->{variant} );
    }
    elsif ( $self->{super}{$vt_method_name} ) {
        $implementor = $self->{super}{$vt_method_name};
    }
    else {
        $implementor = "default";
    }

    return "Parrot_${implementor}_$vt_method_name";
}

=item C<vtable_flags()>

Returns C code to produce a PMC's flags.

=cut

sub vtable_flags {
    my ($self) = @_;

    my $vtbl_flag = 0;
    $vtbl_flag .= '|VTABLE_PMC_IS_SINGLETON'  if $self->flag('singleton');
    $vtbl_flag .= '|VTABLE_IS_SHARED_FLAG'    if $self->flag('is_shared');
    $vtbl_flag .= '|VTABLE_IS_READONLY_FLAG'  if $self->flag('is_ro');
    $vtbl_flag .= '|VTABLE_HAS_READONLY_FLAG' if $self->flag('has_ro');

    return $vtbl_flag;
}

=item C<vtable_decl($name)>

Returns the C code for the declaration of a vtable temporary named
C<$name> with the functions for this class.

=cut

sub vtable_decl {
    my ( $self, $temp_struct_name, $enum_name ) = @_;

    # gen vtable flags
    my $vtbl_flag = $self->vtable_flags;

    my @vt_methods;
    foreach my $vt_method ( @{ $self->vtable->methods } ) {
        push @vt_methods,
            $self->build_full_c_vt_method_name( $vt_method->name );
    }

    my $methlist = join( ",\n        ", @vt_methods );

    my $cout = <<ENDOFCODE;
    const VTABLE $temp_struct_name = {
        NULL,       /* namespace */
        $enum_name, /* base_type */
        NULL,       /* whoami */
        $vtbl_flag, /* flags */
        NULL,       /* provides_str */
        NULL,       /* isa_hash */
        NULL,       /* class */
        NULL,       /* mro */
        NULL,       /* attribute_defs */
        NULL,       /* ro_variant_vtable */
        $methlist,
        0           /* attr size */
    };
ENDOFCODE
    return $cout;
}

=item C<pmc_class_init_func()>

Returns the C code for the PMC's class_init function as a static
function to be called from the exported class_init.

=cut

sub pmc_class_init_func {
    my ($self) = @_;
    my $class_init_code = "";

    if ($self->has_method('class_init')) {
        $class_init_code .= $self->get_method('class_init')->body;

        $class_init_code =~ s/INTERP/interp/g;

        # fix indenting
        $class_init_code =~ s/^/    /mg;
        $class_init_code = <<ENDOFCODE
static void thispmc_class_init(PARROT_INTERP, int entry)
{
$class_init_code
}
ENDOFCODE
    }
    return $class_init_code;
}

=item C<init_func()>

Returns the C code for the PMC's initialization method, or an empty
string if the PMC has a C<no_init> flag.

=cut

sub init_func {
    my ($self) = @_;
    return '' if $self->no_init;

    my $cout        = '';
    my $classname   = $self->name;
    my $enum_name   = $self->is_dynamic ? -1 : "enum_class_$classname";
    my $multi_funcs = $self->find_multi_functions();

    my @multi_list;
    my %strings_seen;
    my $multi_strings = '';
    my $cache         = {};

    my $i = 0;
    for my $multi (@$multi_funcs) {
        my ($name, $fsig, $ns, $func) = @$multi;
        my ($name_str, $fsig_str, $ns_name)     =
            map { gen_multi_name($_, $cache) } ($name, $fsig, $ns);

        for my $s ([$name, $name_str],
                   [$fsig, $fsig_str],
                   [$ns,   $ns_name ]) {
            my ($raw_string, $name) = @$s;
            next if $strings_seen{$name}++;
            $multi_strings .=  "            STRING * const $name = "
                           . qq|CONST_STRING_GEN(interp, "$raw_string");\n|;
        }

        push @multi_list, <<END_MULTI_LIST;
_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
VTABLE_set_pointer_keyed_str(interp, _temp_func, CONST_STRING(interp, "->"), (void *)${func}_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, $name_str, $fsig_str, _temp_func);
END_MULTI_LIST
        $i++;

    }

    my $multi_list_size = @multi_list;
    my $multi_list = join( "\n", @multi_list);

    my $provides        = join( " ", keys( %{ $self->{flags}{provides} } ) );
    my $class_init_code = "";

    if ($self->has_method('class_init')) {
        $class_init_code .= "        thispmc_class_init(interp, entry);\n";
    }

    my %extra_vt;
    $extra_vt{ro} = $self->{ro} if $self->{ro};

    $cout .= <<"EOC";
void
Parrot_${classname}_class_init(PARROT_INTERP, int entry, int pass)
{
    static const char attr_defs [] =
EOC
    $cout .= '        "';

    my $attributes = $self->attributes;
    foreach my $attribute ( @$attributes ) {
        my $attrtype       = $attribute->{type};
        my $attrname       = $attribute->{name};
        my $typeid = ':'; # Unhandled
        if($attrname =~ m/\(*(\w+)\)\(.*?\)/) {
            $attrname = $1;
        }
        elsif ($attrtype eq "INTVAL") {
            $typeid = 'I';
        }
        elsif ($attrtype eq "FLOATVAL") {
            $typeid = 'F';
        }
        elsif ($attrtype =~ /STRING\s*\*$/) {
            $typeid = 'S';
        }
        elsif ($attrtype =~ /PMC\s*\*$/) {
            $typeid = 'F';
        }

        $cout .= $typeid;
        $cout .= $attrname;
        $cout .= ' ';
    }

    $cout .= "\";\n";

    my $const = ( $self->{flags}{dynpmc} ) ? " " : " const ";

    my $flags = $self->vtable_flags;
    $cout .= <<"EOC";
    if (pass == 0) {
        VTABLE * const vt  = Parrot_${classname}_get_vtable(interp);
        vt->base_type      = $enum_name;
        vt->flags          = $flags;
        vt->attribute_defs = attr_defs;
        interp->vtables[entry] = vt;

EOC

    # init vtable slot
    if ( $self->is_dynamic ) {
        $cout .= <<"EOC";
        vt->base_type    = entry;
        vt->whoami       = Parrot_str_new_init(interp, "$classname", @{[length($classname)]},
                                       Parrot_ascii_encoding_ptr, PObj_constant_FLAG|PObj_external_FLAG);
        vt->provides_str = Parrot_str_concat(interp, vt->provides_str,
            Parrot_str_new_init(interp, "$provides", @{[length($provides)]}, Parrot_ascii_encoding_ptr,
            PObj_constant_FLAG|PObj_external_FLAG));

EOC
    }
    else {
        $cout .= <<"EOC";
        vt->whoami       = CONST_STRING_GEN(interp, "$classname");
        vt->provides_str = CONST_STRING_GEN(interp, "$provides");
EOC
    }

    $cout .= <<"EOC";
        vt->isa_hash     = Parrot_${classname}_get_isa(interp, NULL);
EOC

    for my $k ( keys %extra_vt ) {
        my $k_flags = $self->$k->vtable_flags;
        $cout .= <<"EOC";
        {
            VTABLE                   *vt_$k;
            vt_${k}                 = Parrot_${classname}_${k}_get_vtable(interp);
            vt_${k}->base_type      = $enum_name;
            vt_${k}->flags          = $k_flags;

            vt_${k}->attribute_defs = attr_defs;

            vt_${k}->base_type           = entry;
            vt_${k}->whoami              = vt->whoami;
            vt_${k}->provides_str        = vt->provides_str;
            vt->${k}_variant_vtable      = vt_${k};
            vt_${k}->${k}_variant_vtable = vt;
            vt_${k}->isa_hash            = vt->isa_hash;
        }

EOC
    }

    $cout .= <<"EOC";
    }
    else { /* pass */
EOC

    # To make use of the .HLL directive, register any mapping...
    if ( $self->{flags}{hll} && $self->{flags}{maps} ) {

        my $hll = $self->{flags}{hll};
        $cout .= <<"EOC";

        {
            /* Register this PMC as a HLL mapping */
            INTVAL hll_id = Parrot_hll_register_HLL( interp, CONST_STRING_GEN(interp, "$hll"));
EOC
        foreach my $maps ( sort keys %{ $self->{flags}{maps} } ) {
            $cout .= <<"EOC";
            Parrot_hll_register_HLL_type( interp, hll_id, enum_class_$maps, entry);
EOC
        }
        $cout .= <<"EOC";
        } /* Register */
EOC
    }

        $cout .= <<"EOC";
        {
            VTABLE * const vt  = interp->vtables[entry];

            vt->mro = Parrot_${classname}_get_mro(interp, PMCNULL);

            if (vt->ro_variant_vtable)
                vt->ro_variant_vtable->mro = vt->mro;
        }

        /* set up MRO and _namespace */
        Parrot_pmc_create_mro(interp, entry);
EOC

    # declare each nci method for this class
    foreach my $method ( @{ $self->{methods} } ) {
        next unless $method->type eq Parrot::Pmc2c::Method::NON_VTABLE;

        #these differ for METHODs
        my $method_name     = $method->name;
        my $symbol_name     = $method->symbol;
        my ($pcc_signature) = $method->pcc_signature;

        $cout .= <<"EOC";
        {
            STRING * const method_name = CONST_STRING_GEN(interp, "$symbol_name");
            STRING * const signature   = CONST_STRING_GEN(interp, "$pcc_signature");
            register_native_pcc_method_in_ns(interp, entry,
                F2DPTR(Parrot_${classname}_${method_name}),
                method_name, signature);
        }
EOC
        if ( $method->{attrs}{write} ) {
            $cout .= <<"EOC";
        Parrot_mark_method_writes(interp, entry, "$symbol_name");
EOC
        }
    }

    # include any class specific init code from the .pmc file
    if ($class_init_code) {
        $cout .= <<"EOC";

        /* class_init */
$class_init_code

EOC
    }

    $cout .= <<"EOC";
        {
EOC


    if ( @$multi_funcs ) {
        # Don't const the list, breaks some older C compilers
        $cout .= $multi_strings . <<"EOC";
        PMC *_temp_func;
$multi_list
EOC
    }

    $cout .= <<"EOC";
        }
    } /* pass */
} /* Parrot_${classname}_class_init */
EOC

    if ( $self->is_dynamic ) {
        $cout .= dynext_load_code( $classname, $classname => {} );
    }

    $cout;
}

=item C<update_vtable_func()>

Returns the C code for the PMC's update_vtable.

=cut

sub update_vtable_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;
    my $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_EXPORT';

    # Sets the attr_size field:
    # - If the auto_attrs flag is set, use the current data.
    # - If manual_attrs is set, set to 0.
    # - If none is set, check if this PMC has init or init_pmc vtable functions,
    # setting it to 0 in that case, and keeping the value from the
    # parent otherwise.
    my $set_attr_size = '';
    my $flag_auto_attrs = $self->{flags}{auto_attrs};
    my $flag_manual_attrs = $self->{flags}{manual_attrs};
    die 'manual_attrs and auto_attrs can not be used together'
         . 'in PMC ' . $self->name
        if ($flag_auto_attrs && $flag_manual_attrs);
    die 'PMC ' . $self->name . ' has attributes but no auto_attrs or manual_attrs'
        if (@{$self->attributes} && ! ($flag_auto_attrs || $flag_manual_attrs));

    if ( @{$self->attributes} &&  $flag_auto_attrs) {
        $set_attr_size .= "sizeof(Parrot_${classname}_attributes)";
    }
    else {
        $set_attr_size .= "0" if $flag_manual_attrs ||
                                 exists($self->{has_method}{init}) ||
                                 exists($self->{has_method}{init_pmc});
    }
    $set_attr_size =     "    vt->attr_size = " . $set_attr_size . ";\n"
        if $set_attr_size ne '';

    my $vtable_updates = '';
    for my $name ( @{ $self->vtable->names } ) {
        if (exists $self->{has_method}{$name}) {
            $vtable_updates .= "    vt->$name = Parrot_${classname}_${name};\n";
        }
    }

    $vtable_updates .= $set_attr_size;

    $cout .= <<"EOC";

$export
VTABLE *Parrot_${classname}_update_vtable(VTABLE *vt) {
$vtable_updates
    return vt;
}

EOC

    # Generate RO vtable for implemented non-updating methods
    $vtable_updates = '';
    foreach my $name ( @{ $self->vtable->names} ) {
        next unless exists $self->{has_method}{$name};
        if ($self->vtable_method_does_write($name)) {
            # If we override constantness status of vtable
            if (!$self->vtable->attrs($name)->{write}) {
                $vtable_updates .= "    vt->$name = Parrot_${classname}_ro_${name};\n";
            }
        }
        else {
            $vtable_updates .= "    vt->$name = Parrot_${classname}_${name};\n";
        }
    }

    $vtable_updates .= $set_attr_size;

    $cout .= <<"EOC";

$export
VTABLE *Parrot_${classname}_ro_update_vtable(ARGMOD(VTABLE *vt)) {
$vtable_updates
    return vt;
}

EOC

    $cout;
}

=item C<get_mro_func()>

Returns the C code for the PMC's get_mro function.

=cut

sub get_mro_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;
    my $get_mro = '';
    my @parent_names;
    my $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_EXPORT';

    if ($classname ne 'default') {
        for my $dp (reverse @{ $self->direct_parents}) {
            $get_mro .= "    mro = Parrot_${dp}_get_mro(interp, mro);\n"
            unless $dp eq 'default';
        }
    }

    $cout .= <<"EOC";
$export
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* Parrot_${classname}_get_mro(PARROT_INTERP, ARGMOD(PMC* mro)) {
    if (PMC_IS_NULL(mro)) {
        mro = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    }
$get_mro
    VTABLE_unshift_string(interp, mro,
        Parrot_str_new_init(interp, "$classname", @{[length($classname)]},
            Parrot_default_encoding_ptr, 0));
    return mro;
}

EOC

    $cout;
}

=item C<get_isa_func()>

Returns the C code for the PMC's get_isa function.

=cut

sub get_isa_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;
    my $get_isa = '';
    my @parent_names;
    my $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_EXPORT';

    if ($classname ne 'default') {
        for my $dp (reverse @{ $self->direct_parents}) {
            $get_isa .= "    isa = Parrot_${dp}_get_isa(interp, isa);\n"
            unless $dp eq 'default';
        }
    }

    $cout .= <<"EOC";
$export
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Hash* Parrot_${classname}_get_isa(PARROT_INTERP, ARGIN_NULLOK(Hash* isa)) {
EOC

    if ($get_isa ne '') {
        $cout .= $get_isa;
    }
    else {
        $cout .= <<"EOC";
    if (isa == NULL) {
        isa = Parrot_hash_new(interp);
    }
EOC
    }
    $cout .= <<"EOC";
    Parrot_hash_put(interp, isa, (void *)(CONST_STRING_GEN(interp, "$classname")), PMCNULL);
    return isa;
}

EOC

    $cout;
}


=item C<get_vtable_func()>

Returns the C code for the PMC's update_vtable.

=cut

sub get_vtable_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;
    my @other_parents = reverse @{ $self->direct_parents };
    my $first_parent = shift @other_parents;
    my $export = $self->is_dynamic ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_EXPORT';

    my $get_vtable = '';

    if ($first_parent eq 'default') {
        $get_vtable .= "    vt = Parrot_default_get_vtable(interp);\n";
    }
    else {
        $get_vtable .= "    vt = Parrot_${first_parent}_get_vtable(interp);\n";
    }

    foreach my $parent_name ( @other_parents) {
        $get_vtable .= "    Parrot_${parent_name}_update_vtable(vt);\n";
    }

    $get_vtable .= "    Parrot_${classname}_update_vtable(vt);\n";

    $cout .= <<"EOC";
$export
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
VTABLE* Parrot_${classname}_get_vtable(PARROT_INTERP) {
    VTABLE *vt;
$get_vtable
    return vt;
}

EOC

    my $get_extra_vtable = '';

    if ($first_parent eq 'default') {
        $get_extra_vtable .= "    vt = Parrot_default_ro_get_vtable(interp);\n";
    }
    else {
        $get_extra_vtable .= "    vt = Parrot_${first_parent}_ro_get_vtable(interp);\n";
    }

    foreach my $parent_name ( @other_parents ) {
        $get_extra_vtable .= "    Parrot_${parent_name}_ro_update_vtable(vt);\n";
    }

    if ($self->is_dynamic) {
        # The C could be optimized, but the case when Parrot_x_get_vtable_pointer
        # is needed is very rare.  See TT #898 for more info.
        $cout .= <<"EOC";
$export
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
VTABLE* Parrot_${classname}_get_vtable_pointer(PARROT_INTERP) {
    STRING * const type_name = Parrot_str_new_constant(interp, "${classname}");
    const INTVAL type_num  = Parrot_pmc_get_type_str(interp, type_name);
    return interp->vtables[type_num];
}

EOC
    }

    $get_extra_vtable .= "    Parrot_${classname}_ro_update_vtable(vt);\n";

    $cout .= <<"EOC";
$export
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
VTABLE* Parrot_${classname}_ro_get_vtable(PARROT_INTERP) {
    VTABLE *vt;
$get_extra_vtable
    return vt;
}

EOC

    $cout;
}

sub is_vtable_method {
    my ( $self, $vt_method_name ) = @_;
    return 1 if $self->vtable->has_method($vt_method_name);
    return 0;
}

=item C<gen_switch_vtable>

Generate switch-bases VTABLE for MULTI

=back

=cut

sub gen_switch_vtable {
    my ($self) = @_;

    # No cookies for DynPMC. At least not now.
    return 1 if $self->is_dynamic;

    # Convert list of multis to name->[(type,fsig,ns,func,method)] hash.
    my %multi_methods;
    foreach (@{$self->find_multi_functions}) {
        my ($name, $fsig, $ns, $func, $method) = @$_;
        my @sig = split /,/, $fsig;
        push @{ $multi_methods{ $name } }, [ $sig[1], $fsig, $ns, $func, $method ];
    }

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next if $vt_method_name eq 'class_init';

        next if $self->implements_vtable($vt_method_name);
        next unless exists $multi_methods{$vt_method_name};

        my $multis = $multi_methods{$vt_method_name};

        # Get parameters.      strip type from param
        my @parameters = map { s/(\s*\S+\s*\*?\s*)//; $_ } split (/,/, $method->parameters);

        # Gather "case :"
        my @cases = map { $self->generate_single_case($vt_method_name, $_, @parameters) } @$multis;
        my $cases = join "", @cases;

        my $body = <<"BODY";
    INTVAL type = VTABLE_type(INTERP, $parameters[0]);
    /* For dynpmc fallback to MMD */
    if ((type >= enum_class_core_max) || (SELF.type() >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
$cases
    }
BODY

        my $vtable = $method->clone({
                body => Parrot::Pmc2c::Emitter->text($body),
            });
        $self->add_method($vtable);
    }

    1;
}

# Generate single case for switch VTABLE
sub generate_single_case {
    my ($self, $vt_method_name, $multi, @parameters) = @_;

    my ($type, $fsig, $ns, $func, $impl) = @$multi;
    my $case;

    # Gather parameters names
    my $parameters = join ', ', @parameters;
    # ISO C forbids return with expression from void functions.
    my $return = $impl->return_type =~ /^void\s*$/
                    ? ''
                    : 'return ';

    if ($type eq 'DEFAULT' || $type eq 'PMC') {
        # For default case we have to handle return manually.
        my ($pcc_signature, $retval, $call_tail, $pcc_return)
                = gen_defaul_case_wrapping($impl);
        my $dispatch = "Parrot_mmd_multi_dispatch_from_c_args(INTERP, \"$vt_method_name\", \"$pcc_signature\", SELF, $parameters$call_tail);";

        $case = <<"CASE";
        case enum_class_core_max:
CASE
        if ($retval eq '') {
        $case .= <<"CASE";
            $dispatch
CASE
        }
        else {
        $case .= <<"CASE";
            {
                $retval
                $dispatch
                $pcc_return
            }
CASE
        }
        $case .= <<"CASE";
            break;
        default:
            $return$func(INTERP, SELF, $parameters);
            break;
CASE
    }
    else {
        $case = <<"CASE";
        case enum_class_$type:
            $return$func(INTERP, SELF, $parameters);
            break;
CASE
    }

    $case;
}

# Generate (pcc_signature, retval holder, pcc_call_tail, return statement)
# for default case in switch.
sub gen_defaul_case_wrapping {
    my $method = shift;

    local $_ = $method->return_type;
    if (/INTVAL/) {
        return (
            "PP->I",
            "INTVAL retval;",
            ', &retval',
            'return retval;',
        );
    }
    elsif (/STRING/) {
        return (
            "PP->S",
            "STRING *retval;",
            ', &retval',
            'return retval;',
        );
    }
    elsif (/PMC/) {
        return (
            'PPP->P',
            'PMC *retval = PMCNULL;',
            ", &retval",
            "return retval;",
        );
    }
    elsif (/void\s*$/) {
        return (
            'PP->',
            '',
            '',
            'return;',
        );
    }
    else {
        die "Can't handle return type `$_'!";
    }
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
