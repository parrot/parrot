/*
 * $Id$
 * Copyright (C) 2004-2010, Parrot Foundation.
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

#  define PARROT_EXEC_PERMS PROT_READ|PROT_WRITE|PROT_EXEC

/*

=item C<void * mem_alloc_executable(size_t size)>

Allocates executable memory.
Rounds up to page size because the whole page will be marked as executable.

Note, memory allocated with this interface *must* be freed with
mem_free_executable, as it may have been mmapped rather than malloced.

=cut

*/

void *
mem_alloc_executable(size_t size)
{
    void *p;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size = (size + pagesize - 1) & ~(pagesize-1);
#  ifdef WIN32
    if (posix_memalign(&p, pagesize, size))
        return NULL;
    mprotect(p, size, PARROT_EXEC_PERMS);
#  else /* !WIN32 */
    p = mmap(NULL, size, PARROT_EXEC_PERMS, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    if (!p)
        return NULL;
#  endif /* WIN32 */
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
#  ifdef WIN32
    free(p);
#  else /* !WIN32 */
    const size_t pagesize = sysconf(_SC_PAGESIZE);
    size = (size + pagesize - 1) & ~(pagesize-1);
    munmap(p, size);
#  endif /* WIN32 */
}

/*

=item C<void * mem_realloc_executable(void* oldp, size_t oldsize, size_t
newsize)>

Reallocate executable memory.
Rounds up to page size because the whole page will be marked as executable.
The intermediate temp is required because we don't know the old size

=cut

*/

void *
mem_realloc_executable(void* oldp, size_t oldsize, size_t newsize)
{
    void *newp;
    size_t pagesize = sysconf(_SC_PAGESIZE);
#  ifdef WIN32
    void *temp;
    size_t roundup;
    temp = realloc(oldp, newsize);
    if (temp == NULL)
        return NULL;
    free(oldp);
    roundup = (newsize + pagesize - 1) & ~(pagesize-1);
    if (posix_memalign(&newp, pagesize, roundup))
        newp = NULL;
    if (newp) {
        mprotect(newp, roundup, PARROT_EXEC_PERMS);
        memcpy(newp, temp, newsize);
    }
    free(temp);
#  else /* !WIN32 */
    oldsize = (oldsize + pagesize - 1) & ~(pagesize-1);
    newsize = (newsize + pagesize - 1) & ~(pagesize-1);
    newp = mremap(oldp, oldsize, newsize, PARROT_EXEC_PERMS);
#  endif /* WIN32 */
    return newp;
}
#endif /* PARROT_HAS_EXEC_PROTECT */

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
