
/* Global_setup.c
 *
 * Performs all the global setting up of things. This includes the
 * (very few) global variables that Parrot totes around
 *
 */

#define INSIDE_GLOBAL_SETUP
#include "parrot.h"

void
init_world() {
    string_init(); /* Set up the string subsystem */ 
}
