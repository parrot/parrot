/* longopt.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Command line option parsing (for pre-initialized code)
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_LONGOPT_H_GUARD)
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

int longopt_get(Parrot_Interp, int argc, char* argv[],
                const struct longopt_opt_decl options[],
                struct longopt_opt_info* info_buf);

#endif /* PARROT_LONGOPT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
