/*
Copyright (C) 2003-2006, The Perl Foundation.
$Id$

=head1 NAME

src/builtin.c - Builtin Methods

=head1 SYNOPSIS

=head1 DESCRIPTION

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/compiler.h"
#include "builtin.str"
#include <assert.h>


typedef struct _builtin {
    NOTNULL( const char * const c_name );       /* short name 'cos' */
    NOTNULL( const char * const signature );    /* e.g. PP */
    NOTNULL( const char * const c_ns );         /* namespace */
    NULLOK(  STRING *meth_name );               /* internal name e.g. '__cos' */
    NULLOK(  STRING *_namespace );              /* same */
} Builtins;

#define N_BUILTINS (int)(sizeof (builtins) / sizeof (builtins[0]))
static Builtins builtins[] = {
    /*
     * Please keep this list sorted
     */
    { "acos",   "PJO",          "Float",        NULL, NULL },
    { "asec",   "PJO",          "Float",        NULL, NULL },
    { "asin",   "PJO",          "Float",        NULL, NULL },
    { "atan2",  "PJOP",         "Float",        NULL, NULL },
    { "atan",   "PJO",          "Float",        NULL, NULL },
    { "chdir",  "vJOS",         "OS",           NULL, NULL },
    { "chroot", "vJOS",         "OS",           NULL, NULL },
    { "copy",   "vJOSS",        "File",         NULL, NULL },
    { "cosh",   "PJO",          "Float",        NULL, NULL },
    { "cos",    "PJO",          "Float",        NULL, NULL },
    { "cwd",    "SJO",          "OS",           NULL, NULL },
    { "exp",    "PJO",          "Float",        NULL, NULL },
    { "index",  "IJSS.I",       "String",       NULL, NULL },
    { "is_integer","IJS",       "String",       NULL, NULL },
    { "link",   "vJOSS",        "OS",           NULL, NULL },
    { "ln",     "PJO",          "Float",        NULL, NULL },
    { "log10",  "PJO",          "Float",        NULL, NULL },
    { "log2",   "PJO",          "Float",        NULL, NULL },
    { "lower",  "PJO",          "String",       NULL, NULL },
    { "lstat",  "PJOS",         "OS",           NULL, NULL },
    { "mkdir",  "vJOSI",        "OS",           NULL, NULL },
    { "open",   "PJS.S",        "ParrotIO",     NULL, NULL },
    { "puts",   "IJOS",         "ParrotIO",     NULL, NULL },
    { "rename", "vJOSS",        "File",         NULL, NULL },
    { "reverse","vJS",          "String",       NULL, NULL },
    { "rm",     "vJOS",         "OS",           NULL, NULL },
    { "say",    "IJOS",         "ParrotIO",     NULL, NULL },
    { "say",    "IJS",          "ParrotIO",     NULL, NULL },
    { "say",    "vJOS",         "ParrotIO",     NULL, NULL },
    { "say",    "vJS",          "ParrotIO",     NULL, NULL },
    { "sech",   "PJO",          "Float",        NULL, NULL },
    { "sec",    "PJO",          "Float",        NULL, NULL },
    { "sinh",   "PJO",          "Float",        NULL, NULL },
    { "sin",    "PJO",          "Float",        NULL, NULL },
    { "sqrt",   "PJO",          "Float",        NULL, NULL },
    { "symlink","vJOSS",        "OS",           NULL, NULL },
    { "tanh",   "PJO",          "Float",        NULL, NULL },
    { "tan",    "PJO",          "Float",        NULL, NULL },
    { "trans",  "vJSP",         "String",       NULL, NULL },
    { "umask",  "IJOI",         "OS",           NULL, NULL },
    /*
     * Please keep this list sorted
     */
};

/* HEADERIZER HFILE: include/parrot/builtin.h */

/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
static int check_builtin_sig( size_t i, NOTNULL(const char *sig), int pass )
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int find_builtin( NOTNULL(const char *func) )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static int find_builtin_s( PARROT_INTERP, NOTNULL(STRING *func) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */

/*

FUNCDOC: Parrot_init_builtins

Initialize the builtins structure.

FUNCDOC: Parrot_is_builtin

Return the index of the builtin or -1 on failure.

FUNCDOC: Parrot_find_builtin

Return the NCI PMC of the builtin or NULL.

*/

void
Parrot_init_builtins(PARROT_INTERP)
{
    size_t i;

    for (i = 0; i < N_BUILTINS; ++i) {
        /* XXX mangle yes or no */
#ifdef MANGLE_BUILTINS
        char buffer[128];

        buffer[0] = '_';
        buffer[1] = '_';
        strcpy(buffer + 2, builtins[i].c_name);
        builtins[i].meth_name = const_string(interp, buffer);
#else
        builtins[i].meth_name = const_string(interp,
                builtins[i].c_name);
#endif
        builtins[i]._namespace = const_string(interp,
                builtins[i].c_ns);
    }
}

PARROT_WARN_UNUSED_RESULT
static int
find_builtin(NOTNULL(const char *func))
{
    int low  = 0;
    int high = N_BUILTINS - 1;

    /* binary search */
    while (low <= high) {
        int i   = (low + high) / 2;
        const int cmp = strcmp(func, builtins[i].c_name);

        if (!cmp) {
            /* we have to loop here because there is currently more than one
               entry for the 'say' opcode and we depend on having the first
               one so we can check signatures. --mdiep */
            while (i>0 && strcmp(func, builtins[i-1].c_name) == 0)
                i--;
            return i;
        }
        else if (cmp > 0)
            low  = i + 1;
        else if (cmp < 0)
            high = i - 1;
    }
    return -1;
}

PARROT_WARN_UNUSED_RESULT
static int
find_builtin_s(PARROT_INTERP, NOTNULL(STRING *func))
{
    int low  = 0;
    int high = N_BUILTINS - 1;

    /* binary search */ /* XXX isn't there a standard C func for this? */
    while (low <= high) {
        const int i   = (low + high) / 2;
        const int cmp = string_compare(interp, func, builtins[i].meth_name);

        if (!cmp)
            return i;
        else if (cmp > 0)
            low  = i + 1;
        else if (cmp < 0)
            high = i - 1;
    }
    return -1;
}

PARROT_WARN_UNUSED_RESULT
static int
check_builtin_sig(size_t i, NOTNULL(const char *sig), int pass)
{
    const Builtins * const b = builtins + i;
    const char *p;
    int opt = 0;

    p = b->signature;
    if (*p != *sig && *p == 'v')
        ++p;
    for (; *p && *sig; ++sig, ++p) {
        switch (*p) {
            case '.':   /* optional start */
                opt = 1;
                /* fall through */
            case 'J':   /* interpreter */
                ++p;
        }
        if (*p == 'O' && *sig == 'P')
            continue;
        if (pass && (*p == 'P' || *sig == 'P'))
            continue;
        if (*p != *sig)
            return 0;
    }
    if (!*p && !*sig)
        return 1;
    if (*p && opt)
        return 1;
    return 0;
}

PARROT_WARN_UNUSED_RESULT
int
Parrot_is_builtin(NOTNULL(const char *func), NULLOK(const char *sig))
{
    int bi, i, pass;

    i = find_builtin(func);
    if (i < 0)
        return -1;
    if (!sig)
        return i;
    bi = i;
    for (pass = 0; pass <= 1; ++pass) {
        i = bi;
again:
        if (check_builtin_sig(i, sig, pass))
            return i;
        if (i < N_BUILTINS - 1) {
            /* try next with same name */
            ++i;
            if (strcmp(func, builtins[i].c_name))
                continue;
            goto again;
        }
    }
    return -1;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_find_builtin(PARROT_INTERP, NOTNULL(STRING *func))
{
    const int i = find_builtin_s(interp, func);
    if (i < 0)
        return Parrot_find_global_s(interp,
                                    CONST_STRING(interp, "__parrot_core"),
                                    func);
    else
        return Parrot_find_global_s(interp,
                                    builtins[i]._namespace,
                                    builtins[i].meth_name);
}

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const char *
Parrot_builtin_get_c_namespace(int bi)
{
    assert(bi >= 0 && bi < N_BUILTINS);
    return builtins[bi].c_ns;
}

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
int
Parrot_builtin_is_class_method(int bi)
{
    assert(bi >= 0 && bi < N_BUILTINS);
    return builtins[bi].signature[2] != 'O';
}

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
int
Parrot_builtin_is_void(int bi)
{
    assert(bi >= 0 && bi < N_BUILTINS);
    return builtins[bi].signature[0] == 'v';
}

/*

=head1 SEE ALSO

F<ops/math.ops>

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
