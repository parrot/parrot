/* key.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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


PMC *
key_new(struct Parrot_Interp *interpreter)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    return key;
}

PMC *
key_new_integer(struct Parrot_Interp *interpreter, INTVAL value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    key->cache.int_val = value;

    return key;
}

PMC *
key_new_number(struct Parrot_Interp *interpreter, FLOATVAL value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    key->cache.num_val = value;

    return key;
}

PMC *
key_new_string(struct Parrot_Interp *interpreter, STRING *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    key->cache.string_val = value;

    return key;
}

PMC *
key_new_cstring(struct Parrot_Interp *interpreter, const char *value)
{
    return key_new_string(interpreter,
            string_from_cstring(interpreter, value, 0));
}

PMC *
key_new_pmc(struct Parrot_Interp *interpreter, PMC *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    key->cache.pmc_val = value;

    return key;
}

void
key_set_integer(struct Parrot_Interp *interpreter, PMC *key, INTVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    key->cache.int_val = value;

    return;
}

void
key_set_register(struct Parrot_Interp *interpreter, PMC *key, INTVAL value,
                 INTVAL flag)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_register_FLAG | flag;
    key->cache.int_val = value;

    return;
}


void
key_set_number(struct Parrot_Interp *interpreter, PMC *key, FLOATVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    key->cache.num_val = value;

    return;
}


void
key_set_string(struct Parrot_Interp *interpreter, PMC *key, STRING *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    key->cache.string_val = value;

    return;
}


void
key_set_pmc(struct Parrot_Interp *interpreter, PMC *key, PMC *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    key->cache.pmc_val = value;

    return;
}

INTVAL
key_type(struct Parrot_Interp *interpreter, PMC *key)
{
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}

INTVAL
key_integer(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_integer_FLAG:
        return key->cache.int_val;
    case KEY_integer_FLAG | KEY_register_FLAG:
        return interpreter->int_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return VTABLE_get_integer(interpreter,
                                                       key->cache.pmc_val);
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = interpreter->pmc_reg.registers[key->cache.int_val];
        return VTABLE_get_integer(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Key not an integer!\n");
        return 0;
    }
}

FLOATVAL
key_number(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return key->cache.num_val;
    case KEY_number_FLAG | KEY_register_FLAG:
        return interpreter->num_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return VTABLE_get_number(interpreter,
                                                      key->cache.pmc_val);
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = interpreter->pmc_reg.registers[key->cache.int_val];
        return VTABLE_get_number(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Key not a number!\n");
        return 0;
    }
}

STRING *
key_string(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_string_FLAG:
        return key->cache.string_val;
    case KEY_string_FLAG | KEY_register_FLAG:
        return interpreter->string_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return VTABLE_get_string(interpreter,
                                                      key->cache.pmc_val);
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = interpreter->pmc_reg.registers[key->cache.int_val];
        return VTABLE_get_string(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Key not a string!\n");
        return 0;
    }
}

PMC *
key_pmc(struct Parrot_Interp *interpreter, PMC *key)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_pmc_FLAG:
        return key->cache.pmc_val;
    case KEY_pmc_FLAG | KEY_register_FLAG:
        return interpreter->pmc_reg.registers[key->cache.int_val];
    default:
        internal_exception(INVALID_OPERATION, "Key not a PMC!\n");
        return 0;
    }
}

PMC *
key_next(struct Parrot_Interp *interpreter, PMC *key)
{
    return PMC_data(key);
}

PMC *
key_append(struct Parrot_Interp *interpreter, PMC *key1, PMC *key2)
{
    PMC *tail = key1;

    while (PMC_data(tail)) {
        tail = PMC_data(tail);
    }

    PMC_data(tail) = key2;

    return key1;
}

void
key_mark(struct Parrot_Interp *interpreter, PMC *key)
{
    pobject_lives(interpreter, (PObj *) key);
    if ( ((PObj_get_FLAGS(key) & KEY_type_FLAGS) == KEY_string_FLAG) ||
       ((PObj_get_FLAGS(key) & KEY_type_FLAGS) == KEY_pmc_FLAG) )
        pobject_lives(interpreter, (PObj *)key->cache.string_val);
    if ((PObj_get_FLAGS(key) & KEY_type_FLAGS) == KEY_integer_FLAG)
        return;

    if (PMC_data(key))
        pobject_lives(interpreter, (PObj *)PMC_data(key));

}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
