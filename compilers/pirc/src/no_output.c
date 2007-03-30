#include "pirvtable.h"
#include "pirparser.h"
#include <stdlib.h>


static void
none(struct parser_state *p) {
	/* do nothing */	
}

pirvtable *
init_none_vtable(void) {
	pirvtable *vtable = (pirvtable *)malloc(sizeof(pirvtable));
	
	vtable->sub_start = none;
	vtable->sub_end   = none;
	vtable->name      = none;
	
	return vtable;
}
