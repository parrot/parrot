/* cpu_dep.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     CPU dependent functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

void flush_register_windows(void){

#ifdef __sparc

    static union {
	int insns[4];
        double align_hack[2];
    } u = { {
#ifdef __sparcv9
                            0x81580000, /* flushw */
#else
                            0x91d02003, /* ta ST_FLUSH_WINDOWS */
#endif
                            0x81c3e008, /* retl */ 
			    0x01000000  /* nop */
    } };

    static void (*fn_ptr)(void) = (void (*)(void))&u.align_hack[0];
    fn_ptr();

#else

    return;

#endif
}

