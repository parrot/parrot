/* 
 * parrot/imcc/class.h
 *
 * Intermediate Code Compiler for Parrot.
 * 
 * Copyright (C) 2002 Melvin Smith
 *
 * Class management
 */

#if !defined(PARROT_IMCC_CLASS_H_GUARD)
#define PARROT_IMCC_CLASS_H_GUARD

typedef struct _Field {

  Symbol * sym;             /* Circular reference */

} Field;


typedef struct _Method {

  Symbol * sym;             /* Circular reference */
  Symbol * label;

} Method;


typedef struct _Class {

  Symbol * sym;             /* Circular reference */
  SymbolTable * members;

} Class;


Class * new_class(Symbol *);
Method * new_method(Symbol * sym, Symbol * label);
void store_field_symbol(Class * cl, Symbol * sym);
void store_method_symbol(Class * cl, Symbol * sym);
Symbol * lookup_field_symbol(Class *cl, const char * name);
Symbol * lookup_method_symbol(Class *cl, const char * name);


#endif /* PARROT_IMCC_CLASS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

