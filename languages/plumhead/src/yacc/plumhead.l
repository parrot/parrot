%{
#include "y.tab.h"
%}

%%

Hello                 return HELLO;
.                     /* eat up everything else */

%%

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
