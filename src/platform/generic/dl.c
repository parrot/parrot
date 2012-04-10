/*
 * Copyright (C) 2004-2012, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/dl.c

=head1 DESCRIPTION

Parrot functions which wrap around standard library functions for handling dynamic libraries.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#ifdef PARROT_HAS_HEADER_DLFCN
#  include <stddef.h>
#  include <stdlib.h>
#  include <dlfcn.h>
#endif

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void * find_handle_entry(ARGIN(const void *handle))
        __attribute__nonnull__(1);

static void push_handle_entry(ARGIN_NULLOK(void *handle));
static void remove_handle_entry(ARGIN_NULLOK(void *handle));
#define ASSERT_ARGS_find_handle_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_push_handle_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_remove_handle_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define PARROT_DLOPEN_FLAGS RTLD_LAZY

#ifdef PARROT_HAS_HEADER_DLFCN

/*

=item C<static void push_handle_entry(void *handle)>

=item C<static void * find_handle_entry(const void *handle)>

=item C<static void remove_handle_entry(void *handle)>

Helper functions to load and unload libraries.

=cut

*/

struct handle_entry {
    void *handle;
    struct handle_entry *next;
};

struct handle_entry *handle_list = NULL;

static void
push_handle_entry(ARGIN_NULLOK(void *handle))
{
    ASSERT_ARGS(push_handle_entry)

    struct handle_entry *e;

    e = (struct handle_entry *) malloc(sizeof (struct handle_entry));
    if (!e) {
        return;
    }

    e->handle = handle;
    e->next = handle_list;
    handle_list = e;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void *
find_handle_entry(ARGIN(const void *handle))
{
    ASSERT_ARGS(find_handle_entry)

    const struct handle_entry *e;

    for (e = handle_list; e; e = e->next) {
        if (e->handle == handle)
            return e->handle;
    }

    return NULL;
}

static void
remove_handle_entry(ARGIN_NULLOK(void *handle))
{
    ASSERT_ARGS(remove_handle_entry)

    if (handle_list) {
        if (handle_list->handle == handle) {
            struct handle_entry * const p = handle_list;
            handle_list = p->next;
            free(p);
        }
        else {
            struct handle_entry *cur, *prev;
            for (cur = handle_list; cur; prev = cur, cur = cur->next) {
                if (cur->handle == handle) {
                    prev->next = cur->next;
                    free(cur);
                }
            }
        }
    }
}
#endif /* PARROT_HAS_HEADER_DLFCN */



/*

=item C<void * Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)>

Parrot wrapper around C<dlopen>.  Loads dynamic library file named by first
argument and returns a handle to it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    void *h;

    h = dlopen(filename, PARROT_DLOPEN_FLAGS |
            ((flags & Parrot_dlopen_global_FLAG) ? RTLD_GLOBAL : 0));
    push_handle_entry(h);
    return h;
#else
    return NULL;
#endif
}

/*

=item C<const char * Parrot_dlerror(void)>

Wrapper around C<dlerror>.  System-dependent string that indicates most recent
failure in use of C<Parrot_dlopen>, C<Parrot_dlclose> or C<Parrot_dlsym>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char *
Parrot_dlerror(void)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlerror();
#else
    return NULL;
#endif
}

/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

Wrapper around C<dlysm>.  Takes a handle returned by C<Parrot_dlopen> and
returns address where symbol is located.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_dlsym(void *handle, const char *symbol)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    if (!handle)
        handle = RTLD_DEFAULT;
    return dlsym(handle, symbol);
#else
    return NULL;
#endif
}

/*

=item C<int Parrot_dlclose(void *handle)>

Wrapper around C<dlclose>.  Releases reference to dynamic library specified
by argument.  Returns C<0> on success and C<-1> on failure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
Parrot_dlclose(void *handle)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    int rv;

    if (find_handle_entry(handle)) {
        remove_handle_entry(handle);
        rv = dlclose(handle);
        return rv;
    }
#endif
    return -1;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
