#include "parrot/parrot.h"

#include <stdarg.h>

typedef long HUGEINTVAL;
typedef unsigned long UHUGEINTVAL;

typedef struct spfinfo_t {
	INTVAL flags;
	INTVAL width;
	INTVAL prec;
	INTVAL type;
	INTVAL phase;
} * SpfInfo;

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

#define GetInt(targ, whichone)																\
	switch(whichone) {																		\
		case SIZE_REG:																		\
			targ=(HUGEINTVAL)(int)va_arg(*args, int);										\
			break;																			\
		case SIZE_SHORT:																	\
			targ=(HUGEINTVAL)(short)va_arg(*args, short);									\
			break;																			\
		case SIZE_LONG:																		\
			targ=(HUGEINTVAL)(long)va_arg(*args, long);										\
			break;																			\
		case SIZE_HUGE:																		\
			targ=(HUGEINTVAL)(long /*long*/)va_arg(*args, long /*long*/);					\
			break;																			\
		case SIZE_XVAL:																		\
			targ=(HUGEINTVAL)(INTVAL)va_arg(*args, INTVAL);									\
			break;																			\
	}

#define GetUInt(targ, whichone)																\
	switch(whichone) {																		\
		case SIZE_REG:																		\
			targ=(UHUGEINTVAL)(unsigned int)va_arg(*args, unsigned int);					\
			break;																			\
		case SIZE_SHORT:																	\
			targ=(UHUGEINTVAL)(unsigned short)va_arg(*args, unsigned short);				\
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

void
uint_to_str(char *buf1, char *buf2, UHUGEINTVAL num, INTVAL base) {
	int i=0, cur;

	do {
		cur=num % base;

		if(cur < 10) {
			buf2[i]='0'+cur;
		}
		else {
			buf2[i]='a'+cur;
		}
		
		i++;
	} while(num /= base);

	cur=i;

	for(i=0; i <= cur; i++) {
		buf1[i]=buf2[cur-i];
	}
}

void
int_to_str(char *buf1, char *buf2, HUGEINTVAL num, INTVAL base) {
	BOOLVAL neg;
	int i=0, cur;

	if(num < 0) {
		neg=1;
		num= -num;
	}
	else {
		neg=0;
	}

	do {
		cur=num % base;

		if(cur < 10) {
			buf2[i]='0'+cur;
		}
		else {
			buf2[i]='a'+cur;
		}
		
		i++;
	} while(num /= base);

	if(neg) {
		buf2[i++]='-';
	}
	
	cur=i;
	
	for(i=0; i < cur; i++) {
		buf1[i]=buf2[cur-i-1];
	}

	buf1[i]=0;
}

void
Pad_it(SpfInfo info, char *buf) {
	int i;
	int len=strlen(buf);
	int howmuch=info->width - len;
	
	if(!info->width || howmuch == 0) {
		return;
	}
	else if(howmuch < 0) {
		memmove(buf, buf-howmuch, len+howmuch);
	}
	else if(info->flags & FLAG_MINUS) { //left-align
		for(i=0; i < howmuch; i++) {
			buf[i+len]=' ';
		}

		buf[i+len]=0;
	}
	else { //right-align
		memmove(buf+howmuch, buf, len);

		for(i=0; i < howmuch; i++) {
			buf[i]=' ';
		}
	}
}

void
gen_sprintf_call(char *buf, char* buf2, SpfInfo info, char thingy) {
	int i=0;
	buf[i++]='%';

	if(info->flags) {
		if(info->flags & FLAG_MINUS) {
			buf[i++]='-';
		}
		if(info->flags & FLAG_PLUS) {
			buf[i++]='+';
		}
		if(info->flags & FLAG_ZERO) {
			buf[i++]='0';
		}
		if(info->flags & FLAG_SPACE) {
			buf[i++]=' ';
		}
		if(info->flags & FLAG_SHARP) {
			buf[i++]='#';
		}
	}

	if(info->width) {
		int_to_str(buf+i, buf2, info->width, 10);
		i=strlen(buf);
	}

	if(info->prec) {
		buf[i++]='.';
		int_to_str(buf+i, buf2, info->prec, 10);
		i=strlen(buf);
	}

	buf[i++]=thingy;
	buf[i]=0;
}

STRING *
Parrot_vsprintf_s(struct Parrot_Interp *interpreter, STRING* pat, va_list *args) {
	INTVAL i;
	STRING* targ=NULL;
	register char	*	t1=mem_sys_allocate(4096);
	register char	*	t2=mem_sys_allocate(4096);

	for(i=0; i < string_length(pat); i++) {
		if(string_ord(pat, i) == '%') {
			if(string_ord(pat, i+1) == '%') {
				i++;
			}
			else {
				/* hoo boy, here we go... */
				         char	*		chptr;
				         STRING	*		string;
                         PMC    *       pmc;
				         double 		dbl;
				         FLOATVAL		fv;
				register HUGEINTVAL		theint;
				register UHUGEINTVAL	theuint;
	
				struct spfinfo_t info={0, 0, 0, 0, 0};
	
				for(i++; i < string_length(pat) && info.phase != PHASE_DONE; i++) {
					char ch=string_ord(pat, i);
AGAIN:
					switch(info.phase) {
						case PHASE_FLAGS:
							switch(ch) {
								case '-':
									info.flags |= FLAG_MINUS; break;
			
								case '+':
									info.flags |= FLAG_PLUS;  break;

								case '0':
									info.flags |= FLAG_ZERO;  break;

								case ' ':
									info.flags |= FLAG_SPACE; break;

								case '#':
									info.flags |= FLAG_SHARP; break;

								default:
									info.phase=PHASE_WIDTH;
									goto AGAIN;
							}

						case PHASE_WIDTH:
							switch(ch) {
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
									info.width += ch-'0';
									break;
							
								case '.':
									info.phase=PHASE_PREC;
									continue;

								default:
									info.phase=PHASE_PREC;
									goto AGAIN;
							}

						case PHASE_PREC:
							switch(ch) {
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
									info.prec += ch-'0';
									continue;
							
								default:
									info.phase=PHASE_TYPE;
									goto AGAIN;
							}

						case PHASE_TYPE:
							switch(ch) {
								case 'h':
									info.type=SIZE_SHORT; break;

								case 'l':
									info.type=SIZE_LONG; break;

								case 'H':
									info.type=SIZE_HUGE; break;

								case 'v':
									info.type=SIZE_XVAL; break;

								default:
									info.phase=PHASE_TERM;
									goto AGAIN;
							}

							info.phase=PHASE_TERM;
							continue;

						case PHASE_TERM:
							switch(ch) {
								/* INTEGERS */
								case 'c':
									targ=string_concat(interpreter, targ, char2pstr(ch), 0);
									break;

								case 'd':
								case 'i':
									GetInt(theint, info.type);
									int_to_str(t1, t2, theint, 10);
									targ=string_concat(interpreter, targ, cstr2pstr(t1), 0);
									break;

								case 'o':
									GetInt(theint, info.type);
									int_to_str(t1, t2, theint, 8);
									targ=string_concat(interpreter, targ, cstr2pstr(t1), 0);
									break;

								case 'x':
									GetInt(theint, info.type);
									int_to_str(t1, t2, theint, 16);
									targ=string_concat(interpreter, targ, cstr2pstr(t1), 0);
									break;

								case 'u':
									GetUInt(theuint, info.type);
									uint_to_str(t1, t2, theuint, 10);
									targ=string_concat(interpreter, targ, cstr2pstr(t1), 0);
									break;

								case 'p':
									chptr=va_arg(*args, void*);
									int_to_str(t1, t2, (HUGEINTVAL)chptr, 16);
									targ=string_concat(interpreter, targ, cstr2pstr(t1), 0);
									break;

								/* FLOATS - We cheat on these and use the system sprintf. */
								case 'e':
									dbl=va_arg(*args, double);
									gen_sprintf_call(t1, t2, &info, 'e');
									sprintf(t2, t1, dbl);
									targ=string_concat(interpreter, targ, cstr2pstr(t2), 0);
									break;

								case 'E':
									dbl=va_arg(*args, double);
									gen_sprintf_call(t1, t2, &info, 'E');
									sprintf(t2, t1, dbl);
									targ=string_concat(interpreter, targ, cstr2pstr(t2), 0);	
									break;

								case 'f':
									dbl=va_arg(*args, double);
									gen_sprintf_call(t1, t2, &info, 'f');
									sprintf(t2, t1, dbl);
									targ=string_concat(interpreter, targ, cstr2pstr(t2), 0);
									break;

								case 'g':
									dbl=va_arg(*args, double);
									gen_sprintf_call(t1, t2, &info, 'g');
									sprintf(t2, t1, dbl);
									targ=string_concat(interpreter, targ, cstr2pstr(t2), 0);
									break;

								case 'G':
									dbl=va_arg(*args, double);
									gen_sprintf_call(t1, t2, &info, 'G');
									sprintf(t2, t1, dbl);
									targ=string_concat(interpreter, targ, cstr2pstr(t2), 0);
									break;

								/* STRINGS */
								case 's':
									chptr=va_arg(*args, char*);
									targ=string_concat(interpreter, targ, cstr2pstr(chptr), 0);
									break;

								case 'S':
									string=va_arg(*args, STRING*);
									targ=string_concat(interpreter, targ, string, 0);
									break;

                                case 'P':
									pmc=va_arg(*args, PMC*);
									targ=string_concat(interpreter, targ, pmc->vtable->get_string(interpreter, pmc), 0);
									break;

                                case 'P':

							}

							info.phase=PHASE_DONE;
					}
				}
			}

			i--;
		}
		else {
			STRING* substr=NULL;
			string_substr(interpreter, pat, i, 1, &substr);
			targ=string_concat(interpreter, targ, substr,0);
		}
	}

	mem_sys_free(t1);
	mem_sys_free(t2);

	return targ;
}


STRING *
Parrot_vsprintf_c(struct Parrot_Interp *interpreter, char *pat, va_list *args) {
	STRING *realpat=string_make(interpreter, pat, strlen(pat), NULL, 0, NULL);

	return Parrot_vsprintf_s(interpreter, realpat, args);
}
void
Parrot_vsprintf(struct Parrot_Interp *interpreter, char *targ, char *pat, va_list *args) {
	STRING *ret=Parrot_vsprintf_c(interpreter, pat, args);
/*	string_transcode(interpreter, ret, NULL, NULL, &ret);*/

	memcpy(targ, ret->bufstart, ret->bufused);
	targ[ret->bufused+1]=00;
}

void
Parrot_vsnprintf(struct Parrot_Interp *interpreter, char *targ, UINTVAL len, char *pat, va_list *args) {
	STRING *ret=Parrot_vsprintf_c(interpreter, pat, args);
	string_transcode(interpreter, ret, NULL, NULL, &ret);

	if(len > ret->bufused) {
		len=ret->bufused;
	}

	memcpy(targ, ret->bufstart, len);
	targ[len+1]=0;
}

STRING *
Parrot_sprintf_s(struct Parrot_Interp *interpreter, STRING* pat, ...)
{
	STRING *ret;
	va_list args;

	va_start(args, pat);

	ret=Parrot_vsprintf_s(interpreter, pat, &args);

	va_end(args);

	return ret;
}

STRING *
Parrot_sprintf_c(struct Parrot_Interp *interpreter, char* pat, ...) {
	STRING *ret;
	va_list args;

	va_start(args, pat);

	ret=Parrot_vsprintf_c(interpreter, pat, &args);

	va_end(args);

	return ret;
}

void
Parrot_sprintf(struct Parrot_Interp *interpreter, char* targ, char* pat, ...) {
	va_list args;

	va_start(args, pat);

	Parrot_vsprintf(interpreter, targ, pat, &args);

	va_end(args);
}

void
Parrot_snprintf(struct Parrot_Interp *interpreter, char* targ, UINTVAL len, char* pat, ...) {
	va_list args;

	va_start(args, pat);

	Parrot_vsnprintf(interpreter, targ, len, pat, &args);

	va_end(args);
}

#if 0
void   /* barely started conversion to Parrot, but abandoned it. */
perl5s_vsprintf(struct Parrot_Interp *interpreter, STRING *targ, const char *pat, INTVAL patlen, va_list *args)
{
    char *p;
    char *q;
    char *patend;
    INTVAL origlen;
    INTVAL svix = 0;
    static char nullstr[] = "(null)";
    STRING *argsv = NULL;

    /* special-case "", "%s", and "%_" */
	if (patlen == 0) {
		return;
	}

    if (patlen == 2 && pat[0] == '%') {
	switch (pat[1]) {
	case 's':
	    if (args) {
			char *s = va_arg(*args, char*);
			//sv_catpv(sv, s ? s : nullstr);
			targ=string_concat(interpreter, "
	    }
	    else if (svix < svmax) {
		sv_catsv(sv, *svargs);
		if (DO_UTF8(*svargs))
		    SvUTF8_on(sv);
	    }
	    return;
	case '_':
	    if (args) {
		argsv = va_arg(*args, SV*);
		sv_catsv(sv, argsv);
		if (DO_UTF8(argsv))
		    SvUTF8_on(sv);
		return;
	    }
	    /* See comment on '_' below */
	    break;
	}
    }

    patend = (char*)pat + patlen;
    for (p = (char*)pat; p < patend; p = q) {
	bool alt = FALSE;
	bool left = FALSE;
	bool vectorize = FALSE;
	bool vectorarg = FALSE;
	bool vec_utf = FALSE;
	char fill = ' ';
	char plus = 0;
	char intsize = 0;
	INTVAL width = 0;
	INTVAL zeros = 0;
	bool has_precis = FALSE;
	INTVAL precis = 0;
	bool is_utf = FALSE;
	
	char esignbuf[4];
	U8 utf8buf[UTF8_MAXLEN+1];
	INTVAL esignlen = 0;

	char *eptr = Nullch;
	INTVAL elen = 0;
	/* Times 4: a decimal digit takes more than 3 binary digits.
	 * NV_DIG: mantissa takes than many decimal digits.
	 * Plus 32: Playing safe. */
	char ebuf[IV_DIG * 4 + NV_DIG + 32];
        /* large enough for "%#.#f" --chip */
	/* what about long double NVs? --jhi */

	SV *vecsv;
	U8 *vecstr = Null(U8*);
	INTVAL veclen = 0;
	char c;
	int i;
	unsigned base = 0;
	IV iv = 0;
	UV uv = 0;
	NV nv;
	INTVAL have;
	INTVAL need;
	INTVAL gap;
	char *dotstr = ".";
	INTVAL dotstrlen = 1;
	INTVAL efix = 0; /* explicit format parameter index */
	INTVAL ewix = 0; /* explicit width index */
	INTVAL epix = 0; /* explicit precision index */
	INTVAL evix = 0; /* explicit vector index */
	bool asterisk = FALSE;

	/* echo everything up to the next format specification */
	for (q = p; q < patend && *q != '%'; ++q) ;
	if (q > p) {
	    sv_catpvn(sv, p, q - p);
	    p = q;
	}
	if (q++ >= patend)
	    break;

/*
    We allow format specification elements in this order:
	\d+\$              explicit format parameter index
	[-+ 0#]+           flags
	\*?(\d+\$)?v       vector with optional (optionally specified) arg
	\d+|\*(\d+\$)?     width using optional (optionally specified) arg
	\.(\d*|\*(\d+\$)?) precision using optional (optionally specified) arg
	[hlqLV]            size
    [%bcdefginopsux_DFOUX] format (mandatory)
*/
	if (EXPECT_NUMBER(q, width)) {
	    if (*q == '$') {
		++q;
		efix = width;
	    } else {
		goto gotwidth;
	    }
	}

	/* FLAGS */

	while (*q) {
	    switch (*q) {
	    case ' ':
	    case '+':
		plus = *q++;
		continue;

	    case '-':
		left = TRUE;
		q++;
		continue;

	    case '0':
		fill = *q++;
		continue;

	    case '#':
		alt = TRUE;
		q++;
		continue;

	    default:
		break;
	    }
	    break;
	}

      tryasterisk:
	if (*q == '*') {
	    q++;
	    if (EXPECT_NUMBER(q, ewix))
		if (*q++ != '$')
		    goto unknown;
	    asterisk = TRUE;
	}
	if (*q == 'v') {
	    q++;
	    if (vectorize)
		goto unknown;
	    if ((vectorarg = asterisk)) {
		evix = ewix;
		ewix = 0;
		asterisk = FALSE;
	    }
	    vectorize = TRUE;
	    goto tryasterisk;
	}

	if (!asterisk)
	    EXPECT_NUMBER(q, width);

	if (vectorize) {
	    if (vectorarg) {
		if (args)
		    vecsv = va_arg(*args, SV*);
		else
		    vecsv = (evix ? evix <= svmax : svix < svmax) ?
			svargs[ewix ? ewix-1 : svix++] : &PL_sv_undef;
		dotstr = SvPVx(vecsv, dotstrlen);
		if (DO_UTF8(vecsv))
		    is_utf = TRUE;
	    }
	    if (args) {
		vecsv = va_arg(*args, SV*);
		vecstr = (U8*)SvPVx(vecsv,veclen);
		vec_utf = DO_UTF8(vecsv);
	    }
	    else if (efix ? efix <= svmax : svix < svmax) {
		vecsv = svargs[efix ? efix-1 : svix++];
		vecstr = (U8*)SvPVx(vecsv,veclen);
		vec_utf = DO_UTF8(vecsv);
	    }
	    else {
		vecstr = (U8*)"";
		veclen = 0;
	    }
	}

	if (asterisk) {
	    if (args)
		i = va_arg(*args, int);
	    else
		i = (ewix ? ewix <= svmax : svix < svmax) ?
		    SvIVx(svargs[ewix ? ewix-1 : svix++]) : 0;
	    left |= (i < 0);
	    width = (i < 0) ? -i : i;
	}
      gotwidth:

	/* PRECISION */

	if (*q == '.') {
	    q++;
	    if (*q == '*') {
		q++;
		if (EXPECT_NUMBER(q, epix) && *q++ != '$') /* epix currently unused */
		    goto unknown;
		if (args)
		    i = va_arg(*args, int);
		else
		    i = (ewix ? ewix <= svmax : svix < svmax)
			? SvIVx(svargs[ewix ? ewix-1 : svix++]) : 0;
		precis = (i < 0) ? 0 : i;
	    }
	    else {
		precis = 0;
		while (isDIGIT(*q))
		    precis = precis * 10 + (*q++ - '0');
	    }
	    has_precis = TRUE;
	}

	/* SIZE */

	switch (*q) {
#if defined(HAS_QUAD) || (defined(HAS_LONG_DOUBLE) && defined(USE_LONG_DOUBLE))
	case 'L':			/* Ld */
	    /* FALL THROUGH */
#endif
#ifdef HAS_QUAD
	case 'q':			/* qd */
	    intsize = 'q';
	    q++;
	    break;
#endif
	case 'l':
#if defined(HAS_QUAD) || (defined(HAS_LONG_DOUBLE) && defined(USE_LONG_DOUBLE))
             if (*(q + 1) == 'l') {	/* lld, llf */
		intsize = 'q';
		q += 2;
		break;
	     }
#endif
	    /* FALL THROUGH */
	case 'h':
	    /* FALL THROUGH */
	case 'V':
	    intsize = *q++;
	    break;
	}

	/* CONVERSION */

	if (*q == '%') {
	    eptr = q++;
	    elen = 1;
	    goto string;
	}

	if (!args)
	    argsv = (efix ? efix <= svmax : svix < svmax) ?
		    svargs[efix ? efix-1 : svix++] : &PL_sv_undef;

	switch (c = *q++) {

	    /* STRINGS */

	case 'c':
	    uv = args ? va_arg(*args, int) : SvIVx(argsv);
	    if ((uv > 255 ||
		 (!UNI_IS_INVARIANT(uv) && SvUTF8(sv)))
		&& !IN_BYTES) {
		eptr = (char*)utf8buf;
		elen = uvchr_to_utf8((U8*)eptr, uv) - utf8buf;
		is_utf = TRUE;
	    }
	    else {
		c = (char)uv;
		eptr = &c;
		elen = 1;
	    }
	    goto string;

	case 's':
	    if (args) {
		eptr = va_arg(*args, char*);
		if (eptr)
#ifdef MACOS_TRADITIONAL
		  /* On MacOS, %#s format is used for Pascal strings */
		  if (alt)
		    elen = *eptr++;
		  else
#endif
		    elen = strlen(eptr);
		else {
		    eptr = nullstr;
		    elen = sizeof nullstr - 1;
		}
	    }
	    else {
		eptr = SvPVx(argsv, elen);
		if (DO_UTF8(argsv)) {
		    if (has_precis && precis < elen) {
			INTVAL p = precis;
			sv_pos_u2b(argsv, &p, 0); /* sticks at end */
			precis = p;
		    }
		    if (width) { /* fudge width (can't fudge elen) */
			width += elen - sv_len_utf8(argsv);
		    }
		    is_utf = TRUE;
		}
	    }
	    goto string;

	case '_':
	    /*
	     * The "%_" hack might have to be changed someday,
	     * if ISO or ANSI decide to use '_' for something.
	     * So we keep it hidden from users' code.
	     */
	    if (!args)
		goto unknown;
	    argsv = va_arg(*args, SV*);
	    eptr = SvPVx(argsv, elen);
	    if (DO_UTF8(argsv))
		is_utf = TRUE;

	string:
	    vectorize = FALSE;
	    if (has_precis && elen > precis)
		elen = precis;
	    break;

	    /* INTEGERS */

	case 'p':
	    if (alt)
		goto unknown;
	    uv = PTR2UV(args ? va_arg(*args, void*) : argsv);
	    base = 16;
	    goto integer;

	case 'D':
#ifdef IV_IS_QUAD
	    intsize = 'q';
#else
	    intsize = 'l';
#endif
	    /* FALL THROUGH */
	case 'd':
	case 'i':
	    if (vectorize) {
		INTVAL ulen;
		if (!veclen)
		    continue;
		if (vec_utf)
		    uv = utf8n_to_uvchr(vecstr, veclen, &ulen, UTF8_ALLOW_ANYUV);
		else {
		    uv = *vecstr;
		    ulen = 1;
		}
		vecstr += ulen;
		veclen -= ulen;
		if (plus)
		     esignbuf[esignlen++] = plus;
	    }
	    else if (args) {
		switch (intsize) {
		case 'h':	iv = (short)va_arg(*args, int); break;
		default:	iv = va_arg(*args, int); break;
		case 'l':	iv = va_arg(*args, long); break;
		case 'V':	iv = va_arg(*args, IV); break;
#ifdef HAS_QUAD
		case 'q':	iv = va_arg(*args, Quad_t); break;
#endif
		}
	    }
	    else {
		iv = SvIVx(argsv);
		switch (intsize) {
		case 'h':	iv = (short)iv; break;
		default:	break;
		case 'l':	iv = (long)iv; break;
		case 'V':	break;
#ifdef HAS_QUAD
		case 'q':	iv = (Quad_t)iv; break;
#endif
		}
	    }
	    if ( !vectorize )	/* we already set uv above */
	    {
		if (iv >= 0) {
		    uv = iv;
		    if (plus)
			esignbuf[esignlen++] = plus;
		}
		else {
		    uv = -iv;
		    esignbuf[esignlen++] = '-';
		}
	    }
	    base = 10;
	    goto integer;

	case 'U':
#ifdef IV_IS_QUAD
	    intsize = 'q';
#else
	    intsize = 'l';
#endif
	    /* FALL THROUGH */
	case 'u':
	    base = 10;
	    goto uns_integer;

	case 'b':
	    base = 2;
	    goto uns_integer;

	case 'O':
#ifdef IV_IS_QUAD
	    intsize = 'q';
#else
	    intsize = 'l';
#endif
	    /* FALL THROUGH */
	case 'o':
	    base = 8;
	    goto uns_integer;

	case 'X':
	case 'x':
	    base = 16;

	uns_integer:
	    if (vectorize) {
		INTVAL ulen;
	vector:
		if (!veclen)
		    continue;
		if (vec_utf)
		    uv = utf8n_to_uvchr(vecstr, veclen, &ulen, UTF8_ALLOW_ANYUV);
		else {
		    uv = *vecstr;
		    ulen = 1;
		}
		vecstr += ulen;
		veclen -= ulen;
	    }
	    else if (args) {
		switch (intsize) {
		case 'h':  uv = (unsigned short)va_arg(*args, unsigned); break;
		default:   uv = va_arg(*args, unsigned); break;
		case 'l':  uv = va_arg(*args, unsigned long); break;
		case 'V':  uv = va_arg(*args, UV); break;
#ifdef HAS_QUAD
		case 'q':  uv = va_arg(*args, Quad_t); break;
#endif
		}
	    }
	    else {
		uv = SvUVx(argsv);
		switch (intsize) {
		case 'h':	uv = (unsigned short)uv; break;
		default:	break;
		case 'l':	uv = (unsigned long)uv; break;
		case 'V':	break;
#ifdef HAS_QUAD
		case 'q':	uv = (Quad_t)uv; break;
#endif
		}
	    }

	integer:
	    eptr = ebuf + sizeof ebuf;
	    switch (base) {
		unsigned dig;
	    case 16:
		if (!uv)
		    alt = FALSE;
		p = (char*)((c == 'X')
			    ? "0123456789ABCDEF" : "0123456789abcdef");
		do {
		    dig = uv & 15;
		    *--eptr = p[dig];
		} while (uv >>= 4);
		if (alt) {
		    esignbuf[esignlen++] = '0';
		    esignbuf[esignlen++] = c;  /* 'x' or 'X' */
		}
		break;
	    case 8:
		do {
		    dig = uv & 7;
		    *--eptr = '0' + dig;
		} while (uv >>= 3);
		if (alt && *eptr != '0')
		    *--eptr = '0';
		break;
	    case 2:
		do {
		    dig = uv & 1;
		    *--eptr = '0' + dig;
		} while (uv >>= 1);
		if (alt) {
		    esignbuf[esignlen++] = '0';
		    esignbuf[esignlen++] = 'b';
		}
		break;
	    default:		/* it had better be ten or less */
#if defined(PERL_Y2KWARN)
		if (ckWARN(WARN_Y2K)) {
		    INTVAL n;
		    char *s = SvPV(sv,n);
		    if (n >= 2 && s[n-2] == '1' && s[n-1] == '9'
			&& (n == 2 || !isDIGIT(s[n-3])))
		    {
			Perl_warner(aTHX_ WARN_Y2K,
				    "Possible Y2K bug: %%%c %s",
				    c, "format string following '19'");
		    }
		}
#endif
		do {
		    dig = uv % base;
		    *--eptr = '0' + dig;
		} while (uv /= base);
		break;
	    }
	    elen = (ebuf + sizeof ebuf) - eptr;
	    if (has_precis) {
		if (precis > elen)
		    zeros = precis - elen;
		else if (precis == 0 && elen == 1 && *eptr == '0')
		    elen = 0;
	    }
	    break;

	    /* FLOATING POINT */

	case 'F':
	    c = 'f';		/* maybe %F isn't supported here */
	    /* FALL THROUGH */
	case 'e': case 'E':
	case 'f':
	case 'g': case 'G':

	    /* This is evil, but floating point is even more evil */

	    vectorize = FALSE;
	    nv = args ? va_arg(*args, NV) : SvNVx(argsv);

	    need = 0;
	    if (c != 'e' && c != 'E') {
		i = PERL_INT_MIN;
		(void)Perl_frexp(nv, &i);
		if (i == PERL_INT_MIN)
		    Perl_die(aTHX_ "panic: frexp");
		if (i > 0)
		    need = BIT_DIGITS(i);
	    }
	    need += has_precis ? precis : 6; /* known default */
	    if (need < width)
		need = width;

	    need += 20; /* fudge factor */
	    if (PL_efloatsize < need) {
		Safefree(PL_efloatbuf);
		PL_efloatsize = need + 20; /* more fudge */
		New(906, PL_efloatbuf, PL_efloatsize, char);
		PL_efloatbuf[0] = '\0';
	    }

	    eptr = ebuf + sizeof ebuf;
	    *--eptr = '\0';
	    *--eptr = c;
#if defined(USE_LONG_DOUBLE) && defined(PERL_PRIfldbl)
	    {
		/* Copy the one or more characters in a long double
		 * format before the 'base' ([efgEFG]) character to
		 * the format string. */
		static char const prifldbl[] = PERL_PRIfldbl;
		char const *p = prifldbl + sizeof(prifldbl) - 3;
		while (p >= prifldbl) { *--eptr = *p--; }
	    }
#endif
	    if (has_precis) {
		base = precis;
		do { *--eptr = '0' + (base % 10); } while (base /= 10);
		*--eptr = '.';
	    }
	    if (width) {
		base = width;
		do { *--eptr = '0' + (base % 10); } while (base /= 10);
	    }
	    if (fill == '0')
		*--eptr = fill;
	    if (left)
		*--eptr = '-';
	    if (plus)
		*--eptr = plus;
	    if (alt)
		*--eptr = '#';
	    *--eptr = '%';

	    /* No taint.  Otherwise we are in the strange situation
	     * where printf() taints but print($float) doesn't.
	     * --jhi */
	    (void)sprintf(PL_efloatbuf, eptr, nv);

	    eptr = PL_efloatbuf;
	    elen = strlen(PL_efloatbuf);
	    break;

	    /* SPECIAL */

	case 'n':
	    vectorize = FALSE;
	    i = SvCUR(sv) - origlen;
	    if (args) {
		switch (intsize) {
		case 'h':	*(va_arg(*args, short*)) = i; break;
		default:	*(va_arg(*args, int*)) = i; break;
		case 'l':	*(va_arg(*args, long*)) = i; break;
		case 'V':	*(va_arg(*args, IV*)) = i; break;
#ifdef HAS_QUAD
		case 'q':	*(va_arg(*args, Quad_t*)) = i; break;
#endif
		}
	    }
	    else
		sv_setuv_mg(argsv, (UV)i);
	    continue;	/* not "break" */

	    /* UNKNOWN */

	default:
      unknown:
	    vectorize = FALSE;
	    if (!args && ckWARN(WARN_PRINTF) &&
		  (PL_op->op_type == OP_PRTF || PL_op->op_type == OP_SPRINTF)) {
		SV *msg = sv_newmortal();
		Perl_sv_setpvf(aTHX_ msg, "Invalid conversion in %s: ",
			  (PL_op->op_type == OP_PRTF) ? "printf" : "sprintf");
		if (c) {
		    if (isPRINT(c))
			Perl_sv_catpvf(aTHX_ msg,
				       "\"%%%c\"", c & 0xFF);
		    else
			Perl_sv_catpvf(aTHX_ msg,
				       "\"%%\\%03"UVof"\"",
				       (UV)c & 0xFF);
		} else
		    sv_catpv(msg, "end of string");
		Perl_warner(aTHX_ WARN_PRINTF, "%"SVf, msg); /* yes, this is reentrant */
	    }

	    /* output mangled stuff ... */
	    if (c == '\0')
		--q;
	    eptr = p;
	    elen = q - p;

	    /* ... right here, because formatting flags should not apply */
	    SvGROW(sv, SvCUR(sv) + elen + 1);
	    p = SvEND(sv);
	    Copy(eptr, p, elen, char);
	    p += elen;
	    *p = '\0';
	    SvCUR(sv) = p - SvPVX(sv);
	    continue;	/* not "break" */
	}

	have = esignlen + zeros + elen;
	need = (have > width ? have : width);
	gap = need - have;

	SvGROW(sv, SvCUR(sv) + need + dotstrlen + 1);
	p = SvEND(sv);
	if (esignlen && fill == '0') {
	    for (i = 0; i < esignlen; i++)
		*p++ = esignbuf[i];
	}
	if (gap && !left) {
	    memset(p, fill, gap);
	    p += gap;
	}
	if (esignlen && fill != '0') {
	    for (i = 0; i < esignlen; i++)
		*p++ = esignbuf[i];
	}
	if (zeros) {
	    for (i = zeros; i; i--)
		*p++ = '0';
	}
	if (elen) {
	    Copy(eptr, p, elen, char);
	    p += elen;
	}
	if (gap && left) {
	    memset(p, ' ', gap);
	    p += gap;
	}
	if (vectorize) {
	    if (veclen) {
		Copy(dotstr, p, dotstrlen, char);
		p += dotstrlen;
	    }
	    else
		vectorize = FALSE;		/* done iterating over vecstr */
	}
	if (is_utf)
	    SvUTF8_on(sv);
	*p = '\0';
	SvCUR(sv) = p - SvPVX(sv);
	if (vectorize) {
	    esignlen = 0;
	    goto vector;
	}
    }
}
#endif
