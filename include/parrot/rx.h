/* rx.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Supporting file for the regular expression engine
 *  Data Structure and Algorithms:
 *     rxinfo is the main structure involved in regular expressions; it's stuffed 
 *     into a Handle PMC and passed to all regular expression opcodes.
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RX_H_GUARD)
#define PARROT_RX_H_GUARD

#include "parrot/parrot.h"
#include "parrot/rxstacks.h"

typedef struct bitmap_t {
    char *bmp;
    STRING *bigchars;
} * Bitmap;

typedef enum rxflags {
    enum_rxflags_none=0,
    enum_rxflags_case_insensitive=1,
    enum_rxflags_single_line=2,
    enum_rxflags_multiline=4,
    enum_rxflags_reverse=8,
        
    
    enum_rxflags_is_copy=128
} rxflags;

typedef enum rxdirection {
    enum_rxdirection_forwards=1,
    enum_rxdirection_backwards=-1
} rxdirection;

extern const INTVAL RX_MARK;
extern const char * RX_WORDCHARS;
extern const char * RX_NUMCHARS;
extern const char * RX_SPACECHARS;
extern const char * RX_NEWLINES;

#define cstr2pstr(cstr) string_make(interpreter, cstr, strlen(cstr), 0, 0, 0)

typedef struct rxinfo {
    STRING *string;
    INTVAL index;
    INTVAL startindex;
    BOOLVAL success;
    
    rxflags flags;
    UINTVAL minlength;
    rxdirection whichway;
    
    PMC *groupstart;
    PMC *groupend;
    
    opcode_t *substfunc;
    
    rxStack stack;
} rxinfo;


rxinfo * rx_allocate_info(struct Parrot_Interp *, STRING *);

INLINE BOOLVAL  rx_is_word_character(struct Parrot_Interp *, INTVAL ch);
INLINE BOOLVAL  rx_is_number_character(struct Parrot_Interp *, INTVAL ch);
INLINE BOOLVAL  rx_is_whitespace_character(struct Parrot_Interp *, INTVAL ch);
INLINE BOOLVAL  rx_is_newline(struct Parrot_Interp *, INTVAL ch);

Bitmap bitmap_make(struct Parrot_Interp *, STRING*);
Bitmap bitmap_make_cstr(struct Parrot_Interp *, const char*);
void bitmap_add(struct Parrot_Interp *, Bitmap, INTVAL);
BOOLVAL bitmap_match(Bitmap, INTVAL);
void bitmap_destroy(Bitmap);

#define RX_dUNPACK(pmc)            rxinfo *rx=(rxinfo *)pmc->data
#define RxCurChar(rx)              (char)string_ord(rx->string, rx->index)

#define RxAdvance(rx)              RxAdvanceX(rx, 1)
#define RxAdvanceX(rx, x)          rx->index += x * rx->whichway

#define RxCaseInsensitive_on(rx)   RxFlagOn(rx, enum_rxflags_case_insensitive)
#define RxCaseInsensitive_off(rx)  RxFlagOff(rx, enum_rxflags_case_insensitive)
#define RxCaseInsensitive_test(rx) RxFlagTest(rx, enum_rxflags_case_insensitive)

#define RxSingleLine_on(rx)        RxFlagOn(rx, enum_rxflags_single_line)
#define RxSingleLine_off(rx)       RxFlagOff(rx, enum_rxflags_single_line)
#define RxSingleLine_test(rx)      RxFlagTest(rx, enum_rxflags_single_line)

#define RxMultiline_on(rx)         RxFlagOn(rx, enum_rxflags_multiline)
#define RxMultiline_off(rx)        RxFlagOff(rx, enum_rxflags_multiline)
#define RxMultiline_test(rx)       RxFlagTest(rx, enum_rxflags_multiline)

#define RxReverse_on(rx)           RxFlagOn(rx, enum_rxflags_reverse)
#define RxReverse_off(rx)          RxFlagOff(rx, enum_rxflags_reverse)
#define RxReverse_test(rx)         RxFlagTest(rx, enum_rxflags_reverse)

#define RxFlagOn(rx, flag)         (rx->flags |=  flag)
#define RxFlagOff(rx, flag)        (rx->flags &= ~flag)
#define RxFlagTest(rx, flag)       (rx->flags  &  flag)

#define RxFlagsOff(rx)             rx->flags = enum_rxflags_none

#endif /* PARROT_RX_H_GUARD */
