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
 * The byteorder matrix in parrot is 0 based
 * because it is used as a transformation.
 * We should probably move this to Configure
 */
void
endian_matrix(unsigned char * buf) {
    union U {
        opcode_t op;
        unsigned char c[sizeof(opcode_t)/sizeof(unsigned char)];
    } u;
    /* Expect the following to generate warning on 32 bit.*/
    if(sizeof(opcode_t) > 4) {
        /* Have to do this the long way for tcc */
        u.op = 0x07060504;
        u.op <<= 32;
        u.op |= 0x03020100;
    }    
    else {
        u.op = 0x03020100;
    }    
    memcpy(buf, u.c, sizeof(opcode_t));
}


/*
 * Arbitrary byte order handlers.
 */
 
/*
 * This routine should work for any size
 * and combination of char and word. We can't
 * always assume a char is 8 bits.
 *
 * Takes INTVAL (w) and a byteorder matrix in a
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
endian_fetch_intval(INTVAL w, unsigned char * o) {
    unsigned char * b = (unsigned char *)&w;
    INTVAL r;
    unsigned char * rb = (unsigned char *)&r;
    int nibbles = sizeof(INTVAL) / sizeof(char);

    if(!o)
        return w;
        
    rb[0] = b[o[0]];
    /*
     * Optimizer should decide these at compile time;
     * even a dumb compiler should do constant evaluation
     */
    if(nibbles >= 2) {
        rb[1] = b[o[1]];
        if(nibbles >= 4) {
            rb[2] = b[o[2]];
            rb[3] = b[o[3]];
            if(nibbles >= 8) {
                rb[4] = b[o[4]];
                rb[5] = b[o[5]];
                rb[6] = b[o[6]];
                rb[7] = b[o[7]];
            }
        }
    }
    return r;
}

/*
 * Same as above for opcode_t
 */
opcode_t
endian_fetch_op(opcode_t op, unsigned char * o) {
    unsigned char * b = (unsigned char *)&op;
    INTVAL r;
    unsigned char * rb = (unsigned char *)&r;
    int nibbles = sizeof(INTVAL) / sizeof(char);

    if(!o)
        return op;
        
    rb[0] = b[o[0]];
    /*
     * Optimizer should decide these at compile time;
     * even a dumb compiler should do constant evaluation
     */
    if(nibbles >= 2) {
        rb[1] = b[o[1]];
        if(nibbles >= 4) {
            rb[2] = b[o[2]];
            rb[3] = b[o[3]];
            if(nibbles >= 8) {
                rb[4] = b[o[4]];
                rb[5] = b[o[5]];
                rb[6] = b[o[6]];
                rb[7] = b[o[7]];
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
 */
void
endian_fetch_buf(unsigned char * rb, unsigned char * b, unsigned char * o,
                        int wsize) {
    rb[0] = b[o[0]];
    if(wsize >= 2) {
        rb[1] = b[o[1]];
        if(wsize >= 4) {
            rb[2] = b[o[2]];
            rb[3] = b[o[3]];
            if(wsize >= 8) {
                rb[4] = b[o[4]];
                rb[5] = b[o[5]];
                rb[6] = b[o[6]];
                rb[7] = b[o[7]];
            }
        }
    }
}


/*
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
