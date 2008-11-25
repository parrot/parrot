#! perl
# Copyright (C) 2001-2008, The Perl Foundation.
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

my %ret_type = (
    p => "void *",
    i => "int",
    3 => "int *",
    l => "long",
    4 => "long *",
    c => "char",
    s => "short",
    2 => "short *",
    f => "float",
    d => "double",
    t => "char *",
    v => "void",

    #      b => "void *",
    #      B => "void **",
    P => "PMC *",
    S => "STRING *",
    I => "INTVAL",
    N => "FLOATVAL",
);

my %proto_type = (
    p   => "void *",
    i   => "int",
    3   => "int *",
    l   => "long",
    4   => "long *",
    c   => "char",
    s   => "short",
    2   => "short *",
    f   => "float",
    d   => "double",
    t   => "char *",
    v   => "void",
    J   => "PARROT_INTERP",
    P   => "PMC *",
    O   => "PMC *",           # object
    S   => "STRING *",
    I   => "INTVAL",
    N   => "FLOATVAL",
    b   => "void *",
    B   => "void **",
    L   => "long *",
    T   => "char **",
    V   => "void **",
    '@' => "PMC *",           # slurpy array
);

# to fix up signatures that don't translate directly
# to C function names
my %fix_name = ( '@' => 'xAT_' );

my %other_decl = (
    p => "PMC * const final_destination = pmc_new(interp, enum_class_UnManagedStruct);",
    t => "STRING *final_destination;"

        #     b => "Buffer *final_destination =
        #     new_buffer_header(interp);\nPObj_external_SET(final_destination)",
        #     B => "Buffer *final_destination =
        #     new_buffer_header(interp);\nPObj_external_SET(final_destination)",
);

my %ret_type_decl = (
    p => "void *",
    i => "int",
    3 => "int *",
    l => "long",
    4 => "long *",
    c => "char",
    s => "short",
    2 => "short *",
    f => "float",
    d => "double",
    t => "char *",
    v => "void *",

    #      b => "void *",
    #      B => "void **",
    P => "PMC *",
    S => "STRING *",
    I => "INTVAL",
    N => "FLOATVAL",
);

my %ret_assign = (
    p => "PMC_data(final_destination) = return_data;    set_nci_P(interp, &st, final_destination);",
    i => "set_nci_I(interp, &st, return_data);",
    I => "set_nci_I(interp, &st, return_data);",
    l => "set_nci_I(interp, &st, return_data);",
    s => "set_nci_I(interp, &st, return_data);",
    c => "set_nci_I(interp, &st, return_data);",
    4 => "set_nci_I(interp, &st, *return_data);",
    3 => "set_nci_I(interp, &st, *return_data);",
    2 => "set_nci_I(interp, &st, *return_data);",
    f => "set_nci_N(interp, &st, return_data);",
    d => "set_nci_N(interp, &st, return_data);",
    N => "set_nci_N(interp, &st, return_data);",
    P => "set_nci_P(interp, &st, return_data);",
    S => "set_nci_S(interp, &st, return_data);",
    v => "",
    t =>
"final_destination = string_from_cstring(interp, return_data, 0);\n    set_nci_S(interp, &st, final_destination);",

#      b => "PObj_bufstart(final_destination) = return_data;\n    set_nci_S(interp, &st, final_destination);",
#      B => "PObj_bufstart(final_destination) = *return_data;\n    set_nci_S(interp, &st, final_destination);",
);

my %func_call_assign = (
    p => "return_data = ",
    i => "return_data = ",
    3 => "return_data = ",
    2 => "return_data = ",
    4 => "return_data = ",
    l => "return_data = ",
    c => "return_data = ",
    s => "return_data = ",
    f => "return_data = ",
    d => "return_data = ",
    b => "return_data = ",
    t => "return_data = ",
    P => "return_data = ",
    S => "return_data = ",
    I => "return_data = ",
    N => "return_data = ",

    #      B => "return_data = ",
    v => "",
);

my %sig_char = (
    p   => "P",
    i   => "I",
    3   => "P",
    2   => "P",
    4   => "P",
    l   => "I",
    c   => "I",
    s   => "I",
    f   => "N",
    d   => "N",
    b   => "S",
    t   => "S",
    P   => "P",
    O   => "P",
    S   => "S",
    I   => "I",
    N   => "N",
    B   => "S",
    v   => "v",
    V   => "P",
    J   => "",
    '@' => '@',
);

my $temp_cnt = 0;
my @put_pointer;
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
        unless exists $ret_assign{$ret};

    if ( ( $seen{"$ret$args"} ||= $. ) != $. ) {
        warn sprintf "Ignored signature '%s' on line %d (previously seen on line %d) of $ARGV",
            "$ret$args", $., $seen{"$ret$args"}
            if $opt_warndups;
        next;
    }

    my @extra_preamble;
    my @extra_postamble;
    my @temps;
    my @arg;
    my $reg_num = 0;
    my $sig     = '';

    if ( defined $args and not $args =~ m/^\s*$/ ) {
        foreach ( split m//, $args ) {
            die "Invalid argument signature char '$_' on line $. of $ARGV"
                unless exists $sig_char{$_};
            push @arg,
                make_arg( $_, $reg_num++, \$temp_cnt, \@temps, \@extra_preamble,
                \@extra_postamble );
            $sig .= $sig_char{$_};
            $_ eq 'J' && $reg_num--;
        }
    }

    print_function(
        $sig, $ret,
        $args, [@arg],
        $ret_type{$ret},         $ret_type_decl{$ret},
        $func_call_assign{$ret}, $other_decl{$ret},
        $ret_assign{$ret},       \@temps,
        \@extra_preamble, \@extra_postamble,
        \@put_pointer,    \%proto_type
    );
}

print_tail( \@put_pointer );

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
 *  Copyright (C) 2001-2007, The Perl Foundation.
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
#include "nci.str"

/* HEADERIZER HFILE: none */
/* HEADERIZER STOP */

/*
 * if the architecture can build some or all of these signatures
 * enable the define below
 * - the JITed function will be called first
 * - if it returns NULL, the hardcoded version will do the job
 */

#if defined(HAS_JIT) && defined(I386)
#  include "parrot/exec.h"
#  include "jit.h"
#  define CAN_BUILD_CALL_FRAMES
#endif

/*
 * helper funcs - get argument n
 */
static INTVAL
get_nci_I(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_int(st->val);
}

static FLOATVAL
get_nci_N(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_num(st->val);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
get_nci_S(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    /* TODO or act like below? */
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_str(st->val);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
get_nci_P(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    /*
     * exessive args are passed as NULL
     * used by e.g. MMD infix like __add
     */
    if (n < st->src.n)
        Parrot_fetch_arg_nci(interp, st);
    else
        UVal_pmc(st->val) = PMCNULL;

    return UVal_pmc(st->val);
}

#define GET_NCI_I(n) get_nci_I(interp, &st, n)
#define GET_NCI_S(n) get_nci_S(interp, &st, n)
#define GET_NCI_N(n) get_nci_N(interp, &st, n)
#define GET_NCI_P(n) get_nci_P(interp, &st, n)

/*
 * set return value
 */
static void
set_nci_I(PARROT_INTERP, ARGOUT(call_state *st), INTVAL val)
{
    Parrot_init_ret_nci(interp, st, "I");
    if (st->dest.i < st->dest.n) {
        UVal_int(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

static void
set_nci_N(PARROT_INTERP, ARGOUT(call_state *st), FLOATVAL val)
{
    Parrot_init_ret_nci(interp, st, "N");
    if (st->dest.i < st->dest.n) {
        UVal_num(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

static void
set_nci_S(PARROT_INTERP, ARGOUT(call_state *st), STRING *val)
{
    Parrot_init_ret_nci(interp, st, "S");
    if (st->dest.i < st->dest.n) {
        UVal_str(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

static void
set_nci_P(PARROT_INTERP, ARGOUT(call_state *st), PMC* val)
{
    Parrot_init_ret_nci(interp, st, "P");
    if (st->dest.i < st->dest.n) {
        UVal_pmc(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

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
    my ( $argtype, $reg_num, $temp_cnt_ref, $temps_ref, $extra_preamble_ref, $extra_postamble_ref )
        = @_;

    local $_ = $argtype;
    my $temp_num = ${$temp_cnt_ref}++;
    /p/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "PMC_data(t_$temp_num)";
    };
    /V/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "(void**)&PMC_data(t_$temp_num)";
    };
    /i/ && do {
        push @{$temps_ref},          "int t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (int)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /3/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "(int*)&PMC_int_val(t_$temp_num)";
    };
    /l/ && do {
        push @{$temps_ref},          "long t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (long)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /I/ && do {
        push @{$temps_ref},          "INTVAL t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /4/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "(long*)&PMC_int_val(t_$temp_num)";
    };
    /s/ && do {
        push @{$temps_ref},          "short t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (short)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /c/ && do {
        push @{$temps_ref},          "char t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (char)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /2/ && do {
        push @{$temps_ref},          "PMC* t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "(short*)&PMC_int_val(t_$temp_num)";
    };
    /f/ && do {
        push @{$temps_ref},          "float t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (float)GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /d/ && do {
        push @{$temps_ref},          "double t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = (double)GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /N/ && do {
        push @{$temps_ref},          "FLOATVAL t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /t/ && do {
        push @{$temps_ref}, "char *t_$temp_num;";
        push @{$extra_preamble_ref},
            "{STRING * s= GET_NCI_S($reg_num); t_$temp_num = s ? string_to_cstring(interp, s) : (char *) NULL;}";
        push @{$extra_postamble_ref}, "do { if (t_$temp_num) string_cstring_free(t_$temp_num); } while (0);";
        return "t_$temp_num";
    };
    /b/ && do {
        push @{$temps_ref},          "STRING *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_S($reg_num);";
        return "PObj_bufstart(t_$temp_num)";
    };
    /B/ && do {
        push @{$temps_ref}, "char *s_$temp_num;\n    char *t_$temp_num;\n    void** v_$temp_num = (void **) &t_$temp_num;";
        push @{$extra_preamble_ref},
            "{STRING * s= GET_NCI_S($reg_num); t_$temp_num = s ? string_to_cstring(interp, s) : (char *) NULL; s_$temp_num = t_$temp_num;}";
        push @{$extra_postamble_ref}, "do { if (s_$temp_num) string_cstring_free(s_$temp_num); } while (0);";
        return "v_$temp_num";
    };
    /J/ && do {
        return "interp";
    };
    /[OP\@]/ && do {
        push @{$temps_ref},          "PMC *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_P($reg_num);";
        return "PMC_IS_NULL(t_$temp_num) ? NULL : t_$temp_num";
    };
    /S/ && do {
        push @{$temps_ref},          "STRING *t_$temp_num;";
        push @{$extra_preamble_ref}, "t_$temp_num = GET_NCI_S($reg_num);";
        return "t_$temp_num";
    };
    return;
}

sub print_function {
    my (
        $sig,          $return,        $params,             $args,
        $ret_type,     $ret_type_decl, $return_assign,      $other_decl,
        $final_assign, $temps_ref,     $extra_preamble_ref, $extra_postamble_ref,
        $put_pointer_ref, $proto_type_ref
    ) = @_;

    $other_decl ||= "";

    $other_decl .= join( "\n    ", @{$temps_ref} );
    my $call_state      = 'call_state st;';
    my $extra_preamble  = join( "\n    ", @{$extra_preamble_ref} );
    my $extra_postamble = join( "\n    ", @{$extra_postamble_ref} );
    my $return_data =
        "$return_assign $final_assign" =~ /return_data/
        ? qq{$ret_type_decl return_data;}
        : q{};
    my $fix_params = join '', map { $fix_name{$_} || $_ } split m//, $params;

    if ( length $params ) {
        my $proto = join ', ', map { $proto_type_ref->{$_} } split( m//, $params );

        # This is an after-the-fact hack: real fix would be in make_arg
        # or somewhere at that level.  The main point being that one cannot
        # just cast pointers and expect things to magically align.  Instead
        # of trying to: (int*)&something_not_int, one HAS to use temporary
        # variables.  We detect and collect those to "temp".
        my @temp;
        for my $i ( 0 .. $#$args ) {
            if ( $args->[$i] =~ /^\((.+)\*\)&(.+)$/ ) {
                $temp[$i] = [ $1, $2 ];
                $args->[$i] = "&arg$i";
            }
        }
        my $call_params = join( ",", @$args );
        my @tempi = grep { defined $temp[$_] } 0 .. $#$args;
        my $temp_decl = join( "\n    ", map { "$temp[$_]->[0] arg$_;" } @tempi );
        ## shorts need to be properly cast
        my $temp_in = join( "\n    ",
            map { "arg$_ = " . ( 'short' eq $temp[$_]->[0] ? '(short)' : '' ) . "$temp[$_]->[1];" }
                @tempi );
        my $temp_out = join( "\n    ", map { "$temp[$_]->[1] = arg$_;" } @tempi );

        print $NCI <<"HEADER";
static void
pcf_${return}_$fix_params(PARROT_INTERP, PMC *self)
{
    typedef $ret_type (*func_t)($proto);
    func_t pointer;
    $call_state
    $return_data
    $temp_decl
    $other_decl
    Parrot_init_arg_nci(interp, &st, \"$sig\");
    $extra_preamble

    pointer =  (func_t)D2FPTR(PMC_struct_val(self));
    $temp_in
    $return_assign ($ret_type)(*pointer)($call_params);
    $temp_out
    $final_assign
    $extra_postamble
}
HEADER
    }
    else {

        # Things are more simple, when there are no params
        # call state var not needed if there are no params and a void return
        $call_state = '' if 'v' eq $return;
        print $NCI <<"HEADER";
static void
pcf_${return}_(PARROT_INTERP, PMC *self)
{
    $ret_type (*pointer)(void);
    $return_data
    $other_decl
    $call_state
    $extra_preamble

    pointer =  ($ret_type (*)(void))D2FPTR(PMC_struct_val(self));
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
        temp_pmc = pmc_new(interp, enum_class_UnManagedStruct);
        PMC_data(temp_pmc) = (void *)$value;
        VTABLE_set_pmc_keyed_str(interp, HashPointer, CONST_STRING(interp, "$key"), temp_pmc);
PUT_POINTER

    #        qq|        parrot_hash_put( interp, known_frames, const_cast("$key"), $value );|;
    return;
}

sub print_tail {
    my ($put_pointer_ref) = @_;

    my $put_pointer = join( "\n", @{$put_pointer_ref} );
    print $NCI <<"TAIL";


/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *
build_call_func(PARROT_INTERP,
#if defined(CAN_BUILD_CALL_FRAMES)
PMC *pmc_nci,
#else
SHIM(PMC *pmc_nci),
#endif
NOTNULL(STRING *signature), NOTNULL(int *jitted))
{
    char       *c;
    STRING     *ns, *message;
    STRING     *jit_key_name;
    PMC        *b;
    PMC        *iglobals;
    PMC        *temp_pmc;
    UINTVAL    signature_len;

    PMC        *HashPointer   = NULL;

    /* And in here is the platform-independent way. Which is to say
       "here there be hacks" */
    signature_len = string_length(interp, signature);
    if (0 == signature_len)
       return F2DPTR(pcf_v_);
    /* remove deprecated void argument 'v' character */
    if (2 == signature_len && 'v' == string_index(interp, signature, 1)) {
       Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG, "function signature argument character 'v' ignored");
       string_chopn_inplace(interp, signature, 1);
       signature_len = string_length(interp, signature);
    }

    iglobals = interp->iglobals;

    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");
    HashPointer = VTABLE_get_pmc_keyed_int(interp, iglobals,
            IGLOBALS_NCI_FUNCS);

    if (!HashPointer) {
        HashPointer = pmc_new(interp, enum_class_Hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS,
                HashPointer);

$put_pointer

    }

#if defined(CAN_BUILD_CALL_FRAMES)
    /* Try if JIT code can build that signature. If yes, we are done */

    jit_key_name = CONST_STRING(interp, "_XJIT_");
    jit_key_name = string_concat(interp, jit_key_name, signature, 0);
    b            = VTABLE_get_pmc_keyed_str(interp, HashPointer, jit_key_name);

    if (b && b->vtable->base_type == enum_class_ManagedStruct) {
        *jitted = 1;
        return F2DPTR(VTABLE_get_pointer(interp, b));
    }
    else {
        void * const result = Parrot_jit_build_call_func(interp, pmc_nci, signature);
        if (result) {
            *jitted = 1;
            temp_pmc = pmc_new(interp, enum_class_ManagedStruct);
            VTABLE_set_pointer(interp, temp_pmc, (void *)result);
            VTABLE_set_pmc_keyed_str(interp, HashPointer, jit_key_name, temp_pmc);
            return result;
        }
    }

#endif

    b = VTABLE_get_pmc_keyed_str(interp, HashPointer, signature);

    if (b && b->vtable->base_type == enum_class_UnManagedStruct)
        return F2DPTR(PMC_data(b));

    /*
      These three lines have been added to aid debugging. I want to be able to
      see which signature has an unknown type. I am sure someone can come up
      with a neater way to do this.
     */
    ns = string_make(interp, " is an unknown signature type", 29, "ascii", 0);
    message = string_concat(interp, signature, ns, 0);

#if defined(CAN_BUILD_CALL_FRAMES)
    ns = string_make(interp, ".\\nCAN_BUILD_CALL_FRAMES is enabled, this should not happen", 58, "ascii", 0);
#else
    ns = string_make(interp, ".\\nCAN_BUILD_CALL_FRAMES is disabled, add the signature to src/call_list.txt", 75, "ascii", 0);
#endif
    message = string_concat(interp, message, ns, 0);

    /*
     * I think there may be memory issues with this but if we get to here we are
     * aborting.
     */
    c = string_to_cstring(interp, message);
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

    pointer = PMC_struct_val(self);
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
