/*  byteorder.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Byteordering functions
 *     These can be called to convert between our byteorder
 *     and another byteorder. Parrot must be able to load whatever
 *     byteorder/wordsize it sees. The caller should
 *     know if the bytecode byteorder is native and skip
 *     the conversion and just map it in.
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by Melvin on 2002/05/1
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/*
 * Arbitrary byte order handler.
 * This routine should work for any size
 * and combination of char and word. We can't
 * always assume a char is 8 bits.
 *
 * Takes word (w) and a byteorder matrix in a
 * character array, and reorders the word.
 * Benchmarking put this at 75% the speed
 * of the conditionally compiled routines
 * and reorders at a bandwidth higher than my
 * disk delivers.
 *
 * NOTE: Don't fear the if statements, they all
 * use compile time constants; and I think its quite
 * pretty with no macros..
 */

INTVAL
endianize(INTVAL w, unsigned char * o) {
    unsigned char * b = (unsigned char *)&w;
    INTVAL r;
    char * rp = (unsigned char *)&r;
    int nibbles = sizeof(INTVAL) / sizeof(char);
    
    rp[0] = b[o[0]];
    /*
     * Optimizer should decide these at compile time;
     * even a dumb compiler should do constant evaluation
     */
    if(nibbles >= 2) {
        rp[1] = b[o[1]];
        if(nibbles >= 4) {
            rp[2] = b[o[2]];
            rp[3] = b[o[3]];
            if(nibbles >= 8) {
                rp[4] = b[o[4]];
                rp[5] = b[o[5]];
                rp[6] = b[o[6]];
                rp[7] = b[o[7]];
            }
        }
    }
    return r;
}

/*
 * Same as above except this version will swap a buffer larger
 * or smaller than the native size and doesn't return a value.
 * Use endianize() if you are converting orders between same word
 * size, use endianize_buf() if word size is larger/smaller
 * such as handling a bytecode stream that was generated on
 * a platform with different word size.

void
endianize_buf(unsigned char * b, unsigned char * rb, unsigned char * o,
                        int targwsize, int destwsize) {
}


 *
 * Fetch/Put directly on bytestream, need to implement...

INTVAL
endianize_fetch_int(char * s, char * o) {

}

void endianize_put_int(const char * s, char * o) {
    
}
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
