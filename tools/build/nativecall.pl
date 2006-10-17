#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
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
open my $NCI, ">", "src/nci.c" or die "Can't open nci.c!";

print_head(\@ARGV);

my %ret_type =
     ( p => "void *",
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

my %proto_type =
     ( p => "void *",
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
       J => "Interp *",
       P => "PMC *",
       O => "PMC *",      # object
       S => "STRING *",
       I => "INTVAL",
       N => "FLOATVAL",
       b => "void *",
       B => "void **",
       L => "long *",
       T => "char **",
       '@'=>"PMC *", # slurpy array
     );

# to fix up signatures that don't translate directly
# to C function names
my %fix_name =
    ( '@' => 'xAT_' );

my %other_decl = 
  (p => 
   "PMC *final_destination = pmc_new(interpreter, enum_class_UnManagedStruct);",
   t => "STRING *final_destination;"
   #     b => "Buffer *final_destination =
   #     new_buffer_header(interpreter);\nPObj_external_SET(final_destination)",
   #     B => "Buffer *final_destination =
   #     new_buffer_header(interpreter);\nPObj_external_SET(final_destination)",
  );

my %ret_type_decl =
     ( p => "void *",
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

my %ret_assign =
     ( p => "PMC_data(final_destination) = return_data;    set_nci_P(interpreter, &st, final_destination);",
       i => "set_nci_I(interpreter, &st, return_data);",
       I => "set_nci_I(interpreter, &st, return_data);",
       l => "set_nci_I(interpreter, &st, return_data);",
       s => "set_nci_I(interpreter, &st, return_data);",
       c => "set_nci_I(interpreter, &st, return_data);",
       4 => "set_nci_I(interpreter, &st, *return_data);",
       3 => "set_nci_I(interpreter, &st, *return_data);",
       2 => "set_nci_I(interpreter, &st, *return_data);",
       f => "set_nci_N(interpreter, &st, return_data);",
       d => "set_nci_N(interpreter, &st, return_data);",
       N => "set_nci_N(interpreter, &st, return_data);",
       P => "set_nci_P(interpreter, &st, return_data);",
       S => "set_nci_S(interpreter, &st, return_data);",
       v => "",
       t => "final_destination = string_from_cstring(interpreter, return_data, 0);\n    set_nci_S(interpreter, &st, final_destination);",
#      b => "PObj_bufstart(final_destination) = return_data;\n    set_nci_S(interpreter, &st, final_destination);",
#      B => "PObj_bufstart(final_destination) = *return_data;\n    set_nci_S(interpreter, &st, final_destination);",
     );

my %func_call_assign =
     ( p => "return_data = ",
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

my %sig_char =
     ( p => "P",
       i => "I",
       3 => "P",
       2 => "P",
       4 => "P",
       l => "I",
       c => "I",
       s => "I",
       f => "N",
       d => "N",
       b => "S",
       t => "S",
       P => "P",
       O => "P",
       S => "S",
       I => "I",
       N => "N",
       B => "S",
       v => "v",
       J => "",
       '@'=>'@',
     );

my $temp_cnt = 0;
my @put_pointer;
my %seen;

while (<>) {
    chomp;
    s/#.*$//;             # comment till end of line
    s/^\s*//;
    s/\s*$//;
    next unless $_;

    my ($ret, $args) = split /\s+/, $_;

    $args = '' if not defined $args;
    $args =~ s/^v$//
      and warn "Removed deprecated 'v' argument signature on line $. of $ARGV";

    die "Invalid return signature char '$ret' on line $. of $ARGV"
      unless exists $ret_assign{$ret};

    if (($seen{"$ret$args"} ||= $.) != $.) {
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
    my $sig = '';

    if (defined $args and not $args =~ m/^\s*$/ ) {
        foreach (split //, $args) {
            die "Invalid argument signature char '$_' on line $. of $ARGV"
                unless exists $sig_char{$_};
            push @arg, make_arg($_, $reg_num++, \$temp_cnt, \@temps,
                                \@extra_preamble, \@extra_postamble);
            $sig .= $sig_char{$_};
            $_ eq 'J' && $reg_num--;
        }
    }

    print_function($sig, $ret, $args, [@arg], $ret_type{$ret},
                 $ret_type_decl{$ret}, $func_call_assign{$ret},
                 $other_decl{$ret}, $ret_assign{$ret},
                 \@temps,
                 \@extra_preamble, \@extra_postamble,
                 \@put_pointer,
                 \%proto_type);
}

print_tail( \@put_pointer );

# append the C code coda
print $NCI << "EOC";

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
    print $NCI << "HEAD";
/* ex: set ro:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically by tools/build/nativecall.pl
 * from definitions in @$definitions
 *
 * Any changes made here will be lost!
 *
 */

/* nci.c
 *  Copyright (C) 2001-2005, The Perl Foundation.
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

/*
 * if the architecture can build some or all of these signatures
 * enable the define below
 * - the JITed function will be called first
 * - if it returns NULL, the hardcoded version will do the job
 */

#if defined(HAS_JIT) && defined(I386)
#  include "parrot/exec.h"
#  include "jit.h"
/*#  define CAN_BUILD_CALL_FRAMES*/
#endif

/*
 * helper funcs - get argument n
 */
static INTVAL
get_nci_I(Interp *interpreter, struct call_state *st, int n)
{
    assert(n < st->src.n);
    Parrot_fetch_arg_nci(interpreter, st);

    return UVal_int(st->val);
}

static FLOATVAL
get_nci_N(Interp *interpreter, struct call_state *st, int n)
{
    assert(n < st->src.n);
    Parrot_fetch_arg_nci(interpreter, st);

    return UVal_num(st->val);
}

static STRING*
get_nci_S(Interp *interpreter, struct call_state *st, int n)
{
    assert(n < st->src.n);
    Parrot_fetch_arg_nci(interpreter, st);

    return UVal_str(st->val);
}

static PMC*
get_nci_P(Interp *interpreter, struct call_state *st, int n)
{
    /*
     * exessive args are passed as NULL
     * used by e.g. MMD infix like __add
     */
    if (n < st->src.n)
        Parrot_fetch_arg_nci(interpreter, st);
    else
        UVal_pmc(st->val) = NULL;

    return UVal_pmc(st->val);
}

#define GET_NCI_I(n) get_nci_I(interpreter, &st, n)
#define GET_NCI_S(n) get_nci_S(interpreter, &st, n)
#define GET_NCI_N(n) get_nci_N(interpreter, &st, n)
#define GET_NCI_P(n) get_nci_P(interpreter, &st, n)

/*
 * set return value
 */
static void
set_nci_I(Interp *interpreter, struct call_state *st, INTVAL val)
{
    Parrot_init_ret_nci(interpreter, st, "I");
    UVal_int(st->val) = val;
    Parrot_convert_arg(interpreter, st);
    Parrot_store_arg(interpreter, st);
}

static void
set_nci_N(Interp *interpreter, struct call_state *st, FLOATVAL val)
{
    Parrot_init_ret_nci(interpreter, st, "N");
    UVal_num(st->val) = val;
    Parrot_convert_arg(interpreter, st);
    Parrot_store_arg(interpreter, st);
}

static void
set_nci_S(Interp *interpreter, struct call_state *st, STRING *val)
{
    Parrot_init_ret_nci(interpreter, st, "S");
    UVal_str(st->val) = val;
    Parrot_convert_arg(interpreter, st);
    Parrot_store_arg(interpreter, st);
}

static void
set_nci_P(Interp *interpreter, struct call_state *st, PMC* val)
{
    Parrot_init_ret_nci(interpreter, st, "P");
    UVal_pmc(st->val) = val;
    Parrot_convert_arg(interpreter, st);
    Parrot_store_arg(interpreter, st);
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
    my ($argtype, $reg_num, $temp_cnt_ref, $temps_ref,
        $extra_preamble_ref, $extra_postamble_ref) = @_;

    local $_ = $argtype;
    my $temp_num = ${$temp_cnt_ref}++;
    /p/ && do {
        push @{$temps_ref}, "PMC *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_P($reg_num);";
        return "PMC_data(t_$temp_num)";
    };
    /i/ && do {
        push @{$temps_ref}, "int t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (int)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /3/ && do {
        push @{$temps_ref}, "PMC *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_P($reg_num);";
        return "(int*)&PMC_int_val(t_$temp_num)";
    };
    /l/ && do {
        push @{$temps_ref}, "long t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (long)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /I/ && do {
        push @{$temps_ref}, "INTVAL t_$temp_num;";
        push @{$extra_preamble_ref},
             "t_$temp_num = GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /4/ && do {
        push @{$temps_ref}, "PMC *t_$temp_num;";
        push @{$extra_preamble_ref},
             "t_$temp_num = GET_NCI_P($reg_num);";
        return "(long*)&PMC_int_val(t_$temp_num)";
    };
    /s/ && do {
        push @{$temps_ref}, "short t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (short)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /c/ && do {
        push @{$temps_ref}, "char t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (char)GET_NCI_I($reg_num);";
        return "t_$temp_num";
    };
    /2/ && do {
        push @{$temps_ref}, "PMC* t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_P($reg_num);";
        return "(short*)&PMC_int_val(t_$temp_num)";
    };
    /f/ && do {
        push @{$temps_ref}, "float t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (float)GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /d/ && do {
        push @{$temps_ref}, "double t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = (double)GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /N/ && do {
        push @{$temps_ref}, "FLOATVAL t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_N($reg_num);";
        return "t_$temp_num";
    };
    /t/ && do {
        push @{$temps_ref}, "char *t_$temp_num;";
        push @{$extra_preamble_ref},
        "t_$temp_num = string_to_cstring(interpreter, GET_NCI_S($reg_num));";
        push @{$extra_postamble_ref}, "string_cstring_free(t_$temp_num);";
        return "t_$temp_num";
    };
    /b/ && do {
        push @{$temps_ref}, "STRING *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_S($reg_num);";
        return "PObj_bufstart(t_$temp_num)";
    };
    /B/ && do {
        push @{$temps_ref}, "STRING *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_S($reg_num);";
        return "&PObj_bufstart(t_$temp_num)";
    };
    /J/ && do {
        return "interpreter";
    };
    /[OP\@]/ && do {
        push @{$temps_ref}, "PMC *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_P($reg_num);";
        return "t_$temp_num == PMCNULL ? NULL : t_$temp_num";
    };
    /S/ && do {
        push @{$temps_ref}, "STRING *t_$temp_num;";
        push @{$extra_preamble_ref},
            "t_$temp_num = GET_NCI_S($reg_num);";
        return "t_$temp_num";
    };
    return;
}

sub print_function {
    my ($sig, $return, $params, $args, $ret_type, $ret_type_decl,
        $return_assign, $other_decl, $final_assign,
        $temps_ref,
        $extra_preamble_ref, $extra_postamble_ref,
        $put_pointer_ref,
        $proto_type_ref) = @_;

    $other_decl ||= "";

    $other_decl .= join("\n    ", @{$temps_ref});
    my $call_state = 'struct call_state st;';
    my $extra_preamble  = join("\n    ", @{$extra_preamble_ref});
    my $extra_postamble = join("\n    ", @{$extra_postamble_ref});
    my $return_data     = "$return_assign $final_assign" =~ /return_data/ ?
                              qq{$ret_type_decl return_data;} :
                              q{};
    my $fix_params = join '', map { $fix_name{$_} || $_ } split //, $params;

    if (length $params) {
        my $proto = join ', ', map { $proto_type_ref->{$_} } split( '', $params );
        # This is an after-the-fact hack: real fix would be in make_arg
        # or somewhere at that level.  The main point being that one cannot
        # just cast pointers and expect things to magically align.  Instead
        # of trying to: (int*)&something_not_int, one HAS to use temporary
        # variables.  We detect and collect those to "temp".
        my @temp;
        for my $i (0..$#$args) {
            if ($args->[$i] =~ /^\((.+)\*\)&(.+)$/) {
                $temp[$i] = [ $1, $2 ];
                $args->[$i] = "&arg$i";
            }
        }
        my $call_params = join(",", @$args);
        my @tempi = grep { defined $temp[$_] } 0..$#$args;
        my $temp_decl = join("\n    ", map { "$temp[$_]->[0] arg$_;"} @tempi);
        ## shorts need to be properly cast
        my $temp_in   = join("\n    ", map {
                                "arg$_ = "
                                . ( 'short' eq $temp[$_]->[0] ? '(short)' : '' )
                                . "$temp[$_]->[1];"
                        } @tempi);
        my $temp_out  = join("\n    ", map { "$temp[$_]->[1] = arg$_;"} @tempi);

        print $NCI << "HEADER";
static void
pcf_${return}_$fix_params(Interp *interpreter, PMC *self)
{
    typedef $ret_type (*func_t)($proto);
    func_t pointer;
    $call_state
    $return_data
    $temp_decl
    $other_decl
    Parrot_init_arg_nci(interpreter, &st, \"$sig\");
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
        print $NCI << "HEADER";
static void
pcf_${return}_(Interp *interpreter, PMC *self)
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

    my ($key, $value) = (defined $params ?
        ( "$return$params", "pcf_${return}_$fix_params" ) :
        ( "$return", "pcf_${return}" ));

    push @{$put_pointer_ref}, << "PUT_POINTER";
        temp_pmc = pmc_new(interpreter, enum_class_UnManagedStruct);
        PMC_data(temp_pmc) = (void*)$value;
        VTABLE_set_pmc_keyed_str(interpreter, HashPointer, string_from_cstring(interpreter, "$key", 0), temp_pmc);
PUT_POINTER
#        qq|        parrot_hash_put( interpreter, known_frames, const_cast("$key"), $value );|;
    return;
}


sub print_tail {
    my ($put_pointer_ref) = @_;

    my $put_pointer = join("\n", @{$put_pointer_ref});
    print $NCI << "TAIL";


/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *
build_call_func(Interp *interpreter, PMC *pmc_nci,
                STRING *signature)
{
    char       *c;
    STRING     *ns, *message;
    PMC        *b;
    PMC        *iglobals;
    PMC        *temp_pmc;
    UINTVAL    signature_len;

    void       *result        = NULL;
    Hash       *known_frames  = NULL;
    PMC        *HashPointer   = NULL;

#if defined(CAN_BUILD_CALL_FRAMES)

    /* Try if JIT code can build that signature,
     * if yes, we are done
     */

     result = Parrot_jit_build_call_func(interpreter, pmc_nci, signature);

#endif
    if (result)
        return result;

    /* And in here is the platform-independent way. Which is to say
       "here there be hacks" */
    UNUSED(pmc_nci);
    signature_len = string_length(interpreter, signature);
    if (0 == signature_len) return F2DPTR(pcf_v_);
    /* remove deprecated void argument 'v' character */
    if (2 == signature_len && 'v' == string_index(interpreter, signature, 1)) {
       Parrot_warn(interpreter, PARROT_WARNINGS_ALL_FLAG, "function signature argument character 'v' ignored");
       signature = string_chopn(interpreter, signature, 1, 1);
       signature_len = string_length(interpreter, signature);
    }

    iglobals = interpreter->iglobals;

    if (PMC_IS_NULL(iglobals))
        PANIC("iglobals isnÄt created yet");
    HashPointer = VTABLE_get_pmc_keyed_int(interpreter, iglobals,
            IGLOBALS_NCI_FUNCS);

    if (!HashPointer) {
        HashPointer = pmc_new(interpreter, enum_class_Hash);
        VTABLE_set_pmc_keyed_int(interpreter, iglobals, IGLOBALS_NCI_FUNCS,
                HashPointer);

$put_pointer

    }

    b = VTABLE_get_pmc_keyed_str(interpreter, HashPointer, signature);

    if (b && b->vtable->base_type == enum_class_UnManagedStruct)
        return F2DPTR(PMC_data(b));

    /*
      These three lines have been added to aid debugging. I want to be able to
      see which signature has an unknown type. I am sure someone can come up
      with a neater way to do this.
     */
    ns = string_make(interpreter, " is an unknown signature type", 29, "ascii", 0);
    message = string_concat(interpreter, signature, ns, 0);

#if defined(CAN_BUILD_CALL_FRAMES)
    ns = string_make(interpreter, ".\\nCAN_BUILD_CALL_FRAMES is enabled, this should not happen", 58, "ascii", 0);
#else
    ns = string_make(interpreter, ".\\nCAN_BUILD_CALL_FRAMES is disabled, add the signature to src/call_list.txt", 75, "ascii", 0);
#endif
    message = string_concat(interpreter, message, ns, 0);

    /*
     * I think there may be memory issues with this but if we get to here we are
     * aborting.
     */
    c = string_to_cstring(interpreter, message);
    PANIC(c);
    return NULL;
}

TAIL
    return;
}

=begin example

This is the template thing

static void pcf_$funcname(Interp *interpreter, PMC *self) {
    $ret_type (*pointer)();
    $ret_type return_data;

    pointer = PMC_struct_val(self);
    return_data = ($ret_type)(*pointer)($params);
    $ret_reg  = return_data;
    REG_INT(0) = $stack_returns;
    REG_INT(1) = $int_returns;
    REG_INT(2) = $string_returns;
    REG_INT(3) = $pmc_returns;
    REG_INT(4) = $num_returns;
    return;
}

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
