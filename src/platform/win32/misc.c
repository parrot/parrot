/*
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

src\platform\win32\misc.c

=head1 DESCRIPTION

Miscellaneous helper functions that are specific to Win32.

=head2 Functions

=over 4

=cut

*/

#include <ws2tcpip.h>
#undef CONST

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

#ifdef __MSYS__
#include <sys/cygwin.h>

PARROT_CAN_RETURN_NULL
LPWSTR
Parrot_platform_msys_str_to_path(PARROT_INTERP, ARGIN(STRING *path))
{
    int    count;
    char   rpath[MAX_PATH];
    LPSTR  spath;
    LPWSTR wpath;

    spath = Parrot_str_to_encoded_cstring(interp, path,
                Parrot_utf8_encoding_ptr);

    // assumes that paths can only grow by 1 char via adding ':'
    // TODO: verify that this is indeed the case
    if(strlen(spath) >= sizeof rpath - 1)
        return NULL;

    // TODO: what is the return value?
    cygwin_conv_to_win32_path(spath, rpath);
    Parrot_str_free_cstring(spath);

    count = MultiByteToWideChar(CP_UTF8, 0, rpath, -1, NULL, 0);
    if(!count) return NULL;

    wpath = mem_allocate_n_typed(count, WCHAR);
    if(!wpath) return NULL;

    MultiByteToWideChar(CP_UTF8, 0, rpath, -1, wpath, count);
    return wpath;
}

#endif

/*

=item C<void Parrot_platform_init_code(void)>

Initialize Parrot for the Win32 platform. Turns off ugly crash dialog
boxes on Win32.

=cut

*/

void
Parrot_platform_init_code(void)
{
    struct WSAData sockinfo;
    int ret;

    /* Start Winsock
     * no idea where or whether destroy it
     */
    ret = WSAStartup(2, &sockinfo);
    if (ret != 0)
        fprintf(stderr, "WSAStartup failed!!\n ErrorCode=%i\n\n",
                  WSAGetLastError());

    SetErrorMode(SEM_NOGPFAULTERRORBOX);
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

