/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/nci/signatures.c - Native Call Interface signature processing routines

=head1 DESCRIPTION

This file implements functionality for parsing NCI signatures and generating PCC
signatures.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/nci.h"
#include "signatures.str"

/* HEADERIZER HFILE: include/parrot/nci.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static char ncidt_to_pcc(PARROT_INTERP, PARROT_DATA_TYPE t)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_ncidt_to_pcc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<PMC * Parrot_nci_parse_signature(PARROT_INTERP, STRING *sig_str)>

Parse a signature string to a NCI signature PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
PMC *
Parrot_nci_parse_signature(PARROT_INTERP, ARGIN(STRING *sig_str))
{
    ASSERT_ARGS(Parrot_nci_parse_signature)

    const size_t  sig_length = Parrot_str_byte_length(interp, sig_str);
    PMC          *sig_pmc    = Parrot_pmc_new_init_int(interp, enum_class_FixedIntegerArray,
                                                                sig_length);
    size_t i;

    if (!sig_length) {
        sig_pmc = Parrot_pmc_new_init_int(interp, enum_class_FixedIntegerArray, 1);
        VTABLE_set_integer_keyed_int(interp, sig_pmc, 0, enum_type_void);
        return sig_pmc;
    }

    for (i = 0; i < sig_length; ++i) {
        const INTVAL c = Parrot_str_indexed(interp, sig_str, i);
        PARROT_DATA_TYPE e;

        PARROT_ASSERT(c == (char)c);

        switch ((char)c) {
          case 'f':
            e = enum_type_float;
            break;
          case 'd':
            e = enum_type_double;
            break;
          case 'N':
            e = enum_type_FLOATVAL;
            break;

          case 'c':   /* char */
            e = enum_type_char;
            break;
          case 's':   /* short */
            e = enum_type_short;
            break;
          case 'i':   /* int */
            e = enum_type_int;
            break;
          case 'l':   /* long */
            e = enum_type_long;
            break;
          case 'I':   /* INTVAL */
            e = enum_type_INTVAL;
            break;

          case 'S':
            e = enum_type_STRING;
            break;

          case 'p':   /* push pmc->data */
            e = enum_type_ptr;
            break;
          case 'O':   /* PMC invocant */
          case 'P':   /* push PMC * */
            e = enum_type_PMC;
            break;

          case 'v':
            e = enum_type_void;
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_JIT_ERROR,
                    "Unknown param Signature %c\n", (char)c);
            break;
        }

        VTABLE_set_integer_keyed_int(interp, sig_pmc, i, e);
    }

    return sig_pmc;
}

/*

=item C<static char ncidt_to_pcc(PARROT_INTERP, PARROT_DATA_TYPE t)>

Lookup the appropriate PCC signature item to use for a given NCI type.

=cut

*/

static char
ncidt_to_pcc(PARROT_INTERP, PARROT_DATA_TYPE t)
{
    ASSERT_ARGS(ncidt_to_pcc)

    switch (t) {
      case enum_type_float:
      case enum_type_double:
      case enum_type_FLOATVAL:
        return 'N';

      case enum_type_char:
      case enum_type_short:
      case enum_type_int:
      case enum_type_long:
      case enum_type_INTVAL:
        return 'I';

      case enum_type_STRING:
        return 'S';

      case enum_type_ptr:
      case enum_type_PMC:
        return 'P';

      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 0, "Unhandled NCI type: `%Ss'",
                Parrot_dt_get_datatype_name(interp, t));
    }
}


/*

=item C<void Parrot_nci_sig_to_pcc(PARROT_INTERP, PMC *sig_pmc, STRING
**params_sig, STRING **ret_sig)>

Determine the PCC signatures for a given NCI signature PMC.

=cut

*/

void
Parrot_nci_sig_to_pcc(PARROT_INTERP, ARGIN(PMC *sig_pmc), ARGOUT(STRING **params_sig),
    ARGOUT(STRING **ret_sig))
{
    ASSERT_ARGS(Parrot_nci_sig_to_pcc)

    const size_t sig_len = VTABLE_elements(interp, sig_pmc);

    const size_t argc = sig_len - 1;
    size_t retc = 0;

    /* avoid malloc churn on common signatures */
    char  static_buf[16];
    char *sig_buf;

    size_t i, j;
    PARROT_DATA_TYPE t;

    /* process NCI arguments */
    sig_buf = argc < sizeof static_buf ?  static_buf : (char *)mem_sys_allocate(argc);

    for (i = 0; i < argc; i++) {
        t          = (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, sig_pmc, i + 1);
        sig_buf[i] = ncidt_to_pcc(interp, (PARROT_DATA_TYPE)(t & ~enum_type_ref_flag));
        if (t & enum_type_ref_flag)
            retc++;
    }

    *params_sig = argc ? Parrot_str_new(interp, sig_buf, argc) : CONST_STRING(interp, "");
    if (sig_buf != static_buf)
        mem_sys_free(sig_buf);

    if (enum_type_void !=
        (t = (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, sig_pmc, 0)))
        retc++;

    /* process NCI returns */
    sig_buf = retc < sizeof static_buf ? static_buf : (char *)mem_sys_allocate(retc);

    if (enum_type_void == t) {
        j = 0;
    }
    else {
        sig_buf[0] = ncidt_to_pcc(interp, t);
        j = 1;
    }

    for (i = 0; j < retc; i++) {
        t = (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, sig_pmc, i + 1);
        if (t & enum_type_ref_flag)
            sig_buf[j++] = ncidt_to_pcc(interp, (PARROT_DATA_TYPE)(t & ~enum_type_ref_flag));
    }

    *ret_sig = retc ? Parrot_str_new(interp, sig_buf, retc) : CONST_STRING(interp, "");
    if (sig_buf != static_buf)
        mem_sys_free(sig_buf);
}

/*

=item C<STRING * Parrot_nci_describe_sig(PARROT_INTERP, PMC *sig)>

Provide a descriptive string for a signature.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_nci_describe_sig(PARROT_INTERP, ARGIN(PMC *sig))
{
    ASSERT_ARGS(Parrot_nci_describe_sig)

    STRING *s;
    size_t  n = VTABLE_elements(interp, sig);
    size_t  i;

    /* return value */
    s = Parrot_dt_get_datatype_name(interp, VTABLE_get_integer_keyed_int(interp, sig, 0));

    /* arguments */
    s = Parrot_str_concat(interp, s, CONST_STRING(interp, " ("));
    for (i = 1; i < n; i++) {
        s = Parrot_str_concat(interp, s, Parrot_dt_get_datatype_name(interp,
                                            VTABLE_get_integer_keyed_int(interp, sig, i)));
        if (i < n - 1)
            s = Parrot_str_concat(interp, s, CONST_STRING(interp, ", "));
    }
    s = Parrot_str_concat(interp, s, CONST_STRING(interp, ")"));

    return s;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
