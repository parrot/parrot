/*
** Dynlib stuff
*/

#ifdef PARROT_HAS_HEADER_DLFCN
#  include <dlfcn.h>
#endif

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlopen(filename, PARROT_DLOPEN_FLAGS);
#else
    return 0;
#endif
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlerror();
#else
    return 0;
#endif
}

/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlsym(handle, symbol);
#else
    return 0;
#endif
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlclose(handle);
#else
    return -1;
#endif
}
