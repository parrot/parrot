# Copyright (C) 2007-2008, Parrot Foundation.
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
use Parrot::Pmc2c::Emitter;
use Parrot::Pmc2c::Method;
use Parrot::Pmc2c::MethodEmitter;
use Parrot::Pmc2c::UtilFunctions qw( dont_edit dynext_load_code c_code_coda );
use Text::Balanced 'extract_bracketed';
use Parrot::Pmc2c::PCCMETHOD;
use Parrot::Pmc2c::MULTI;
use Parrot::Pmc2c::PMC::RO;
use Parrot::Pmc2c::PMC::ParrotClass;

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
        Parrot::Pmc2c::Emitter->new( $self->filename(".h") );

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
    $c->emit("#include \"pmc_continuation.h\"\n");

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
        $h->emit("${export}VTABLE* Parrot_${name}_update_vtable(VTABLE*);\n");
        $h->emit("${export}VTABLE* Parrot_${name}_ro_update_vtable(VTABLE*);\n");
    }
    $h->emit("${export}VTABLE* Parrot_${name}_get_vtable(PARROT_INTERP);\n");
    $h->emit("${export}VTABLE* Parrot_${name}_ro_get_vtable(PARROT_INTERP);\n");


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

    # generate decls for all vtable methods in this PMC
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

    $hout .= "${export}VTABLE* Parrot_${lc_name}_update_vtable(VTABLE*);\n"
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

    $self->fixup_singleton if $self->singleton;

    #!( singleton or abstract ) everything else gets readonly version of
    # methods too.

    $self->ro( Parrot::Pmc2c::PMC::RO->new($self) )
        unless $self->abstract or $self->singleton;
}

sub fixup_singleton {
    my ($self) = @_;

    # Because singletons are shared between interpreters, we need to make
    # special effort to use the right namespace for method lookups.
    #
    # Note that this trick won't work if the singleton inherits from something
    # else (because the MRO will still be shared).

    unless ( $self->implements_vtable('get_namespace')
        or $self->super_method('get_namespace') ne 'default' )
    {
        my $body =
            Parrot::Pmc2c::Emitter->text(
            "  return INTERP->vtables[SELF->vtable->base_type]->_namespace;\n");
        $self->add_method(
            Parrot::Pmc2c::Method->new(
                {
                    name        => 'get_namespace',
                    parent_name => $self->name,
                    parameters  => '',
                    body        => $body,
                    type        => Parrot::Pmc2c::Method::VTABLE,
                    mmds        => [],
                    return_type => 'PMC*',
                    attrs       => {},
                }
            )
        );
    }
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

=item C<proto($type,$parameters)>

Determines the prototype (argument signature) for a method body
(see F<src/call_list>).

=cut

my %calltype = (
    "char"     => "c",
    "short"    => "s",
    "char"     => "c",
    "short"    => "s",
    "int"      => "i",
    "INTVAL"   => "I",
    "float"    => "f",
    "FLOATVAL" => "N",
    "double"   => "d",
    "STRING*"  => "S",
    "char*"    => "t",
    "PMC*"     => "P",
    "short*"   => "2",
    "int*"     => "3",
    "long*"    => "4",
    "void"     => "v",
    "void*"    => "b",
    "void**"   => "B",

    #"BIGNUM*" => "???" # RT#43731
);

sub proto {
    my ( $type, $parameters ) = @_;

    # reduce to a comma separated set of types
    $parameters =~ s/\w+(,|$)/,/g;
    $parameters =~ s/ //g;

    # flatten whitespace before "*" in return value
    $type =~ s/\s+\*$/\*/ if defined $type;

    # type method(interp, self, parameters...)
    my $ret = $calltype{ $type or "void" }
        . "JO"
        . join( '', map { $calltype{$_} or "?" } split( /,/, $parameters ) );

    # RT #43733
    # scan src/call_list.txt if the generated signature is available

    # RT #43735 report errors for "?"
    # --leo

    return $ret;
}

sub pre_method_gen {
}

=item C<gen_methods()>

Returns the C code for the pmc methods.

=cut

sub gen_methods {
    my ($self) = @_;

    # vtable methods
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next if $vt_method_name eq 'class_init';

        if ( $self->implements_vtable($vt_method_name) ) {
            $self->get_method($vt_method_name)->generate_body($self);
        }
    }

    # non-vtable methods
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

    if ( @$attributes ) {

        Parrot::Pmc2c::Attribute::generate_start( $attributes->[0], $self );

        foreach my $attribute ( @$attributes ) {
            $attribute->generate_declaration($self);
        }

        Parrot::Pmc2c::Attribute::generate_end( $attributes->[0], $self );

        foreach my $attribute ( @$attributes ) {
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
                             $pmcname, $functionname ];
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
    $vtbl_flag .= '|VTABLE_PMC_NEEDS_EXT'     if $self->flag('need_ext');
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
        $methlist
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
            $multi_strings .=  "        STRING *$name = "
                           . qq|CONST_STRING_GEN(interp, "$raw_string");\n|;
        }

        push @multi_list, <<END_MULTI_LIST;
        { $name_str,
          $ssig_str,
          $fsig_str,
          $ns_name,
          (funcptr_t) $func }
END_MULTI_LIST

    }

    my $multi_list = join( ",\n", @multi_list);

    my @isa = grep { $_ ne 'default' } @{ $self->parents };

    my $provides        = join( " ", keys( %{ $self->{flags}{provides} } ) );
    my $class_init_code = "";

    if ($self->has_method('class_init')) {
        $class_init_code    = $self->get_method('class_init')->body;

        $class_init_code =~ s/INTERP/interp/g;

        # fix indenting
        $class_init_code =~ s/^/        /mg;
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
    if ( @$multi_funcs ) {
        $cout .= $multi_strings . <<"EOC";

   $const multi_func_list _temp_multi_func_list[] = {
        $multi_list
    };
EOC
    }

    $cout .= <<"EOC";
    if (pass == 0) {
EOC
    for my $k ( keys %extra_vt ) {
        $cout .= "        VTABLE *vt_$k;\n";
    }

    my $flags = $self->vtable_flags;
    $cout .= <<"EOC";
        Hash   * isa_hash;
        VTABLE * vt        = Parrot_${classname}_get_vtable(interp);
        vt->base_type      = $enum_name;
        vt->flags          = $flags;
        vt->attribute_defs = attr_defs;

EOC
    for my $k ( keys %extra_vt ) {
        my $k_flags = $self->$k->vtable_flags;
        $cout .= <<"EOC";
        vt_${k}                 = Parrot_${classname}_${k}_get_vtable(interp);
        vt_${k}->base_type      = $enum_name;
        vt_${k}->flags          = $k_flags;
        vt_${k}->attribute_defs = attr_defs;

EOC
    }

    # init vtable slot
    if ( $self->is_dynamic ) {
        $cout .= <<"EOC";
        vt->base_type    = entry;
        vt->whoami       = string_make(interp, "$classname", @{[length($classname)]},
                                       "ascii", PObj_constant_FLAG|PObj_external_FLAG);
        vt->provides_str = Parrot_str_append(interp, vt->provides_str,
            string_make(interp, " $provides", @{[length($provides) + 1]}, "ascii",
            PObj_constant_FLAG|PObj_external_FLAG));

        /* set up isa hash */
        isa_hash = parrot_new_hash(interp);
        vt->isa_hash     = isa_hash;
EOC
    }
    else {
        $cout .= <<"EOC";
        vt->whoami       = CONST_STRING_GEN(interp, "$classname");
        vt->provides_str = CONST_STRING_GEN(interp, "$provides");

        /* set up isa hash */
        isa_hash         = parrot_new_hash(interp);
        vt->isa_hash     = isa_hash;
EOC
    }

    for my $k ( keys %extra_vt ) {
        $cout .= <<"EOC";
        vt_${k}->base_type    = entry;
        vt_${k}->whoami       = vt->whoami;
        vt_${k}->provides_str = vt->provides_str;
EOC
    }

    for my $k ( keys %extra_vt ) {
        $cout .= <<"EOC";
        vt->${k}_variant_vtable    = vt_${k};
        vt_${k}->${k}_variant_vtable = vt;
        vt_${k}->isa_hash          = isa_hash;
EOC
    }

    $cout .= <<"EOC";
        interp->vtables[entry] = vt;
EOC

    for my $isa ($classname, @isa) {
        $cout .= <<"EOC";
        parrot_hash_put(interp, isa_hash, (void *)(CONST_STRING_GEN(interp, "$isa")), PMCNULL);
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
            const INTVAL pmc_id = Parrot_get_HLL_id( interp, CONST_STRING_GEN(interp, "$hll")
            );
            if (pmc_id > 0) {
EOC
        foreach my $maps ( sort keys %{ $self->{flags}{maps} } ) {
            $cout .= <<"EOC";
                Parrot_register_HLL_type( interp, pmc_id, enum_class_$maps, entry);
EOC
        }
        $cout .= <<"EOC";
            }
        } /* Register */
EOC
    }

        $cout .= <<"EOC";
        {
            PMC    *       mro = pmc_new(interp, enum_class_ResizableStringArray);
            VTABLE * const vt  = interp->vtables[entry];

            vt->mro = mro;

            if (vt->ro_variant_vtable)
                vt->ro_variant_vtable->mro = mro;

EOC

    for my $isa ($classname, @isa) {
        $cout .= <<"EOC";
            VTABLE_push_string(interp, mro, CONST_STRING_GEN(interp, "$isa"));
EOC
    }

    $cout .= <<"EOC";
        }

        /* set up MRO and _namespace */
        Parrot_create_mro(interp, entry);
EOC

    # declare each nci method for this class
    foreach my $method ( @{ $self->{methods} } ) {
        next unless $method->type eq Parrot::Pmc2c::Method::NON_VTABLE;

        my $proto       = proto( $method->return_type, $method->parameters );
        my $method_name = $method->name;
        my $symbol_name =
            defined $method->symbol ? $method->symbol : $method->name;

        if ( exists $method->{PCCMETHOD} ) {
            $cout .= <<"EOC";
        register_raw_nci_method_in_ns(interp, entry,
            F2DPTR(Parrot_${classname}_${method_name}), "$symbol_name");
EOC
        }
        else {
            $cout .= <<"EOC";
        register_nci_method(interp, entry,
                F2DPTR(Parrot_${classname}_${method_name}), "$symbol_name", "$proto");
EOC
        }
        if ( $method->{attrs}{write} ) {
            $cout .= <<"EOC";
        Parrot_mark_method_writes(interp, entry, "$symbol_name");
EOC
        }
    }

    # include any class specific init code from the .pmc file
    $cout .= <<"EOC" if $class_init_code;
        /* class_init */
        {
$class_init_code
        }
EOC

    $cout .= <<"EOC";
        {
EOC


    if ( @$multi_funcs ) {
        $cout .= <<"EOC";
#define N_MULTI_LIST (sizeof(_temp_multi_func_list)/sizeof(_temp_multi_func_list[0]))
            Parrot_mmd_add_multi_list_from_c_args(interp,
                _temp_multi_func_list, N_MULTI_LIST);
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

Returns the C code for the PMC's update_vtable method.

=cut

sub update_vtable_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;

    my $vtable_updates = '';
    for my $name ( @{ $self->vtable->names } ) {
        if (exists $self->{has_method}{$name}) {
            $vtable_updates .= "    vt->$name = Parrot_${classname}_${name};\n";
        }
    }

    $cout .= <<"EOC";

PARROT_EXPORT VTABLE *Parrot_${classname}_update_vtable(VTABLE *vt) {
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

    $cout .= <<"EOC";

PARROT_EXPORT VTABLE *Parrot_${classname}_ro_update_vtable(VTABLE *vt) {
$vtable_updates
    return vt;
}

EOC

    $cout;
}

=item C<get_vtable_func()>

Returns the C code for the PMC's update_vtable method.

=cut

sub get_vtable_func {
    my ($self) = @_;

    my $cout      = "";
    my $classname = $self->name;

    my $get_vtable = '';
    foreach my $parent_name ( reverse ($self->name, @{ $self->parents }) ) {
        if ($parent_name eq 'default') {
            $get_vtable .= "    vt = Parrot_default_get_vtable(interp);\n";
        }
        else {
            $get_vtable .= "    Parrot_${parent_name}_update_vtable(vt);\n";
        }
    }

    $cout .= <<"EOC";
PARROT_EXPORT
VTABLE* Parrot_${classname}_get_vtable(PARROT_INTERP) {
    VTABLE *vt;
$get_vtable
    return vt;
}

EOC

    my $get_extra_vtable = '';
    foreach my $parent_name ( reverse ($self->name, @{ $self->parents }) ) {
        if ($parent_name eq 'default') {
            $get_extra_vtable .= "    vt = Parrot_default_ro_get_vtable(interp);\n";
        }
        else {
            $get_extra_vtable .= "    Parrot_${parent_name}_ro_update_vtable(vt);\n";
        }
    }

    $cout .= <<"EOC";
PARROT_EXPORT
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

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
