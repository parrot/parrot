/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

longopt.c - Command-line option parsing

=head1 DESCRIPTION

This is used by C<parrot>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/longopt.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static int longopt_get_longopt(PARROT_INTERP,
    int argc,
    ARGIN(const char* argv[]),
    ARGIN(const struct longopt_opt_decl options[]),
    ARGMOD(struct longopt_opt_info* info_buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(* info_buf);

PARROT_WARN_UNUSED_RESULT
static int longopt_get_shortopt(PARROT_INTERP,
    int argc,
    ARGIN(const char* argv[]),
    ARGIN(const struct longopt_opt_decl options[]),
    ARGMOD(struct longopt_opt_info* info_buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(* info_buf);

#define ASSERT_ARGS_longopt_get_longopt __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(options) \
    , PARROT_ASSERT_ARG(info_buf))
#define ASSERT_ARGS_longopt_get_shortopt __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(options) \
    , PARROT_ASSERT_ARG(info_buf))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

static char longopt_error_buffer[512];

/*

=item C<const struct longopt_opt_decl * Parrot_cmd_options(void)>

Set up the const struct declaration for cmd_options

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_CONST_FUNCTION
const struct longopt_opt_decl *
Parrot_cmd_options(void)
{
    ASSERT_ARGS(Parrot_cmd_options)
    static const struct longopt_opt_decl cmd_options[] = {
        { '.', '.', (OPTION_flags)0, { "--wait" } },
        { 'D', 'D', OPTION_optional_FLAG, { "--parrot-debug" } },
        { 'E', 'E', (OPTION_flags)0, { "--pre-process-only" } },
        { 'G', 'G', (OPTION_flags)0, { "--no-gc" } },
        { '\0', OPT_HASH_SEED, OPTION_required_FLAG, { "--hash-seed" } },
        { 'I', 'I', OPTION_required_FLAG, { "--include" } },
        { 'L', 'L', OPTION_required_FLAG, { "--library" } },
        { 'O', 'O', OPTION_optional_FLAG, { "--optimize" } },
        { 'R', 'R', OPTION_required_FLAG, { "--runcore" } },
        { 'g', 'g', OPTION_required_FLAG, { "--gc" } },
        { 'V', 'V', (OPTION_flags)0, { "--version" } },
        { 'X', 'X', OPTION_required_FLAG, { "--dynext" } },
        { '\0', OPT_DESTROY_FLAG, (OPTION_flags)0,
                                     { "--leak-test", "--destroy-at-end" } },
        { '\0', OPT_GC_DEBUG, (OPTION_flags)0, { "--gc-debug" } },
        { 'a', 'a', (OPTION_flags)0, { "--pasm" } },
        { 'c', 'c', (OPTION_flags)0, { "--pbc" } },
        { 'd', 'd', OPTION_optional_FLAG, { "--imcc-debug" } },
        { '\0', OPT_HELP_DEBUG, (OPTION_flags)0, { "--help-debug" } },
        { 'h', 'h', (OPTION_flags)0, { "--help" } },
        { 'o', 'o', OPTION_required_FLAG, { "--output" } },
        { '\0', OPT_PBC_OUTPUT, (OPTION_flags)0, { "--output-pbc" } },
        { 'r', 'r', (OPTION_flags)0, { "--run-pbc" } },
        { '\0', OPT_RUNTIME_PREFIX, (OPTION_flags)0, { "--runtime-prefix" } },
        { 't', 't', OPTION_optional_FLAG, { "--trace" } },
        { 'v', 'v', (OPTION_flags)0, { "--verbose" } },
        { 'w', 'w', (OPTION_flags)0, { "--warnings" } },
        { 'y', 'y', (OPTION_flags)0, { "--yydebug" } },
        { 0, 0, (OPTION_flags)0, { NULL } }
    };
    return cmd_options;
}

/*

=item C<int longopt_get(PARROT_INTERP, int argc, const char* argv[], const
struct longopt_opt_decl options[], struct longopt_opt_info* info_buf)>

Gets long or short options, specified in C<options[]> (see
F<docs/dev/longopt.dev>).

Call it iteratively with the same C<info_buf> until it returns 0 or -1.

0  means you have reached the end of options.

-1 means a parse error, with error put in C<< info_buf->opt_error >>.

Any other value is a valid option identifier.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
int
longopt_get(PARROT_INTERP, int argc, ARGIN(const char* argv[]),
            ARGIN(const struct longopt_opt_decl options[]),
            ARGMOD(struct longopt_opt_info* info_buf))
{
    ASSERT_ARGS(longopt_get)
    const int dex = info_buf->opt_index;

    info_buf->opt_id = 0;
    info_buf->opt_arg = info_buf->opt_error = NULL;

    if (dex >= argc || argv[dex] == NULL)
        return 0;

    if (argv[dex][0] != '-' || argv[dex][1] == '\0')
        return 0;

    if (info_buf->_shortopt_pos)
        return longopt_get_shortopt(interp, argc, argv, options, info_buf);

    if (argv[dex][1] == '-') { /* Long option or -- */
        if (argv[dex][2] == '\0') {
            ++info_buf->opt_index;
            return 0;
        }
        else {                   /* Long option */
            return longopt_get_longopt(interp, argc, argv, options, info_buf);
        }
    }
    else {                       /* Short option */
        return longopt_get_shortopt(interp, argc, argv, options, info_buf);
    }
}

/*

=item C<static int longopt_get_longopt(PARROT_INTERP, int argc, const char*
argv[], const struct longopt_opt_decl options[], struct longopt_opt_info*
info_buf)>

Find the option identifier of a long option.

Fill C<info_buf> appropriately, and return the option identifier.

C<argv[info_buf->opt_index]> is guaranteed to have at least three
characters and start with C<-->.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
longopt_get_longopt(PARROT_INTERP, int argc, ARGIN(const char* argv[]),
                    ARGIN(const struct longopt_opt_decl options[]),
                    ARGMOD(struct longopt_opt_info* info_buf))
{
    ASSERT_ARGS(longopt_get_longopt)
    const int dex = info_buf->opt_index;
    int optlen = 0;
    const struct longopt_opt_decl* dptr;

    while (argv[dex][optlen] != '\0' && argv[dex][optlen] != '=') {
        ++optlen;
    }

    for (dptr = options; dptr->opt_id; ++dptr) {
        int sptr;
        /* For each listed long option... */
        for (sptr = 0; dptr->opt_long[sptr]; ++sptr) {
            if (strncmp(dptr->opt_long[sptr], argv[dex], optlen) == 0
             && dptr->opt_long[sptr][optlen] == '\0') {
                /* Found it */
                info_buf->opt_id = dptr->opt_id;
                ++info_buf->opt_index;

                /* XXX: (LP) if a longopt is given an argument when it's
                 * not expecting one, it is just ignored.  Bad. */

                if (argv[dex][optlen] == '=') {
                    if (dptr->opt_flags &
                            (OPTION_required_FLAG | OPTION_optional_FLAG)) {
                        info_buf->opt_arg = &argv[dex][optlen+1];
                    }
                    else {
                        Parrot_snprintf(interp, longopt_error_buffer,
                                        sizeof (longopt_error_buffer),
                                        "Option %s does not expect an argument",
                                                dptr->opt_long[sptr]);
                        info_buf->opt_error = longopt_error_buffer;
                        return -1;
                    }
                }
                else {
                    if (dptr->opt_flags & OPTION_required_FLAG) {
                        if (dex+1 < argc) {
                            info_buf->opt_arg = argv[dex+1];
                            ++info_buf->opt_index;
                        }
                        else {
                            Parrot_snprintf(interp, longopt_error_buffer,
                                            sizeof (longopt_error_buffer),
                                           "Option %s needs an argument",
                                                   dptr->opt_long[sptr]);
                            info_buf->opt_error = longopt_error_buffer;
                            return -1;
                        }
                    }
                    else if (dptr->opt_flags & OPTION_optional_FLAG) {
                        if (dex+2 < argc && argv[dex+1][0] &&
                                argv[dex+1][0] != '-') {
                            info_buf->opt_arg = argv[dex+1];
                            ++info_buf->opt_index;
                        }
                    }
                }

                return dptr->opt_id;
            }
        }
    }

    /* Couldn't find it. */
    info_buf->opt_id = -1;
    Parrot_snprintf(interp, longopt_error_buffer,
             sizeof (longopt_error_buffer),
             "Option %s not known", argv[dex]);
    info_buf->opt_error = longopt_error_buffer;
    return -1;
}

/*

=item C<static int longopt_get_shortopt(PARROT_INTERP, int argc, const char*
argv[], const struct longopt_opt_decl options[], struct longopt_opt_info*
info_buf)>

Find the option identifier of the next short option.

This next short option may be in the middle of a bundle (C<-abcd>), and
C<< info_buf->_shortopt_pos >> maintains a pointer into that bundle.

C<< argv[info_buf->opt_index] >> is guaranteed to be at least two
characters long and start with a dash.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
longopt_get_shortopt(PARROT_INTERP, int argc, ARGIN(const char* argv[]),
                     ARGIN(const struct longopt_opt_decl options[]),
                     ARGMOD(struct longopt_opt_info* info_buf))
{
    ASSERT_ARGS(longopt_get_shortopt)
    const int dex = info_buf->opt_index;
    const struct longopt_opt_decl* dptr;
    const char* pos;


    if (!info_buf->_shortopt_pos)
        info_buf->_shortopt_pos = &argv[dex][1];
    pos = info_buf->_shortopt_pos;

    for (dptr = options; dptr->opt_id; ++dptr) {
        if (dptr->opt_short == *pos) {
            /* Found it */
            info_buf->opt_id = dptr->opt_id;

            if (dptr->opt_flags & OPTION_required_FLAG) {
                if (*(pos + 1)) {
                    info_buf->opt_arg = pos + 1;
                }
                else {
                    if (dex+1 < argc) {
                        info_buf->opt_arg = argv[dex+1];
                        ++info_buf->opt_index;
                    }
                    else {
                        Parrot_snprintf(interp, longopt_error_buffer,
                                        sizeof (longopt_error_buffer),
                                        "Option -%c expects an argument", *pos);
                        info_buf->opt_error = longopt_error_buffer;
                        return -1;
                    }
                }
                info_buf->_shortopt_pos = NULL;
                ++info_buf->opt_index;
            }
            else if (dptr->opt_flags & OPTION_optional_FLAG) {
                if (*(pos + 1)) {
                    info_buf->opt_arg = pos + 1;
                }
                else if (dex+2 < argc && argv[dex+1][0] &&
                        argv[dex+1][0] != '-') {
                    info_buf->opt_arg = argv[dex+1];
                    ++info_buf->opt_index;
                }
                info_buf->_shortopt_pos = NULL;
                ++info_buf->opt_index;
            }
            else {             /* No argument expected */
                if (! *(pos + 1)) {
                    info_buf->_shortopt_pos = NULL;
                    ++info_buf->opt_index;
                }
                else {
                    ++info_buf->_shortopt_pos;
                }
            }

            return dptr->opt_id;
        }
    }

    /* Couldn't find it in the table */
    info_buf->opt_id = -1;
    Parrot_snprintf(interp, longopt_error_buffer,
             sizeof (longopt_error_buffer),
             "Option -%c not known", *pos);
    info_buf->opt_error = longopt_error_buffer;
    return -1;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/longopt.h> and F<docs/dev/longopt.dev>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
