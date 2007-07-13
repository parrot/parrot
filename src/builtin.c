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
    const char *c_name;         /* short name 'cos' */
    const char *signature;      /* e.g. PP */
    const char *c_ns;           /* namespace */
    STRING *meth_name;          /* internal name e.g. '__cos' */
    STRING *_namespace;          /* same */
} Builtins;

#define N_BUILTINS (int)(sizeof (builtins) / sizeof (builtins[0]))
static Builtins builtins[] = {
    /*
     * Please keep this list sorted
     */
    { "acos",   "PJO",          "Float",        0, 0 },
    { "asec",   "PJO",          "Float",        0, 0 },
    { "asin",   "PJO",          "Float",        0, 0 },
    { "atan2",  "PJOP",         "Float",        0, 0 },
    { "atan",   "PJO",          "Float",        0, 0 },
    { "chdir",  "vJOS",         "OS",           0, 0 },
    { "chroot", "vJOS",         "OS",           0, 0 },
    { "copy",   "vJOSS",        "File",         0, 0 },
    { "cosh",   "PJO",          "Float",        0, 0 },
    { "cos",    "PJO",          "Float",        0, 0 },
    { "cwd",    "SJO",          "OS",           0, 0 },
    { "exp",    "PJO",          "Float",        0, 0 },
    { "index",  "IJSS.I",       "String",       0, 0 },
    { "is_integer","IJS",       "String",       0, 0 },
    { "link",   "vJOSS",        "OS",           0, 0 },
    { "ln",     "PJO",          "Float",        0, 0 },
    { "log10",  "PJO",          "Float",        0, 0 },
    { "log2",   "PJO",          "Float",        0, 0 },
    { "lower",  "PJO",          "String",       0, 0 },
    { "lstat",  "PJOS",         "OS",           0, 0 },
    { "mkdir",  "vJOSI",        "OS",           0, 0 },
    { "open",   "PJS.S",        "ParrotIO",     0, 0 },
    { "puts",   "IJOS",         "ParrotIO",     0, 0 },
    { "rename", "vJOSS",        "File",         0, 0 },
    { "reverse","vJS",          "String",       0, 0 },
    { "rm",     "vJOS",         "OS",           0, 0 },
    { "say",    "IJOS",         "ParrotIO",     0, 0 },
    { "say",    "IJS",          "ParrotIO",     0, 0 },
    { "say",    "vJOS",         "ParrotIO",     0, 0 },
    { "say",    "vJS",          "ParrotIO",     0, 0 },
    { "sech",   "PJO",          "Float",        0, 0 },
    { "sec",    "PJO",          "Float",        0, 0 },
    { "sinh",   "PJO",          "Float",        0, 0 },
    { "sin",    "PJO",          "Float",        0, 0 },
    { "sqrt",   "PJO",          "Float",        0, 0 },
    { "symlink","vJOSS",        "OS",           0, 0 },
    { "tanh",   "PJO",          "Float",        0, 0 },
    { "tan",    "PJO",          "Float",        0, 0 },
    { "trans",  "vJSP",         "String",       0, 0 },
    { "umask",  "IJOI",         "OS",           0, 0 },
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
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

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
    /* WARN_UNUSED */
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
