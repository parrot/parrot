/* intclass.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     These are the vtable functions for the int base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static INTVAL Parrot_int_type (PMC* pmc) {
}
static STRING Parrot_int_name (PMC* pmc) {
}
static PMC* Parrot_int_new (PMC* pmc) {
}
static void Parrot_int_clone (PMC* pmc, PMC* dest) {
}
static void Parrot_int_morph (PMC* pmc, INTVAL type) {
}
static BOOL Parrot_int_move_to (PMC* pmc, void * destination) {
}
static INTVAL Parrot_int_real_size (PMC* pmc) {
}
static void Parrot_int_destroy (PMC* pmc) {
}
static INTVAL Parrot_int_get_integer (PMC* pmc) {
}
static FLOATVAL Parrot_int_get_number (PMC* pmc) {
}
static STRING Parrot_int_get_string (PMC* pmc) {
}
static BOOL Parrot_int_get_bool (PMC* pmc) {
}
static void* Parrot_int_get_value (PMC* pmc) {
}
static BOOL Parrot_int_is_same (PMC* pmc, PMC* pmc2) {
}
static void Parrot_int_set_integer_1 (PMC* pmc, INTVAL integer) {
}
static void Parrot_int_set_integer_2 (PMC* pmc, INTVAL integer) {
}
static void Parrot_int_set_integer_3 (PMC* pmc, INTVAL integer) {
}
static void Parrot_int_set_integer_4 (PMC* pmc, INTVAL integer) {
}
static void Parrot_int_set_integer_5 (PMC* pmc, INTVAL integer) {
}
static void Parrot_int_set_number_1 (PMC* pmc, FLOATVAL number) {
}
static void Parrot_int_set_number_2 (PMC* pmc, FLOATVAL number) {
}
static void Parrot_int_set_number_3 (PMC* pmc, FLOATVAL number) {
}
static void Parrot_int_set_number_4 (PMC* pmc, FLOATVAL number) {
}
static void Parrot_int_set_number_5 (PMC* pmc, FLOATVAL number) {
}
static void Parrot_int_set_string_1 (PMC* pmc, STRING string) {
}
static void Parrot_int_set_string_2 (PMC* pmc, STRING string) {
}
static void Parrot_int_set_string_3 (PMC* pmc, STRING string) {
}
static void Parrot_int_set_string_4 (PMC* pmc, STRING string) {
}
static void Parrot_int_set_string_5 (PMC* pmc, STRING string) {
}
static void Parrot_int_set_value (PMC* pmc, void* value) {
}
static void Parrot_int_add_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_6 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_add_7 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_6 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_subtract_7 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_6 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_multiply_7 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_6 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_divide_7 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_6 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_modulus_7 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_concatenate_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_concatenate_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_concatenate_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_concatenate_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_concatenate_5 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_is_equal (PMC* pmc, PMC* left) {
}
static void Parrot_int_logical_or (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_logical_and (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_logical_not (PMC* pmc, PMC* left) {
}
static void Parrot_int_match_1 (PMC* pmc, PMC* left,  REGEX* re) {
}
static void Parrot_int_match_2 (PMC* pmc, PMC* left,  REGEX* re) {
}
static void Parrot_int_match_3 (PMC* pmc, PMC* left,  REGEX* re) {
}
static void Parrot_int_match_4 (PMC* pmc, PMC* left,  REGEX* re) {
}
static void Parrot_int_match_5 (PMC* pmc, PMC* left,  REGEX* re) {
}
static void Parrot_int_repeat_1 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_repeat_2 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_repeat_3 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_repeat_4 (PMC* pmc, PMC* left,  PMC* right) {
}
static void Parrot_int_repeat_5 (PMC* pmc, PMC* left,  PMC* right) {
}
void Parrot_int_init (void) {
    Parrot_base_vtables[enum_class_int] = (struct _vtable) {
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
		Parrot_int_set_integer_1,
		Parrot_int_set_integer_2,
		Parrot_int_set_integer_3,
		Parrot_int_set_integer_4,
		Parrot_int_set_integer_5,
		Parrot_int_set_number_1,
		Parrot_int_set_number_2,
		Parrot_int_set_number_3,
		Parrot_int_set_number_4,
		Parrot_int_set_number_5,
		Parrot_int_set_string_1,
		Parrot_int_set_string_2,
		Parrot_int_set_string_3,
		Parrot_int_set_string_4,
		Parrot_int_set_string_5,
		Parrot_int_set_value,
		Parrot_int_add_1,
		Parrot_int_add_2,
		Parrot_int_add_3,
		Parrot_int_add_4,
		Parrot_int_add_5,
		Parrot_int_add_6,
		Parrot_int_add_7,
		Parrot_int_subtract_1,
		Parrot_int_subtract_2,
		Parrot_int_subtract_3,
		Parrot_int_subtract_4,
		Parrot_int_subtract_5,
		Parrot_int_subtract_6,
		Parrot_int_subtract_7,
		Parrot_int_multiply_1,
		Parrot_int_multiply_2,
		Parrot_int_multiply_3,
		Parrot_int_multiply_4,
		Parrot_int_multiply_5,
		Parrot_int_multiply_6,
		Parrot_int_multiply_7,
		Parrot_int_divide_1,
		Parrot_int_divide_2,
		Parrot_int_divide_3,
		Parrot_int_divide_4,
		Parrot_int_divide_5,
		Parrot_int_divide_6,
		Parrot_int_divide_7,
		Parrot_int_modulus_1,
		Parrot_int_modulus_2,
		Parrot_int_modulus_3,
		Parrot_int_modulus_4,
		Parrot_int_modulus_5,
		Parrot_int_modulus_6,
		Parrot_int_modulus_7,
		Parrot_int_concatenate_1,
		Parrot_int_concatenate_2,
		Parrot_int_concatenate_3,
		Parrot_int_concatenate_4,
		Parrot_int_concatenate_5,
		Parrot_int_is_equal,
		Parrot_int_logical_or,
		Parrot_int_logical_and,
		Parrot_int_logical_not,
		Parrot_int_match_1,
		Parrot_int_match_2,
		Parrot_int_match_3,
		Parrot_int_match_4,
		Parrot_int_match_5,
		Parrot_int_repeat_1,
		Parrot_int_repeat_2,
		Parrot_int_repeat_3,
		Parrot_int_repeat_4,
		Parrot_int_repeat_5,
	};
}
