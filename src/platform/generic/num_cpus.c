/*
 * Copyright (C) 2012, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/num_cpus.c

=head1 DESCRIPTION

Returns the number of CPUs for non-win32 systems
For win32, look in platform/win32/num_cpus.c

=head2 Functions

=cut

*/

#include "parrot/parrot.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef PARROT_HAS_HEADER_UNISTD
#  include <unistd.h>
#endif

/* HEADERIZER HFILE: none */

/*

=over 4

=item C<INTVAL Parrot_get_num_cpus(Parrot_Interp)>

Returns the number of CPUs

=back

=cut

*/

INTVAL
Parrot_get_num_cpus(Parrot_Interp interp) {
    INTVAL nprocs = -1;

#ifdef _SC_NPROCESSORS_ONLN
    nprocs = sysconf(_SC_NPROCESSORS_ONLN);
#elif defined (PARROT_HAS_HEADER_LIBCPUID)
    struct cpu_raw_data_t raw; 
    struct cpu_id_t data;     

    if (!cpuid_present()) {
        printf("cpuid_present failed\n");
        exit(EXIT_FAILURE);
    }
    if (cpuid_get_raw_data(&raw) < 0) { 
        printf("cpuid_get_raw_data failed\n");
        printf("Error: %s\n", cpuid_error());
        exit(EXIT_FAILURE);
    }
    if (cpu_identify(&raw, &data) < 0) {    
        printf("cpu_identify failed\n");
        printf("Error: %s\n", cpuid_error());
        exit(EXIT_FAILURE);
    }
    nprocs = data.num_cores;
#else
    FILE *f;
    char line[128];

    if (!fopen("/proc/cpuinfo", "rb"))
        exit(EXIT_FAILURE);

    while (!feof(f)) {
        fgets(line, 128, f);
        if (strlen(line) == 1) continue;
        if (strncmp(line, "cpu cores", 8) == 0) {
            sscanf(line, "cpu cores\t: %d", &nprocs);
            fclose (f);
            return nprocs;
        }
    }
    fclose (f);
#endif
    return nprocs;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

