/* scalarclass.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id: genclass.pl,v 1.2 2001/10/23 14:23:56 simon Exp   Overview:
 *     These are the vtable functions for the scalar base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

struct PerlScalarData { 
    INTVAL  intdata;  
    NUMVAL  numdata;   
    STRING* stringdata; 
};

/* It's more efficient to use our own caching than the PMC's cache
   Why? Because we also need to store state on what type of thing is
   in the cache, and this can be one of three things. (four, if you
   include "nothing") Four things is two bits, which means two flag
   tests instead of one. Hence, we just use the old-style IOK/NOK/POK */
#define PS_INTEGER_OK        (1<<9)
#define PS_NUMBER_OK         (1<<10)
#define PS_STRING_OK         (1<<11)

static STRING* whoami;

static INTVAL Parrot_scalar_type (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING* Parrot_scalar_name (struct Parrot_Interp *interpreter, PMC* pmc) {
    return whoami;
}

static PMC* Parrot_scalar_new (struct Parrot_Interp *interpreter, PMC* pmc) {
    pmc->data = memory_allocate_aligned(sizeof(struct PerlScalarData));
}

static void Parrot_scalar_clone (struct Parrot_Interp *interpreter, PMC* pmc, PMC* dest) {
    dest->vtable->destroy(dest); /* MAY NOT BE NEEDED */
    dest->vtable = pmc->vtable;
    dest->vtable->new(dest);     /* Similarly, may not be needed */
    dest->flags &= ~(PS_STRING_OK | PS_INTEGER_OK | PS_NUMBER_OK);
    dest->flags |= pmc->flags & (PS_STRING_OK | PS_INTEGER_OK | PS_NUMBER_OK);

    /* Copy stuff across */
    ((struct PerlScalarData)(dest->data))->numdata = 
	((struct PerlScalarData)(pmc->data))->numdata;
    ((struct PerlScalarData)(dest->data))->intdata = 
	((struct PerlScalarData)(pmc->data))->intdata;
    ((struct PerlScalarData)(dest->data))->stringdata = 
	string_copy(((struct PerlScalarData)(pmc->data))->stringdata);

}

static void Parrot_scalar_morph (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL type) {
}

static BOOLVAL Parrot_scalar_move_to (struct Parrot_Interp *interpreter, PMC* pmc, void * destination) {
}

static INTVAL Parrot_scalar_real_size (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static void Parrot_scalar_destroy (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static INTVAL Parrot_scalar_get_integer (struct Parrot_Interp *interpreter, PMC* pmc) {
    if (pmc->flags & PS_INTEGER_OK) {
        return ((struct PerlScalarData)(pmc->data))->intdata;
    } else if (pmc->flags & PS_NUMBER_OK) {
	pmc->flags |= PS_INTEGER_OK;
	return ((struct PerlScalarData)(pmc->data))->intdata 
	    = (INTVAL)((struct PerlScalarData)(pmc->data)->numdata);
    } else if (pmc->flags & CACHE_STRING) {
	pmc->flags |= PS_INTEGER_OK;
        printf("String atoi will go here when implemented\n");
        exit(1);
    } else {
	/* ENODATA! */
        pmc->flags |= PS_INTEGER_OK;
        return ((struct PerlScalarData)(pmc->data))->intdata = 0;
    }
}

static FLOATVAL Parrot_scalar_get_number (struct Parrot_Interp *interpreter, PMC* pmc) {
    if (pmc->flags & PS_NUMBER_OK) {
        return pmc->data->numdata;
    } else if (pmc->flags & PS_INTEGER_OK) {
        pmc->flags |= PS_NUMBER_OK
        return pmc->data->numdata = (FLOATVAL)pmc->data->intdata;
    } else if (pmc->flags & PS_STRING_OK) {
        printf("String aton will go here when implemented\n");
        exit(1);
    } else {
        pmc->flags |= PS_NUMBER_OK | PS_INTEGER_OK;
	pmc->data->intval = 0;
        return pmc->data->numval = 0.0;
    }
}

static STRING* Parrot_scalar_get_string (struct Parrot_Interp *interpreter, PMC* pmc) {
    if (pmc->flags & PS_STRING_OK) {
        return pmc->data->stringval;
    } else if (pmc->flags & PS_NUMBER_OK) {
        char* buf = mem_allocate_aligned((INTVAL)log(pmc->data->numdata)+1);
        sprintf(buf, "%d", pmc->data->numdata); /* Hack */
        pmc->data->stringdata = string_make(interpreter, buf, strlen(buf), 0, 0, 0);
        free(buf);
        return pmc->data->stringdata;
    } else if (pmc->flags & PS_INTEGER_OK) {
        char* buf = mem_allocate_aligned((INTVAL)log(pmc->data->intdata)+1);
        sprintf(buf, "%i", pmc->data->intdata); /* Hack */
        pmc->data->stringdata = string_make(interpreter, buf, strlen(buf), 0, 0, 0);
        free(buf);
    } else {
        /* Empty? */
        pmc->flags |= PS_STRING_OK | PS_NUMBER_OK | PS_INTEGER_OK;
	pmc->data->intval = pmc->data->numval = 0;
        return pmc->data->stringdata = string_make(interpreter, "", 0, 0, 0, 0);
    }
}

static BOOLVAL Parrot_scalar_get_bool (struct Parrot_Interp *interpreter, PMC* pmc) {
    if (pmc->flags & PS_NUMBER_OK) { return (BOOLVAL)pmc->data->numval; }
    if (pmc->flags & PS_INTEGER_OK) { return (INTVAL)pmc->data->intval; }
    if (!pmc->flags & PS_STRING_OK) { return 0; }
    /* I don't know what happens here */
}

static void* Parrot_scalar_get_value (struct Parrot_Interp *interpreter, PMC* pmc) {
    return pmc->data;
}

static BOOLVAL Parrot_scalar_is_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC* pmc2) {
    if (pmc1->flags & PS_NUMBER_OK) {
	return pmc1->data->numval == pmc2->vtable->get_number(pmc2); 
    } else if (pmc1->flags & PS_INTEGER_OK) { 
	return pmc1->data->intval == pmc2->vtable->get_integer(pmc2);
    } else if (pmc1->flags & PS_STRING_OK) {
	/* Urgh */
	/* return string_compare(pmc1->data->stringval, pmc2->vtable->get_string(pmc2) */
    } 
    /* pmc1 is false */
    return !pmc2->vtable->get_bool(pmc2);
}

static void Parrot_scalar_set_integer_1 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_scalar_set_integer_2 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_scalar_set_integer_3 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_scalar_set_integer_4 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_scalar_set_integer_5 (struct Parrot_Interp *interpreter, PMC* pmc, INTVAL integer) {
}

static void Parrot_scalar_set_number_1 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_scalar_set_number_2 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_scalar_set_number_3 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_scalar_set_number_4 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_scalar_set_number_5 (struct Parrot_Interp *interpreter, PMC* pmc, FLOATVAL number) {
}

static void Parrot_scalar_set_string_1 (struct Parrot_Interp *interpreter, PMC* pmc, STRING* string) {
}

static void Parrot_scalar_set_string_2 (struct Parrot_Interp *interpreter, PMC* pmc, STRING* string) {
}

static void Parrot_scalar_set_string_3 (struct Parrot_Interp *interpreter, PMC* pmc, STRING* string) {
}

static void Parrot_scalar_set_string_4 (struct Parrot_Interp *interpreter, PMC* pmc, STRING* string) {
}

static void Parrot_scalar_set_string_5 (struct Parrot_Interp *interpreter, PMC* pmc, STRING* string) {
}

static void Parrot_scalar_set_value (struct Parrot_Interp *interpreter, PMC* pmc, void* value) {
    pmc->data = value;
}

static void Parrot_scalar_add_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_add_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_subtract_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_multiply_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_divide_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_6 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_modulus_7 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_concatenate_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_concatenate_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_concatenate_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_concatenate_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_concatenate_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_is_equal (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left) {
}

static void Parrot_scalar_logical_or (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_logical_and (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_logical_not (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left) {
}

static void Parrot_scalar_match_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_scalar_match_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_scalar_match_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_scalar_match_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_scalar_match_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  REGEX* re) {
}

static void Parrot_scalar_repeat_1 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_repeat_2 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_repeat_3 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_repeat_4 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

static void Parrot_scalar_repeat_5 (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left,  PMC* right) {
}

void Parrot_scalar_init (void) {
    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_scalar,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

		Parrot_scalar_type,
		Parrot_scalar_name,
		Parrot_scalar_new,
		Parrot_scalar_clone,
		Parrot_scalar_morph,
		Parrot_scalar_move_to,
		Parrot_scalar_real_size,
		Parrot_scalar_destroy,
		Parrot_scalar_get_integer,
		Parrot_scalar_get_number,
		Parrot_scalar_get_string,
		Parrot_scalar_get_bool,
		Parrot_scalar_get_value,
		Parrot_scalar_is_same,
		{
			Parrot_scalar_set_integer_1,
			Parrot_scalar_set_integer_2,
			Parrot_scalar_set_integer_3,
			Parrot_scalar_set_integer_4,
			Parrot_scalar_set_integer_5,
		},
		{
			Parrot_scalar_set_number_1,
			Parrot_scalar_set_number_2,
			Parrot_scalar_set_number_3,
			Parrot_scalar_set_number_4,
			Parrot_scalar_set_number_5,
		},
		{
			Parrot_scalar_set_string_1,
			Parrot_scalar_set_string_2,
			Parrot_scalar_set_string_3,
			Parrot_scalar_set_string_4,
			Parrot_scalar_set_string_5,
		},
		Parrot_scalar_set_value,
		{
			Parrot_scalar_add_1,
			Parrot_scalar_add_2,
			Parrot_scalar_add_3,
			Parrot_scalar_add_4,
			Parrot_scalar_add_5,
			Parrot_scalar_add_6,
			Parrot_scalar_add_7,
		},
		{
			Parrot_scalar_subtract_1,
			Parrot_scalar_subtract_2,
			Parrot_scalar_subtract_3,
			Parrot_scalar_subtract_4,
			Parrot_scalar_subtract_5,
			Parrot_scalar_subtract_6,
			Parrot_scalar_subtract_7,
		},
		{
			Parrot_scalar_multiply_1,
			Parrot_scalar_multiply_2,
			Parrot_scalar_multiply_3,
			Parrot_scalar_multiply_4,
			Parrot_scalar_multiply_5,
			Parrot_scalar_multiply_6,
			Parrot_scalar_multiply_7,
		},
		{
			Parrot_scalar_divide_1,
			Parrot_scalar_divide_2,
			Parrot_scalar_divide_3,
			Parrot_scalar_divide_4,
			Parrot_scalar_divide_5,
			Parrot_scalar_divide_6,
			Parrot_scalar_divide_7,
		},
		{
			Parrot_scalar_modulus_1,
			Parrot_scalar_modulus_2,
			Parrot_scalar_modulus_3,
			Parrot_scalar_modulus_4,
			Parrot_scalar_modulus_5,
			Parrot_scalar_modulus_6,
			Parrot_scalar_modulus_7,
		},
		{
			Parrot_scalar_concatenate_1,
			Parrot_scalar_concatenate_2,
			Parrot_scalar_concatenate_3,
			Parrot_scalar_concatenate_4,
			Parrot_scalar_concatenate_5,
		},
		Parrot_scalar_is_equal,
		Parrot_scalar_logical_or,
		Parrot_scalar_logical_and,
		Parrot_scalar_logical_not,
		{
			Parrot_scalar_match_1,
			Parrot_scalar_match_2,
			Parrot_scalar_match_3,
			Parrot_scalar_match_4,
			Parrot_scalar_match_5,
		},
		{
			Parrot_scalar_repeat_1,
			Parrot_scalar_repeat_2,
			Parrot_scalar_repeat_3,
			Parrot_scalar_repeat_4,
			Parrot_scalar_repeat_5,
		},
	};
    whoami = Parrot_string_make(NULL, /* This is a screamingly huge hack */
				"PerlScalar",
				10, 0, 0, 0);
    Parrot_base_vtables[enum_class_scalar] = temp_base_vtable;
}
