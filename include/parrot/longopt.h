/* longopt.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Command line option parsing (for pre-initialized code)
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_LONGOPT_H_GUARD
#define PARROT_LONGOPT_H_GUARD

/* I use a char* here because this needs to be easily statically
 * initialized, and because the interpreter is probably not running
 * yet.
 */
typedef const char* longopt_string_t;

/* &gen_from_enum(longopt.pasm) subst(s/(\w+)/uc($1)/e) */
typedef enum {
    OPTION_required_FLAG = 0x1,
    OPTION_optional_FLAG = 0x2
} OPTION_flags;
/* &end_gen */

struct longopt_opt_decl {
    int               opt_short;
    int               opt_id;
    OPTION_flags      opt_flags;
    longopt_string_t  opt_long[10];   /* An array of long aliases */
};

struct longopt_opt_info {
    int               opt_index;    /* The index within argv */
    int               opt_id;       /* 0 signifies end of options */
    longopt_string_t  opt_arg;      /* A pointer to any argument's position */
    longopt_string_t  opt_error;

    const char*      _shortopt_pos;
};

#define LONGOPT_OPT_INFO_INIT { 1, 0, NULL, NULL, NULL }

/* HEADERIZER BEGIN: src/longopt.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
int longopt_get(PARROT_INTERP,
    int argc,
    ARGIN(const char* argv[]),
    ARGIN(const struct longopt_opt_decl options[]),
    ARGMOD(struct longopt_opt_info* info_buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(* info_buf);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/longopt.c */

#endif /* PARROT_LONGOPT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
