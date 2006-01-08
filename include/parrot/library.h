/* library.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Contains accessor functions for the _parrotlib bytecode interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_LIBRARY_H_GUARD)
#define PARROT_LIBRARY_H_GUARD

typedef enum {
    PARROT_RUNTIME_FT_LIBRARY = 0x0001,
    PARROT_RUNTIME_FT_INCLUDE = 0x0002,
    PARROT_RUNTIME_FT_DYNEXT  = 0x0004,
    PARROT_RUNTIME_FT_PBC     = 0x0010,
    PARROT_RUNTIME_FT_PASM    = 0x0100,
    PARROT_RUNTIME_FT_PIR     = 0x0200,
    PARROT_RUNTIME_FT_PAST    = 0x0400,
    PARROT_RUNTIME_FT_SOURCE  = 0x0F00
} enum_runtime_ft;

typedef enum {
    PARROT_LIB_PATH_INCLUDE,            /* .include "foo" */
    PARROT_LIB_PATH_LIBRARY,            /* load_bytecode "bar" */
    PARROT_LIB_PATH_DYNEXT,             /* loadlib "baz" */
    PARROT_LIB_DYN_EXTS,                /* ".so", ".dylib" .. */
    /* must be last: */
    PARROT_LIB_PATH_SIZE
} enum_lib_paths;

char* Parrot_locate_runtime_file(Interp *, const char *file_name,
        enum_runtime_ft);
STRING* Parrot_locate_runtime_file_str(Interp *, STRING *file_name,
        enum_runtime_ft);

void Parrot_autoload_class(Interp *, STRING *class);
const char* Parrot_get_runtime_prefix(Interp *, STRING **prefix);
void parrot_init_library_paths(Interp *);
STRING * parrot_split_path_ext(Interp* , STRING *in, 
        STRING **wo_ext, STRING **ext);

#endif /* PARROT_LIBRARY_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
