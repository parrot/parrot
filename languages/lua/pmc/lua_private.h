/*
Copyright (C) 2007, The Perl Foundation.
$Id$
*/

#include "parrot/parrot.h"

extern INTVAL dynpmc_LuaBoolean;
extern INTVAL dynpmc_LuaClosure;
extern INTVAL dynpmc_LuaFunction;
extern INTVAL dynpmc_LuaNil;
extern INTVAL dynpmc_LuaNumber;
extern INTVAL dynpmc_LuaString;
extern INTVAL dynpmc_LuaTable;

extern PMC * find_meth(Interp* interp, PMC *obj, const char *name);

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
