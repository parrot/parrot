/* intclass.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id: genclass.pl,v 1.2 2001/10/23 14:23:56 simon Exp   Overview:
 *     These are the vtable functions for the int base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static INTVAL Parrot_int_type (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING Parrot_int_name (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static PMC* Parrot_int_new (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void Parrot_int_clone (struct Parrot_Interp *interpreter, PMC* pmc, PMC* dest) {
}

static void Parrot_int_morph (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL type) {
}

static BOOL Parrot_int_move_to (struct Parrot_Interp *interpreter, PMC* pmc, void * destination) {
}

static INTVAL Parrot_int_real_size (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void Parrot_int_destroy (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static INTVAL Parrot_int_get_integer (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static FLOATVAL Parrot_int_get_number (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING Parrot_int_get_string (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static BOOL Parrot_int_get_bool (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void* Parrot_int_get_value (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static BOOL Parrot_int_is_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC* pmc2) {
}

static void Parrot_int_set_integer_1 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_int_set_integer_2 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_int_set_integer_3 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_int_set_integer_4 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_int_set_integer_5 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_int_set_number_1 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_int_set_number_2 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_int_set_number_3 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_int_set_number_4 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_int_set_number_5 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_int_set_string_1 (struct Parrot_Interp *interpreter, PMC* pmc, STRING string) {
}

static void Parrot_int_set_string_2 (struct Parrot_Interp *interpreter, PMC* pmc, STRING string) {
}

static void Parrot_int_set_string_3 (struct Parrot_Interp *interpreter, PMC* pmc, STRING string) {
}

static void Parrot_int_set_string_4 (struct Parrot_Interp *interpreter, PMC* pmc, STRING string) {
}

static void Parrot_int_set_string_5 (struct Parrot_Interp *interpreter, PMC* pmc, STRING string) {
}

static void Parrot_int_set_value (struct Parrot_Interp *interpreter, PMC* pmc, void* value) {
}

static void Parrot_int_add_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_add_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_subtract_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_multiply_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_divide_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_modulus_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_concatenate_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_concatenate_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_concatenate_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_concatenate_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_concatenate_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_is_equal (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left) {
}

static void Parrot_int_logical_or (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_logical_and (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_logical_not (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left) {
}

static void Parrot_int_match_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_int_match_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_int_match_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_int_match_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_int_match_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_int_repeat_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_repeat_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_repeat_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_repeat_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_int_repeat_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

void Parrot_int_init (void) {
    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_int,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

		Parrot_int_type,
		Parrot_int_name,
		Parrot_int_new,
		Parrot_int_clone,
		Parrot_int_morph,
		Parrot_int_move_to,
		Parrot_int_real_size,
		Parrot_int_destroy,
		Parrot_int_get_integer,
		Parrot_int_get_number,
		Parrot_int_get_string,
		Parrot_int_get_bool,
		Parrot_int_get_value,
		Parrot_int_is_same,
		{
			Parrot_int_set_integer_1,
			Parrot_int_set_integer_2,
			Parrot_int_set_integer_3,
			Parrot_int_set_integer_4,
			Parrot_int_set_integer_5,
		},
		{
			Parrot_int_set_number_1,
			Parrot_int_set_number_2,
			Parrot_int_set_number_3,
			Parrot_int_set_number_4,
			Parrot_int_set_number_5,
		},
		{
			Parrot_int_set_string_1,
			Parrot_int_set_string_2,
			Parrot_int_set_string_3,
			Parrot_int_set_string_4,
			Parrot_int_set_string_5,
		},
		Parrot_int_set_value,
		{
			Parrot_int_add_1,
			Parrot_int_add_2,
			Parrot_int_add_3,
			Parrot_int_add_4,
			Parrot_int_add_5,
			Parrot_int_add_6,
			Parrot_int_add_7,
		},
		{
			Parrot_int_subtract_1,
			Parrot_int_subtract_2,
			Parrot_int_subtract_3,
			Parrot_int_subtract_4,
			Parrot_int_subtract_5,
			Parrot_int_subtract_6,
			Parrot_int_subtract_7,
		},
		{
			Parrot_int_multiply_1,
			Parrot_int_multiply_2,
			Parrot_int_multiply_3,
			Parrot_int_multiply_4,
			Parrot_int_multiply_5,
			Parrot_int_multiply_6,
			Parrot_int_multiply_7,
		},
		{
			Parrot_int_divide_1,
			Parrot_int_divide_2,
			Parrot_int_divide_3,
			Parrot_int_divide_4,
			Parrot_int_divide_5,
			Parrot_int_divide_6,
			Parrot_int_divide_7,
		},
		{
			Parrot_int_modulus_1,
			Parrot_int_modulus_2,
			Parrot_int_modulus_3,
			Parrot_int_modulus_4,
			Parrot_int_modulus_5,
			Parrot_int_modulus_6,
			Parrot_int_modulus_7,
		},
		{
			Parrot_int_concatenate_1,
			Parrot_int_concatenate_2,
			Parrot_int_concatenate_3,
			Parrot_int_concatenate_4,
			Parrot_int_concatenate_5,
		},
		Parrot_int_is_equal,
		Parrot_int_logical_or,
		Parrot_int_logical_and,
		Parrot_int_logical_not,
		{
			Parrot_int_match_1,
			Parrot_int_match_2,
			Parrot_int_match_3,
			Parrot_int_match_4,
			Parrot_int_match_5,
		},
		{
			Parrot_int_repeat_1,
			Parrot_int_repeat_2,
			Parrot_int_repeat_3,
			Parrot_int_repeat_4,
			Parrot_int_repeat_5,
		},
	};
	Parrot_base_vtables[enum_class_int] = temp_base_vtable;
}
