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

=back

=cut

=item C<STRING *Parrot_get_cpu_type(Parrot_Interp)>

Fetch CPU type for win32 systems

=cut

*/

STRING
*Parrot_get_cpu_type(Parrot_Interp interp) {
    SYSTEM_INFO sys_info;
    WORD proc_arch;
    STRING arch_type;

    GetSystemInfo(&sys_info);

    proc_arch = sys_info.wProcessorArchitecture;
    switch (proc_arch) {
      case PROCESSOR_ARCHITECTURE_AMD64:
        arch_type = "x64";
        break;
      case PROCESSOR_ARCHITECTURE_IA64:
        arch_type="IA64";
        break;
      case PROCESSOR_ARCHITECTURE_INTEL:
        arch_type="x86";
        break;
      case PROCESSOR_ARCHITECTURE_UNKNOWN:
        arch_type="unknown";
        break;
      default:
        arch_type="unknown";
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

