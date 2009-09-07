/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. The number of
registers in each set varies depending on the use counts of the subroutine and
is determined by the PASM/PIR compiler in the register allocation pass
(F<imcc/reg_alloc.c>).

=cut

*/

/* HEADERIZER HFILE: include/parrot/register.h */

/*

=back

=head1 SEE ALSO

F<include/parrot/register.h> and F<src/stacks.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
