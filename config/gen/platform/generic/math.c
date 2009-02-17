/*
 * $Id$
 * Copyright (C) 2004-2007, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/math.c

=head1 DESCRIPTION

math stuff

=head2 Functions

=over 4

=cut

*/

/*

=item C<extern int Parrot_signbit(double x)>

return true if the Numval has a negative sign.
This is mostly for handling the -0.0 case.

=cut

*/

/*
 */
#if DOUBLE_SIZE == 2 * INT_SIZE
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

/*

=item C<int Parrot_signbit_l(long double x)>

RT#48260: Not yet documented!!!

=cut

*/

#if NUMVAL_SIZE == 12 && DOUBLE_SIZE == 3 * INT_SIZE && PARROT_LITTLE_ENDIAN
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
 * vim: expandtab shiftwidth=4:
 */
