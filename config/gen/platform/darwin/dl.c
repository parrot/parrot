/*
 * $Id$
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

dl.c

=head1 DESCRIPTION

The dl* functions showed up in OS X 10.3, but they are just a
wrapper around the native dyld and NSModule API, so we'll use
the base API directly. This gives us wider compatibility, and
more control over the behavior.

=head2 Functions

=over 4

=cut

*/

#import <mach-o/dyld.h>

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/*

=item C<static const char *
scan_paths(const char *filename, const char *libpath)>

Simple routine to walk a colon separated list of directories in a string
and check for a file in each one, returning the first match.
Note that this returns a static buffer, and so is not thread-safe.

=cut

*/

static const char *
scan_paths(const char *filename, const char *libpath)
{
    static char buf[PATH_MAX];
    struct stat st;
    char *path_list;
    char *path_list_start;
    const char *path;

    if (!libpath)
        return NULL;

    path_list_start = path_list = strdup(libpath);

    path = strsep(&path_list, ":");

    while (path) {
        snprintf(buf, PATH_MAX, "%s/%s", path, filename);
        if (stat(buf, &st) == 0) {
            free(path_list_start);
            return buf;
        }
        path = strsep(&path_list, ":");
    }
    free(path_list_start);
    return NULL;
}

/*

=item C<static const char *
get_lib(const char *filename)>

Try to expand a filename input into a full file system path following
the behavior described in dyld(1). First looks for the file in
DYLD_LIBRARY_PATH, the DYLD_FALLBACK_LIBRARY_PATH, and lastly uses the
default of /usr/local/lib:/lib:/usr/lib. If the filename cannot be
expanded, the original value passed to the function is returned.

=cut

*/

static const char *
get_lib(const char *filename)
{
    const char *rv;
    char *libpath = getenv("DYLD_LIBRARY_PATH");
    char fallback[PATH_MAX] = "/usr/local/lib:/lib:/usr/lib";

    rv = scan_paths(filename, libpath);
    if (rv)
      return rv;

    libpath = getenv("DYLD_FALLBACK_LIBRARY_PATH");
    rv = scan_paths(filename, libpath);
    if (rv)
        return rv;

    rv = scan_paths(filename, fallback);
    if (rv)
        return rv;

    return filename;
}

/*

=item C<void *
Parrot_dlopen(const char *filename)>

RT#48260: Not yet documented!!!

=cut

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
                NSAddImage(fullpath,
                           NSADDIMAGE_OPTION_RETURN_ON_ERROR
                           | NSADDIMAGE_OPTION_WITH_SEARCHING);

        if (header)
            return (void *)header;

        /*
         * that didn't work either; go ahead and report the original error
         */

        switch (dyld_result) {
        /* RT#48274 for now, ignore all the known errors */
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


/*

=item C<const char *
Parrot_dlerror(void)>

RT#48260: Not yet documented!!!

=cut

*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}


/*

=item C<void *
Parrot_dlsym(void *handle, const char *symbol)>

RT#48260: Not yet documented!!!

=cut

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
    else if (((struct mach_header *)handle)->magic == MH_MAGIC
             || ((struct mach_header *)handle)->magic == MH_CIGAM)
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

=item C<int
Parrot_dlclose(void *handle)>

RT#48260: Not yet documented!!!

=cut

*/

int
Parrot_dlclose(void *handle)
{
    if (handle && !(((struct mach_header *)handle)->magic == MH_MAGIC
               ||   ((struct mach_header *)handle)->magic == MH_CIGAM)) {
        unsigned long options = NSUNLINKMODULE_OPTION_NONE;
#ifdef __ppc__
        options = NSUNLINKMODULE_OPTION_RESET_LAZY_REFERENCES;
#endif

        return NSUnLinkModule(handle, options) ? 1 : 0;
    }
    else
        return 0;
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

