/* Copyright (C) 2001-2010, Parrot Foundation. */

#define PARROT_IN_EXTENSION

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/runcore_api.h"

int
main(void) {
    Parrot_Interp interp;

    interp = Parrot_new(NULL);

    Parrot_api_set_runcore(interp);

    /* DEBUG */
    printf("Hello world!\n");
    /* DEBUG */

    Parrot_x_exit(interp, 0);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

