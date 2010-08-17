/*
 * $Id$
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

memexec.c

=head1 DESCRIPTION

Memory protection functions.

=head2 Functions

=over 4

=cut

*/

#ifdef PARROT_HAS_EXEC_PROTECT
/*

=item C<void * mem_alloc_executable(size_t size)>

Allocate executable memory
Round up to page size because the whole page will be marked as executable
malloc() under OpenBSD page-aligns allocations >= page size

=cut

*/

void *
mem_alloc_executable(size_t size)
{
    void *p;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size = (size + pagesize - 1) & ~(pagesize-1);
    p = malloc(size);
    if (p != NULL) {
        mprotect(p, size, PROT_READ|PROT_WRITE|PROT_EXEC);
    }
    return p;
}

/*

=item C<void mem_free_executable(void *p, size_t size)>

Free a buffer allocated with mem_alloc_executable().

=cut

*/

void
mem_free_executable(void *p, size_t size)
{
    free(p);
}

/*

=item C<void * mem_realloc_executable(void* oldp, size_t oldsize, size_t
newsize)>

Reallocate executable memory
Round up to page size because the whole page will be marked as executable

=cut

*/

void *
mem_realloc_executable(void* oldp, size_t oldsize, size_t newsize)
{
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size_t roundup = (newsize + pagesize - 1) & ~(pagesize-1);
    void *newp = realloc(oldp, roundup);
    if (newp != NULL) {
        mprotect(newp, roundup, PROT_READ|PROT_WRITE|PROT_EXEC);
    }
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
