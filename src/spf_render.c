/*
Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

src/spf_render.c - Parrot sprintf

=head1 DESCRIPTION

Implements the main function that drives the C<Parrot_sprintf> family
and its utility functions.

=head2 Utility Functions

=over 4

=cut

*/

#define IN_SPF_SYSTEM

#include "parrot/parrot.h"
#include "spf_render.str"

typedef enum {
    PHASE_FLAGS = 0,
    PHASE_WIDTH,
    PHASE_PREC,
    PHASE_TYPE,
    PHASE_TERM,
    PHASE_DONE
} PHASE;

typedef struct SpfInfo_tag {
    UINTVAL width;
    UINTVAL prec;
    INTVAL  flags;
    INTVAL  type;
    PHASE   phase;
} SpfInfo;

enum {
    FLAG_MINUS  = (1<<0),
    FLAG_PLUS   = (1<<1),
    FLAG_ZERO   = (1<<2),
    FLAG_SPACE  = (1<<3),
    FLAG_SHARP  = (1<<4),
    FLAG_WIDTH  = (1<<5),
    FLAG_PREC   = (1<<6)
};

/* HEADERIZER HFILE: include/parrot/misc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void canonicalize_exponent(
    ARGMOD(char *tc),
    ARGIN(const SpfInfo *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tc);

static void gen_sprintf_call(
    ARGOUT(char *out),
    ARGMOD(SpfInfo *info),
    int thingy)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*out)
        FUNC_MODIFIES(*info);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * handle_flags(PARROT_INTERP,
    ARGIN(const SpfInfo *info),
    ARGIN(STRING *str),
    INTVAL is_int_type,
    ARGIN_NULLOK(STRING* prefix))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* str_concat_w_flags(PARROT_INTERP,
    ARGOUT(STRING *dest),
    ARGIN(const SpfInfo *info),
    ARGMOD(STRING *src),
    ARGIN_NULLOK(STRING *prefix))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*src);

#define ASSERT_ARGS_canonicalize_exponent __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(tc) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_gen_sprintf_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(out) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_handle_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_str_concat_w_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/* Per Dan's orders, we will not use sprintf if snprintf isn't
 * around for us.
 */
#ifdef _MSC_VER
#  define snprintf _snprintf
#endif

/*

=item C<static STRING * handle_flags(PARROT_INTERP, const SpfInfo *info, STRING
*str, INTVAL is_int_type, STRING* prefix)>

Handles C<+>, C<->, C<0>, C<#>, space, width, and prec.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
handle_flags(PARROT_INTERP, ARGIN(const SpfInfo *info), ARGIN(STRING *str),
        INTVAL is_int_type, ARGIN_NULLOK(STRING* prefix))
{
    ASSERT_ARGS(handle_flags)
    UINTVAL len = Parrot_str_byte_length(interp, str);

    if (is_int_type) {
        if (info->flags & FLAG_PREC && info->prec == 0 &&
                len == 1 &&
                STRING_ord(interp, str, 0) == '0') {
            str = Parrot_str_chopn(interp, str, len);
            len = 0;
        }
        /* +, space */
        if (!len || STRING_ord(interp, str, 0) != '-') {
            if (info->flags & FLAG_PLUS) {
                STRING * const cs = CONST_STRING(interp, "+");
                str = Parrot_str_concat(interp, cs, str);
                ++len;
            }
            else if (info->flags & FLAG_SPACE) {
                STRING * const cs = CONST_STRING(interp, " ");
                str = Parrot_str_concat(interp, cs, str);
                ++len;
            }
        }

        /* # 0x ... */
        if ((info->flags & FLAG_SHARP) && prefix) {
            str = Parrot_str_concat(interp, prefix, str);
            len += Parrot_str_byte_length(interp, prefix);
        }
        /* XXX sharp + fill ??? */
    }
    else {
        /* string precision */
        if (info->flags & FLAG_PREC && info->prec == 0) {
            str = Parrot_str_chopn(interp, str, len);
            len = 0;
        }
        else if (info->flags & FLAG_PREC && info->prec < len) {
            str = Parrot_str_chopn(interp, str, -(INTVAL)(info->prec));
            len = info->prec;
        }
    }

    if ((info->flags & FLAG_WIDTH) && info->width > len) {
        STRING * const filler =
            ((info->flags & FLAG_ZERO) && !(info->flags & FLAG_MINUS))
                ? CONST_STRING(interp, "0")
                : CONST_STRING(interp, " ");
        STRING * const fill = Parrot_str_repeat(interp, filler, info->width - len);

        if (info->flags & FLAG_MINUS) { /* left-align */
            str = Parrot_str_concat(interp, str, fill);
        }
        else {                  /* right-align */
            /* signed and zero padded */
            if (info->flags & FLAG_ZERO
                && (STRING_ord(interp, str, 0) == '-' ||
                    STRING_ord(interp, str, 0) == '+')) {
                STRING * const temp = STRING_substr(interp, str, 1, len-1);
                str = Parrot_str_chopn(interp, str, -1);
                str = Parrot_str_concat(interp, str, fill);
                str = Parrot_str_concat(interp, str, temp);
            }
            else {
                str = Parrot_str_concat(interp, fill, str);
            }
        }
    }
    return str;
}

/*

=item C<static STRING* str_concat_w_flags(PARROT_INTERP, STRING *dest, const
SpfInfo *info, STRING *src, STRING *prefix)>

Used by Parrot_sprintf_format.  Prepends supplied prefix for numeric
values. (e.g. 0x for hex.)

Returns the pointer to the modified string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
str_concat_w_flags(PARROT_INTERP, ARGOUT(STRING *dest), ARGIN(const SpfInfo *info),
        ARGMOD(STRING *src), ARGIN_NULLOK(STRING *prefix))
{
    ASSERT_ARGS(str_concat_w_flags)
    src = handle_flags(interp, info, src, 1, prefix);
    dest = Parrot_str_concat(interp, dest, src);
    return dest;
}

/*

=item C<static void gen_sprintf_call(char *out, SpfInfo *info, int thingy)>

Turn the info structure back into an sprintf format. Far from being
pointless, this is used to call C<snprintf()> when we're confronted with
a float.

=cut

*/

static void
gen_sprintf_call(ARGOUT(char *out), ARGMOD(SpfInfo *info), int thingy)
{
    ASSERT_ARGS(gen_sprintf_call)

    const int flags = info->flags;
    char *p = out;
    *p++ = '%';

    if (flags) {
        if (flags & FLAG_MINUS)
            *p++ = '-';

        if (flags & FLAG_PLUS)
            *p++ = '+';

        if (flags & FLAG_ZERO)
            *p++ = '0';

        if (flags & FLAG_SPACE)
            *p++ = ' ';

        if (flags & FLAG_SHARP)
            *p++ = '#';

        if (flags & FLAG_WIDTH) {
            if (info->width > PARROT_SPRINTF_BUFFER_SIZE - 1)
                info->width = PARROT_SPRINTF_BUFFER_SIZE;

            p += sprintf(p, "%u", (unsigned)info->width);
        }

        if (flags & FLAG_PREC) {
            if (info->prec > PARROT_SPRINTF_MAX_PREC)
                info->prec = PARROT_SPRINTF_MAX_PREC;

            *p++ = '.';
            p += sprintf(p, "%u", (unsigned)info->prec);
        }
    }

    if (thingy == 'd' || thingy == 'i' ||thingy == 'u') {
        /* the u?int isa HUGEU?INTVAL aka long long
         * the 'll' modifier is specced in susv3 - hopefully all our
         * compilers support it too */
        *p++ = 'l';
        *p++ = 'l';
    }

    *p++ = (char)thingy;
    *p = '\0';
}

/*

=item C<static void canonicalize_exponent(char *tc, const SpfInfo *info)>

This function is called to canonicalize any exponent in a formatted
float. PARROT_SPRINTF_EXP_DIGITS specifies the standard number of exponent
digits that we want. Remember that the exponent has the form "...Esddd",
where "s" is the sign, "ddd" is some number of digits, and there may be
trailing spaces.

=cut

*/

static void
canonicalize_exponent(ARGMOD(char *tc), ARGIN(const SpfInfo *info))
{
    ASSERT_ARGS(canonicalize_exponent)

    const size_t exp_digits = PARROT_SPRINTF_EXP_DIGITS;
    size_t len      = strlen(tc);
    size_t last_pos = len;
    size_t non0_pos = len;
    size_t sign_pos = 0;
    size_t e_pos    = 0;
    int i;

    /* Scan the formatted number backward to find the positions of the
       last digit, leftmost non-0 exponent digit, sign, and E. */

    for (i = len-1; i >= 0 && e_pos == 0; --i) {
        switch (tc[i]) {
            case '1': case '2': case '3':
            case '4': case '5': case '6':
            case '7': case '8': case '9':   non0_pos = i;
                                            /* fall through */

            case '0':                       if (last_pos == len) last_pos = i;
                                            break;

            case '+': case '-':             sign_pos = i;
                                            break;

            case 'E': case 'e':             e_pos = i;
                                            break;

            default:                        break;
        }
    }

    /* If there is an E, and it is followed by a sign, and there are
       leading zeroes on the exponent, and there are more than the
       standard number of exponent digits, then we have work to do. */

    if (e_pos != 0 && sign_pos == e_pos + 1 &&
        non0_pos > sign_pos + 1 &&
        last_pos - sign_pos > exp_digits) {

        /* Close up to eliminate excess exponent digits and
           adjust the length. Don't forget to move the NUL. */

        const size_t keep = (last_pos - non0_pos + 1 > exp_digits)
                        ? len - non0_pos
                        : exp_digits + (len - last_pos - 1);

        mem_sys_memmove(&tc[sign_pos+1], &tc[len - keep], keep+1);
        len = sign_pos + 1 + keep;

        /* If it's a fixed-width field and we're too short now,
           we have more work to do. If the field is left-justified,
           pad the number on the right. Otherwise pad the number on
           the left, possibly with leading zeroes. */

        if ((info->flags & FLAG_WIDTH) && len < info->width) {
            if (info->flags & FLAG_MINUS) {
                while (len < info->width) {
                    strcat(tc, " ");
                    ++len;
                }
            }
            else {
                size_t i;
                mem_sys_memmove(&tc[info->width - len], &tc[0], len+1);
                for (i = 0; i < info->width - len; ++i)
                    tc[i] = (info->flags & FLAG_ZERO) ? '0' : ' ';
            }
        }
    }
}

/*

=item C<STRING * Parrot_sprintf_format(PARROT_INTERP, const STRING *pat,
SPRINTF_OBJ *obj)>

This is the engine that does all the formatting.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_sprintf_format(PARROT_INTERP, ARGIN(const STRING *pat), ARGMOD(SPRINTF_OBJ *obj))
{
    ASSERT_ARGS(Parrot_sprintf_format)
    INTVAL i;
    INTVAL len     = 0;
    INTVAL old     = 0;
    const INTVAL pat_len = (INTVAL)Parrot_str_length(interp, pat);
    HUGEINTVAL num;

    /* start with a buffer; double the pattern length to avoid realloc #1 */
    STRING *targ = Parrot_str_new_noinit(interp, pat_len * 2);

    /* ts is used almost universally as an intermediate target;
     * tc is used as a temporary buffer by Parrot_str_from_uint and
     * as a target by gen_sprintf_call.
     */
    STRING *substr = NULL;
    char tc[PARROT_SPRINTF_BUFFER_SIZE];

    for (i = 0; i < pat_len; ++i) {
        if (STRING_ord(interp, pat, i) == '%') {        /* % */
            if (len) {
                substr = STRING_substr(interp, pat, old, len);
                /* XXX This shouldn't modify targ the pointer */
                targ = Parrot_str_concat(interp, targ, substr);
            }
            len = 0;
            old = i;
            if (STRING_ord(interp, pat, i + 1) == '%') {
                /* skip this one, make next the first char
                 * of literal sequence, starting at old */
                ++i;
                ++old;
                ++len;
                continue;
            }
            else {
                /* hoo boy, here we go... */

                HUGEINTVAL sharedint = 0;

                /* Storage for flags, etc. */
                SpfInfo info = { 0, 0, 0, 0, (PHASE)0 };

                /* Reset temporaries */
                tc[0] = '\0';

/*  This can be really hard to understand, so I'll try to explain beforehand.
 *  A rough grammar for a printf format is:
 *
 *  grammar Parrot::PrintF_Format {
 *      rule format {
 *          <other_stuff> (<field> <other_stuff>)*
 *      }
 *
 *      rule other_stuff {
 *          [<[^\%]> | \%\%]*:
 *      }
 *
 *      rule field {
 *          \%
 *          <flags>?
 *          <width>?
 *          [\.<prec>]?
 *          <size>?
 *          <term>
 *      }
 *
 *      rule flags {
 *          <[
 *              +       # prefix with a + if necessary
 *              -       # left-align
 *              0       # zero-pad
 *              <sp>    # space-pad
 *              \#      # 0, 0x on octal, hex; force decimal point on float
 *          ]>+
 *      }
 *
 *      rule width {
 *          [\d|\*]+    # minimum width
 *      }
 *
 *      rule prec {
 *          [\d|\*]+    # width on integers;
 *                      # number of digits after decimal on floats;
 *                      # maximum width on strings
 *      }
 *
 *      rule size {
 *          <[
 *              h       # short (or float)
 *              l       # long
 *              H       # HUGEwhateverVAL (long [long]?, [long]? double)
 *              v       # whateverVAL
 *              O       # opcode_t
 *              P       # really a PMC
 *              S       # Parrot string (only with %s)
 *          ]>
 *      }
 *
 *      rule term {
 *          <[
 *              c       # char
 *              d       # integer
 *              i       # integer
 *              o       # octal
 *              x       # hex
 *              X       # hex with capital X (if #)
 *              b       # binary
 *              B       # binary with capital B (if #)
 *              u       # unsigned integer
 *              p       # pointer
 *
 *              e       # 1e1
 *              E       # 1E1
 *              f       # 1.0
 *              g       # 1, 0.1, 1e1
 *              G       # 1, 0.1, 1E1
 *
 *              s       # string
 *          ]>
 *      }
 *  }
 *
 *      Complication: once upon a time, %P existed.  Now you should
 *      use %Ps, %Pd or %Pf, but we still need to support the old form.
 *      The same is true of %S--%Ss is the best form, but %S is still
 *      supported.
 *
 *  The implementation of Parrot_vsprintf is surprisingly similar to this
 *  regex, even though the two were developed semi-independently.
 *  Parrot_vsprintf keeps track of what it expects to see next (the
 *  'phase')--flags, width, precision, size, or field type (term).  If it
 *  doesn't find a character that fits whatever it's expecting, it sets
 *  info.phase to the next thing and tries it.  The first four phases just
 *  set flags--the last does all the work.
 */

                for (++i; i < pat_len && info.phase != PHASE_DONE; ++i) {
                    const INTVAL ch = STRING_ord(interp, pat, i);

                    switch (info.phase) {
                    /*@fallthrough@ */ case PHASE_FLAGS:
                        switch (ch) {
                          case '-':
                            info.flags |= FLAG_MINUS;
                            continue;

                          case '+':
                            info.flags |= FLAG_PLUS;
                            continue;

                          case '0':
                            info.flags |= FLAG_ZERO;
                            continue;

                          case ' ':
                            info.flags |= FLAG_SPACE;
                            continue;

                          case '#':
                            info.flags |= FLAG_SHARP;
                            continue;

                          default:
                            info.phase = PHASE_WIDTH;
                        }


                    /*@fallthrough@ */ case PHASE_WIDTH:
                        switch (ch) {
                          case '0':
                          case '1':
                          case '2':
                          case '3':
                          case '4':
                          case '5':
                          case '6':
                          case '7':
                          case '8':
                          case '9':
                            info.flags |= FLAG_WIDTH;
                            info.width *= 10;
                            info.width += ch - '0';
                            continue;

                          case '*':
                            info.flags |= FLAG_WIDTH;
                            num = obj->getint(interp, SIZE_XVAL, obj);
                            if (num < 0) {
                                info.flags |= FLAG_MINUS;
                                info.width = -num;
                            }
                            else {
                                info.width = num;
                            }
                            continue;

                          case '.':
                            info.phase = PHASE_PREC;
                            continue;

                          default:
                            info.phase = PHASE_PREC;
                        }


                    /*@fallthrough@ */ case PHASE_PREC:
                        switch (ch) {
                          case '0':
                          case '1':
                          case '2':
                          case '3':
                          case '4':
                          case '5':
                          case '6':
                          case '7':
                          case '8':
                          case '9':
                            info.flags |= FLAG_PREC;
                            info.prec *= 10;
                            info.prec += ch - '0';
                            continue;

                          case '*':
                            info.flags |= FLAG_PREC;
                            info.prec = (UINTVAL)obj->getint(interp,
                                                     SIZE_XVAL, obj);
                            info.phase = PHASE_TYPE;
                            continue;

                          default:
                            info.phase = PHASE_TYPE;
                        }

                    /*@fallthrough@ */ case PHASE_TYPE:
                        switch (ch) {
                          case 'h':
                            info.type = SIZE_SHORT;
                            continue;

                          case 'l':
                            info.type = SIZE_LONG;
                            continue;

                          case 'L':
                          case 'H':
                            info.type = SIZE_HUGE;
                            continue;

                          case 'v':
                            info.type = SIZE_XVAL;
                            continue;

                          case 'O':
                            info.type = SIZE_OPCODE;
                            continue;

                          case 'P':
                            info.type = SIZE_PMC;
                            continue;

                          case 'S':
                            info.type = SIZE_PSTR;
                            continue;

                          default:
                            info.phase = PHASE_TERM;
                        }


                    /*@fallthrough@ */ case PHASE_TERM:
                        switch (ch) {
                            /* INTEGERS */
                          case 'c':
                            {
                            STRING * const ts = Parrot_str_chr(interp,
                                 (UINTVAL)obj->getint(interp, info.type, obj));
                            targ = str_concat_w_flags(interp, targ, &info, ts, NULL);
                            }
                            break;

                          case 'o':
                            {
                            const UHUGEINTVAL theuint =
                                obj->getuint(interp, info.type, obj);
                            STRING * const ts    =
                                Parrot_str_from_uint(interp, tc, theuint, 8, 0);
                            STRING * const prefix = CONST_STRING(interp, "0");

                            /* unsigned conversion - no plus */
                            info.flags &= ~FLAG_PLUS;
                            targ        = str_concat_w_flags(interp, targ,
                                            &info, ts, prefix);
                            }
                            break;

                          case 'x':
                            {
                            const UHUGEINTVAL theuint =
                                obj->getuint(interp, info.type, obj);
                            STRING * const ts         =
                                Parrot_str_from_uint(interp, tc, theuint, 16, 0);
                            STRING * const prefix = CONST_STRING(interp, "0x");

                            /* unsigned conversion - no plus */
                            info.flags &= ~FLAG_PLUS;
                            targ        = str_concat_w_flags(interp, targ,
                                            &info, ts, prefix);
                            }
                            break;

                          case 'X':
                            {
                            STRING * const prefix = CONST_STRING(interp, "0X");
                            const UHUGEINTVAL theuint =
                                obj->getuint(interp, info.type, obj);
                            STRING * ts =
                                Parrot_str_from_uint(interp, tc, theuint, 16, 0);
                            ts = Parrot_str_upcase(interp, ts);

                            /* unsigned conversion - no plus */
                            info.flags &= ~FLAG_PLUS;
                            targ        = str_concat_w_flags(interp, targ,
                                            &info, ts, prefix);
                            }
                            break;

                          case 'b':
                            {
                            STRING * const prefix = CONST_STRING(interp, "0b");
                            const UHUGEINTVAL theuint =
                                obj->getuint(interp, info.type, obj);
                            STRING * const ts =
                                Parrot_str_from_uint(interp, tc, theuint, 2, 0);

                            /* unsigned conversion - no plus */
                            info.flags &= ~FLAG_PLUS;
                            targ        = str_concat_w_flags(interp, targ,
                                            &info, ts, prefix);
                            }
                            break;

                          case 'B':
                            {
                            STRING * const prefix = CONST_STRING(interp, "0B");
                            const HUGEINTVAL theint =
                                obj->getint(interp, info.type, obj);
                            STRING * const ts =
                                Parrot_str_from_int_base(interp, tc, theint, 2);

                            /* unsigned conversion - no plus */
                            info.flags &= ~FLAG_PLUS;
                            targ        = str_concat_w_flags(interp, targ,
                                            &info, ts, prefix);
                            }
                            break;

                          case 'u':
                            {
                            const UHUGEINTVAL theuint =
                                obj->getuint(interp, info.type, obj);
                            sharedint = theuint;
                            }
                            goto do_sprintf;
                          case 'd':
                          case 'i':

                            /* EVIL: Work around bug in glibc that makes %0lld
                             * sometimes output an empty string. */
                            if (!(info.flags & FLAG_WIDTH))
                                info.flags &= ~FLAG_ZERO;

                            sharedint = obj->getint(interp, info.type, obj);
                          do_sprintf:
                            {
                            STRING *ts;
                            gen_sprintf_call(tc, &info, ch);
                            ts = cstr2pstr(tc);
                            {
                                char * const tempstr =
                                    Parrot_str_to_cstring(interp, ts);

#ifdef PARROT_HAS_SNPRINTF
                                snprintf(tc, PARROT_SPRINTF_BUFFER_SIZE,
                                         tempstr, sharedint);
#else
                                /* the buffer is 4096, so no problem here */
                                sprintf(tc, tempstr, sharedint);
#endif
                                Parrot_str_free_cstring(tempstr);
                            }
                            targ = Parrot_str_concat(interp, targ, cstr2pstr(tc));
                            }
                            break;

                          case 'p':
                            {
                            STRING * const prefix = CONST_STRING(interp, "0x");
                            const void * const ptr =
                                obj->getptr(interp, info.type, obj);
                            STRING * const ts = Parrot_str_from_uint(interp, tc,
                                       (UHUGEINTVAL) (size_t) ptr, 16, 0);

                            targ = str_concat_w_flags(interp, targ, &info,
                                    ts, prefix);
                            }
                            break;

                            /* FLOATS - We cheat on these and use snprintf. */
                          case 'e':
                          case 'E':
                          case 'f':
                          case 'g':
                          case 'G':
                            {
                            STRING *ts;
                            const HUGEFLOATVAL thefloat =
                                obj->getfloat(interp, info.type, obj);

                            /* check for Inf and NaN values */
                            if (PARROT_FLOATVAL_IS_POSINF(thefloat)) {
                                ts = cstr2pstr(PARROT_CSTRING_INF_POSITIVE);
                            }
                            else if (PARROT_FLOATVAL_IS_NEGINF(thefloat)) {
                                ts = cstr2pstr(PARROT_CSTRING_INF_NEGATIVE);
                            }
                            else if (PARROT_FLOATVAL_IS_NAN(thefloat)) {
                                ts = cstr2pstr(PARROT_CSTRING_NAN_QUIET);
                            }
                            else {
                                /* turn -0.0 into 0.0 */
                                gen_sprintf_call(tc, &info, ch);
                                ts = cstr2pstr(tc);
                            }

                            /* XXX lost precision if %Hg or whatever */
                            {
                                char * const tempstr =
                                    Parrot_str_to_cstring(interp, ts);

#ifdef PARROT_HAS_SNPRINTF
                                snprintf(tc, PARROT_SPRINTF_BUFFER_SIZE,
                                         tempstr,
                                         (double)thefloat);
#else
                                /* the buffer is 4096, so no problem here */
                                sprintf(tc, tempstr, (double)thefloat);
#endif
                                Parrot_str_free_cstring(tempstr);
                            }

                            if (ch == 'e' || ch == 'E' ||
                                ch == 'g' || ch == 'G')
                              canonicalize_exponent(tc, &info);

                            targ = Parrot_str_concat(interp, targ, cstr2pstr(tc));
                            }
                            break;

                            /* STRINGS */
                          case 'r':        /* Python repr */
                            /* XXX the right fix is to add a getrepr entry *
                             * to SPRINTF_OBJ, but for now, getstring_pmc  *
                             * is inlined and modified to call get_repr    */
                            if (obj->getstring == pmc_core.getstring) {
                                PMC * const tmp =
                                    VTABLE_get_pmc_keyed_int(interp,
                                                             ((PMC *)obj->data),
                                                             (obj->index));

                                STRING * const string = (VTABLE_get_repr(interp, tmp));
                                STRING * const ts     = handle_flags(interp, &info,
                                                    string, 0, NULL);
                                ++obj->index;

                                targ = Parrot_str_concat(interp, targ, ts);
                                break;
                            }

                          case 's':
                          CASE_s:
                            {
                            STRING * const string = obj->getstring(interp,
                                                        info.type, obj);
                            /* XXX Silently ignore? */
                            if (!STRING_IS_NULL(string)) {
                                STRING * const ts = handle_flags(interp,
                                        &info, string, 0, NULL);
                                targ = Parrot_str_concat(interp, targ, ts);
                            }
                            }
                            break;

                          default:
                            /* fake the old %P and %S commands */
                            if (info.type == SIZE_PMC
                             || info.type == SIZE_PSTR) {
                                --i;
                                goto CASE_s;
                                /* case 's' will see the SIZE_PMC or SIZE_PSTR
                                 * and assume it was %Ps (or %Ss).  Genius,
                                 * no?  */
                            }
                            else {
                                Parrot_ex_throw_from_c_args(interp, NULL,
                                    EXCEPTION_INVALID_CHARACTER,
                                    "'%c' is not a valid sprintf format", ch);
                            }
                        }

                        info.phase = PHASE_DONE;
                        break;

                      case PHASE_DONE:
                      default:
                        /* This is the terminating condition of the surrounding
                         * loop, so...
                         */
                        PANIC(interp, "We can't be here");
                    }
                }
            }

            old = i;
            --i;
        }
        else {
            ++len;
        }
    }
    if (len) {
        substr = STRING_substr(interp, pat, old, len);
        targ = Parrot_str_concat(interp, targ, substr);
    }

    return targ;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/misc.h>, F<src/misc.c>, F<src/spf_vtable.c>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
