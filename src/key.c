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

struct _bucket {
  KEY_PAIR pair;
  STRING*  key;
  struct _bucket* next;
};

typedef struct _bucket BUCKET;

static void
debug_key (struct Parrot_Interp* interpreter, KEY* key) {
  INTVAL i;
  fprintf(stderr," *** key %p\n",key);
  fprintf(stderr," *** size %d\n",key->size);
  for(i=0;i<key->size;i++) {
    INTVAL type = key->keys[i].type;
    if(type == enum_key_bucket) {
      fprintf(stderr," *** Bucket %d type %d\n",i,type);
    }
    else if(type != enum_key_undef) {
      fprintf(stderr," *** Other %d type %d\n",i,type);
    }
  }
}

static BUCKET*
new_bucket (struct Parrot_Interp* interpreter, STRING* key, KEY_PAIR* pair) {
  BUCKET* bucket = mem_sys_allocate(sizeof(BUCKET));
  if(bucket != NULL) {
    if(key != NULL) {
      if(pair != NULL) {
        bucket->key = string_copy(interpreter,key);
        memcpy(&bucket->pair,pair,sizeof(KEY_PAIR));
      }
      else {
        fprintf(stderr,"*** new_bucket was given a null pair\n");
      }
    }
    else {
      fprintf(stderr,"*** new_bucket was given a null key\n");
    }
  }
  else {
    fprintf(stderr,"*** new_bucket attempted to return a null bucket\n");
  }
  return bucket;
}

static KEY_PAIR*
find_bucket (struct Parrot_Interp *interpreter, BUCKET* head, STRING* key) {
  KEY_PAIR* pair = NULL;
  if(head != NULL) {
    if(key != NULL) {
      while(head != NULL) {
        if(string_compare(interpreter,key,head->key) == 0) {
          pair = &head->pair;
          break;
        }
        head = head->next;
      }
    }
    else {
      fprintf(stderr,"*** find_bucket given a null key\n");
    }
  }
  else {
    fprintf(stderr,"*** find_bucket given a null bucket\n");
  }
  return pair;
}

/*=for api key key_hash

Return the hashed value of the string

=cut
*/

static INTVAL key_hash(struct Parrot_Interp *interpreter, STRING* value) {
  char* buffptr = value->bufstart;
  INTVAL len    = value->bufused;
  INTVAL hash   = 5893;

  while(len--) {
    hash = hash * 33 + *buffptr++;
  }
  if(hash < 0) {
    hash = -hash;
  }
  return hash;
}


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
    return 0;
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
	INTVAL i;
        key->keys = pair;
	for(i=key->size;i<size;i++) {
	  key->keys[i].type = enum_key_undef;
	}
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

return the type of element <idx> of KEY <key>

=cut
*/

INTVAL key_element_type(struct Parrot_Interp *interpreter, KEY* key, 
                        INTVAL idx) {
  if(key != NULL) {
    if((idx >= 0) || (idx < key->size)) {
      KEY_PAIR* pair = &key->keys[idx];
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

return the value of index <idx> of KEY <key>

=cut
*/

KEY_PAIR* key_element_value_i(struct Parrot_Interp *interpreter, KEY* key, 
                              INTVAL idx) {
  if(key != NULL) {
    if((idx >= 0) || (idx < key->size)) {
      KEY_PAIR* pair = &key->keys[idx];
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
  fprintf(stderr,"*** key_element_value_i checking a NULL key\n");
  return NULL;
}

KEY_PAIR*
key_element_value_s(struct Parrot_Interp *interpreter, KEY* key, STRING* idx) {
  KEY_PAIR* pair;
  if(key != NULL) {
    if(idx != NULL) {
      INTVAL hash = key_hash(interpreter,idx);
      hash = hash % NUM_BUCKETS;
      pair = find_bucket(interpreter,key->keys[hash].cache.struct_val,idx);
      if(pair == NULL) {
        fprintf(stderr,"*** key_element_value_s pair returning a null key\n");
      }
    }
    else {
      fprintf(stderr,"*** key_element_value_s given a NULL index\n");
    }
  }
  else {
    fprintf(stderr,"*** key_element_value_s given a NULL key\n");
  }
  return pair;
}

/*=for api key key_set_element_value_i

Set the value of index <idx> of key <key> to integer <value>

=cut
*/

void key_set_element_value_i(struct Parrot_Interp *interpreter, KEY* key, 
                             INTVAL idx, KEY_PAIR* value) {
  if(key != NULL) {
    if((idx >= 0) || (idx < key->size)) {
      memcpy(&key->keys[idx],value,sizeof(KEY_PAIR));
    }
    else {
      fprintf(stderr,
          "*** key_set_element_value_i setting value out of bounds\n");
    }
  }
  else {
    fprintf(stderr,"*** key_set_element_value_i assigning to a NULL key\n");
  }
}

/*=for api key key_set_element_value_s

Set the value of index <idx> of key <key> to string <value>

=cut
*/

void key_set_element_value_s(struct Parrot_Interp *interpreter, KEY* key, 
                             STRING* idx, KEY_PAIR* value) {
  if(key != NULL) {
    if(idx != NULL) {
      if(value != NULL) {
        INTVAL  hash   = key_hash(interpreter,idx);
        BUCKET* bucket = new_bucket(interpreter,idx,value);
        if(bucket != NULL) {
          hash = hash % NUM_BUCKETS;
          /* Resize the hash here rather than set an initial size. */
          if(hash > key->size) {
            key_set_size(interpreter,key,hash+1);
          }
          if(key->keys[hash].type != enum_key_undef) {
            STRING* tmp = key->keys[hash].cache.struct_val;
            bucket->next = (BUCKET*)tmp;
          }
          else {
          }
          key->keys[hash].cache.struct_val = bucket;
          key->keys[hash].type = enum_key_bucket;
        }
        else {
          fprintf(stderr,"*** key_set_element_value_s given a NULL bucket\n");
        }
      }
      else {
        fprintf(stderr,"*** key_set_element_value_s given a NULL value\n");
      }
    }
    else {
      fprintf(stderr,"*** key_set_element_value_s given a NULL index\n");
    }
  }
  else {
    fprintf(stderr,"*** key_set_element_value_s given a NULL key\n");
  }
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

Increment the type of index <idx> of key <key>

=cut
*/

void key_inc(struct Parrot_Interp *interpreter, KEY* key, INTVAL idx) {
  if(key != NULL) {
    if(idx > 0 && idx <= key->size) {
      KEY_PAIR* pair = &key->keys[idx];
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
