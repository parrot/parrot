/* key.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The base vtable calling functions.
 *  Data Structure and Algorithms:
 *     See include/parrot/key.h.
 *  History:
 *     Initial version by Jeff G. on 2001.12.05
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/*=for api key key_new

Return a pointer to a new KEY structure

=cut
*/

KEY* key_new(struct Parrot_Interp *interpreter) {
  KEY* key = mem_sys_allocate(sizeof(KEY));
  key->size = 0;
  return key;
}

/*=for api key key_clone

Return a copy of the KEY <key>.

=cut
*/

KEY* key_clone(struct Parrot_Interp *interpreter, KEY* key) {
  KEY* new_key = NULL;
  if(key != NULL) {
    new_key = key_new(interpreter);
    memcpy(new_key,key,sizeof(KEY));
  }
  else {
    fprintf(stderr,"*** key_clone attempted to clone a NULL variable\n");
  }
  return new_key;
}

/*=for api key key_size

return the size of KEY <key>

=cut
*/

INTVAL key_size(struct Parrot_Interp *interpreter, KEY* key) {
  if(key != NULL) {
    return key->size;
  }
  else {
    fprintf(stderr,"*** key_size asked to check a NULL key\n");
  }
}

/*=for api key key_set_size

Set the size of KEY <key> to <size>.

=cut
*/

void key_set_size(struct Parrot_Interp *interpreter, KEY* key, INTVAL size) {
  if(key != NULL) {
    if(size < 0) {
      fprintf(stderr,"*** key_set_size asked to resize below zero\n");
      return;
    }
    if(size > key->size) {
      KEY_PAIR* pair = (KEY_PAIR*)realloc(key->keys,sizeof(KEY_PAIR)*size);
      if(pair != NULL) {
        key->keys = pair;
      }
      else {
        fprintf(stderr,"*** key_set_size tried to allocate a NULL pair\n");
      }
    }
    else if(size < key->size) {
      INTVAL i;
      for(i=size;i<key->size;i++) {
        /* Memory leak in the making */
      }
      key->keys = (KEY_PAIR*)realloc(key->keys,sizeof(KEY_PAIR)*size);
    }
    key->size = size;
  }
  else {
    fprintf(stderr,"*** key_set_size attempted to resize a NULL key\n");
  }
}

/*=for api key key_destroy

Destroy KEY <key>

=cut
*/

void key_destroy(struct Parrot_Interp *interpreter, KEY* key) {
  if(key != NULL) {
    INTVAL i;
    for(i=0;i<key->size;i++) {
      /* Memory leak in the making */
    }
    free(key);
  }
  else {
    fprintf(stderr,"*** key_destroy freeing NULL key\n");
  }
}

/*=for api key key_element_type

return the type of element <index> of KEY <key>

=cut
*/

INTVAL key_element_type(struct Parrot_Interp *interpreter, KEY* key, INTVAL index) {
  if(key != NULL) {
    if((index >= 0) || (index < key->size)) {
      KEY_PAIR* pair = &key->keys[index];
      return pair->type;
    }
    else {
      fprintf(stderr,"*** key_element_type checking out of bounds\n");
      return -1;
    }
  }
  fprintf(stderr,"*** key_element_type checking a NULL key\n");
  return -1;
}

/*=for api key key_element_value_i

return the value of index <index> of KEY <key>

=cut
*/

KEY_PAIR* key_element_value_i(struct Parrot_Interp *interpreter, KEY* key, INTVAL index) {
  if(key != NULL) {
    if((index >= 0) || (index < key->size)) {
      KEY_PAIR* pair = &key->keys[index];
      if(pair != NULL) {
        return pair;
      }
      else {
        fprintf(stderr,"*** key_element_value_i pair returning a null key\n");
      }
    }
    else {
      fprintf(stderr,"*** key_element_value_i checking out of bounds\n");
    }
  }
  fprintf(stderr,"*** key_element_value_ checking a NULL key\n");
  return NULL;
}

KEY_PAIR* key_element_value_s(struct Parrot_Interp *interpreter, KEY* key, STRING* index) {
  if(key != NULL) {
/*
    if((index >= 0) || (index < key->size)) {
      KEY_PAIR* pair = &key->keys[index];
      if(pair != NULL) {
        return pair->cache.struct_val;
      }
      else {
        fprintf(stderr,"*** key_element_value_s pair returning a null key\n");
      }
    }
    else {
      fprintf(stderr,"*** key_element_value_s checking out of bounds\n");
    }
*/
  }
  fprintf(stderr,"*** key_element_value_s not implemented yet\n");
  return NULL;
}

/*=for api key key_set_element_value_i

Set the value of index <index> of key <key> to integer <value>

=cut
*/

void key_set_element_value_i(struct Parrot_Interp *interpreter, KEY* key, INTVAL index, KEY_PAIR* value) {
  if(key != NULL) {
    if((index >= 0) || (index < key->size)) {
      memcpy(&key->keys[index],value,sizeof(KEY_PAIR));
    }
    else {
      fprintf(stderr,"*** key_set_element_value_i setting value out of bounds\n");
    }
  }
  else {
    fprintf(stderr,"*** key_set_element_value_i assigning to a NULL key\n");
  }
}

/*=for api key key_set_element_value_s

Set the value of index <index> of key <key> to string <value>

=cut
*/

void key_set_element_value_s(struct Parrot_Interp *interpreter, KEY* key, STRING* index, KEY_PAIR* value) {
  if(key != NULL) {
/*
    if((index >= 0) || (index < key->size)) {
      KEY_PAIR* pair = &key->keys[index];
      pair->cache.struct_val = value;
      pair->type = enum_key_string;
    }
*/
  }
  fprintf(stderr,"*** key_set_element_value_s not implemented yet\n");
}

/*=for api key key_chop

Remove the last element of key <key>

=cut
*/

void key_chop(struct Parrot_Interp *interpreter, KEY* key) {
  if(key != NULL) {
    if(key->size > 0) {
      /* Memory leak in the making */
      key->size--;
      key->keys = (KEY_PAIR*)realloc(key->keys,sizeof(KEY_PAIR)*key->size);
    }
    else if(key->size == 0) {
      fprintf(stderr,
              "*** key_chop chopping a zero-length key! SHOULD NOT HAPPEN\n");
    }
    else {
      fprintf(stderr,
              "*** key_chop chopping before start! SHOULD NOT HAPPEN\n");
    }
  }
  else {
    fprintf(stderr,"*** key_chop chopping a NULL key\n");
  }
}

/*=for api key key_inc

Increment the type of index <index> of key <key>

=cut
*/

void key_inc(struct Parrot_Interp *interpreter, KEY* key, INTVAL index) {
  if(key != NULL) {
    if(index > 0 && index <= key->size) {
      KEY_PAIR* pair = &key->keys[index];
      pair->type++;
    }
    else {
      fprintf(stderr,
              "*** key_inc attempting to increment an out-of-range index\n");
    }
  }
  else {
    fprintf(stderr,"*** key_inc working on a NULL key\n");
  }
}
