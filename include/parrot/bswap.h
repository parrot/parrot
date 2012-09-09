/* bswap.h
 * Copyright (C) 2012, Parrot Foundation.
 *
 * Native byteswap macros
 *
 */

#ifdef HAS_HEADER_BYTESWAP
#  include <byteswap.h>
#else
#  ifdef HAS_HEADER_ENDIAN
#    include <endian.h>
#  elif defined(HAS_HEADER_SYS_ENDIAN)
#    include <sys/endian.h>
#  endif
#  if defined(HAS_HEADER_ENDIAN) || defined(HAS_HEADER_SYS_ENDIAN)
#    define bswap_16(x) __bswap_16(x)
#    define bswap_32(x) __bswap_32(x)
#    if __WORDSIZE == 64
#      define bswap_64(x) __bswap_64(x)
#    endif
#  else
#    ifdef HAS_HEADER_LIBKERN_OSBYTEORDER
#      if __BYTE_ORDER == __LITTLE_ENDIAN
#        define bswap_16(x) OSSwapHostToBigInt16(x)
#        define bswap_32(x) OSSwapHostToBigInt32(x)
#        if __WORDSIZE == 64
#          define bswap_64(x) OSSwapHostToBigInt64(x)
#        endif
#      else
#        define bswap_16(x) OSSwapBigToHostInt16(x)
#        define bswap_32(x) OSSwapBigToHostInt32(x)
#        if __WORDSIZE == 64
#          define bswap_64(x) OSSwapBigToHostInt64(x)
#        endif
#      endif
#    else
#      define bswap_16(x) { unsigned char rb[4]; SWAB_4(rb,x); memcpy(x,rb,4); }
#      define bswap_32(x) { unsigned char rb[8]; SWAB_8(rb,x); memcpy(x,rb,8); }
#      if __WORDSIZE == 64
#        define bswap_64(x) { unsigned char rb[16]; SWAB_16(rb,x); memcpy(x,rb,16); }
#      endif
#    endif
#  endif
#endif

#define SWAB_4(rb,b) \
    rb[0] = b[3]; \
    rb[1] = b[2]; \
    rb[2] = b[1]; \
    rb[3] = b[0]

#define SWAB_8(rb,b) \
    rb[0] = b[7]; \
    rb[1] = b[6]; \
    rb[2] = b[5]; \
    rb[3] = b[4]; \
    rb[4] = b[3]; \
    rb[5] = b[2]; \
    rb[6] = b[1]; \
    rb[7] = b[0]

#define SWAB_12(rb,b) \
    rb[0]  = b[11]; \
    rb[1]  = b[10]; \
    rb[2]  = b[9]; \
    rb[3]  = b[8]; \
    rb[4]  = b[7]; \
    rb[5]  = b[6]; \
    rb[6]  = b[5]; \
    rb[7]  = b[4]; \
    rb[8]  = b[3]; \
    rb[9]  = b[2]; \
    rb[10] = b[1]; \
    rb[11] = b[0]

#define SWAB_16(rb,b) \
    rb[0]  = b[15]; \
    rb[1]  = b[14]; \
    rb[2]  = b[13]; \
    rb[3]  = b[12]; \
    rb[4]  = b[11]; \
    rb[5]  = b[10]; \
    rb[6]  = b[9]; \
    rb[7]  = b[8]; \
    rb[8]  = b[7]; \
    rb[9]  = b[6]; \
    rb[10] = b[5]; \
    rb[11] = b[4]; \
    rb[12] = b[3]; \
    rb[13] = b[2]; \
    rb[14] = b[1]; \
    rb[15] = b[0]

#define SWAB_32(rb,b) \
    rb[0]  = b[31]; \
    rb[1]  = b[30]; \
    rb[2]  = b[29]; \
    rb[3]  = b[28]; \
    rb[4]  = b[27]; \
    rb[5]  = b[26]; \
    rb[6]  = b[25]; \
    rb[7]  = b[24]; \
    rb[8]  = b[23]; \
    rb[9]  = b[22]; \
    rb[10] = b[21]; \
    rb[11] = b[20]; \
    rb[12] = b[19]; \
    rb[13] = b[18]; \
    rb[14] = b[17]; \
    rb[15] = b[16]; \
    rb[16] = b[15]; \
    rb[17] = b[14]; \
    rb[18] = b[13]; \
    rb[19] = b[12]; \
    rb[20] = b[11]; \
    rb[21] = b[10]; \
    rb[22] = b[9]; \
    rb[23] = b[8]; \
    rb[24] = b[7]; \
    rb[25] = b[6]; \
    rb[26] = b[5]; \
    rb[27] = b[4]; \
    rb[28] = b[3]; \
    rb[29] = b[2]; \
    rb[30] = b[1]; \
    rb[31] = b[0];


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

