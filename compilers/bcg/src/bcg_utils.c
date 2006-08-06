#include "bcg_utils.h"
#include "parrot/parrot.h"

bcg_hash *
bcg_hash_create(BCG_info *bcg_info)
{
    bcg_hash *hash;

    parrot_new_cstring_hash(bcg_info->interp, &hash);
    return hash;
}

void
bcg_hash_destroy(BCG_info *bcg_info, bcg_hash *hash)
{
    parrot_hash_destroy(bcg_info->interp, hash);
}

void
bcg_hash_put(BCG_info *bcg_info, bcg_hash *hash, char *key, void *value)
{
    parrot_hash_put(bcg_info->interp, hash, key, value);
}

void *
bcg_hash_get(BCG_info *bcg_info, bcg_hash *hash, char *key)
{
    DECL_CONST_CAST_OF(char);

    return parrot_hash_get(bcg_info->interp, hash, const_cast(key));
}
