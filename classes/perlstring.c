/* PerlStringclass.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id: genclass.pl,v 1.4 2001/11/16 16:15:26 simon Exp   Overview:
 *     These are the vtable functions for the PerlString base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static INTVAL Parrot_PerlString_type (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING* Parrot_PerlString_name (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static PMC* Parrot_PerlString_new (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void Parrot_PerlString_clone (struct Parrot_Interp *interpreter, PMC* pmc, PMC* dest) {
}

static void Parrot_PerlString_morph (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL type) {
}

static BOOLVAL Parrot_PerlString_move_to (struct Parrot_Interp *interpreter, PMC* pmc, void * destination) {
}

static INTVAL Parrot_PerlString_real_size (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void Parrot_PerlString_destroy (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static INTVAL Parrot_PerlString_get_integer (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static FLOATVAL Parrot_PerlString_get_number (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING* Parrot_PerlString_get_string (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static BOOLVAL Parrot_PerlString_get_bool (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void* Parrot_PerlString_get_value (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static BOOLVAL Parrot_PerlString_is_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC* pmc2) {
}

static void Parrot_PerlString_set_integer (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_integer_native (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value) {
}

static void Parrot_PerlString_set_integer_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value) {
}

static void Parrot_PerlString_set_integer_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_number (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_number_native (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value) {
}

static void Parrot_PerlString_set_number_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value) {
}

static void Parrot_PerlString_set_number_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_string (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_string_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlString_set_string_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlString_set_string_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value) {
}

static void Parrot_PerlString_set_string_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value) {
}

static void Parrot_PerlString_set_value (struct Parrot_Interp *interpreter, PMC* pmc, void* value) {
}

static void Parrot_PerlString_add (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_add_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlString_add_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlString_add_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlString_add_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlString_add_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_subtract (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_subtract_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlString_subtract_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlString_subtract_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlString_subtract_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlString_subtract_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_multiply (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_multiply_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlString_multiply_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlString_multiply_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlString_multiply_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlString_multiply_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_divide (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_divide_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlString_divide_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlString_divide_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlString_divide_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlString_divide_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_modulus (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_modulus_int (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL value,  PMC* dest) {
}

static void Parrot_PerlString_modulus_bigint (struct Parrot_Interp *interpreter, PMC* pmc, BIGINT value,  PMC* dest) {
}

static void Parrot_PerlString_modulus_float (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL value,  PMC* dest) {
}

static void Parrot_PerlString_modulus_bigfloat (struct Parrot_Interp *interpreter, PMC* pmc, BIGFLOAT value,  PMC* dest) {
}

static void Parrot_PerlString_modulus_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_concatenate (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_concatenate_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_concatenate_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_concatenate_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_concatenate_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static BOOLVAL Parrot_PerlString_is_equal (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value) {
}

static void Parrot_PerlString_logical_or (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value,  PMC* dest) {
}

static void Parrot_PerlString_logical_and (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value,  PMC* dest) {
}

static void Parrot_PerlString_logical_not (struct Parrot_Interp *interpreter, PMC* pmc, PMC* value) {
}

static void Parrot_PerlString_match (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  REGEX* re) {
}

static void Parrot_PerlString_match_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlString_match_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlString_match_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  REGEX* re) {
}

static void Parrot_PerlString_match_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  REGEX* re) {
}

static void Parrot_PerlString_repeat (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

static void Parrot_PerlString_repeat_native (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_repeat_unicode (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_repeat_other (struct Parrot_Interp *interpreter, PMC* pmc, STRING * value,  PMC* dest) {
}

static void Parrot_PerlString_repeat_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC * value,  PMC* dest) {
}

void Parrot_PerlString_init (void) {
    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_PerlString,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

		Parrot_PerlString_type,
		Parrot_PerlString_name,
		Parrot_PerlString_new,
		Parrot_PerlString_clone,
		Parrot_PerlString_morph,
		Parrot_PerlString_move_to,
		Parrot_PerlString_real_size,
		Parrot_PerlString_destroy,
		Parrot_PerlString_get_integer,
		Parrot_PerlString_get_number,
		Parrot_PerlString_get_string,
		Parrot_PerlString_get_bool,
		Parrot_PerlString_get_value,
		Parrot_PerlString_is_same,
		Parrot_PerlString_set_integer,
		Parrot_PerlString_set_integer_native,
		Parrot_PerlString_set_integer_bigint,
		Parrot_PerlString_set_integer_same,
		Parrot_PerlString_set_number,
		Parrot_PerlString_set_number_native,
		Parrot_PerlString_set_number_bigfloat,
		Parrot_PerlString_set_number_same,
		Parrot_PerlString_set_string,
		Parrot_PerlString_set_string_native,
		Parrot_PerlString_set_string_unicode,
		Parrot_PerlString_set_string_other,
		Parrot_PerlString_set_string_same,
		Parrot_PerlString_set_value,
		Parrot_PerlString_add,
		Parrot_PerlString_add_int,
		Parrot_PerlString_add_bigint,
		Parrot_PerlString_add_float,
		Parrot_PerlString_add_bigfloat,
		Parrot_PerlString_add_same,
		Parrot_PerlString_subtract,
		Parrot_PerlString_subtract_int,
		Parrot_PerlString_subtract_bigint,
		Parrot_PerlString_subtract_float,
		Parrot_PerlString_subtract_bigfloat,
		Parrot_PerlString_subtract_same,
		Parrot_PerlString_multiply,
		Parrot_PerlString_multiply_int,
		Parrot_PerlString_multiply_bigint,
		Parrot_PerlString_multiply_float,
		Parrot_PerlString_multiply_bigfloat,
		Parrot_PerlString_multiply_same,
		Parrot_PerlString_divide,
		Parrot_PerlString_divide_int,
		Parrot_PerlString_divide_bigint,
		Parrot_PerlString_divide_float,
		Parrot_PerlString_divide_bigfloat,
		Parrot_PerlString_divide_same,
		Parrot_PerlString_modulus,
		Parrot_PerlString_modulus_int,
		Parrot_PerlString_modulus_bigint,
		Parrot_PerlString_modulus_float,
		Parrot_PerlString_modulus_bigfloat,
		Parrot_PerlString_modulus_same,
		Parrot_PerlString_concatenate,
		Parrot_PerlString_concatenate_native,
		Parrot_PerlString_concatenate_unicode,
		Parrot_PerlString_concatenate_other,
		Parrot_PerlString_concatenate_same,
		Parrot_PerlString_is_equal,
		Parrot_PerlString_logical_or,
		Parrot_PerlString_logical_and,
		Parrot_PerlString_logical_not,
		Parrot_PerlString_match,
		Parrot_PerlString_match_native,
		Parrot_PerlString_match_unicode,
		Parrot_PerlString_match_other,
		Parrot_PerlString_match_same,
		Parrot_PerlString_repeat,
		Parrot_PerlString_repeat_native,
		Parrot_PerlString_repeat_unicode,
		Parrot_PerlString_repeat_other,
		Parrot_PerlString_repeat_same,
	};
	Parrot_base_vtables[enum_class_PerlString] = temp_base_vtable;
}
