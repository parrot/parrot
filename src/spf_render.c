/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

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

/* Per Dan's orders, we will not use sprintf if snprintf isn't
 * around for us.
 */
#ifdef _WIN32
#  define snprintf _snprintf
#endif

/*

=item C<static STRING*
uint_to_str(Interp *interpreter,
            char *tc, UHUGEINTVAL num, char base, int minus)>

Returns C<num> converted to a Parrot C<STRING>.

Note that C<base> must be defined, a default of 10 is not assumed.

If C<minus> is true then C<-> is prepended to the string representation.

=cut

*/

static STRING*
uint_to_str(Interp *interpreter,
            char *tc, UHUGEINTVAL num, char base, int minus)
{
    char cur;
    char *tail, *p;
    /* the buffer must be at least as long as this */
    tail = p = tc + sizeof(UHUGEINTVAL)*8 + 1;

    do {
        cur = (char)(num % base);
        if (cur < 10) {
            *--p = (char)('0' + cur);
        }
        else {
            *--p = (char)('a' + cur - 10);
        }
    } while (num /= base);
    if (minus)
        *--p = '-';
    return string_make(interpreter, p, tail - p, "iso-8859-1", 0);
}

/*

=item C<STRING *
int_to_str(Interp *interpreter,
           char *tc, HUGEINTVAL num, char base)>

Returns C<num> converted to a Parrot C<STRING>.

Note that C<base> must be defined, a default of 10 is not assumed.

If C<num < 0> then C<-> is prepended to the string representation.

=cut

*/

STRING *
int_to_str(Interp *interpreter,
           char *tc, HUGEINTVAL num, char base)
{
    int minus = 0;

    if (num < 0) {
        minus = 1;
        num = -num;
    }
    return uint_to_str(interpreter, tc, (UHUGEINTVAL) num, base, minus);
}

/*

=item C<static STRING *
handle_flags(Interp *interpreter,
             SpfInfo info, STRING *str, INTVAL is_int_type, const char *prefix)>

Handles C<+>, C<->, C<0>, C<#>, space, width, and prec.

=cut

*/

static STRING *
handle_flags(Interp *interpreter,
             SpfInfo info, STRING *str, INTVAL is_int_type, const char *prefix)
{
    UINTVAL len = string_length(interpreter, str);

    if (is_int_type) {
        /* +, space */
        if (string_ord(interpreter, str, 0) != '-') {
            if (info->flags & FLAG_PLUS) {
                str = string_concat(interpreter, cstr2pstr("+"), str, 0);
                len++;
            }
            else if (info->flags & FLAG_SPACE) {
                str = string_concat(interpreter, cstr2pstr(" "), str, 0);
                len++;
            }
        }
        /* XXX
         * cstr2pstr mostly uses literal chars, which should generate a
         * string with PObj_external_FLAG
         * TODO make 2 versions of this if needed
         */

        /* # */
        if ((info->flags & FLAG_SHARP) && prefix && prefix[0]) {
            str = string_concat(interpreter, cstr2pstr(prefix), str, 0);
            len += strlen(prefix);
        }
        /* XXX sharp + fill ??? */

        /* precision */
        if (info->flags & FLAG_PREC) {
            info->flags |= FLAG_WIDTH;
            if (string_ord(interpreter, str, 0) == '-' || string_ord(interpreter, str, 0) == '+') {
                info->width = info->prec + 1;
            }
            else {
                info->width = info->prec;
            }
        }
    }
    else {
        /* string precision */
        if (info->flags & FLAG_PREC && info->prec < len) {
            string_chopn(interpreter, str, -(INTVAL)(info->prec));
            len = info->prec;
        }
    }

    if ((info->flags & FLAG_WIDTH) && info->width > len) {
        STRING *fill;

        if (info->flags & FLAG_ZERO) {
            fill = cstr2pstr("0");
        }
        else {
            fill = cstr2pstr(" ");
        }

        string_repeat(interpreter, fill, info->width - len, &fill);

        if (info->flags & FLAG_MINUS) { /* left-align */
            string_append(interpreter, str, fill, 0);
        }
        else {                  /* right-align */
            /* signed and zero padded */
            if (info->flags & FLAG_ZERO
                && (string_ord(interpreter, str,0) == '-' || string_ord(interpreter, str,0) == '+')) {
                STRING *temp = 0;
                string_substr(interpreter, str, 1, len-1, &temp, 0);
                string_chopn(interpreter, str, -1);
                string_append(interpreter, str, fill, 0);
                string_append(interpreter, str, temp, 0);
            }
            else {
                str = string_concat(interpreter, fill, str, 0);
            }
        }
    }
    return str;
}

/*

=item C<static void
gen_sprintf_call(Interp *interpreter, char *out,
                 SpfInfo info, int thingy)>

Turn the info structure back into an sprintf format. Far from being
pointless, this is used to call C<snprintf()> when we're confronted with
a float.

=cut

*/

static void
gen_sprintf_call(Interp *interpreter, char *out,
                 SpfInfo info, int thingy)
{
    int i = 0;
    char tc[PARROT_SPRINTF_BUFFER_SIZE];

    STRING *ts;
    out[i++] = '%';
    if (info->flags) {
        if (info->flags & FLAG_MINUS) {
            out[i++] = '-';
        }
        if (info->flags & FLAG_PLUS) {
            out[i++] = '+';
        }
        if (info->flags & FLAG_ZERO) {
            out[i++] = '0';
        }
        if (info->flags & FLAG_SPACE) {
            out[i++] = ' ';
        }
        if (info->flags & FLAG_SHARP) {
            out[i++] = '#';
        }
    }

    if (info->flags & FLAG_WIDTH) {
        if (info->width > PARROT_SPRINTF_BUFFER_SIZE - 1) {
            info->width = PARROT_SPRINTF_BUFFER_SIZE;
        }
        ts = uint_to_str(interpreter, tc, info->width, 10, 0);
        {
            char *tempstr = string_to_cstring(interpreter, ts);
            strcpy(out + i, tempstr);
            string_cstring_free(tempstr);
        }
        i = strlen(out);
    }

    if (info->flags & FLAG_PREC) {
        if (info->prec > PARROT_SPRINTF_MAX_PREC) {
            info->prec = PARROT_SPRINTF_MAX_PREC;
        }

        out[i++] = '.';
        ts = uint_to_str(interpreter, tc, info->prec, 10, 0);
        {
            char *tempstr = string_to_cstring(interpreter, ts);
            strcpy(out + i, tempstr);
            string_cstring_free(tempstr);
        }
        i = strlen(out);
    }

    out[i++] = thingy;
    out[i] = 0;
}

/*

=item C<STRING *
Parrot_sprintf_format(Interp *interpreter, STRING *pat,
                      SPRINTF_OBJ * obj)>

This is the engine that does all the formatting.

=cut

*/

STRING *
Parrot_sprintf_format(Interp *interpreter, STRING *pat,
                      SPRINTF_OBJ * obj)
{
    INTVAL i, len, old;
    /*
     * start with some allocated buffer
     * this speeds up tracing mandel.pasm by a factor of 3
     */
    STRING *targ = string_make_empty(interpreter, enum_stringrep_one, 128);

    /* ts is used almost universally as an intermediate target;
     * tc is used as a temporary buffer by uint_to_string and
     * as a target by gen_sprintf_call.
     */
    STRING *ts;
    STRING *substr = NULL;
    char tc[PARROT_SPRINTF_BUFFER_SIZE];


    for (i = old = len = 0; i < (INTVAL) string_length(interpreter, pat); i++) {
        if (string_ord(interpreter, pat, i) == '%') {        /* % */
            if (len) {
                string_substr(interpreter, pat, old, len, &substr, 1);
                string_append(interpreter, targ, substr, 0);
            }
            len = 0;
            old = i;
            if (string_ord(interpreter, pat, i + 1) == '%') {
                /* skip this one, make next the first char
                 * of literal sequence, starting at old */
                i++;
                old++;
                len++;
                continue;
            }
            else {
                /* hoo boy, here we go... */

                /* Various data types we may need */
                void *ptr;
                STRING *string;
                HUGEFLOATVAL thefloat;
                HUGEINTVAL theint = 0;
                UHUGEINTVAL theuint = 0;

                /* Storage for flags, etc. */
                struct spfinfo_t info = { 0, 0, 0, 0, 0 };

                /* Reset temporaries */
                tc[0] = '\0';

/*  This can be really hard to understand, so I'll try to explain beforehand.
 *  A rough grammar for a printf format is:
 *
 *  grammar Parrot::PrintF_Format {
 *      rule format {
 *          <other_stuff> ( <field> <other_stuff> )*
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

                for (i++; i < (INTVAL) string_length(interpreter, pat)
                     && info.phase != PHASE_DONE; i++) {
                    INTVAL ch = string_ord(interpreter, pat, i);

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
                            info.width *= 10;
                            info.width += obj->getint(interpreter,
                                                      SIZE_XVAL, obj);
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
                            info.prec *= 10;
                            info.prec += obj->getint(interpreter,
                                                     SIZE_XVAL, obj);
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
                            string_append(interpreter, targ,
                                          obj->getchr(interpreter,
                                                      info.type, obj), 0);
                            break;

                        case 'd':
                        case 'i':
                            theint = obj->getint(interpreter, info.type, obj);
                            ts = int_to_str(interpreter, tc, theint, 10);

                            ts = handle_flags(interpreter, &info, ts, 1, NULL);

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'o':
                            theint = obj->getint(interpreter, info.type, obj);
                            ts = int_to_str(interpreter, tc, theint, 8);

                            ts = handle_flags(interpreter, &info, ts, 1, "0");

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'x':
                            theuint = obj->getuint(interpreter, info.type, obj);
                            ts = uint_to_str(interpreter, tc, theuint, 16, 0);

                            ts = handle_flags(interpreter, &info, ts, 1, "0x");

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'X':
                            theuint =
                                obj->getuint(interpreter, info.type, obj);
                            ts = uint_to_str(interpreter, tc, theuint, 16, 0);

                            ts = handle_flags(interpreter, &info, ts, 1, "0X");

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'b':
                            theuint =
                                obj->getuint(interpreter, info.type, obj);
                            ts = uint_to_str(interpreter, tc, theuint, 2, 0);

                            ts = handle_flags(interpreter, &info, ts, 1, "0b");

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'B':
                            theint = obj->getint(interpreter, info.type, obj);
                            ts = int_to_str(interpreter, tc, theint, 2);

                            ts = handle_flags(interpreter, &info, ts, 1, "0B");

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'u':
                            theuint =
                                obj->getuint(interpreter, info.type, obj);
                            ts = uint_to_str(interpreter, tc, theuint, 10, 0);

                            ts = handle_flags(interpreter, &info, ts, 1, NULL);

                            string_append(interpreter, targ, ts, 0);
                            break;

                        case 'p':
                            ptr = obj->getptr(interpreter, info.type, obj);
                            ts = uint_to_str(interpreter, tc,
                                       (HUGEINTVAL) (size_t) ptr, 16, 0);

                            ts = handle_flags(interpreter, &info, ts, 1, "0x");

                            string_append(interpreter, targ, ts, 0);
                            break;

                            /* FLOATS - We cheat on these and use snprintf. */
                        case 'e':
                        case 'E':
                        case 'f':
                        case 'g':
                        case 'G':
                            thefloat = obj->getfloat
                                (interpreter, info.type, obj);
                            /* turn -0.0 into 0.0 */
                            if( thefloat == 0.0 ) { thefloat = 0.0; }
                            gen_sprintf_call(interpreter, tc, &info, ch);
                            ts = cstr2pstr(tc);
                            /* XXX lost precision if %Hg or whatever
                               */
                            {
                                char *tempstr = string_to_cstring(interpreter,
                                                                  ts);

#ifdef HAS_SNPRINTF
                                snprintf(tc, PARROT_SPRINTF_BUFFER_SIZE,
                                         tempstr,
                                         (double)thefloat);
#else
                                /* the buffer is 4096, so no problem here */
                                sprintf(tc, tempstr, (double)thefloat);
#endif
                                string_cstring_free(tempstr);
                            }

#if _WIN32
                            /* Microsoft uses a retarded, broken, nonstandard
                             * behavior with regards to signs, exponents and
                             * precision: it doesn't count the + as part of the
                             * precision.  We'll fix it ourselves if need be.
                             * XXX this bug might also apply to %e and %E
                             */

                            if(tolower(ch) == 'g') {
                                UINTVAL j;
                                for(j=0; j < strlen(tc); j++) {
                                    if(tolower(tc[j]) == 'e' &&
                                        (tc[j+1] == '+' || tc[j+1] == '-')) {
                                        tc[j+2]='\0';
                                        strcat(tc, &(tc[j+3]));
                                    }
                                }
                            }
#endif

                            string_append(interpreter, targ, cstr2pstr(tc), 0);
                            break;

                            /* STRINGS */
                        case 's':
                        case 'r':        /* Python repr??? */
                          CASE_s:
                            string = obj->getstring
                                (interpreter, info.type, obj);

                            ts = handle_flags(interpreter, &info, string,
                                    0, NULL);

                            string_append(interpreter, targ, ts, 0);

                            break;

                        default:
                            /* fake the old %P and %S commands */
                            if (info.type == SIZE_PMC
                                || info.type == SIZE_PSTR) {
                                i--;
                                goto CASE_s;
                                /* case 's' will see the SIZE_PMC or SIZE_PSTR
                                 * and assume it was %Ps (or %Ss).  Genius,
                                 * no?
                                 */
                            }
                            else {
                                internal_exception(INVALID_CHARACTER,
                                                   "'%c' is not a valid sprintf format",
                                                   ch);
                            }
                        }

                        info.phase = PHASE_DONE;
                        break;

                    case PHASE_DONE:
                        /* This is the terminating condition of the surrounding
                         * loop, so...
                         */
                        PANIC("We can't be here");
                    }
                }
            }

            old = i;
            i--;
        }
        else {
            len++;
        }
    }
    if (len) {
        string_substr(interpreter, pat, old, len, &substr, 1);
        string_append(interpreter, targ, substr, 0);
    }

    return targ;
}

/*

=back

=head1 SEE ALSO

F<src/misc.h>, F<src/misc.c>, F<src/spf_vtable.c>.

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
