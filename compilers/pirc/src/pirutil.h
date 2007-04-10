#ifndef __PIRUTIL_H
#  define __PIRUTIL_H



/* command argument switches */
typedef enum pirc_flags {
        PIRC_VERBOSE     = 1,
        PIRC_DEBUG       = 2,

} pirc_flag;



extern void printverbose(char *message);

extern void printdebug(char *message);

extern char *clone_string(char const *str);

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
