#ifndef __SYMBOL_H
#define __SYMBOL_H


/*
 * Need to patch IMCC to use Symbol type where it makes
 * sense and stop using SymReg as a catchall.
 * Should be a lotta fun converting it.
 */

typedef struct _Symbol {

   char * name;
   struct _Symbol * last;
   struct _Symbol * next;

   union p {
      SymReg * reg;
      Class * cl;
      Method * method;
      Field * field;
   };

} Symbol;

#endif

