/*
Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

src/spf_vtable.c - Parrot sprintf

=head1 DESCRIPTION

Implements the two families of functions C<Parrot_sprintf> may use to
retrieve arguments.

=head2 Var args Functions

=over 4

=cut

*/

#define IN_SPF_SYSTEM

#include "parrot/parrot.h"

#include <stdarg.h>
#include "spf_vtable.str"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * getchr_pmc(PARROT_INTERP,
    INTVAL size,
    ARGMOD(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*obj);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * getchr_va(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static HUGEFLOATVAL getfloat_pmc(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static HUGEFLOATVAL getfloat_va(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static HUGEINTVAL getint_pmc(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static HUGEINTVAL getint_va(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static void * getptr_pmc(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void * getptr_va(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * getstring_pmc(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * getstring_va(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static UHUGEINTVAL getuint_pmc(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static UHUGEINTVAL getuint_va(PARROT_INTERP,
    INTVAL size,
    ARGIN(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_getchr_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getchr_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getfloat_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getfloat_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getint_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getint_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getptr_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getptr_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getstring_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getstring_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getuint_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_getuint_va __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static STRING * getchr_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ *obj)>

Gets a C<char> out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is unused.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
getchr_va(PARROT_INTERP, SHIM(INTVAL size), ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getchr_va)
    va_list *arg = (va_list *)(obj->data);

    /* char promoted to int */
    char ch = (char)va_arg(*arg, int);

    return Parrot_str_new_init(interp, &ch, 1, Parrot_latin1_encoding_ptr, 0);
}

/*

=item C<static HUGEINTVAL getint_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Gets an integer out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the integer.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static HUGEINTVAL
getint_va(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getint_va)
    va_list * const arg = (va_list *)(obj->data);

    switch (size) {
      case SIZE_REG:
        return va_arg(*arg, int);

      case SIZE_SHORT:
        /* "'short int' is promoted to 'int' when passed through '...'" */
        return (short)va_arg(*arg, int);

      case SIZE_LONG:
        return va_arg(*arg, long);

      case SIZE_HUGE:
        return va_arg(*arg, HUGEINTVAL);

      case SIZE_XVAL:
        return va_arg(*arg, INTVAL);

      case SIZE_OPCODE:
        return va_arg(*arg, opcode_t);

      case SIZE_PMC:
        {
            PMC * const pmc = (PMC *)va_arg(*arg, PMC *);
            return VTABLE_get_integer(interp, pmc);
        }

      default:
        PANIC(interp, "Invalid int type!");
    }
}

/*

=item C<static UHUGEINTVAL getuint_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Gets an unsigned integer out of the C<va_list> in C<obj> and returns it
as a Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the integer.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UHUGEINTVAL
getuint_va(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getuint_va)
    va_list * const arg = (va_list *)(obj->data);

    switch (size) {
      case SIZE_REG:
        return va_arg(*arg, unsigned int);

      case SIZE_SHORT:
        /* short int promoted HLAGHLAGHLAGH. See note above */
        return (unsigned short)va_arg(*arg, unsigned int);

      case SIZE_LONG:
        return va_arg(*arg, unsigned long);

      case SIZE_HUGE:
        return va_arg(*arg, UHUGEINTVAL);

      case SIZE_XVAL:
        return va_arg(*arg, UINTVAL);

      case SIZE_OPCODE:
        return va_arg(*arg, opcode_t);

      case SIZE_PMC:
        {
            PMC * const pmc = va_arg(*arg, PMC *);
            return (UINTVAL)VTABLE_get_integer(interp, pmc);
        }

      default:
        PANIC(interp, "Invalid uint type!");
    }
}

/*

=item C<static HUGEFLOATVAL getfloat_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Gets an floating-point number out of the C<va_list> in C<obj> and
returns it as a Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type of
the number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static HUGEFLOATVAL
getfloat_va(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getfloat_va)
    va_list * const arg = (va_list *)(obj->data);

    switch (size) {
      case SIZE_SHORT:
        /* float is promoted to double */
        return (HUGEFLOATVAL)(float)va_arg(*arg, double);

      case SIZE_REG:
        return (HUGEFLOATVAL)(double)va_arg(*arg, double);

      case SIZE_HUGE:
        return (HUGEFLOATVAL)(HUGEFLOATVAL) va_arg(*arg, HUGEFLOATVAL);

      case SIZE_XVAL:
        return (HUGEFLOATVAL)(FLOATVAL) va_arg(*arg, FLOATVAL);

      case SIZE_PMC:
        {
            PMC * const pmc = (PMC *)va_arg(*arg, PMC *);

            return (HUGEFLOATVAL)(VTABLE_get_number(interp, pmc));
        }

      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
            "Internal sprintf doesn't recognize size %d for a float", size);
    }
}

/*

=item C<static STRING * getstring_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Gets an string out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the string.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
getstring_va(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getstring_va)
    va_list * const arg = (va_list *)(obj->data);

    switch (size) {
    case SIZE_REG:
        {
            const char * const cstr = (char *)va_arg(*arg, char *);

            return cstr2pstr(cstr);
        }

    case SIZE_PSTR:
        {
            STRING * const s = (STRING *)va_arg(*arg, STRING *);
            return s ? s : CONST_STRING(interp, "(null)");

        }

    case SIZE_PMC:
        {
            PMC * const pmc = (PMC *)va_arg(*arg, PMC *);
            STRING * const s = VTABLE_get_string(interp, pmc);

            return s;
        }

    default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
            "Internal sprintf doesn't recognize size %d for a string", size);
    }
}

/*

=item C<static void * getptr_va(PARROT_INTERP, INTVAL size, SPRINTF_OBJ *obj)>

Gets a C<void *> out of the C<va_list> in C<obj> and returns it.

C<size> is unused.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void *
getptr_va(SHIM_INTERP, SHIM(INTVAL size), ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getptr_va)
    va_list * const arg = (va_list *)(obj->data);

    return (void *)va_arg(*arg, void *);
}

const SPRINTF_OBJ va_core = {
    NULL, 0, getchr_va, getint_va, getuint_va,
    getfloat_va, getstring_va, getptr_va
};

/*

=back

=head2 PMC Functions

=over 4

=item C<static STRING * getchr_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Same as C<getchr_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
getchr_pmc(PARROT_INTERP, SHIM(INTVAL size), ARGMOD(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getchr_pmc)
    STRING *s;
    PMC * const tmp = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data),
            (obj->index));

    ++obj->index;
    s = VTABLE_get_string(interp, tmp);
    return STRING_substr(interp, s, 0, 1);
}

/*

=item C<static HUGEINTVAL getint_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Same as C<getint_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static HUGEINTVAL
getint_pmc(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getint_pmc)

    PMC * const tmp = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data),
            (obj->index++));

    HUGEINTVAL ret  = VTABLE_get_integer(interp, tmp);

    switch (size) {
      case SIZE_SHORT:
        ret = (short)ret;
        break;
        /* case SIZE_REG: ret=(HUGEINTVAL)(int)ret; break; */
      case SIZE_LONG:
        ret = (long)ret;
        break;
      default:
        /* nothing */ ;
    }

    return ret;
}

/*

=item C<static UHUGEINTVAL getuint_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Same as C<getuint_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UHUGEINTVAL
getuint_pmc(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getuint_pmc)

    PMC * const tmp = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data),
            (obj->index++));

    UHUGEINTVAL ret = (UINTVAL)VTABLE_get_integer(interp, tmp);

    switch (size) {
      case SIZE_SHORT:
        ret = (unsigned short)ret;
        break;
        /* case SIZE_REG: * ret=(UHUGEINTVAL)(unsigned int)ret; * break; */
      case SIZE_LONG:
        ret = (unsigned long)ret;
        break;
      default:
        /* nothing */ ;
    }

    return ret;
}

/*

=item C<static HUGEFLOATVAL getfloat_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Same as C<getfloat_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static HUGEFLOATVAL
getfloat_pmc(PARROT_INTERP, INTVAL size, ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getfloat_pmc)
    PMC * const tmp  = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data),
            (obj->index++));

    HUGEFLOATVAL ret = (HUGEFLOATVAL)(VTABLE_get_number(interp, tmp));

    switch (size) {
    case SIZE_SHORT:
        ret = (HUGEFLOATVAL)(float)ret;
        break;
        /* case SIZE_REG: * ret=(HUGEFLOATVAL)(double)ret; * break; */
    default:
        /* nothing */ ;
    }

    return ret;
}

/*

=item C<static STRING * getstring_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ
*obj)>

Same as C<getstring_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
getstring_pmc(PARROT_INTERP, SHIM(INTVAL size), ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getstring_pmc)

    PMC * const tmp = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data),
            (obj->index++));

    STRING * const str = (STRING *)(VTABLE_get_string(interp, tmp));
    return str;
}

/*

=item C<static void * getptr_pmc(PARROT_INTERP, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getptr_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static void *
getptr_pmc(PARROT_INTERP, SHIM(INTVAL size), ARGIN(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(getptr_pmc)
    PMC * const tmp = VTABLE_get_pmc_keyed_int(interp,
            ((PMC *)obj->data), (obj->index++));
    const INTVAL i  = VTABLE_get_integer(interp, tmp);

    /* XXX correct? */
    return (void *)i;
}

SPRINTF_OBJ pmc_core = {
    NULL, 0, getchr_pmc, getint_pmc, getuint_pmc,
    getfloat_pmc, getstring_pmc, getptr_pmc
};

/*

=back

=head1 SEE ALSO

F<src/misc.h>, F<src/misc.c>, F<src/spf_render.c>.

=head1 HISTORY

When I was first working on this implementation of sprintf, I ran into a
problem.  I wanted to re-use the implementation for a Parrot
bytecode-level sprintf, but that couldn't be done, since it used C<va_*>
directly.  For a while I thought about generating two versions of the
source with a Perl script, but that seemed like overkill. Eventually I
came across this idea -- pass in a specialized vtable with methods for
extracting things from the arglist, whatever it happened to be.  This is
the result.

=head1 TODO

In the future, it may be deemed desirable to similarly vtable-ize
appending things to the string, allowing for faster C<Parrot_io_printf()> &c,
as well as a version that writes directly to a C string. However, at
this point neither of those is needed.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
