/* exceptions.h 
 *
 * define the internal interpreter exceptions
 *
 */

#if !defined(PARROT_EXCEPTIONS_H_GUARD)
#define PARROT_EXCEPTIONS_H_GUARD

#define INTERNAL_EXCEPTION(x,y) {fprintf(stderr, y); exit(x);}

#define NO_REG_FRAMES 1

#endif
