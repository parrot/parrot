#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 NAME

tools/build/nativecall.pl - Build up the native call routines

=head1 SYNOPSIS

    % perl tools/build/nativecall.pl src/call_list.txt

=head1 DESCRIPTION

This script creates the Native Call Interface file F<src/nci.c>. It
parses a file of function signatures of the form:

 <return-type-specifier><ws><parameter-type-specifiers>[<ws>][#<comment>]
    ...
Empty lines and lines containing only whitespace or comment are ignored.
The types specifiers are documented in F<src/call_list.txt>.

=head1 SEE ALSO

F<src/call_list.txt>.
F<docs/pdds/pdd16_native_call.pod>.

=cut

use strict;
use warnings;

my $opt_warndups = 0;

# This file will eventually be compiled
open my $NCI, '>', 'src/nci.c' or die "Can't create nci.c: $!";

print_head( \@ARGV );


my %sig_table = (
    p => {
        as_proto => "void *",
        final_dest => "PMC * final_destination = PMCNULL;",
        sig_char => "P",
        ret_assign => "if (return_data != NULL) {\n" .
             "        final_destination = Parrot_pmc_new(interp, enum_class_UnManagedStruct);\n" .
             "        VTABLE_set_pointer(interp, final_destination, return_data);\n" .
             "    }\n" .
             "    Parrot_pcc_fill_returns_from_c_args(interp, call_object, \"P\", final_destination);",
    },
    i => { as_proto => "int",    sig_char => "I", return_type => "INTVAL" },
    l => { as_proto => "long",   sig_char => "I", return_type => "INTVAL" },
    c => { as_proto => "char",   sig_char => "I", return_type => "INTVAL" },
    s => { as_proto => "short",  sig_char => "I", return_type => "INTVAL" },
    f => { as_proto => "float",  sig_char => "N", return_type => "FLOATVAL" },
    d => { as_proto => "double", sig_char => "N", return_type => "FLOATVAL" },
    t => { as_proto => "char *",
           final_dest => "STRING *final_destination;",
           ret_assign => "final_destination = Parrot_str_new(interp, return_data, 0);\n    Parrot_pcc_fill_returns_from_c_args(interp, call_object, \"S\", final_destination);",
           sig_char => "S" },
    v => { as_proto => "void",
           return_type => "void *",
           sig_char => "v",
           ret_assign => "",
           func_call_assign => ""
         },
    P => { as_proto => "PMC *", sig_char => "P" },
    O => { as_proto => "PMC *", returns => "", sig_char => "Pi" },
    J => { as_proto => "PARROT_INTERP", returns => "", sig_char => "" },
    S => { as_proto => "STRING *", sig_char => "S" },
    I => { as_proto => "INTVAL", sig_char => "I" },
    N => { as_proto => "FLOATVAL", sig_char => "N" },
    b => { as_proto => "void *", as_return => "", sig_char => "S" },
    B => { as_proto => "char **", as_return => "", sig_char => "S" },
    # These should be replaced by modifiers in the future
    2 => { as_proto => "short *",  sig_char => "P", return_type => "short",
           ret_assign => 'Parrot_pcc_fill_returns_from_c_args(interp, call_object, "I", return_data);' },
    3 => { as_proto => "int *",  sig_char => "P", return_type => "int",
           ret_assign => 'Parrot_pcc_fill_returns_from_c_args(interp, call_object, "I", return_data);' },
    4 => { as_proto => "long *",  sig_char => "P", return_type => "long",
           ret_assign => 'Parrot_pcc_fill_returns_from_c_args(interp, call_object, "I", return_data);' },
    L => { as_proto => "long *", as_return => "" },
    T => { as_proto => "char **", as_return => "" },
    V => { as_proto => "void **", as_return => "", sig_char => "P" },
    '@' => { as_proto => "PMC *", as_return => "", cname => "xAT_", sig_char => 'Ps' },
);

for (values %sig_table) {
    if (not exists $_->{as_return}) { $_->{as_return} = $_->{as_proto} }
    if (not exists $_->{return_type}) { $_->{return_type} = $_->{as_proto} }
    if (not exists $_->{ret_assign} and exists $_->{sig_char}) {
        $_->{ret_assign} = 'Parrot_pcc_fill_returns_from_c_args(interp, call_object, "'
                           . $_->{sig_char} . '", return_data);';
    }
    if (not exists $_->{func_call_assign}) {
        $_->{func_call_assign} = "return_data = "
    }
}


my $temp_cnt = 0;
my (@put_pointer, @put_pointer_nci_too, @nci_defs);
my %seen;

while (<>) {
    chomp;
    s/#.*$//;    # comment till end of line
    s/^\s*//;
    s/\s*$//;
    next unless $_;

    my ( $ret, $args ) = split m/\s+/, $_;

    $args = '' if not defined $args;

    die "Invalid return signature char '$ret' on line $. of $ARGV\n"
        unless exists $sig_table{$ret}{ret_assign};

    if ( ( $seen{"$ret$args"} ||= $. ) != $. ) {
        warn sprintf "Ignored signature '%s' on line %d (previously seen on line %d) of $ARGV",
            "$ret$args", $., $seen{"$ret$args"}
            if $opt_warndups;
        next;
    }

    my @fill_params;
    my @extra_preamble;
    my @extra_postamble;
    my @temps;
    my @arg;
    my $reg_num = 0;
    my $sig     = '';

    if ( defined $args and not $args =~ m/^\s*$/ ) {
        foreach ( split m//, $args ) {
            die "Invalid argument signature char '$_' on line $. of $ARGV"
                unless exists $sig_table{$_}{sig_char};
            push @arg,
                make_arg( $_, $reg_num++, \$temp_cnt, \@temps, \@fill_params,
                \@extra_preamble, \@extra_postamble );
            $sig .= $sig_table{$_}{sig_char};
            $_ eq 'J' && $reg_num--;
        }
    }

    my $ret_sig = $sig_table{$ret};

    if ($args =~ /[234V]/) {
        push @nci_defs, create_function(
            $sig, $ret,
            $args, [@arg],
            $ret_sig->{as_return}, $ret_sig->{return_type},
            $ret_sig->{func_call_assign}, $ret_sig->{final_dest},
            $ret_sig->{ret_assign}, \@temps,
            \@fill_params, \@extra_preamble, \@extra_postamble,
            \@put_pointer_nci_too,
        );
    }
    else {
        print {$NCI} create_function(
            $sig, $ret,
            $args, [@arg],
            $ret_sig->{as_return}, $ret_sig->{return_type},
            $ret_sig->{func_call_assign}, $ret_sig->{final_dest},
            $ret_sig->{ret_assign}, \@temps,
            \@fill_params, \@extra_preamble, \@extra_postamble,
            \@put_pointer,
        );
    }
}

print {$NCI} <<"END_FUNCS";

#endif
@nci_defs

END_FUNCS

print_tail( \@put_pointer, \@put_pointer_nci_too );

# append the C code coda
print $NCI <<"EOC";

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
EOC

close $NCI;

sub print_head {
    my ($definitions) = @_;
    print $NCI <<"HEAD";
/* ex: set ro ft=c:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically by tools/build/nativecall.pl
 * from definitions in @$definitions
 *
 * Any changes made here will be lost!
 *
 */

/* nci.c
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     \$Id\$
 *  Overview:
 *     Native Call Interface routines. The code needed to build a
 *     parrot to C call frame is in here
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */
#include "parrot/parrot.h"
#include "parrot/hash.h"
#include "parrot/oplib/ops.h"
#include "pmc/pmc_managedstruct.h"
#include "pmc/pmc_nci.h"
#include "pmc/pmc_pointer.h"
#include "pmc/pmc_callcontext.h"
#include "nci.str"

/* HEADERIZER HFILE: none */
/* HEADERIZER STOP */

/*
 * if the architecture can build some or all of these signatures
 * enable the define below
 * - the JITed function will be called first
 * - if it returns NULL, the hardcoded version will do the job
 */

#include "frame_builder.h"

#ifndef CAN_BUILD_CALL_FRAMES
/* All our static functions that call in various ways. Yes, terribly
   hackish, but that is just fine */

HEAD
    return;
}

sub make_arg {

    #
    # we have to fetch all to temps, so that the call code
    # can operate in sequence
    #
    my ( $argtype, $reg_num, $temp_cnt_ref, $temps_ref, $fill_params_ref, $extra_preamble_ref, $extra_postamble_ref )
        = @_;

    local $_ = $argtype;
    my $temp_num = ${$temp_cnt_ref}++;
    /[ilcsfdINSOP\@]/ && do {
        my $ret_type = $sig_table{$_}{return_type};
        push @{$temps_ref},       "$ret_type t_$temp_num;";
        push @{$fill_params_ref}, "&t_$temp_num";
        return "t_$temp_num";
    };
    /p/ && do {
        push @{$temps_ref},       "PMC *t_$temp_num;";
        push @{$fill_params_ref}, "&t_$temp_num";
        return "PMC_IS_NULL((PMC*)t_$temp_num)? (void*)NULL:VTABLE_get_pointer(interp, t_$temp_num)";
    };
    /V/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$temps_ref},          "void *v_$temp_num;";
        push @{$fill_params_ref},    "&t_$temp_num";
        push @{$extra_preamble_ref}, "v_$temp_num = VTABLE_get_pointer(interp, t_$temp_num);";
        push @{$extra_postamble_ref}, "VTABLE_set_pointer(interp, t_$temp_num, v_$temp_num);";
        return "&v_$temp_num";
    };
    /[234]/ && do {
        my $ret_type = $sig_table{$_}{return_type};
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$temps_ref},          "$ret_type i_$temp_num;";
        push @{$fill_params_ref},    "&t_$temp_num";
        push @{$extra_preamble_ref}, "i_$temp_num = ($ret_type) VTABLE_get_integer(interp, t_$temp_num);";
        push @{$extra_postamble_ref}, "VTABLE_set_integer_native(interp, t_$temp_num, i_$temp_num);";
        return "&i_$temp_num";
    };
    /t/ && do {
        push @{$temps_ref},          "char *t_$temp_num;";
        push @{$temps_ref},          "STRING *ts_$temp_num;";
        push @{$fill_params_ref},    "&ts_$temp_num";
        push @{$extra_preamble_ref},
            "t_$temp_num = ts_$temp_num ? Parrot_str_to_cstring(interp, ts_$temp_num) : (char *) NULL;";
        push @{$extra_postamble_ref}, "do { if (t_$temp_num) Parrot_str_free_cstring(t_$temp_num); } while (0);";
        return "t_$temp_num";
    };
    /b/ && do {
        push @{$temps_ref},          "STRING *t_$temp_num;";
        push @{$fill_params_ref},    "&t_$temp_num";
        return "Buffer_bufstart(t_$temp_num)";
    };
    /B/ && do {
        push @{$temps_ref},           "char *t_$temp_num;";
        push @{$temps_ref},           "char** v_$temp_num = &t_$temp_num;";
        push @{$temps_ref},           "STRING *ts_$temp_num;";
        push @{$fill_params_ref},     "&ts_$temp_num";
        push @{$extra_preamble_ref},
            "t_$temp_num = ts_$temp_num ? Parrot_str_to_cstring(interp, ts_$temp_num) : (char *) NULL;";
        push @{$extra_postamble_ref}, "do { if (t_$temp_num) Parrot_str_free_cstring(t_$temp_num); } while (0);";
        return "v_$temp_num";
    };
    /J/ && do {
        return "interp";
    };
    return;
}

sub create_function {
    my (
        $sig,                 $return,          $params,          $args,
        $ret_type,            $ret_type_decl,   $return_assign,   $final_dest,
        $final_assign,        $temps_ref,       $fill_params_ref, $extra_preamble_ref,
        $extra_postamble_ref, $put_pointer_ref,
    ) = @_;

    my $func = '';

    $final_dest ||= "";

    my $other_decl .= join( "\n    ", $final_dest, @{$temps_ref} );
    my $call_object_decl = <<"CALLOBJECT";
    PMC *ctx         = CURRENT_CONTEXT(interp);
    PMC *call_object = Parrot_pcc_get_signature(interp, ctx);
CALLOBJECT
    my $extra_preamble   = join( "\n    ", @{$extra_preamble_ref} );
    my $extra_postamble  = join( "\n    ", @{$extra_postamble_ref} );
    my $return_data_decl =
        "$return_assign $final_assign" =~ /return_data/
        ? qq{$ret_type_decl return_data;}
        : q{};
    my $fix_params = join '', map { $sig_table{$_}{cname} || $_ } split m//, $params;

    if ( length $params ) {
        my $proto = join ', ', map { $sig_table{$_}{as_proto} } split( m//, $params );

        my $call_params = join( ",", @$args );
        my $fill_params = join( ", ", @$fill_params_ref );
        $fill_params = ", " . $fill_params if($fill_params);

        $func = <<"HEADER";
static void
pcf_${return}_$fix_params(PARROT_INTERP, PMC *self)
{
    typedef $ret_type (*func_t)($proto);
    func_t pointer;
    void *orig_func;
    $call_object_decl
    $return_data_decl
    $other_decl
    Parrot_pcc_fill_params_from_c_args(interp, call_object, \"$sig\"$fill_params);
    $extra_preamble

    GETATTR_NCI_orig_func(interp, self, orig_func);
    pointer = (func_t)D2FPTR(orig_func);
    $return_assign ($ret_type)(*pointer)($call_params);
    $final_assign
    $extra_postamble
}
HEADER
    }
    else {

        # Things are more simple, when there are no params
        $func       = <<"HEADER";
static void
pcf_${return}_(PARROT_INTERP, PMC *self)
{
    $ret_type (*pointer)(void);
    void *orig_func;
    $return_data_decl
    $other_decl
    $call_object_decl
    $extra_preamble

    GETATTR_NCI_orig_func(interp, self, orig_func);
    pointer = ($ret_type (*)(void))D2FPTR(orig_func);
    $return_assign ($ret_type)(*pointer)();
    $final_assign
    $extra_postamble
}
HEADER
    }

    my ( $key, $value ) = (
        defined $params
        ? ( "$return$params", "pcf_${return}_$fix_params" )
        : ( "$return", "pcf_${return}" )
    );

    push @{$put_pointer_ref}, <<"PUT_POINTER";
        temp_pmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(interp, temp_pmc, (void *)$value);
        VTABLE_set_pmc_keyed_str(interp, HashPointer, CONST_STRING(interp, "$key"), temp_pmc);
PUT_POINTER

    #        qq|        parrot_hash_put( interp, known_frames, const_cast("$key"), $value );|;

    return $func;
}

sub print_tail {
    my ($put_pointer_ref, $put_pointer_nci_ref) = @_;

    my $put_pointer     = join( "\n", @{$put_pointer_ref} );
    my $put_pointer_nci = join( "\n", @{$put_pointer_nci_ref} );
    print $NCI <<"TAIL";


/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *
build_call_func(PARROT_INTERP,
#if defined(CAN_BUILD_CALL_FRAMES)
PMC *pmc_nci, NOTNULL(STRING *signature), NOTNULL(int *jitted))
#else
SHIM(PMC *pmc_nci), NOTNULL(STRING *signature), SHIM(int *jitted))
#endif
{
    char       *c;
    STRING     *ns, *message;
    PMC        *b;
    PMC        *iglobals;
    PMC        *temp_pmc;

    PMC        *HashPointer   = NULL;

    /* And in here is the platform-independent way. Which is to say
       "here there be hacks" */

    /* fixup empty signatures */
    if (STRING_IS_EMPTY(signature))
        signature = CONST_STRING(interp, "v");

    iglobals = interp->iglobals;

    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");
    HashPointer = VTABLE_get_pmc_keyed_int(interp, iglobals,
            IGLOBALS_NCI_FUNCS);

    if (!HashPointer) {
        HashPointer = Parrot_pmc_new(interp, enum_class_Hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS,
                HashPointer);
    }

#if defined(CAN_BUILD_CALL_FRAMES)
    /* Try if JIT code can build that signature. If yes, we are done */
    b            = VTABLE_get_pmc_keyed_str(interp, HashPointer, signature);

    PARROT_ASSERT(PMC_IS_NULL(b) || b->vtable);

    if ((!PMC_IS_NULL(b)) && b->vtable->base_type == enum_class_ManagedStruct) {
        *jitted = 1;
        return F2DPTR(VTABLE_get_pointer(interp, b));
    }
    else {
        int jit_size;
        void * const result = Parrot_jit_build_call_func(interp, pmc_nci, signature, &jit_size);
        if (result) {
            struct jit_buffer_private_data *priv;
            *jitted = 1;
            temp_pmc = Parrot_pmc_new(interp, enum_class_ManagedStruct);
            VTABLE_set_pointer(interp, temp_pmc, (void *)result);
#ifdef PARROT_HAS_EXEC_PROTECT
            priv = (struct jit_buffer_private_data *)
                mem_sys_allocate(sizeof(struct jit_buffer_private_data));
            priv->size = jit_size;
            SETATTR_ManagedStruct_custom_free_func(interp, temp_pmc, Parrot_jit_free_buffer);
            SETATTR_ManagedStruct_custom_free_priv(interp, temp_pmc, priv);
            SETATTR_ManagedStruct_custom_clone_func(interp, temp_pmc, Parrot_jit_clone_buffer);
            SETATTR_ManagedStruct_custom_clone_priv(interp, temp_pmc, priv);
#endif /* PARROT_HAS_EXEC_PROTECT */
            VTABLE_set_pmc_keyed_str(interp, HashPointer, signature, temp_pmc);
            return result;
        }
    }

#endif

    b = VTABLE_get_pmc_keyed_str(interp, HashPointer, signature);

    if (PMC_IS_NULL(b)) {
$put_pointer_nci
#ifndef CAN_BUILD_CALL_FRAMES
$put_pointer
#endif

        b = VTABLE_get_pmc_keyed_str(interp, HashPointer, signature);
    }

    PARROT_ASSERT(PMC_IS_NULL(b) || b->vtable);

    if ((!PMC_IS_NULL(b)) && b->vtable->base_type == enum_class_UnManagedStruct)
        return F2DPTR(VTABLE_get_pointer(interp, b));

    /*
      These three lines have been added to aid debugging. I want to be able to
      see which signature has an unknown type. I am sure someone can come up
      with a neater way to do this.
     */
    ns = string_make(interp, " is an unknown signature type", 29, "ascii", 0);
    message = Parrot_str_concat(interp, signature, ns, 0);

#if defined(CAN_BUILD_CALL_FRAMES)
    ns = string_make(interp, ".\\nCAN_BUILD_CALL_FRAMES is enabled, this should not happen", 58, "ascii", 0);
#else
    ns = string_make(interp, ".\\nCAN_BUILD_CALL_FRAMES is disabled, add the signature to src/call_list.txt", 75, "ascii", 0);
#endif
    message = Parrot_str_concat(interp, message, ns, 0);

    /*
     * I think there may be memory issues with this but if we get to here we are
     * aborting.
     */
    c = Parrot_str_to_cstring(interp, message);
    PANIC(interp, c);
}

TAIL
    return;
}

=begin example

This is the template thing

static void pcf_$funcname(PARROT_INTERP, PMC *self) {
    $ret_type (*pointer)();
    $ret_type return_data;

    return_data = ($ret_type)(*pointer)($params);
    $ret_reg  = return_data;
    REG_INT(interp, 0) = $stack_returns;
    REG_INT(interp, 1) = $int_returns;
    REG_INT(interp, 2) = $string_returns;
    REG_INT(interp, 3) = $pmc_returns;
    REG_INT(interp, 4) = $num_returns;
    return;
}

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
