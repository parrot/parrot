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
    FLOATVAL  numdata;   
    STRING* stringdata; 
};

/* It's more efficient to use our own caching than the PMC's cache
   Why? Because we also need to store state on what type of thing is
   in the cache, and this can be one of three things. (four, if you
   include "nothing") Four things is two bits, which means two flag
   tests instead of one. Hence, we just use the old-style IOK/NOK/POK */
#define PS_INTEGER_OK        (1<<PMC_USER_FLAG)
#define PS_NUMBER_OK         (1<<(PMC_USER_FLAG+1))
#define PS_STRING_OK         (1<<(PMC_USER_FLAG+2))

static STRING* whoami;

static INTVAL Parrot_scalar_type (struct Parrot_Interp *interpreter, PMC* pmc) {
}

static STRING* Parrot_scalar_name (struct Parrot_Interp *interpreter, PMC* pmc) {
    return whoami;
}

static PMC* Parrot_scalar_new (struct Parrot_Interp *interpreter, PMC* pmc) {
    pmc->data = mem_allocate_aligned(sizeof(struct PerlScalarData));
}

static void Parrot_scalar_clone (struct Parrot_Interp *interpreter, PMC* pmc, PMC* dest) {
    struct PerlScalarData *s = pmc->data;
    struct PerlScalarData *d; /* This may change when d is instantiated */

    dest->vtable->destroy(interpreter, dest);
    dest->vtable = pmc->vtable;
    dest->vtable->new(interpreter, dest);
    dest->flags &= ~(PS_STRING_OK | PS_INTEGER_OK | PS_NUMBER_OK);
    dest->flags |= pmc->flags & (PS_STRING_OK | PS_INTEGER_OK | PS_NUMBER_OK);
    d = dest->data;

    /* Copy stuff across */
    d->numdata = s->numdata;
    d->intdata = s->intdata;
    d->stringdata = string_copy(interpreter, s->stringdata);

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
    struct PerlScalarData* d = pmc->data;

    if (pmc->flags & PS_INTEGER_OK) {
        return d->intdata;
    } 
    
    if (pmc->flags & PS_NUMBER_OK) {
	pmc->flags |= PS_INTEGER_OK;
	return (d->intdata) = (INTVAL)(d->numdata);
    } 
    
    if (pmc->flags & PS_STRING_OK) {
	pmc->flags |= PS_INTEGER_OK;
        printf("String atoi will go here when implemented\n");
        exit(1);
    }

    /* ENODATA! */
    pmc->flags |= PS_INTEGER_OK;
    return d->intdata = 0;
}

static FLOATVAL Parrot_scalar_get_number (struct Parrot_Interp *interpreter, PMC* pmc) {
    struct PerlScalarData* d = pmc->data;

    if (pmc->flags & PS_NUMBER_OK) {
        return d->numdata;
    } 
    
    if (pmc->flags & PS_INTEGER_OK) {
        pmc->flags |= PS_NUMBER_OK;
        return d->numdata = (FLOATVAL)(d->intdata);
    } 
    
    if (pmc->flags & PS_STRING_OK) {
        printf("String aton will go here when implemented\n");
        exit(1);
    }

    /* Else, we have no data. Fill both integer and number */
    pmc->flags |= PS_NUMBER_OK | PS_INTEGER_OK;
    d->intdata = 0;
    return d->numdata = 0.0;
}

static STRING* Parrot_scalar_get_string (struct Parrot_Interp *interpreter, PMC* pmc) {
    struct PerlScalarData* d = pmc->data;

    if (pmc->flags & PS_STRING_OK) {
        return d->stringdata;
    } 
    
    if (pmc->flags & PS_NUMBER_OK) {
        char* buf = mem_allocate_aligned((INTVAL)log(d->numdata)+1);
        sprintf(buf, "%d", d->numdata); /* Hack */
	    d->stringdata = string_make(interpreter, buf, strlen(buf), 0, 0, 0);
        free(buf);
        return d->stringdata;
    } 
    
    if (pmc->flags & PS_INTEGER_OK) {
        char* buf = mem_allocate_aligned((INTVAL)log(d->intdata)+1);
        sprintf(buf, "%i", d->intdata); /* Hack */
	    d->stringdata = string_make(interpreter, buf, strlen(buf), 0, 0, 0);
        free(buf);
        return d->stringdata;
    }

    pmc->flags |= PS_STRING_OK | PS_NUMBER_OK | PS_INTEGER_OK;
    d->intdata = d->numdata = 0;
    return d->stringdata = string_make(interpreter, "", 0, 0, 0, 0);
}

static BOOLVAL Parrot_scalar_get_bool (struct Parrot_Interp *interpreter, PMC* pmc) {
    struct PerlScalarData* d = pmc->data;

    if (pmc->flags & PS_NUMBER_OK) { 
        return (BOOLVAL)(d->numdata);
    }

    if (pmc->flags & PS_INTEGER_OK) {
        return (BOOLVAL)(d->intdata);
    }

    if (!pmc->flags & PS_STRING_OK) { return 0; }
    /* I don't know what happens here */
}

static void* Parrot_scalar_get_value (struct Parrot_Interp *interpreter, PMC* pmc) {
    return pmc->data;
}

static BOOLVAL Parrot_scalar_is_equal (struct Parrot_Interp *interpreter, PMC* pmc1, PMC* pmc2) {
    struct PerlScalarData* d = pmc1->data;

    if (pmc1->flags & PS_NUMBER_OK) {
        return d->numdata == pmc2->vtable->get_number(interpreter, pmc2);
    } 
    
    if (pmc1->flags & PS_INTEGER_OK) { 
        return d->intdata == pmc2->vtable->get_integer(interpreter, pmc2);
    } 
    
    if (pmc1->flags & PS_STRING_OK) {
	/* Urgh */
	/* return string_compare(pmc1->data->stringval, pmc2->vtable->get_string(pmc2) */
    } 

    /* pmc1 is false */
    return !pmc2->vtable->get_bool(interpreter, pmc2);
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

static BOOLVAL Parrot_scalar_is_same (struct Parrot_Interp *interpreter, PMC* pmc, PMC* left) {
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
    whoami = string_make(NULL, /* This is a screamingly huge hack */
				"PerlScalar",
				10, 0, 0, 0);
    Parrot_base_vtables[enum_class_scalar] = temp_base_vtable;
}
