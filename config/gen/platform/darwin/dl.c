#import <mach-o/dyld.h>

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

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
#ifndef const_cast
#  define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)
#endif

            return const_cast(header);
        }
        else
        { /* that didn't work either; go ahead and report the orignal error */

            switch(dyld_result) {
            /* XXX for now, ignore all the known errors */
            case NSObjectFileImageFailure:
            case NSObjectFileImageInappropriateFile:
            case NSObjectFileImageArch:
            case NSObjectFileImageFormat:
            case NSObjectFileImageAccess:
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

