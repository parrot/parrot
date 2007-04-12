#ifndef __PIRUTIL_H
#  define __PIRUTIL_H


#  include <stdio.h>


/* command argument switches */
typedef enum pirc_flags {
    PIRC_VERBOSE     = 1,
    PIRC_DEBUG       = 2,

} pirc_flag;

extern void printverbose(char *message);

extern void printdebug(char *message);

extern char *clone_string(char const *str);

extern int is_op(char *id);

extern FILE *open_file(char *filename, char *mode);


/* where do we leave the flags?
#  define verbose(P,S)  if (P->flags & PIRC_VERBOSE) printverbose(S)
#  define debug(P,S)    if (P->flags & PIRC_DEBUG)   printdebug(S)
*/




#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
