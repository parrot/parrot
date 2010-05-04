# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Pmc2c::PMCEmitter - PMC to C Code Generation

=head1 SYNOPSIS

    use Parrot::Pmc2c::PMCEmitter;

=head1 DESCRIPTION

C<Parrot::Pmc2c::PMCEmitter> is used by F<tools/build/pmc2c.pl> to generate C code from PMC files.

=head2 Functions

=over

=cut

package Parrot::Pmc2c::PMC;
use strict;
use warnings;
use Parrot::Pmc2c::Emitter ();
use Parrot::Pmc2c::Method ();
use Parrot::Pmc2c::MethodEmitter ();
use Parrot::Pmc2c::UtilFunctions qw( dont_edit dynext_load_code c_code_coda );
use Text::Balanced 'extract_bracketed';
use Parrot::Pmc2c::PCCMETHOD ();
use Parrot::Pmc2c::MULTI ();
use Parrot::Pmc2c::PMC::RO ();
use Parrot::Pmc2c::PMC::ParrotClass ();

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
    $c->emit("#include \"pmc/pmc_continuation.h\"\n");
    $c->emit("#include \"pmc/pmc_callcontext.h\"\n");

    $c->emit( $self->preamble );

    $c->emit( $self->hdecls );
    $c->emit( $self->{ro}->hdecls ) if ( $self->{ro} );
    $self->gen_methods;

    my $ro = $self->ro;
    if ($ro) {
        $ro->{emitter} = $self->{emitter};
        $ro->gen_methods;
    }

    $c->emit("#include \"pmc/pmc_default.h\"\n");

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

    # Emit available functions for work with vtables.
    my $export = 'PARROT_EXPORT ';
    if ($self->is_dynamic) {
        $export = 'PARROT_DYNEXT_EXPORT ';
        $h->emit("${export}void    Parrot_${name}_class_init(PARROT_INTERP, int, int);\n");
    }

    if ($name ne 'default') {
        $h->emit("${export}VTABLE* Parrot_${name}_update_vtable(ARGMOD(VTABLE*));\n");
        $h->emit("${export}VTABLE* Parrot_${name}_ro_update_vtable(ARGMOD(VTABLE*));\n");
    }
    $h->emit("${export}VTABLE* Parrot_${name}_get_vtable(PARROT_INTERP);\n");
    $h->emit("${export}VTABLE* Parrot_${name}_ro_get_vtable(PARROT_INTERP);\n");
    $h->emit("${export}PMC*    Parrot_${name}_get_mro(PARROT_INTERP, PMC* mro);\n");
    $h->emit("${export}Hash*   Parrot_${name}_get_isa(PARROT_INTERP, Hash* isa);\n");


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
        my $short_sig    = $method->{MULTI_short_sig};
        my $full_sig     = $pmcname . "," . $method->{MULTI_full_sig};
        my $functionname = 'Parrot_' . $pmcname . '_' . $method->name;
        push @multi_names, [ $method->symbol, $short_sig, $full_sig,
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
        next if $vt_method->is_mmd;
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

sub gen_multi_name
{
    my ($name, $cache) = @_;

    return $cache->{$name} if exists $cache->{$name};
    my $count              = keys %$cache;
    return $cache->{$name} = "mfl_$count";
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
        my ($name, $ssig, $fsig, $ns, $func) = @$multi;
        my ($name_str, $ssig_str, $fsig_str, $ns_name)     =
            map { gen_multi_name($_, $cache) } ($name, $ssig, $fsig, $ns);

        for my $s ([$name, $name_str],
                   [$ssig, $ssig_str],
                   [$fsig, $fsig_str],
                   [$ns,   $ns_name ]) {
            my ($raw_string, $name) = @$s;
            next if $strings_seen{$name}++;
            $multi_strings .=  "            STRING * const $name = "
                           . qq|CONST_STRING_GEN(interp, "$raw_string");\n|;
        }

        push @multi_list, <<END_MULTI_LIST;
            _temp_multi_func_list[$i].multi_name = $name_str;
            _temp_multi_func_list[$i].short_sig = $ssig_str;
            _temp_multi_func_list[$i].full_sig = $fsig_str;
            _temp_multi_func_list[$i].ns_name = $ns_name;
            _temp_multi_func_list[$i].func_ptr = (funcptr_t) $func;
END_MULTI_LIST
        $i++;

    }

    my $multi_list_size = @multi_list;
    my $multi_list = join( "\n", @multi_list);

    my @isa = grep { $_ ne 'default' } @{ $self->parents };

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
        vt->whoami       = string_make(interp, "$classname", @{[length($classname)]},
                                       "ascii", PObj_constant_FLAG|PObj_external_FLAG);
        vt->provides_str = Parrot_str_concat(interp, vt->provides_str,
            string_make(interp, "$provides", @{[length($provides)]}, "ascii",
            PObj_constant_FLAG|PObj_external_FLAG));

EOC
    }
    else {
        $cout .= <<"EOC";
        vt->whoami       = CONST_STRING_GEN(interp, "$classname");
        vt->provides_str = CONST_STRING_GEN(interp, "$provides");
EOC
    }

    if (@isa) {
        unshift @isa, $classname;
        $cout .= <<"EOC";
        vt->isa_hash     = Parrot_${classname}_get_isa(interp, NULL);
EOC
    }
    else {
        $cout .= <<"EOC";
        vt->isa_hash     = NULL;
EOC
    }

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
            const INTVAL hll_id = Parrot_get_HLL_id( interp, CONST_STRING_GEN(interp, "$hll"));
            if (hll_id > 0) {
EOC
        foreach my $maps ( sort keys %{ $self->{flags}{maps} } ) {
            $cout .= <<"EOC";
                Parrot_register_HLL_type( interp, hll_id, enum_class_$maps, entry);
EOC
        }
        $cout .= <<"EOC";
            }
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
        my $method_name = $method->name;
        my $symbol_name = $method->symbol;

        $cout .= <<"EOC";
        register_raw_nci_method_in_ns(interp, entry, F2DPTR(Parrot_${classname}_${method_name}), CONST_STRING_GEN(interp, "$symbol_name"));
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

            multi_func_list _temp_multi_func_list[$multi_list_size];
$multi_list
            Parrot_mmd_add_multi_list_from_c_args(interp,
                _temp_multi_func_list, $multi_list_size);
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
PMC* Parrot_${classname}_get_mro(PARROT_INTERP, PMC* mro) {
    if (PMC_IS_NULL(mro)) {
        mro = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    }
$get_mro
    VTABLE_unshift_string(interp, mro,
        string_make(interp, "$classname", @{[length($classname)]}, NULL, 0));
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
Hash* Parrot_${classname}_get_isa(PARROT_INTERP, Hash* isa) {
    if (isa == NULL) {
        isa = parrot_new_hash(interp);
    }
$get_isa
    parrot_hash_put(interp, isa, (void *)(CONST_STRING_GEN(interp, "$classname")), PMCNULL);
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

sub vtable {
    my ( $self, $value ) = @_;
    $self->{vtable} = $value if $value;
    return $self->{vtable};
}

=item C<gen_switch_vtable>

Generate switch-bases VTABLE for MULTI

=cut

sub gen_switch_vtable {
    my ($self) = @_;

    # No cookies for DynPMC. At least not now.
    return 1 if $self->is_dynamic;

    # Convert list of multis to name->[(type,,ssig,fsig,ns,func)] hash.
    my %multi_methods;
    foreach (@{$self->find_multi_functions}) {
        my ($name, $ssig, $fsig, $ns, $func, $method) = @$_;
        my @sig = split /,/, $fsig;
        push @{ $multi_methods{ $name } }, [ $sig[1], $ssig, $fsig, $ns, $func, $method ];
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
        my $cases = join "\n", @cases;

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

    my ($type, $ssig, $fsig, $ns, $func, $impl) = @$multi;
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
                = $self->gen_defaul_case_wrapping($ssig, @parameters);

        $case = <<"CASE";
        default:
            if (type < enum_class_core_max)
                $return$func(INTERP, SELF, $parameters);
            else {
                $retval
                Parrot_mmd_multi_dispatch_from_c_args(INTERP, "$vt_method_name", "$pcc_signature", SELF, $parameters$call_tail);
                $pcc_return
            }
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
    my ($self, $ssig, @parameters) = @_;

    my $letter = substr($ssig, 0, 1);
    if ($letter eq 'I') {
        return (
            "PP->" . $letter,
            "INTVAL retval;",
            ', &retval',
            'return retval;',
        );
    }
    elsif ($letter eq 'S') {
        return (
            "PP->" . $letter,
            "STRING *retval;",
            ', &retval',
            'return retval;',
        );
    }
    elsif ($letter eq 'P') {
        return (
            'PPP->P',
            'PMC *retval = PMCNULL;',
            ", &retval",
            "return retval;",
        );
    }
    elsif ($letter eq 'v') {
        return (
            'PP->',
            '',
            '',
            'return;',
        );
    }
    else {
        die "Can't handle signature $ssig!";
    }
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
