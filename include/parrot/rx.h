/* rx.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Supporting file for the regular expression engine
 *  Data Structure and Algorithms:
 *	   rxinfo is the main structure involved in regular expressions; it's stuffed 
 *     into a Handle PMC and passed to all regular expression opcodes.
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RX_H_GUARD)
#define PARROT_RX_H_GUARD

#include "parrot/parrot.h"

typedef char* Bitmap;

typedef enum rxflags {
	enum_rxflags_none=0,
	enum_rxflags_case_insensitive=1,
	enum_rxflags_single_line=2,
	enum_rxflags_multiline=4,
	enum_rxflags_reverse=8
} rxflags;

typedef enum rxdirection {
	enum_rxdirection_forwards=1,
	enum_rxdirection_backwards=-1
} rxdirection;

extern const INTVAL RX_MARK;
extern const char * RX_WORDCHARS;
extern const char * RX_NUMCHARS;
extern const char * RX_SPACECHARS;

#define cstr2pstr(cstr) string_make(interpreter, cstr, strlen(cstr), 0, 0, 0)

typedef struct rxinfo {
	STRING *string;
	UINTVAL index;
	UINTVAL startindex;
	BOOLVAL success;

	rxflags flags;
	UINTVAL minlength;
	rxdirection whichway;

	PMC *groupstart;
	PMC *groupend;

	opcode_t *substfunc;

        struct Stack_chunk_t* stack;
} rxinfo;

rxinfo * rx_allocate_info(struct Parrot_Interp *, STRING *);

BOOLVAL  rx_is_word_character(struct Parrot_Interp *, INTVAL ch);
BOOLVAL  rx_is_number_character(struct Parrot_Interp *, INTVAL ch);
BOOLVAL  rx_is_whitespace_character(struct Parrot_Interp *, INTVAL ch);

Bitmap make_bitmap(STRING* str);
BOOLVAL check_bitmap(INTVAL ch, Bitmap bmp);

STRING *rxP_get_substr(struct Parrot_Interp *, STRING *, INTVAL, INTVAL);

#define RX_dUNPACK(pmc)				rxinfo *rx=(rxinfo *)pmc->data
#define RxCurChar(rx)				(char)string_ord(rx->string, rx->index)
#define RxCurCharS(rx)				rxP_get_substr(interpreter, rx->string, rx->index, 1)

#define RxAdvance(rx)				RxAdvanceX(rx, 1)
#define RxAdvanceX(rx, x)			rx->index += x * rx->whichway

#define RxCaseInsensitive_on(rx)	RxFlagOn(rx, enum_rxflags_case_insensitive)
#define RxCaseInsensitive_off(rx)	RxFlagOff(rx, enum_rxflags_case_insensitive)
#define RxCaseInsensitive_test(rx)	RxFlagTest(rx, enum_rxflags_case_insensitive)

#define RxSingleLine_on(rx)			RxFlagOn(rx, enum_rxflags_single_line)
#define RxSingleLine_off(rx)		RxFlagOff(rx, enum_rxflags_single_line)
#define RxSingleLine_test(rx)		RxFlagTest(rx, enum_rxflags_single_line)

#define RxMultiline_on(rx)			RxFlagOn(rx, enum_rxflags_multiline)
#define RxMultiline_off(rx)			RxFlagOff(rx, enum_rxflags_multiline)
#define RxMultiline_test(rx)		RxFlagTest(rx, enum_rxflags_multiline)

#define RxReverse_on(rx)			RxFlagOn(rx, enum_rxflags_reverse)
#define RxReverse_off(rx)			RxFlagOff(rx, enum_rxflags_reverse)
#define RxReverse_test(rx)			RxFlagTest(rx, enum_rxflags_reverse)

#define RxFlagOn(rx, flag)			(rx->flags |=  flag)
#define RxFlagOff(rx, flag)			(rx->flags &= ~flag)
#define RxFlagTest(rx, flag)		(rx->flags  &  flag)

#define RxFlagsOff(rx)				rx->flags = enum_rxflags_none

#endif
