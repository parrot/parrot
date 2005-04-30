/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

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

/*

=item C<static STRING *
getchr_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets a C<char> out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is unused.

=cut

*/

static STRING *
getchr_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    /* char promoted to int */
    char ch = (char)va_arg(*arg, int);

    return string_make(interpreter, &ch, 1, "iso-8859-1", 0);
}

/*

=item C<static HUGEINTVAL
getint_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets an integer out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the integer.

=cut

*/

static HUGEINTVAL
getint_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    switch (size) {
    case SIZE_REG:
        return (HUGEINTVAL)(int)va_arg(*arg, int);

    case SIZE_SHORT:
        /* "'short int' is promoted to 'int' when passed through '...'" */
        return (HUGEINTVAL)(short)va_arg(*arg, int);

    case SIZE_LONG:
        return (HUGEINTVAL)(long)va_arg(*arg, long);

    case SIZE_HUGE:
        return (HUGEINTVAL)(HUGEINTVAL)
                va_arg(*arg, HUGEINTVAL);

    case SIZE_XVAL:
        return (HUGEINTVAL)(INTVAL)va_arg(*arg, INTVAL);

    case SIZE_OPCODE:
        return (HUGEINTVAL)(opcode_t)va_arg(*arg, opcode_t);

    case SIZE_PMC:{
            PMC *pmc = (PMC *)va_arg(*arg, PMC *);

            return (HUGEINTVAL)(INTVAL)
                    (VTABLE_get_integer(interpreter, pmc));
        }
    default:
        PANIC("Invalid int type!");
        return 0;
    }
}

/*

=item C<static UHUGEINTVAL
getuint_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets an unsigned integer out of the C<va_list> in C<obj> and returns it
as a Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the integer.

=cut

*/

static UHUGEINTVAL
getuint_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    switch (size) {
    case SIZE_REG:
        return (UHUGEINTVAL)(unsigned int)
                va_arg(*arg, unsigned int);

    case SIZE_SHORT:
        /* short int promoted HLAGHLAGHLAGH. See note above */
        return (UHUGEINTVAL)(unsigned short)
                va_arg(*arg, unsigned int);

    case SIZE_LONG:
        return (UHUGEINTVAL)(unsigned long)
                va_arg(*arg, unsigned long);

    case SIZE_HUGE:
        return (UHUGEINTVAL)(UHUGEINTVAL)
                va_arg(*arg, UHUGEINTVAL);

    case SIZE_XVAL:
        return (UHUGEINTVAL)(UINTVAL)va_arg(*arg, UINTVAL);

    case SIZE_OPCODE:
        return (UHUGEINTVAL)(opcode_t)va_arg(*arg, opcode_t);

    case SIZE_PMC:{
            PMC *pmc = (PMC *)va_arg(*arg, PMC *);

            return (UHUGEINTVAL)(UINTVAL)
                    (VTABLE_get_integer(interpreter, pmc));
        }
    default:
        PANIC("Invalid uint type!");
        return 0;
    }
}

/*

=item C<static HUGEFLOATVAL
getfloat_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets an floating-point number out of the C<va_list> in C<obj> and
returns it as a Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type of
the number.

=cut

*/

static HUGEFLOATVAL
getfloat_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    switch (size) {
    case SIZE_SHORT:
        /* float is promoted to double */
        return (HUGEFLOATVAL)(float)va_arg(*arg, double);

    case SIZE_REG:
        return (HUGEFLOATVAL)(double)va_arg(*arg, double);

    case SIZE_HUGE:
        return (HUGEFLOATVAL)(HUGEFLOATVAL)
                va_arg(*arg, HUGEFLOATVAL);

    case SIZE_XVAL:
        return (HUGEFLOATVAL)(FLOATVAL)
                va_arg(*arg, FLOATVAL);

    case SIZE_PMC:{
            PMC *pmc = (PMC *)va_arg(*arg, PMC *);

            return (HUGEFLOATVAL)(VTABLE_get_number(interpreter, pmc));
        }
    default:
        internal_exception(INVALID_CHARACTER,
                "Internal sprintf doesn't recognize size %d for a float",
                size);
        return (HUGEFLOATVAL)0.0;
    }
}

/*

=item C<static STRING *
getstring_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets an string out of the C<va_list> in C<obj> and returns it as a
Parrot C<STRING>.

C<size> is an C<enum spf_type_t> value which indicates the storage type
of the string.

=cut

*/

static STRING *
getstring_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    switch (size) {
    case SIZE_REG:
        {
            char *cstr = (char *)va_arg(*arg, char *);

            return cstr2pstr(cstr);
        }

    case SIZE_PSTR:
        {
            STRING *s = (STRING *)va_arg(*arg, STRING *);
            return s ? s : CONST_STRING(interpreter, "(null)");

        }

    case SIZE_PMC:
        {
            PMC *pmc = (PMC *)va_arg(*arg, PMC *);
            STRING *s = VTABLE_get_string(interpreter, pmc);

            return s;
        }

    default:
        internal_exception(INVALID_CHARACTER,
                "Internal sprintf doesn't recognize size %d for a string",
                size);
        return NULL;
    }
}

/*

=item C<static void *
getptr_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Gets a C<void *> out of the C<va_list> in C<obj> and returns it.

C<size> is unused.

=cut

*/

static void *
getptr_va(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    va_list *arg = (va_list *)(obj->data);

    return (void *)va_arg(*arg, void *);
}

SPRINTF_OBJ va_core = {
    NULL, 0, getchr_va, getint_va, getuint_va,
    getfloat_va, getstring_va, getptr_va
};

/*

=back

=head2 PMC Functions

=over 4

=item C<static STRING *
getchr_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getchr_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static STRING *
getchr_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    STRING *s;
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    s = VTABLE_get_string(interpreter, tmp);
    /* XXX string_copy like below? + adjusting bufused */
    return string_substr(interpreter, s, 0, 1, NULL, 0);
}

/*

=item C<static HUGEINTVAL
getint_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getint_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static HUGEINTVAL
getint_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    HUGEINTVAL ret;
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    ret = (HUGEINTVAL)(VTABLE_get_integer(interpreter, tmp));

    switch (size) {
    case SIZE_SHORT:
        ret = (HUGEINTVAL)(short)ret;
        break;
        /* case SIZE_REG: ret=(HUGEINTVAL)(int)ret; */
        break;
    case SIZE_LONG:
        ret = (HUGEINTVAL)(long)ret;
    default:
        /* nothing */ ;
    }

    return ret;
}

/*

=item C<static UHUGEINTVAL
getuint_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getuint_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static UHUGEINTVAL
getuint_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    UHUGEINTVAL ret;
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    ret = (UHUGEINTVAL)(VTABLE_get_integer(interpreter, tmp));

    switch (size) {
    case SIZE_SHORT:
        ret = (UHUGEINTVAL)(unsigned short)ret;
        break;
        /* case SIZE_REG: * ret=(UHUGEINTVAL)(unsigned int)ret; * break; */
    case SIZE_LONG:
        ret = (UHUGEINTVAL)(unsigned long)ret;
    default:
        /* nothing */ ;
    }

    return ret;
}

/*

=item C<static HUGEFLOATVAL
getfloat_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getfloat_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static HUGEFLOATVAL
getfloat_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    HUGEFLOATVAL ret;
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    ret = (HUGEFLOATVAL)(VTABLE_get_number(interpreter, tmp));

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

=item C<static STRING *
getstring_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getstring_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static STRING *
getstring_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    STRING *s;
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    s = (STRING *)(VTABLE_get_string(interpreter, tmp));
    return s;
}

/*

=item C<static void *
getptr_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)>

Same as C<getptr_va()> except that a vtable is used to get the value
from C<obj>.

=cut

*/

static void *
getptr_pmc(Interp *interpreter, INTVAL size, SPRINTF_OBJ *obj)
{
    PMC *tmp = VTABLE_get_pmc_keyed_int(interpreter,
            ((PMC *)obj->data),
            (obj->index));

    obj->index++;
    /* XXX correct? */
    return (void *)(VTABLE_get_integer(interpreter, tmp));
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
appending things to the string, allowing for faster C<PIO_printf()> &c,
as well as a version that writes directly to a C string. However, at
this point neither of those is needed.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
