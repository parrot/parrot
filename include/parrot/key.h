/* key.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_KEY_H_GUARD)
#define PARROT_KEY_H_GUARD

typedef enum {
  enum_key_int,
  enum_key_num,
  enum_key_string,
  enum_key_max
} KEY_TYPE;

struct _key_pair {
  KEY_TYPE type;
  union {
    INTVAL int_val;
    FLOATVAL num_val;
    STRING* struct_val;
  } cache;
};

typedef struct _key_pair KEY_PAIR;

struct _key {
  INTVAL size;
  KEY_PAIR* keys;
};

typedef struct _key KEY;

/* Prototypes */
KEY* key_new(struct Parrot_Interp *interpreter);
KEY* key_clone(struct Parrot_Interp *interpreter, KEY *key);
INTVAL key_size(struct Parrot_Interp *interpreter, KEY *key);
void key_set_size(struct Parrot_Interp *interpreter, KEY *key, INTVAL size);
void key_destroy(struct Parrot_Interp *interpreter, KEY *key);
INTVAL   key_element_value_i(struct Parrot_Interp *interpreter, KEY *key, INTVAL index);
FLOATVAL key_element_value_n(struct Parrot_Interp *interpreter, KEY *key, INTVAL index);
STRING*  key_element_value_s(struct Parrot_Interp *interpreter, KEY *key, INTVAL index);
void key_set_element_value_i(struct Parrot_Interp *interpreter, KEY *key, INTVAL index, INTVAL value);
void key_set_element_value_n(struct Parrot_Interp *interpreter, KEY *key, INTVAL index, FLOATVAL value);
void key_set_element_value_s(struct Parrot_Interp *interpreter, KEY *key, INTVAL index, STRING* value);
void key_chop(struct Parrot_Interp *interpreter, KEY *key);
void key_inc(struct Parrot_Interp *interpreter, KEY *key, INTVAL index);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
