/*
** darwin.c
*/

#include <time.h>
#include <sys/time.h>

#undef environ
#undef bool
#import <mach-o/dyld.h>


#include "parrot/parrot.h"

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

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

FLOATVAL
Parrot_floatval_time(void)
{
    struct timeval t;
    gettimeofday(&t, NULL);
    return (FLOATVAL)t.tv_sec + ((FLOATVAL)t.tv_usec / 1000000.0);
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    sleep(seconds);
}


/*
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
#ifdef PARROT_HAS_SETENV
    setenv(name, value, 1);
#else
    int name_len = strlen(name);
    int val_len = strlen(value);

    char *envs = malloc(name_len + 1 + val_len + 1);
    if (envs == NULL)
        return;

    /* Save a bit of time, by using the fact we already have the
       lengths, avoiding strcat */
    strcpy(envs, name);
    strcpy(envs + name_len, "=");
    strcpy(envs + name_len + 1, value);

    putenv(envs);

    /* The buffer is intentionally not freed! */
#endif
}

void
Parrot_unsetenv(const char *name)
{
#ifdef PARROT_HAS_UNSETENV
    unsetenv(name);
#else
    Parrot_setenv(name, "");
#endif
}

char *
Parrot_getenv(const char *name, int *free_it)
{
    *free_it = 0;
    return getenv(name);
}


/* The dl* functions showed up in OS X 10.3, but they are just a
   wrapper around the native dyld and NSModule API, so we'll use
   the base API directly. This gives us wider compatibility, and
   more control over the behavior. */
/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    int dyld_result;
    NSObjectFileImage ofile;

    /* try bundle-style loading first */
    dyld_result = NSCreateObjectFileImageFromFile(filename, &ofile);

    if (NSObjectFileImageSuccess == dyld_result)
    {
        NSModule module = NSLinkModule(ofile, filename, 
                              NSLINKMODULE_OPTION_RETURN_ON_ERROR 
                              | NSLINKMODULE_OPTION_PRIVATE);
    
        NSDestroyObjectFileImage(ofile);

        return module; /* NSModule is typedef'd to void*  */
    }
    else
    { /* bundle-style loading didn't work; try dylib-style before giving up */
        const struct mach_header *header = 
                NSAddImage( filename, 
                            NSADDIMAGE_OPTION_RETURN_ON_ERROR 
                            | NSADDIMAGE_OPTION_WITH_SEARCHING);

        if (header)
        {
            union {
                const void * __c_ptr;
                void * __ptr;
            } __ptr_u;
#define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)

            return const_cast(header);
        }
        else
        { /* that didn't work either; go ahead and report the orignal error */

            switch(dyld_result) {
            case NSObjectFileImageFailure:
                fprintf(stderr, 
                        "open result was Failure (%i) for filename [%s]\n", 
                        dyld_result, filename);
                break;
            case NSObjectFileImageInappropriateFile:
                fprintf(stderr, 
                        "open result was InappropriateFile (%i) for filename [%s]\n",
                        dyld_result, filename);
                break;
            case NSObjectFileImageArch:
                fprintf(stderr, 
                        "open result was Arch (%i) for filename [%s]\n",
                        dyld_result, filename);
                break;
            case NSObjectFileImageFormat:
                fprintf(stderr, 
                        "open result was Format (%i) for filename [%s]\n",
                        dyld_result, filename);
                break;
            case NSObjectFileImageAccess:
                fprintf(stderr, 
                        "open result was Access (%i) for filename [%s]\n",
                        dyld_result, filename);
                break;
            default:
                fprintf(stderr, 
                        "open result was unknown (%i) for filename [%s]\n",
                        dyld_result, filename);
                break;
            }

            return NULL;
        }
    }
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
    NSSymbol found_symbol = NULL;
    char *fixed_name = malloc(strlen(symbol) + 2);

    /* Need to prepend underscore to symbol name to match the C convention 
       for symbol naming. */
    strcpy(fixed_name, "_");
    strcat(fixed_name, symbol);

    if (!handle) /* must be looking up global symbol */
    {
        if (NSIsSymbolNameDefined(fixed_name))
        {
            found_symbol = NSLookupAndBindSymbol(fixed_name);
        }
    }
    else if (    ((struct mach_header *)handle)->magic == MH_MAGIC 
              || ((struct mach_header *)handle)->magic == MH_CIGAM )
    {
        if (NSIsSymbolNameDefinedInImage(handle, fixed_name))
        {
            found_symbol = NSLookupSymbolInImage(handle, fixed_name, 
                    NSLOOKUPSYMBOLINIMAGE_OPTION_RETURN_ON_ERROR 
                    | NSLOOKUPSYMBOLINIMAGE_OPTION_BIND);
        }
    }
    else
    {
        found_symbol = NSLookupSymbolInModule(handle, fixed_name);
    }

    free(fixed_name);

    if (!symbol)
    {
        return NULL;
    }
    else
    {
        return NSAddressOfSymbol(found_symbol);
    }
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    if ( handle && !( ((struct mach_header *)handle)->magic == MH_MAGIC 
                   || ((struct mach_header *)handle)->magic == MH_CIGAM ) )
    {
        unsigned long options = NSUNLINKMODULE_OPTION_NONE;
#ifdef __ppc__
        options = NSUNLINKMODULE_OPTION_RESET_LAZY_REFERENCES;
#endif

        return (int)NSUnLinkModule(handle, options);
    }
    else
    {
        return 0;
    }
}


/*
 * itimer stuff
 */

#ifdef PARROT_HAS_SETITIMER

/*
 * Start a system timer with the passed value in milli seconds.
 *
 * The handle is that, what new_sys_timer_ms() returned.
 * We could pass ITIMER_REAL in handle, but for now we ignore it
 * as we are just having one timer.
 */

void
start_sys_timer_ms(void *handle, int ms)
{
    struct itimerval its;
    memset(&its, 0, sizeof(its));
    if (ms) {
	its.it_interval.tv_sec = its.it_value.tv_sec = ms/1000;
	its.it_interval.tv_usec = its.it_value.tv_usec = 1000 *(ms%1000);
    }
    setitimer(ITIMER_REAL, &its, NULL);
}

/* Stop the given timer. */
void
stop_sys_timer_ms(void *handle)
{
    start_sys_timer_ms(handle, 0);
}

/*
 * Return the programmed timer interval or 0 if none for the
 * given timer handle.
 */

int
get_sys_timer_ms(void *handle)
{
    struct itimerval ots;
    getitimer(ITIMER_REAL, &ots);
    return ots.it_interval.tv_sec * 1000 + ots.it_interval.tv_usec/1000;
}

/*
 * Create a new system timer with ~ms resolution.
 * The returned handle is passed to the other timer functions.
 */
void *
new_sys_timer_ms()
{
    return 0;
}

#else
#endif

/*
 * signal handling
 */
#ifdef PARROT_HAS_HEADER_SIGNAL
#include <signal.h>
/*
 * for now use signal based functions
 */

Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)
{
    return signal(signum, handler);
}
#endif


/*
** mem_alloc_executable() 
*/

void *
mem_alloc_executable(struct Parrot_Interp *interpreter, size_t size)
{
	return mem_sys_allocate_zeroed(size);
}


/*
** mem_realloc_executable()
*/

void *
mem_realloc_executable(struct Parrot_Interp *interpreter,
                       void* memblock, size_t size)
{
	return mem_sys_realloc(memblock, size);
}


/*
** mem_free_executable() 
*/

void
mem_free_executable(void *addr)
{
	mem_sys_free(addr);
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
