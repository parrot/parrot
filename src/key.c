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

    key->flags |= KEY_integer_FLAG;
    key->cache.int_val = value;

    return key;
}

PMC *
key_new_number(struct Parrot_Interp *interpreter, FLOATVAL value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    key->flags |= KEY_number_FLAG;
    key->cache.num_val = value;

    return key;
}

PMC *
key_new_string(struct Parrot_Interp *interpreter, STRING *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    key->flags |= KEY_string_FLAG;
    key->cache.string_val = value;

    return key;
}

PMC *
key_new_pmc(struct Parrot_Interp *interpreter, PMC *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    key->flags |= KEY_pmc_FLAG;
    key->cache.pmc_val = value;

    return key;
}

void
key_set_integer(struct Parrot_Interp *interpreter, PMC *key, INTVAL value)
{
    key->flags &= ~KEY_type_FLAGS;
    key->flags |= KEY_integer_FLAG;
    key->cache.int_val = value;

    return;
}

void
key_set_register(struct Parrot_Interp *interpreter, PMC *key, INTVAL value,
        INTVAL flag)
{
    key->flags &= ~KEY_type_FLAGS;
    key->flags |= KEY_register_FLAG | flag;
    key->cache.int_val = value;

    return;
}


void
key_set_number(struct Parrot_Interp *interpreter, PMC *key, FLOATVAL value)
{
    key->flags &= ~KEY_type_FLAGS;
    key->flags |= KEY_number_FLAG;
    key->cache.num_val = value;

    return;
}


void
key_set_string(struct Parrot_Interp *interpreter, PMC *key, STRING *value)
{
    key->flags &= ~KEY_type_FLAGS;
    key->flags |= KEY_string_FLAG;
    key->cache.string_val = value;

    return;
}


void
key_set_pmc(struct Parrot_Interp *interpreter, PMC *key, PMC *value)
{
    key->flags &= ~KEY_type_FLAGS;
    key->flags |= KEY_pmc_FLAG;
    key->cache.pmc_val = value;

    return;
}

INTVAL
key_type(struct Parrot_Interp *interpreter, PMC *key)
{
    return (key->flags & KEY_type_FLAGS) & ~KEY_register_FLAG;
}

INTVAL
key_integer(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (key->flags & KEY_type_FLAGS) {
    case KEY_integer_FLAG:
        return key->cache.int_val;
    case KEY_integer_FLAG|KEY_register_FLAG:
        return interpreter->ctx.int_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return key->cache.pmc_val->vtable->get_integer(interpreter,
            key->cache.pmc_val);
    case KEY_pmc_FLAG|KEY_register_FLAG:
        reg = interpreter->ctx.pmc_reg.registers[key->cache.int_val];
        return reg->vtable->get_integer(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Not an integer!\n");
        return 0;
    }
}

FLOATVAL
key_number(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (key->flags & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return key->cache.num_val;
    case KEY_number_FLAG|KEY_register_FLAG:
        return interpreter->ctx.num_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return key->cache.pmc_val->vtable->get_number(interpreter,
            key->cache.pmc_val);
    case KEY_pmc_FLAG|KEY_register_FLAG:
        reg = interpreter->ctx.pmc_reg.registers[key->cache.int_val];
        return reg->vtable->get_number(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Not a number!\n");
        return 0;
    }
}

STRING *
key_string(struct Parrot_Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (key->flags & KEY_type_FLAGS) {
    case KEY_string_FLAG:
        return key->cache.string_val;
    case KEY_string_FLAG|KEY_register_FLAG:
        return interpreter->ctx.string_reg.registers[key->cache.int_val];
    case KEY_pmc_FLAG:
        return key->cache.pmc_val->vtable->get_string(interpreter,
            key->cache.pmc_val);
    case KEY_pmc_FLAG|KEY_register_FLAG:
        reg = interpreter->ctx.pmc_reg.registers[key->cache.int_val];
        return reg->vtable->get_string(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Not a string!\n");
        return 0;
    }
}

PMC *
key_pmc(struct Parrot_Interp *interpreter, PMC *key)
{
    switch (key->flags & KEY_type_FLAGS) {
    case KEY_pmc_FLAG:
        return key->cache.pmc_val;
    case KEY_pmc_FLAG|KEY_register_FLAG:
        return interpreter->ctx.pmc_reg.registers[key->cache.int_val];
    default:
        internal_exception(INVALID_OPERATION, "Not a PMC!\n");
        return 0;
    }
}

PMC *
key_next(struct Parrot_Interp *interpreter, PMC *key)
{
    return key->data;
}

PMC *
key_append(struct Parrot_Interp *interpreter, PMC *key1, PMC *key2)
{
    PMC *tail = key1;

    while (tail->data) {
        tail = tail->data;
    }

    tail->data = key2;

    return key1;
}

PMC *
key_mark(struct Parrot_Interp *interpreter, PMC *key, PMC *end_of_used_list)
{
    if ((key->flags & KEY_type_FLAGS) == KEY_string_FLAG)
        buffer_lives((Buffer *)key->cache.string_val);
    else if ((key->flags & KEY_type_FLAGS) == KEY_pmc_FLAG)
        end_of_used_list = mark_used(key->cache.pmc_val, end_of_used_list);

    if (key->data)
        end_of_used_list = mark_used(key->data, end_of_used_list);

    return end_of_used_list;
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
