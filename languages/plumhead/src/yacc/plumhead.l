%{
#include "y.tab.h"
%}

%%

Hello                 return HELLO;
.                     /* eat up everything else */

%%
