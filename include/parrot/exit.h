/* exit.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      exit.c
 */

#if !defined(PARROT_EXIT_H_GUARD)
#define PARROT_EXIT_H_GUARD

int Parrot_on_exit(void (*function)(int , void *), void *arg);
void Parrot_exit(int status);

#endif /* PARROT_EXIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
