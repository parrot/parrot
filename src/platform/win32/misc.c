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
    char   win32_path[MAX_PATH];
    LPSTR  posix_path;
    LPWSTR wp_path;

    posix_path = Parrot_str_to_encoded_cstring(interp, path,
                     Parrot_utf8_encoding_ptr);

    /* ignore return value (-1 for relative paths, 0 for abolute paths) */
    cygwin_conv_to_win32_path(posix_path, win32_path);
    Parrot_str_free_cstring(posix_path);

    count = MultiByteToWideChar(CP_UTF8, 0, win32_path, -1, NULL, 0);
    if(!count) return NULL;

    wp_path = mem_allocate_n_typed(count, WCHAR);
    if(!wp_path) return NULL;

    if(!MultiByteToWideChar(CP_UTF8, 0, win32_path, -1, wp_path, count))
    {
        mem_sys_free(wp_path);
        return NULL;
    }

    return wp_path;
}

PARROT_CAN_RETURN_NULL
STRING *
Parrot_platform_msys_path_to_str(PARROT_INTERP, ARGIN(LPWSTR path))
{
    /* TODO: check if cygwin_conv_to_posix_path() can be done in-place */
    int  count;
    char win32_path[MAX_PATH];
    char posix_path[MAX_PATH];

    count = WideCharToMultiByte(CP_UTF8, 0, path, -1, win32_path,
                sizeof win32_path, NULL, NULL);

    if(!count)
        return NULL;

    /* TODO: return value */
    cygwin_conv_to_posix_path(win32_path, posix_path);

    /* TODO: check if you can re-use old count */
    count = strlen(posix_path);

    return Parrot_str_new_init(interp, posix_path, count,
               Parrot_utf8_encoding_ptr, 0);
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

