#import <mach-o/dyld.h>

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/* The dl* functions showed up in OS X 10.3, but they are just a
   wrapper around the native dyld and NSModule API, so we'll use
   the base API directly. This gives us wider compatibility, and
   more control over the behavior. */

/*
** scan_paths()
 */

/* Simple routine to walk a colon separated list of directories in a string 
   and check for a file in each one, returning the first match. */
static const char *
scan_paths(const char *filename, const char *libpath)
{
    static char buf[PATH_MAX];
    struct stat st;
    const char *path;
    
    if(!libpath)
      return NULL;
    
    path = strsep((char**)&libpath, ":");
  
    while(path) {
        snprintf(buf, PATH_MAX, "%s/%s", path, filename);
        if(stat(buf, &st) == 0)
          return buf;
        path = strsep((char**)&libpath, ":");
    }
    return NULL;
}

/*
** get_lib()
*/

/* Try to expand a filename input into a full file system path following 
   the behavior described in dyld(1). First looks for the file in 
   DYLD_LIBRARY_PATH, the DYLD_FALLBACK_LIBRARY_PATH, and lastly uses the 
   default of /usr/local/lib:/lib:/usr/lib. If the filename cannot be 
   expanded, the original value passed to the function is returned. */
static const char *
get_lib(const char *filename) 
{
    const char *rv;
    char *libpath = getenv("DYLD_LIBRARY_PATH");
    char fallback[PATH_MAX] = "/usr/local/lib:/lib:/usr/lib";
    
    rv = scan_paths(filename, libpath);
    if(rv)
      return rv;

    libpath = getenv("DYLD_FALLBACK_LIBRARY_PATH");
    rv = scan_paths(filename, libpath);
    if(rv)
        return rv;

    rv = scan_paths(filename, fallback);
    if(rv)
        return rv;

    return filename;
}

/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    int dyld_result;
    NSObjectFileImage ofile;
    const char *fullpath = get_lib(filename);

    /* try bundle-style loading first */
    dyld_result = NSCreateObjectFileImageFromFile(fullpath, &ofile);

    if (NSObjectFileImageSuccess == dyld_result)
    {
        NSModule module = NSLinkModule(ofile, fullpath,
                              NSLINKMODULE_OPTION_RETURN_ON_ERROR
                              | NSLINKMODULE_OPTION_PRIVATE);

        NSDestroyObjectFileImage(ofile);

        return module; /* NSModule is typedef'd to void*  */
    }
    else
    { /* bundle-style loading didn't work; try dylib-style before giving up */
        const struct mach_header *header =
                NSAddImage( fullpath,
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
                        "open result was unknown (%i) for fullpath [%s]\n",
                        dyld_result, fullpath);
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

