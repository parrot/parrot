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

BOOLVAL rx_is_word_character(char ch) {
	if(
		(ch >= 'a' && ch <= 'z') ||
		(ch >= 'A' && ch <= 'Z') ||
		(ch >= '0' && ch <= '9') ||
		ch == '_'
	) {
		return 1;
	}
	else {
		return 0;
	}
}

BOOLVAL rx_is_number_character(char ch) {
	if(ch >= '0' && ch <= '9') {
		return 1;
	}
	else {
		return 0;
	}
}

BOOLVAL rx_is_whitespace_character(char ch) {
	if(ch == '\n' || ch == '\r' || ch == '\t' || ch == ' ') {
		return 1;
	}
	else {
		return 0;
	}
}

STRING *rxP_get_substr(struct Parrot_Interp *interpreter, STRING * source, INTVAL startindex, INTVAL length) {
	STRING *ret;
	
	/*printf("rxP_get_substr(%p, %p(%d), %d, %d)", interpreter, source, -1, startindex, length);*/

	ret=string_make(interpreter, NULL, 0, NULL, 0, NULL);

	string_substr(interpreter, source, startindex, length, &ret);

	return ret;
}
