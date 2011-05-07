/* longopt.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     Command line option parsing (for pre-initialized code)
 */

#ifndef PARROT_LONGOPT_H_GUARD
#define PARROT_LONGOPT_H_GUARD

#include "parrot/api.h"

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

#define OPT_GC_DEBUG              128
#define OPT_DESTROY_FLAG          129
#define OPT_HELP_DEBUG            130
#define OPT_PBC_OUTPUT            131
#define OPT_RUNTIME_PREFIX        132
#define OPT_HASH_SEED             133
#define OPT_GC_DYNAMIC_THRESHOLD  134
#define OPT_GC_MIN_THRESHOLD      135
#define OPT_GC_NURSERY_SIZE       136

/* HEADERIZER BEGIN: src/longopt.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

int longopt_get(
    int argc,
    ARGIN(const char* argv[]),
    ARGIN(const struct longopt_opt_decl options[]),
    ARGMOD(struct longopt_opt_info* info_buf))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* info_buf);

#define ASSERT_ARGS_longopt_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(options) \
    , PARROT_ASSERT_ARG(info_buf))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/longopt.c */

#endif /* PARROT_LONGOPT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
