/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/memexec.c

=head1 DESCRIPTION

Memory protection stuff

=head2 Functions

=over 4

=cut

*/

#ifdef PARROT_HAS_EXEC_PROTECT
/*

=item C<void * mem_alloc_executable(size_t size)>

Allocate executable memory
Round up to page size because the whole page will be marked as executable

=cut

*/

void *
mem_alloc_executable(size_t size)
{
    void *p;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size = (size + pagesize - 1) & ~(pagesize-1);
    if (posix_memalign(&p, pagesize, size))
        return NULL;
    mprotect(p, size, PROT_READ|PROT_WRITE|PROT_EXEC);
    return p;
}

/*

=item C<void mem_free_executable(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

void
mem_free_executable(void *p)
{
    free(p);
}

/*

=item C<void * mem_realloc_executable(void* oldp, size_t newsize)>

Reallocate executable memory
Round up to page size because the whole page will be marked as executable
The intermediate temp is required because we don't know the old size

=cut

*/

void *
mem_realloc_executable(void* oldp, size_t newsize)
{
    void *temp;
    void *newp;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size_t roundup;
    temp = realloc(oldp, newsize);
    if (temp == NULL)
        return NULL;
    free(oldp);
    roundup = (newsize + pagesize - 1) & ~(pagesize-1);
    if (posix_memalign(&newp, pagesize, roundup))
        newp = NULL;
    if (newp) {
        mprotect(newp, roundup, PROT_READ|PROT_WRITE|PROT_EXEC);
        memcpy(newp, temp, newsize);
    }
    free(temp);
    return newp;
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
