/*
** platform.c [win32 version]
**
*/

#include <time.h>
#include <windows.h>
#include <winbase.h>
#include "parrot/parrot.h"


/* for PANIC */
#define interpreter NULL


/*
** Parrot_intval_time()
*/

INTVAL
Parrot_intval_time(void)
{
    return time(NULL);
}


/*
** Parrot_floatval_time()
*/

void
Parrot_platform_init_code(void)
{
 SetErrorMode(SEM_NOGPFAULTERRORBOX); 
}

FLOATVAL
Parrot_floatval_time(void)
{
    SYSTEMTIME sysTime;
    FILETIME fileTime;          /* 100ns == 1 */
    LARGE_INTEGER i;

    GetSystemTime(&sysTime);
    SystemTimeToFileTime(&sysTime, &fileTime);
    /* Documented as the way to get a 64 bit from a FILETIME. */
    memcpy(&i, &fileTime, sizeof(LARGE_INTEGER));

    return (FLOATVAL)i.QuadPart / 10000000.0;   /*1e7 */
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    Sleep(seconds * 1000);
}


/*
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
    SetEnvironmentVariable(name, value);
}


/*
** Parrot_getenv()
*/

char *
Parrot_getenv(const char *name, int *free_it)
{
    DWORD size = GetEnvironmentVariable(name, NULL, 0);
    char *buffer;

    if (size == 0) {
        *free_it = 0;
        return NULL;
    } else
        *free_it = 1;
    buffer = mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);

    return buffer;
}


/*
** Parrot_unsetenv()
*/

void
Parrot_unsetenv(const char *name)
{
    SetEnvironmentVariable(name, NULL);
}


/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    return LoadLibrary(filename);
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    return (void *)(ptrcast_t)GetProcAddress(handle, symbol);
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    return FreeLibrary(handle)? 0: 1;
}


/*
** mem_alloc_executable() 
*/

void *
mem_alloc_executable(struct Parrot_Interp *interpreter, size_t size)
{
	void *ptr = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
	if (!ptr)
		PANIC("Out of mem");
	return ptr;
}


/*
** mem_realloc_executable()
*/

void *
mem_realloc_executable(void* memblock, size_t size)
{
	MEMORY_BASIC_INFORMATION memInfo;
	void *newBlock;
	
	/* Get size of current memory allocation. */
	if (!(VirtualQuery(memblock, &memInfo, sizeof(MEMORY_BASIC_INFORMATION))))
		PANIC("VirtualQuery failed");

	/* Allocate new block of memory. */
	newBlock = mem_alloc_executable(size);
	if (!newBlock)
		PANIC("Out of mem");
	
	/* Copy older block's data to new block's data, taking into account size of data. */
	if (memInfo.RegionSize <= size)
	{
		CopyMemory(newBlock, memblock, memInfo.RegionSize);
	}
	else
	{
		CopyMemory(newBlock, memblock, size);
	}
	
	/* Free older block and return pointer to the new one. */
	mem_free_executable(memblock);
	return newBlock;
}


/*
** mem_free_executable() 
*/

void
mem_free_executable(void *addr)
{
	/* We need to decommit, then release the pages. */
	VirtualFree(addr, 1, MEM_DECOMMIT);
	VirtualFree(addr, 0, MEM_RELEASE);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
