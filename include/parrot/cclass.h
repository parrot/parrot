/* dynext.h
*
* $Id: cclass.h jrieks $
*
*   Parrot character classes
*/

#if !defined(PARROT_CCLASS_H_GUARD)
#define PARROT_CCLASS_H_GUARD

/* &gen_from_enum(cclass.pasm) subst(s/enum_cclass_(\w+)/uc("CCLASS_$1")/e) */
typedef enum {				/* ASCII characters matching this class: */
enum_cclass_any = 0x0000,		/* all */
enum_cclass_none = 0xffff,		/* none */
enum_cclass_uppercase = 0x0001,		/* A-Z */
enum_cclass_lowercase = 0x0002,		/* a-z */
enum_cclass_alphabetic = 0x0004,	/* a-z, A-Z */
enum_cclass_numeric = 0x0008,		/* 0-9 */
enum_cclass_hexadecimal = 0x0010,	/* 0-9, a-f, A-F */
enum_cclass_whitespace = 0x0020,	/* ' ', '\f', '\n', '\r', '\t', '\v' */
enum_cclass_printing = 0x0040,		/* any printable character including space */
enum_cclass_graphical = 0x0080,		/* any printable character except space */
enum_cclass_blank = 0x0100, 		/* ' ', '\t' */
enum_cclass_control = 0x0200,		/* control characters */
enum_cclass_punctuation = 0x0400,	/* all except ' ', a-z, A-Z, 0-9 */
enum_cclass_alphanumeric = 0x0800,      /* a-z, A-Z, 0-9 */
enum_cclass_newline = 0x1000,           /* '\n', '\r' */
enum_cclass_word = 0x2000,		/* a-z, A-Z, 0-9, '_'*/
} PARROT_CCLASS_FLAGS;
/* &end_gen */

#endif /* PARROT_CCLASS_H_GUARD */
