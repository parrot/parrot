/* PerlIntclass.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id: genclass.pl,v 1.4 2001/11/16 16:15:26 simon Exp   Overview:
 *     These are the vtable functions for the PerlInt base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static STRING* whoami;

static INTVAL Parrot_PerlInt_type (struct Parrot_Interp *interpreter, PMC* pmc) {
    return 0;
}

static STRING* Parrot_PerlInt_name (struct Parrot_Interp *interpreter, PMC* pmc) {
    return whoami;
}

static void Parrot_PerlInt_init (struct Parrot_Interp *interpreter, PMC* pmc) {
    pmc->cache.int_val = 0;
    
}

static void Parrot_PerlInt_clone (struct Parrot_Interp *interpreter, PMC* pmc, PMC* dest) {
}

static void Parrot_PerlInt_morph (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL type) {
}

static BOOLVAL Parrot_PerlInt_move_to (struct Parrot_Interp *interpreter, PMC* pmc, void * destination) {
    return 0; /* You can't move me, I don't have anything to move! */
}

static INTVAL Parrot_PerlInt_real_size (struct Parrot_Interp *interpreter, PMC* pmc) {
    return 0; /* ->data is unused */
}

static void Parrot_PerlInt_destroy (struct Parrot_Interp *interpreter, PMC* pmc) {
    /* Integers need no destruction! */
}

static INTVAL Parrot_PerlInt_get_integer (struct Parrot_Interp *interpreter, PMC* pmc) {
    return pmc->cache.int_val;
}

static FLOATVAL Parrot_PerlInt_get_number (struct Parrot_Interp *interpreter, PMC* pmc) {
    /* We're a float now */
    pmc->vtable = &(Parrot_base_vtables[enum_class_PerlNum]);
    return pmc->cache.num_val = (FLOATVAL)pmc->cache.int_val;
}

static STRING* Parrot_PerlInt_get_string (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static BOOLVAL Parrot_PerlInt_get_bool (struct Parrot_Interp *interpreter, PMC* pmc) {
    return pmc->cache.int_val != 0;
}

static void* Parrot_PerlInt_get_value (struct Parrot_Interp *interpreter, PMC* pmc) {
    return &pmc->cache; /* YAFIYGI */
}

/* Do you refer to exactly the same data that I do? */
static BOOLVAL Parrot_PerlInt_is_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC* pmc2) {
    return pmc2->vtable == pmc->vtable /* You never know if you've been inherited...*/
          && pmc->cache.int_val == pmc2->cache.int_val;
}

static void Parrot_PerlInt_set_integer (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
    pmc->cache.int_val = (INTVAL)value->vtable->get_integer(interpreter, value);
}

static void Parrot_PerlInt_set_integer_native (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value) {
    pmc->cache.int_val = value;
}

static void Parrot_PerlInt_set_integer_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value) {
    pmc->cache.struct_val = value; /* Maybe we need a copy */
    /* pmc->vtable = &(Parrot_base_vtables[enum_class_PerlBigInt]); */
}

static void Parrot_PerlInt_set_integer_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
    pmc->cache.int_val = value->cache.int_val;
}

static void Parrot_PerlInt_set_number (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlInt_set_number_native (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value) {
}

static void Parrot_PerlInt_set_number_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value) {
}

static void Parrot_PerlInt_set_number_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlInt_set_string (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlInt_set_string_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlInt_set_string_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlInt_set_string_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlInt_set_string_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlInt_set_value (struct Parrot_Interp *interpreter, PMC* pmc, void* value) {
}

static void Parrot_PerlInt_add (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
    dest->vtable->set_integer_native(interpreter, dest, 
            pmc->cache.int_val + value->vtable->get_integer(interpreter, value)
    );
}

static void Parrot_PerlInt_add_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
    dest->vtable->set_integer_native(interpreter, dest, 
            pmc->cache.int_val + value
    );
}

static void Parrot_PerlInt_add_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlInt_add_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_add_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlInt_add_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_subtract (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
    dest->vtable->set_integer_native(interpreter, dest, 
            pmc->cache.int_val - value->vtable->get_integer(interpreter, value)
    );
}

static void Parrot_PerlInt_subtract_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
    dest->vtable->set_integer_native(interpreter, dest, 
            pmc->cache.int_val - value
    );
}

static void Parrot_PerlInt_subtract_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlInt_subtract_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_subtract_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlInt_subtract_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlInt_multiply_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_divide (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_divide_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_divide_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlInt_divide_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_divide_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlInt_divide_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlInt_modulus_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_concatenate (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_concatenate_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_concatenate_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_concatenate_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_concatenate_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

/* == operation */

static BOOLVAL Parrot_PerlInt_is_equal (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value) {
    return pmc->cache.int_val == value->vtable->get_integer(interpreter, value);
}

static void Parrot_PerlInt_logical_or (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value,  PMC* dest) {
    /* No set_bool :( */
    dest->vtable->set_integer_native(interpreter, dest,
            pmc->cache.int_val || 
            value->vtable->get_integer(interpreter, value)
    );
}

static void Parrot_PerlInt_logical_and (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value,  PMC* dest) {
    dest->vtable->set_integer_native(interpreter, dest,
            pmc->cache.int_val && 
            value->vtable->get_integer(interpreter, value)
    );
}

static void Parrot_PerlInt_logical_not (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value) {
    pmc->cache.int_val = (INTVAL)(!value->vtable->get_bool(interpreter, value));
}

static void Parrot_PerlInt_match (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  REGEX* re) {
}

static void Parrot_PerlInt_match_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlInt_match_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlInt_match_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlInt_match_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  REGEX* re) {
}

static void Parrot_PerlInt_repeat (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlInt_repeat_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_repeat_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_repeat_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlInt_repeat_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

void Parrot_PerlInt_class_init (void) {
    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_PerlInt,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

		Parrot_PerlInt_type,
		Parrot_PerlInt_name,
		Parrot_PerlInt_init,
		Parrot_PerlInt_clone,
		Parrot_PerlInt_morph,
		Parrot_PerlInt_move_to,
		Parrot_PerlInt_real_size,
		Parrot_PerlInt_destroy,
		Parrot_PerlInt_get_integer,
		Parrot_PerlInt_get_number,
		Parrot_PerlInt_get_string,
		Parrot_PerlInt_get_bool,
		Parrot_PerlInt_get_value,
		Parrot_PerlInt_is_same,
		Parrot_PerlInt_set_integer,
		Parrot_PerlInt_set_integer_native,
		Parrot_PerlInt_set_integer_bigint,
		Parrot_PerlInt_set_integer_same,
		Parrot_PerlInt_set_number,
		Parrot_PerlInt_set_number_native,
		Parrot_PerlInt_set_number_bigfloat,
		Parrot_PerlInt_set_number_same,
		Parrot_PerlInt_set_string,
		Parrot_PerlInt_set_string_native,
		Parrot_PerlInt_set_string_unicode,
		Parrot_PerlInt_set_string_other,
		Parrot_PerlInt_set_string_same,
		Parrot_PerlInt_set_value,
		Parrot_PerlInt_add,
		Parrot_PerlInt_add_int,
		Parrot_PerlInt_add_bigint,
		Parrot_PerlInt_add_float,
		Parrot_PerlInt_add_bigfloat,
		Parrot_PerlInt_add_same,
		Parrot_PerlInt_subtract,
		Parrot_PerlInt_subtract_int,
		Parrot_PerlInt_subtract_bigint,
		Parrot_PerlInt_subtract_float,
		Parrot_PerlInt_subtract_bigfloat,
		Parrot_PerlInt_subtract_same,
		Parrot_PerlInt_multiply,
		Parrot_PerlInt_multiply_int,
		Parrot_PerlInt_multiply_bigint,
		Parrot_PerlInt_multiply_float,
		Parrot_PerlInt_multiply_bigfloat,
		Parrot_PerlInt_multiply_same,
		Parrot_PerlInt_divide,
		Parrot_PerlInt_divide_int,
		Parrot_PerlInt_divide_bigint,
		Parrot_PerlInt_divide_float,
		Parrot_PerlInt_divide_bigfloat,
		Parrot_PerlInt_divide_same,
		Parrot_PerlInt_modulus,
		Parrot_PerlInt_modulus_int,
		Parrot_PerlInt_modulus_bigint,
		Parrot_PerlInt_modulus_float,
		Parrot_PerlInt_modulus_bigfloat,
		Parrot_PerlInt_modulus_same,
		Parrot_PerlInt_concatenate,
		Parrot_PerlInt_concatenate_native,
		Parrot_PerlInt_concatenate_unicode,
		Parrot_PerlInt_concatenate_other,
		Parrot_PerlInt_concatenate_same,
		Parrot_PerlInt_is_equal,
		Parrot_PerlInt_logical_or,
		Parrot_PerlInt_logical_and,
		Parrot_PerlInt_logical_not,
		Parrot_PerlInt_match,
		Parrot_PerlInt_match_native,
		Parrot_PerlInt_match_unicode,
		Parrot_PerlInt_match_other,
		Parrot_PerlInt_match_same,
		Parrot_PerlInt_repeat,
		Parrot_PerlInt_repeat_native,
		Parrot_PerlInt_repeat_unicode,
		Parrot_PerlInt_repeat_other,
		Parrot_PerlInt_repeat_same,
	};
    whoami = string_make(NULL, /* DIRTY HACK */
             "PerlInt", 7, 0, 0, 0);
	Parrot_base_vtables[enum_class_PerlInt] = temp_base_vtable;
}
