#ifndef PARROT_BCG_UTILS_H
#define PARROT_BCG_UTILS_H

#include "bcg.h"

/* Function for CString based hash tables. */
typedef Hash bcg_hash;

bcg_hash *bcg_hash_create(BCG_info * bcg_info);
void bcg_hash_destroy(BCG_info * bcg_info, bcg_hash * hash);
void bcg_hash_put(BCG_info * bcg_info, bcg_hash * hash, char *key,
                  void *value);
void *bcg_hash_get(BCG_info * bcg_info, bcg_hash * hash, char *key);

#endif /* PARROT_BCG_UTILS_H */
