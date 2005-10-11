# Parrot MD5 library; Nick Glencross <nickg@glencros.demon.co.uk>
#                     Improvements from Leo and Jens Rieks
#
# Based on md5.c, from md5sum
#           written by Ulrich Drepper <drepper@gnu.ai.mit.edu>, 1995.

=head1 NAME

MD5.imc - calculates MD5 checksums

=head1 SYNOPSIS

  load_bytecode "Digest/MD5.imc"
  $P0 = _md5sum("foo")
  _md5_print($P0)

or

  load_bytecode "Digest/MD5.imc"
  $P0 = _md5sum("bar")
  $S0 = _md5_hex($P0)

=head1 DESCRIPTION

This is a pure Parrot MD5 hash routine. You should run it with the JIT
core if possible.

=head1 SUBROUTINES

=head2 _md5sum

Pass in a string, returns an Integer array with the result.

=head2 _md5_hex

Pass it the Integer array from _md5sum to get the checksum as string.

=head2 _md5_print

Pass it the Integer array to print the checksum.

=head1 BUGS

Still has some limitations on input buffer size, largely due to memory
consumption which should be resolved soon.

=cut

###########################################################################
# Export function entries to globals

.sub onload :load

    .local pmc f
    f = find_global "Digest", "_md5sum"
    global "_md5sum"    = f
    f = find_global "Digest", "_md5_hex"
    global "_md5_hex"   = f
    f = find_global "Digest", "_md5_print"
    global "_md5_print" = f
.end

###########################################################################
# Main backend entry point

.namespace ["Digest"]

.sub _md5sum
    .param string str

    .local pmc context
    context = new FixedIntegerArray
    context = 4

    .local pmc buffer
    buffer = _md5_create_buffer (str)

    _md5_init (context)
    _md5_process_buffer (context, buffer)

    .return (context)
.end


###########################################################################
# Low-level macros used in MD5

.macro FF (b,c,d)
    tmp  = .c ~ .d
    tmp &= .b
    tmp ~= .d
.endm

.macro FH (b,c,d)
    tmp  = .b ~ .c
    tmp ~= .d
.endm

.macro FI (b,c,d)
    tmp  = ~.d
    tmp |= .b
    tmp ~= .c
.endm

###########################################################################
# Higher level MD5 operations

.macro common (a, b, k, s, T)
    .a += tmp
    .a += .T
    tmp = .k + idx
    tmp = buffer[tmp]
    .a += tmp
    .a &= 0xffffffff
    tmp = rot .a, .s, 32
    .a  = .b + tmp
    .a &= 0xffffffff
.endm


.macro OP1 (aa,bb,cc,dd, kk, ss, TT)
    .FF     (.bb,.cc,.dd)
    .common (.aa, .bb, .kk, .ss, .TT)
.endm

.macro OP2 (aa,bb,cc,dd, kk, ss, TT)
    .FF     (.dd,.bb,.cc)
    .common (.aa, .bb, .kk, .ss, .TT)
.endm

.macro OP3 (aa,bb,cc,dd, kk, ss, TT)
    .FH     (.bb,.cc,.dd)
    .common (.aa, .bb, .kk, .ss, .TT)
.endm

.macro OP4 (aa,bb,cc,dd, kk, ss, TT)
    .FI     (.bb,.cc,.dd)
    .common (.aa, .bb, .kk, .ss, .TT)
.endm

###########################################################################

# Swap the bytes which make up a word

.macro swap (w)
     $I10 = .w & 0x000000ff
     $I11 = .w & 0x0000ff00
     $I12 = .w & 0x00ff0000
     $I13 = .w & 0xff000000

     $I10 = $I10 <<  24
     $I11 = $I11 <<  8
     $I12 = $I12 >>> 8
     $I13 = $I13 >>> 24

     $I10 |= $I11
     $I10 |= $I12
     $I10 |= $I13

     # For 64-bit architectures
     .w = $I10 & 0xffffffff
.endm

###########################################################################

# Set the initial MD5 constants

.sub _md5_init
    .param pmc context

    # Initial MD5 constants
    context[0] = 0x67452301
    context[1] = 0xefcdab89
    context[2] = 0x98badcfe
    context[3] = 0x10325476

.end

###########################################################################
# Create an internal scratchpad buffer

.sub _md5_create_buffer
    .param string str

    .local pmc buffer
    buffer = new FixedIntegerArray

    .local int counter
    .local int subcounter
    .local int slow_counter

    .local int word, len

     len = length str

     $I1 = len - 1

     # Work out how many words to allocate
     .local int words
     words  = len + 8
     words |= 63
     inc words
     words /= 4

     buffer = words

     word         = 0
     counter      = 0
     subcounter   = 0
     slow_counter = 0

create_buffer_loop:

     $I5 = counter + subcounter

     if $I5 > len goto create_buffer_break

     # MD5 pad character, which goes last
     $I4 = 0x80

     if $I5 > $I1 goto string_char
     $I4 = ord str, $I5

string_char:

     word <<= 8
     word  |= $I4

     inc subcounter
     if subcounter != 4 goto create_buffer_loop

     .swap (word)

     buffer[slow_counter] = word

     word       = 0
     counter   += 4
     subcounter = 0
     inc slow_counter

     goto create_buffer_loop

create_buffer_break:

     # Check for a partial word

     if subcounter == 0 goto complete
     subcounter = 4 - subcounter
     $I0    = 8*subcounter
     word <<= $I0

     .swap (word)

     buffer[slow_counter] = word

complete:

     # The number of bits in the string go into the last two words

     $I0 = len >>> 29
     dec words
     buffer[words] = $I0

     $I0 = len << 3
     dec words
     buffer[words] = $I0

     .return (buffer)

.end

###########################################################################

.sub _md5_process_buffer
    .param pmc  context
    .param pmc  buffer

    .local int A, B, C, D
    .local int A_save, B_save, C_save, D_save

    .local int tmp, idx, len

    idx = 0
    len = elements buffer

    A = context[0]
    B = context[1]
    C = context[2]
    D = context[3]

loop:

    A_save = A
    B_save = B
    C_save = C
    D_save = D

    # Round 1.
    .OP1 (A, B, C, D, 0,  7, 0xd76aa478)
    .OP1 (D, A, B, C, 1, 12, 0xe8c7b756)
    .OP1 (C, D, A, B, 2, 17, 0x242070db)
    .OP1 (B, C, D, A, 3, 22, 0xc1bdceee)
    .OP1 (A, B, C, D, 4,  7, 0xf57c0faf)
    .OP1 (D, A, B, C, 5, 12, 0x4787c62a)
    .OP1 (C, D, A, B, 6, 17, 0xa8304613)
    .OP1 (B, C, D, A, 7, 22, 0xfd469501)
    .OP1 (A, B, C, D, 8,  7, 0x698098d8)
    .OP1 (D, A, B, C, 9, 12, 0x8b44f7af)
    .OP1 (C, D, A, B, 10,17, 0xffff5bb1)
    .OP1 (B, C, D, A, 11,22, 0x895cd7be)
    .OP1 (A, B, C, D, 12, 7, 0x6b901122)
    .OP1 (D, A, B, C, 13,12, 0xfd987193)
    .OP1 (C, D, A, B, 14,17, 0xa679438e)
    .OP1 (B, C, D, A, 15,22, 0x49b40821)

    # Round 2.
    .OP2 (A, B, C, D,  1,  5, 0xf61e2562)
    .OP2 (D, A, B, C,  6,  9, 0xc040b340)
    .OP2 (C, D, A, B, 11, 14, 0x265e5a51)
    .OP2 (B, C, D, A,  0, 20, 0xe9b6c7aa)
    .OP2 (A, B, C, D,  5,  5, 0xd62f105d)
    .OP2 (D, A, B, C, 10,  9, 0x02441453)
    .OP2 (C, D, A, B, 15, 14, 0xd8a1e681)
    .OP2 (B, C, D, A,  4, 20, 0xe7d3fbc8)
    .OP2 (A, B, C, D,  9,  5, 0x21e1cde6)
    .OP2 (D, A, B, C, 14,  9, 0xc33707d6)
    .OP2 (C, D, A, B,  3, 14, 0xf4d50d87)
    .OP2 (B, C, D, A,  8, 20, 0x455a14ed)
    .OP2 (A, B, C, D, 13,  5, 0xa9e3e905)
    .OP2 (D, A, B, C,  2,  9, 0xfcefa3f8)
    .OP2 (C, D, A, B,  7, 14, 0x676f02d9)
    .OP2 (B, C, D, A, 12, 20, 0x8d2a4c8a)

    # Round 3.
    .OP3 (A, B, C, D,  5,  4, 0xfffa3942)
    .OP3 (D, A, B, C,  8, 11, 0x8771f681)
    .OP3 (C, D, A, B, 11, 16, 0x6d9d6122)
    .OP3 (B, C, D, A, 14, 23, 0xfde5380c)
    .OP3 (A, B, C, D,  1,  4, 0xa4beea44)
    .OP3 (D, A, B, C,  4, 11, 0x4bdecfa9)
    .OP3 (C, D, A, B,  7, 16, 0xf6bb4b60)
    .OP3 (B, C, D, A, 10, 23, 0xbebfbc70)
    .OP3 (A, B, C, D, 13,  4, 0x289b7ec6)
    .OP3 (D, A, B, C,  0, 11, 0xeaa127fa)
    .OP3 (C, D, A, B,  3, 16, 0xd4ef3085)
    .OP3 (B, C, D, A,  6, 23, 0x04881d05)
    .OP3 (A, B, C, D,  9,  4, 0xd9d4d039)
    .OP3 (D, A, B, C, 12, 11, 0xe6db99e5)
    .OP3 (C, D, A, B, 15, 16, 0x1fa27cf8)
    .OP3 (B, C, D, A,  2, 23, 0xc4ac5665)

    # Round 4.
    .OP4 (A, B, C, D,  0,  6, 0xf4292244)
    .OP4 (D, A, B, C,  7, 10, 0x432aff97)
    .OP4 (C, D, A, B, 14, 15, 0xab9423a7)
    .OP4 (B, C, D, A,  5, 21, 0xfc93a039)
    .OP4 (A, B, C, D, 12,  6, 0x655b59c3)
    .OP4 (D, A, B, C,  3, 10, 0x8f0ccc92)
    .OP4 (C, D, A, B, 10, 15, 0xffeff47d)
    .OP4 (B, C, D, A,  1, 21, 0x85845dd1)
    .OP4 (A, B, C, D,  8,  6, 0x6fa87e4f)
    .OP4 (D, A, B, C, 15, 10, 0xfe2ce6e0)
    .OP4 (C, D, A, B,  6, 15, 0xa3014314)
    .OP4 (B, C, D, A, 13, 21, 0x4e0811a1)
    .OP4 (A, B, C, D,  4,  6, 0xf7537e82)
    .OP4 (D, A, B, C, 11, 10, 0xbd3af235)
    .OP4 (C, D, A, B,  2, 15, 0x2ad7d2bb)
    .OP4 (B, C, D, A,  9, 21, 0xeb86d391)

    A += A_save
    B += B_save
    C += C_save
    D += D_save

    idx += 16

    if idx < len goto loop

    context[0] = A
    context[1] = B
    context[2] = C
    context[3] = D

.end

###########################################################################

# Format four hex values

.sub _md5_format_vals
    .param int A
    .param int B
    .param int C
    .param int D

    $P0 = new FixedIntegerArray
    $P0 = 4

    $P0[0] = A
    $P0[1] = B
    $P0[2] = C
    $P0[3] = D

    $S0 = sprintf "%08lx%08lx%08lx%08lx", $P0
    .return ($S0)
.end

###########################################################################

# Retrieve the final checksum as a string

.sub _md5_hex
    .param pmc context

    .local int A, B, C, D

    A = context[0]
    B = context[1]
    C = context[2]
    D = context[3]

    .swap (A)
    .swap (B)
    .swap (C)
    .swap (D)

    $S0 = _md5_format_vals (A,B,C,D)
    .return ($S0)
.end

# Convenience subroutine to print the MD5 hash for a string

.sub _md5_print
    .param pmc context

    $S0 = _md5_hex (context)
    print $S0

    .return ($S0)
.end
