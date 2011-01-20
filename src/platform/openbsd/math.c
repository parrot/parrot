/*
 * Copyright (C) 2006-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/openbsd/math.c

=head1 DESCRIPTION

Mathematical functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*
 * force atan2() to use IEEE behavior
 */

#include <math.h>
#ifdef _IEEE_

_LIB_VERSION_TYPE _LIB_VERSION = _IEEE_;

#endif

/* HEADERIZER HFILE: none */

#if DOUBLE_SIZE == 2 * INT_SIZE
/*

=item C<extern int Parrot_signbit(double x)>

Return true if the Numval has a negative sign.
This is mostly for handling the -0.0 case.

=cut

*/

extern int
Parrot_signbit(double x)
{
    union {
        double d;
        int i[2];
    } u;
    u.d = x;
#  if PARROT_BIGENDIAN
    return u.i[0] < 0;
#  else
    return u.i[1] < 0;
#  endif
}
#endif

#if NUMVAL_SIZE == 12 && DOUBLE_SIZE == 3 * INT_SIZE && PARROT_LITTLE_ENDIAN
/*

=item C<int Parrot_signbit_l(long double x)>

Like C<Parrot_signbit()>, only taking long double instead of double.

=cut

*/

int
Parrot_signbit_l(long double x)
{
    union {
        long double d;
        int i[3];
    } u;
    u.d = x;
    return u.i[2] < 0;
}
#endif

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
