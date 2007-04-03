/*

=head1 NAME

jsonout.c - JSON backend for PIRC

=cut

*/
#include "jsonout.h"
#include "pirvtable.h"
#include "pirparser.h"
#include <stdio.h>

#define OUT  stderr

static void
json_init(struct parser_state *p) {
    fprintf(OUT, "{\n");
}


static void
json_end(struct parser_state *p) {
    fprintf(OUT, "}\n");
}


static void
json_sub_start(struct parser_state *p, char *name, int pos) {

}


pirvtable *
init_json_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    vtable->initialize = json_init;
    vtable->sub_start  = json_sub_start;
    vtable->end        = json_end;

    return vtable;
}

