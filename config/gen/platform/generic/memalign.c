/*
 * $Id$
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/memalign.c

=head1 DESCRIPTION

memalign related stuff

=head2 Functions

=over 4

=cut

*/

#if defined(PARROT_HAS_POSIX_MEMALIGN)
#  include <stdlib.h>

/*

=item C<void * Parrot_memalign(size_t align, size_t size)>

RT#48260: Not yet documented!!!

=cut

*/

void *
Parrot_memalign(size_t align, size_t size)
{
    void *p;
    int i = posix_memalign(&p, align, size);
    return i == 0 ? p : NULL;
}

#elif defined(PARROT_HAS_MEMALIGN)

#  if defined(PARROT_HAS_HEADER_MALLOC)
#    include <malloc.h>
#  else
#    include <stdlib.h>
#  endif

/*

=item C<void * Parrot_memalign(size_t align, size_t size)>

RT#48260: Not yet documented!!!

=cut

*/

void *
Parrot_memalign(size_t align, size_t size)
{
    return memalign(align, size);
}

#endif

/*

=item C<void Parrot_free_memalign(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

void
Parrot_free_memalign(void *p)
{
    free(p);
}

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
