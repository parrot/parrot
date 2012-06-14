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

=item C<STRING * Parrot_get_cpu_type(Parrot_Interp interp)>

Fetch CPU type for win32 systems

=back

=cut

*/

STRING *
Parrot_get_cpu_type(Parrot_Interp interp) {
    SYSTEM_INFO sys_info;
    WORD arch_type;
    char *proc_arch;

    GetSystemInfo(&sys_info);

    arch_type = sys_info.wProcessorArchitecture;
    switch (arch_type) {
      case PROCESSOR_ARCHITECTURE_AMD64:
        proc_arch = "x64";
        break;
      case PROCESSOR_ARCHITECTURE_IA64:
        proc_arch ="IA64";
        break;
      case PROCESSOR_ARCHITECTURE_INTEL:
        proc_arch ="x86";
        break;
      case PROCESSOR_ARCHITECTURE_UNKNOWN:
        proc_arch ="unknown";
        break;
      default:
        proc_arch ="unknown";
        break;
    }

    return Parrot_str_new_init(interp, proc_arch, strlen(proc_arch),
            Parrot_ascii_encoding_ptr, 0);

}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

