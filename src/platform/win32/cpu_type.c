/*
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

src\platform\win32\cpu_type.c

=head1 DESCRIPTION

Fetch CPU type for win32 systems.

=head2 Functions

=over 4

=cut

*/

#include <ws2tcpip.h>
#undef CONST

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

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

