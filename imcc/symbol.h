/* 
 * parrot/imcc/symbol.h
 *
 * Intermediate Code Compiler for Parrot.
 * 
 * Copyright (C) 2002 Melvin Smith
 *
 * Symbol management routines.
 * XXX FIXME: This should really be a library since symbol management is so common.
 */

#if !defined(PARROT_IMCC_SYMBOL_H_GUARD)
#define PARROT_IMCC_SYMBOL_H_GUARD


/*
 * Need to patch IMCC to use Symbol type where it makes
 * sense and stop using SymReg as a catchall.
 * Should be a lotta fun converting it.
 */


enum SYMBOLTYPE {
    SYMTYPE_CLASS,
    SYMTYPE_METHOD,
    SYMTYPE_FIELD
};

typedef struct _Symbol {

   char * name;
   int type;   /* PIR type (int, string, float, pmc) */

   /* A symbol can belong to exactly one table and/or one list but no more */
   struct _Symbol * nextintable;
   struct _Symbol * nextinlist;

   enum SYMBOLTYPE symtype;

   void * p;  /* Class, Method, Field */

} Symbol;


#define SYMTAB_HASHSIZE 109

typedef struct _SymbolTable {

   int count;
   Symbol * table[SYMTAB_HASHSIZE];

} SymbolTable;


typedef struct _SymbolList {

   Symbol * head;
   Symbol * tail;

} SymbolList;



/* Symbol table and list management */

extern Symbol * new_symbol(const char * str);
extern SymbolTable * new_symbol_table(void);
extern SymbolList * new_symbol_list(void);
extern void store_symbol(SymbolTable * st, Symbol * sym);
extern Symbol * lookup_symbol(SymbolTable * st, const char * name);
extern void push_symbol(SymbolList * list, Symbol * sym);
extern SymbolList * symtab_to_symlist(SymbolTable * st);



extern SymbolTable global_symbol_table;

#endif /* PARROT_IMCC_SYMBOL_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

