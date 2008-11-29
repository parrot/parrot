/*
 *  Copyright (C) 2007, The Perl Foundation.
 * $Id$
 */

#ifndef PARROT_LUA_PRIVATE_H_GUARD
#define PARROT_LUA_PRIVATE_H_GUARD

#include "parrot/parrot.h"

extern INTVAL dynpmc_LuaBoolean;
extern INTVAL dynpmc_LuaFunction;
extern INTVAL dynpmc_LuaNil;
extern INTVAL dynpmc_LuaNumber;
extern INTVAL dynpmc_LuaString;
extern INTVAL dynpmc_LuaTable;
extern INTVAL dynpmc_LuaUserdata;

#define PMC_type(pmc)      ((pmc)->vtable->base_type)

extern PMC * find_meth(PARROT_INTERP, PMC *obj, const char *name);

#endif /* PARROT_LUA_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
