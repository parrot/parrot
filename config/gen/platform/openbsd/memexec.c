#ifdef PARROT_HAS_EXEC_PROTECT
/*
 * Allocate executable memory
 * Round up to page size because the whole page will be marked as
 *   executable
 * malloc() under OpenBSD page-aligns allocations >= page size
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

void
mem_free_executable(void *p)
{
    free(p);
}

/*
 * Reallocate executable memory
 * Round up to page size because the whole page will be marked as
 *   executable
 */
void *
mem_realloc_executable(void* oldp, size_t newsize)
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
