/*
 * parrot/imcc/symbol.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Symbol management routines.
 * XXX FIXME: This should really be a library since symbol management is
 *  so common.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "symbol.h"
#include "class.h"


static int
hash_str(const char * str)
{
    unsigned long key = 0;
    const char * s;
    for (s=str; *s; s++)
        key = key * 65599 + *s;
    return key;
}


Symbol *
new_symbol(const char * str)
{
   Symbol * sym = calloc(1, sizeof(Symbol));
   sym->name = malloc(strlen(str)+1);
   strcpy(sym->name, str);
   return sym;
}


SymbolTable *
new_symbol_table(void)
{
   SymbolTable * st = calloc(1,sizeof(SymbolTable));

   if (!st)
      abort();

   return st;
}


SymbolList *
new_symbol_list(void)
{
   SymbolList * sl = calloc(1,sizeof(SymbolList));

   if (!sl)
      abort();

   return sl;
}


/*
 * Store a symbol into table
 */
void
store_symbol(SymbolTable * st, Symbol * sym)
{
   unsigned int i;
   if (!sym)
      return;
   i = hash_str(sym->name) % SYMTAB_HASHSIZE;
   sym->nextintable = st->table[i];
   st->table[i] = sym;
#if 0
   fprintf(stderr, "store_symbol table=%x: %s hashbucket=%d\n", st, sym->name, i);
#endif
}


/*
 * Lookup a symbol by name in table.
 * No scope levels yet.
 */
Symbol *
lookup_symbol(SymbolTable * st, const char * name)
{
    Symbol * sym;
    unsigned int i = hash_str(name) % SYMTAB_HASHSIZE;
    for (sym = st->table[i]; sym; sym = sym->nextintable) {
        if (!strcmp(name, sym->name))
            return sym;
    }

    return NULL;
}


void
push_symbol(SymbolList * list, Symbol * sym)
{
    sym->nextinlist = list->head;
    list->head = sym;
    if (!list->tail)
       list->tail = sym;
}


/*
 * Walk hash table and construct a list. If any symbols
 * already belong to a list, the old list will become
 * invalid.
 */
SymbolList *
symtab_to_symlist(SymbolTable * st)
{
   Symbol * sym, * next;
   int i;
   SymbolList * list = new_symbol_list();
   sym = NULL;
   for (i = 0; i < SYMTAB_HASHSIZE; i++) {
      for (next = st->table[i]; next; next = next->nextintable) {
         if (!list->head)
            list->head = next;
         if (sym)
            sym->nextinlist = next;

         sym = next;
         sym->nextinlist = NULL;
      }
   }

   list->tail = sym;
   return list;
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

