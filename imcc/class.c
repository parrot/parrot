/*
 * parrot/imcc/class.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Class management. Really quick and dirty.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "symbol.h"
#include "class.h"


Class * new_class(Symbol * sym)
{
   Class * cl = calloc(1, sizeof(Class));
   sym->symtype = SYMTYPE_CLASS;
   cl->sym = sym;
   cl->members = new_symbol_table();
   return cl;
}

Method * new_method(Symbol * sym, Symbol * label)
{
   Method * meth = calloc(1, sizeof(Method));
   sym->symtype = SYMTYPE_METHOD;
   meth->sym = sym;
   meth->label = label;
   sym->p = (void*)meth;
   return meth;
}

/*
 * XXX: I suppose this is inadequate since there are
 * languages which may allow fields and methods to
 * be the same name.
 */
void store_field_symbol(Class * cl, Symbol * sym)
{
#if 0
   fprintf(stderr, "%s.store_field_symbol %s\n", cl->sym->name, sym->name);
#endif
   sym->symtype = SYMTYPE_FIELD;
   store_symbol(cl->members, sym);
}


void store_method_symbol(Class * cl, Symbol * sym)
{
   sym->symtype = SYMTYPE_METHOD;
   store_symbol(cl->members, sym);
}


Symbol * lookup_field_symbol(Class *cl, const char * name)
{
   Symbol * sym = lookup_symbol(cl->members, name);
   if (!sym)
      return NULL;
   if (sym->symtype == SYMTYPE_FIELD)
      return sym;
   return NULL;
}


Symbol * lookup_method_symbol(Class *cl, const char * name)
{
   Symbol * sym = lookup_symbol(cl->members, name);
   if (!sym)
      return NULL;
   if (sym->symtype == SYMTYPE_METHOD)
      return sym;
   return NULL;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

