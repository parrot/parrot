/* rx.c
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

#include "parrot/rx.h"

const INTVAL RX_MARK=-1;
const char * RX_WORDCHARS="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";
const char * RX_NUMCHARS="0123456789";
const char * RX_SPACECHARS="\r\n\t ";

/*************************************************************
 * Parrot Regular Expression Engine, version 3.0 alpha (Rx3) *
 *          Copyright (C) 2001-2002 The Parrot Team          *
 *               Initial version by Brent Dax                *
 *************************************************************/

rxinfo * rx_allocate_info(struct Parrot_Interp *interpreter, STRING *string) {
	rxinfo *rx=mem_sys_allocate(sizeof(rxinfo));

	rx->minlength=rx->index=rx->startindex=0;
	rx->flags=enum_rxflags_none;
	rx->whichway=enum_rxdirection_forwards;

	rx->string=string;

	rx->groupstart=pmc_new(interpreter, enum_class_PerlArray);
	rx->groupend=pmc_new(interpreter, enum_class_PerlArray);

	rx->stack = new_stack(interpreter);

	return rx;
}

BOOLVAL rx_is_word_character(struct Parrot_Interp *interpreter, INTVAL ch) {
	static Bitmap bmp=NULL;
	
	if(!bmp) {
		bmp=make_bitmap(cstr2pstr(RX_WORDCHARS));
	}
	
	return check_bitmap(ch, bmp);
}

BOOLVAL rx_is_number_character(struct Parrot_Interp *interpreter, INTVAL ch) {
	/* faster to do less-than/greater-than */
	
	if(ch >= '0' && ch <= '9') {
		return 1;
	}
	else {
		return 0;
	}
}

BOOLVAL rx_is_whitespace_character(struct Parrot_Interp *interpreter, INTVAL ch) {
	static Bitmap bmp=NULL;
	
	if(!bmp) {
		bmp=make_bitmap(cstr2pstr(RX_SPACECHARS));
	}

	return check_bitmap(ch, bmp);
}

STRING *rxP_get_substr(struct Parrot_Interp *interpreter, STRING * source, INTVAL startindex, INTVAL length) {
	STRING *ret;
	
	/*printf("rxP_get_substr(%p, %p(%d), %d, %d)", interpreter, source, -1, startindex, length);*/

	ret=string_make(interpreter, NULL, 0, NULL, 0, NULL);

	string_substr(interpreter, source, startindex, length, &ret);

	return ret;
}

Bitmap make_bitmap(STRING* str) {
	INTVAL i, ch;
	Bitmap bmp=mem_sys_allocate(32);
	
	/* XXX Bitmaps currently do not support chars > 255 -- 
	   the memory space needed grows _very_ fast */
	
	for(i=0; i < 32; i++) {
		bmp[i]=0;
	}
	
	for(i=0; i < string_length(str); i++) {
		ch=string_ord(str, i);

		if(ch > 255) return NULL; /* Can't do it--caller must figure out another way */

		bmp[ch>>3] |= (1<<(ch & 7));
	}
	
	return bmp;
}

BOOLVAL check_bitmap(INTVAL ch, Bitmap bmp) {
	if(ch > 255) {
		return 0;
	}
	
	return bmp[ch>>3] & (1<<(ch & 7));
}