/* misc.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Miscellaneous functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

#include <stdarg.h>

typedef long HUGEINTVAL;
typedef unsigned long UHUGEINTVAL;

typedef struct spfinfo_t {
    UINTVAL flags;
    UINTVAL width;
    UINTVAL prec;
    UINTVAL type;
    UINTVAL phase;
} *SpfInfo;

#define cstr2pstr(cstr) string_make(interpreter, cstr, strlen(cstr), NULL, 0, NULL)
#define char2pstr(ch)   string_make(interpreter, &ch, 1, NULL, 0, NULL)

#define PHASE_FLAGS 0
#define PHASE_WIDTH 1
#define PHASE_PREC  2
#define PHASE_TYPE  3
#define PHASE_TERM  4
#define PHASE_DONE  5

#define FLAG_MINUS  1
#define FLAG_PLUS   2
#define FLAG_ZERO   4
#define FLAG_SPACE  8
#define FLAG_SHARP  16

#define SIZE_REG	0
#define SIZE_SHORT	1
#define SIZE_LONG	2
#define SIZE_HUGE	3
#define SIZE_XVAL	4

#define GetInt(targ, whichone) \
	switch(whichone) {	\
		case SIZE_REG:	\
			targ=(HUGEINTVAL)(int)va_arg(*args, int); \
			break; \
		case SIZE_SHORT: /* "'short int' is promoted to 'int' when passed through '...'" */ \
			targ=(HUGEINTVAL)(short)va_arg(*args, int); \
			break;\
        case SIZE_LONG: \
			targ=(HUGEINTVAL)(long)va_arg(*args, long); \
			break; \
		case SIZE_HUGE:																		\
			targ=(HUGEINTVAL)(long /*long*/)va_arg(*args, long /*long*/);					\
			break;																			\
		case SIZE_XVAL:																		\
			targ=(HUGEINTVAL)(INTVAL)va_arg(*args, INTVAL);									\
			break;																			\
	}

#define GetUInt(targ, whichone) \
	switch(whichone) { \
		case SIZE_REG: \
			targ=(UHUGEINTVAL)(unsigned int)va_arg(*args, unsigned int); \
			break; \
		case SIZE_SHORT: /* short int promoted HLAGHLAGHLAGH. See note above */ \
			targ=(UHUGEINTVAL)(unsigned short)va_arg(*args, int);				\
			break;																			\
		case SIZE_LONG:																		\
			targ=(UHUGEINTVAL)(unsigned long)va_arg(*args, unsigned long);					\
			break;																			\
		case SIZE_HUGE:																		\
			targ=(UHUGEINTVAL)(unsigned long /*long*/)va_arg(*args, unsigned long /*long*/);\
			break;																			\
		case SIZE_XVAL:																		\
			targ=(UHUGEINTVAL)(UINTVAL)va_arg(*args, UINTVAL);								\
			break;																			\
	}

/*
void int_to_str(char *, char *, HUGEINTVAL, INTVAL );
*/

void gen_sprintf_call(char *, char *, SpfInfo, int);

static void uint_to_str(char *buf1, char *buf2, UHUGEINTVAL num,
			INTVAL base) {
    int i = 0, cur;

    do {
	    cur = num % base;

	    if (cur < 10) {
	        buf2[i] = '0' + cur;
	    }
	    else {
	        buf2[i] = 'a' + cur;
	    }

	    i++;
    } while (num /= base);

    cur = i;

    for (i = 0; i <= cur; i++) {
    	buf1[i] = buf2[cur - i];
    }
}

static void int_to_str(char *buf1, char *buf2, HUGEINTVAL num, INTVAL base) {
    BOOLVAL neg;
    int i = 0, cur;

    if (num < 0) {
	    neg = 1;
	    num = -num;
    }
    else {
	    neg = 0;
    }

    do {
	    cur = num % base;

	    if (cur < 10) {
	        buf2[i] = '0' + cur;
	    }
	    else {
	        buf2[i] = 'a' + cur;
	    }

	    i++;
    } while (num /= base);

    if (neg) {
	    buf2[i++] = '-';
    }

    cur = i;

    for (i = 0; i < cur; i++) {
	    buf1[i] = buf2[cur - i - 1];
    }

    buf1[i] = 0;
}

static void Pad_it(SpfInfo info, char *buf) {
    int i;
    int len = strlen(buf);
    int howmuch = info->width - len;

    if (!info->width || howmuch == 0) {
	    return;
    }
    else if (howmuch < 0) {
	    memmove(buf, buf - howmuch, (size_t) (len + howmuch));
    }
    else if (info->flags & FLAG_MINUS) {	/* left-align */
	    for (i = 0; i < howmuch; i++) {
	        buf[i + len] = ' ';
	    }

	    buf[i + len] = 0;
    }
    else {			/* right-align */
	    memmove(buf + howmuch, buf, (size_t) len);

	    for (i = 0; i < howmuch; i++) {
	        buf[i] = ' ';
	    }
    }
}

void
gen_sprintf_call(char *buf, char *buf2, SpfInfo info, int thingy) {
    int i = 0;
    buf[i++] = '%';

    if (info->flags) {
	    if (info->flags & FLAG_MINUS) {
	        buf[i++] = '-';
	    }
	    if (info->flags & FLAG_PLUS) {
	        buf[i++] = '+';
	    }
	    if (info->flags & FLAG_ZERO) {
	        buf[i++] = '0';
	    }
	    if (info->flags & FLAG_SPACE) {
	        buf[i++] = ' ';
	    }
	    if (info->flags & FLAG_SHARP) {
	        buf[i++] = '#';
	    }
    }

    if (info->width) {
	    uint_to_str(buf + i, buf2, info->width, 10);
	    i = strlen(buf);
    }

    if (info->prec) {
	    buf[i++] = '.';
	    uint_to_str(buf + i, buf2, info->prec, 10);
	    i = strlen(buf);
    }

    buf[i++] = thingy;
    buf[i] = 0;
}

STRING *Parrot_vsprintf_s(struct Parrot_Interp *interpreter, STRING * pat,
			  va_list * args) {
    INTVAL i;
    STRING *targ = NULL;
    register char *t1 = mem_sys_allocate(4096);
    register char *t2 = mem_sys_allocate(4096);

    for (i = 0; i < (INTVAL) string_length(pat); i++) {
	    if (string_ord(pat, i) == '%') {
	        if (string_ord(pat, i + 1) == '%') {
		        i++;
	        }
	        else {
		        /* hoo boy, here we go... */
		        char *chptr;
		        STRING *string;
		        PMC *pmc;
		        double dbl;
		        register HUGEINTVAL theint = 0;
		        register UHUGEINTVAL theuint = 0;

		        struct spfinfo_t info = { 0, 0, 0, 0, 0 };

		        for (i++; i < (INTVAL) string_length(pat)
		            && info.phase != PHASE_DONE; i++) {
		            char ch = string_ord(pat, i);
                    
                    switch (info.phase) {
    /*@fallthrough@*/case PHASE_FLAGS:
			                switch (ch) {
			                case '-':
			                    info.flags |= FLAG_MINUS;
			                    break;

			                case '+':
			                    info.flags |= FLAG_PLUS;
			                    break;

			                case '0':
			                    info.flags |= FLAG_ZERO;
			                    break;

			                case ' ':
			                    info.flags |= FLAG_SPACE;
			                    break;

			                case '#':
			                    info.flags |= FLAG_SHARP;
			                    break;

			                default:
			                    info.phase = PHASE_WIDTH;
			                }
                                    

    /*@fallthrough@*/case PHASE_WIDTH:
			                switch (ch) {
			                    case '0':
			                    case '1':
			                    case '2':
			                    case '3':
			                    case '4':
			                    case '5':
			                    case '6':
			                    case '8':
			                    case '9':
			                        info.width *= 10;
			                        info.width += ch - '0';
			                        break;

			                    case '.':
			                        info.phase = PHASE_PREC;
			                        continue;

			                    default:
			                        info.phase = PHASE_PREC;
    		            }

    /*@fallthrough@*/case PHASE_PREC:
			                switch (ch) {
			                    case '0':
			                    case '1':
			                    case '2':
			                    case '3':
			                    case '4':
			                    case '5':
			                    case '6':
			                    case '8':
			                    case '9':
			                        info.prec *= 10;
			                        info.prec += ch - '0';
			                        continue;

			                    default:
			                        info.phase = PHASE_TYPE;
			                }

    /*@fallthrough@*/case PHASE_TYPE:
			                switch (ch) {
			                    case 'h':
			                        info.type = SIZE_SHORT;
			                        break;

			                    case 'l':
			                        info.type = SIZE_LONG;
			                        break;

			                    case 'H':
			                        info.type = SIZE_HUGE;
			                        break;

			                    case 'v':
			                        info.type = SIZE_XVAL;
			                        break;

			                    default:
			                        info.phase = PHASE_TERM;
			                }

			                info.phase = PHASE_TERM;
			                continue;

    /*@fallthrough@*/case PHASE_TERM:
			                switch (ch) {
			                    /* INTEGERS */
			                    case 'c':
			                        targ =
				                    string_concat(interpreter, targ,
					                        char2pstr(ch), 0);
			                        break;

			                    case 'd':
			                    case 'i':
			                        GetInt(theint, info.type);
			                        int_to_str(t1, t2, theint, 10);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t1), 0);
			                        break;

			                    case 'o':
			                        GetInt(theint, info.type);
			                        int_to_str(t1, t2, theint, 8);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t1), 0);
			                        break;

			                    case 'x':
			                        GetInt(theint, info.type);
			                        int_to_str(t1, t2, theint, 16);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t1), 0);
			                        break;

			                    case 'u':
			                        GetUInt(theuint, info.type);
			                        uint_to_str(t1, t2, theuint, 10);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t1), 0);
			                        break;

			                    case 'p':
			                        chptr = va_arg(*args, void *);
			                        int_to_str(t1, t2, (HUGEINTVAL) chptr, 16);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t1), 0);
			                        break;

			                    /* FLOATS - We cheat on these and use the system sprintf. */
			                    case 'e':
			                        dbl = va_arg(*args, double);
			                        gen_sprintf_call(t1, t2, &info,
					                        'e');
			                        sprintf(t2, t1, dbl);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t2), 0);
			                        break;

			                    case 'E':
			                        dbl = va_arg(*args, double);
			                        gen_sprintf_call(t1, t2, &info,
					                        'E');
			                        sprintf(t2, t1, dbl);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t2), 0);
			                        break;

			                    case 'f':
			                        dbl = va_arg(*args, double);
			                        gen_sprintf_call(t1, t2, &info,
					                        (char) 'f');
			                        sprintf(t2, t1, dbl);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t2), 0);
			                        break;

			                    case 'g':
			                        dbl = va_arg(*args, double);
			                        gen_sprintf_call(t1, t2, &info,
					                        'g');
			                        sprintf(t2, t1, dbl);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t2), 0);
			                        break;

			                    case 'G':
			                        dbl = va_arg(*args, double);
			                        gen_sprintf_call(t1, t2, &info,
					                        'G');
			                        sprintf(t2, t1, dbl);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(t2), 0);
			                        break;

			                    /* STRINGS */
			                    case 's':
			                        chptr = va_arg(*args, char *);
			                        targ =
				                    string_concat(interpreter, targ,
					                        cstr2pstr(chptr), 0);
			                        break;

			                    case 'S':
			                        string = va_arg(*args, STRING *);
			                        targ =
				                    string_concat(interpreter, targ, string,
					                        0);
			                        break;

			                    case 'P':
			                        pmc = va_arg(*args, PMC *);
			                        targ =
				                    string_concat(interpreter, targ,
					                        pmc->vtable->
					                        get_string(interpreter, pmc),
					                        0);
			                        break;

			                }

			                info.phase = PHASE_DONE;
		            }
		        }
	        }

	        i--;
	    }
	    else {
	        STRING *substr = NULL;
	        string_substr(interpreter, pat, i, 1, &substr);
	        targ = string_concat(interpreter, targ, substr, 0);
	    }
    }

    mem_sys_free(t1);
    mem_sys_free(t2);

    return targ;
}


STRING *Parrot_vsprintf_c(struct Parrot_Interp * interpreter, const char *pat,
			  va_list * args) {
    STRING *realpat =
	string_make(interpreter, pat, strlen(pat), NULL, 0, NULL);

    return Parrot_vsprintf_s(interpreter, realpat, args);
}
void
Parrot_vsprintf(struct Parrot_Interp *interpreter, char *targ, const char *pat,
		va_list * args) {
    STRING *ret = Parrot_vsprintf_c(interpreter, pat, args);
/*	string_transcode(interpreter, ret, NULL, NULL, &ret);*/

    memcpy(targ, ret->bufstart, ret->bufused);
    targ[ret->bufused + 1] = 00;
}

void
Parrot_vsnprintf(struct Parrot_Interp *interpreter, char *targ,
		 UINTVAL len, const char *pat, va_list * args) {
    STRING *ret = Parrot_vsprintf_c(interpreter, pat, args);
    string_transcode(interpreter, ret, NULL, NULL, &ret);

    if (len > ret->bufused) {
	    len = ret->bufused;
    }

    memcpy(targ, ret->bufstart, len);
    targ[len + 1] = 0;
}

STRING *Parrot_sprintf_s(struct Parrot_Interp *interpreter, STRING * pat,
			 ...) {
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_s(interpreter, pat, &args);

    va_end(args);

    return ret;
}

STRING *Parrot_sprintf_c(struct Parrot_Interp * interpreter, const char *pat,
			 ...) {
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_c(interpreter, pat, &args);

    va_end(args);

    return ret;
}

void
Parrot_sprintf(struct Parrot_Interp *interpreter, char *targ, const char *pat,
	       ...) {
    va_list args;

    va_start(args, pat);

    Parrot_vsprintf(interpreter, targ, pat, &args);

    va_end(args);
}

void
Parrot_snprintf(struct Parrot_Interp *interpreter, char *targ, UINTVAL len,
		const char *pat, ...) {
    va_list args;

    va_start(args, pat);

    Parrot_vsnprintf(interpreter, targ, len, pat, &args);

    va_end(args);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
