/* objects.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Handles class and object manipulation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* Subclass a class. Single parent class, nice and
   straightforward. If child_class is NULL, this is an anonymous
   subclass we're creating, which happens commonly enough to warrant
   an actual single-subclass function
 */
PMC *
Parrot_single_subclass(Parrot_Interp interpreter, PMC *base_class,
                       STRING *child_class_name) 
{
  PMC *child_class;
  PMC *child_class_array;
  PMC *classname_pmc;
  PMC *temp_pmc;

  if (!PObj_is_class_TEST(base_class)) {
      internal_exception(NO_CLASS, "Can't subclass a non-class!");
  }

  child_class = pmc_new(interpreter, enum_class_ParrotClass);
  child_class_array = PMC_data(child_class);

  /* We have the same number of attributes as our parent */
  child_class->obj.u.int_val = base_class->obj.u.int_val;

  /* Our parent class array has a single member in it */
  temp_pmc = pmc_new(interpreter, enum_class_Array);
  VTABLE_set_integer_native(interpreter, temp_pmc, 1);
  VTABLE_set_pmc_keyed_int(interpreter, child_class_array, 0, temp_pmc);
  VTABLE_set_pmc_keyed_int(interpreter, temp_pmc, 0, base_class);

  /* Set the classname, if we have one */
  classname_pmc = pmc_new(interpreter, enum_class_PerlString);
  if (child_class_name) {
      VTABLE_set_string_native(interpreter, classname_pmc, child_class_name);

    /* Add ourselves to the interpreter's class hash */
      VTABLE_set_pmc_keyed(interpreter, interpreter->class_hash,
                           key_new_string(interpreter, child_class_name),
                                          child_class);
  }
  else {
      VTABLE_set_string_native(interpreter, classname_pmc,
                               string_make(interpreter, 
                                           "\0\0anonymous", 
                                           11, NULL, 0, NULL));
  }

  VTABLE_set_pmc_keyed_int(interpreter, child_class_array, 1, classname_pmc);

  /* Our penultimate parent list is a clone of our parent's parent
     list, with our parent unshifted onto the beginning */
  temp_pmc = pmc_new_noinit(interpreter, enum_class_Array);
  VTABLE_clone(interpreter, 
               VTABLE_get_pmc_keyed_int(interpreter,
                                        (PMC *)PMC_data(base_class), 2),
               temp_pmc);
  VTABLE_unshift_pmc(interpreter, temp_pmc, base_class);
  VTABLE_set_pmc_keyed_int(interpreter, child_class_array, 2, temp_pmc);

  /* Our attribute list is our parent's attribute list */
  temp_pmc = pmc_new_noinit(interpreter, enum_class_OrderedHash);
  VTABLE_clone(interpreter,
               VTABLE_get_pmc_keyed_int(interpreter,
                                        (PMC *)PMC_data(base_class), 3),
               temp_pmc);
  VTABLE_set_pmc_keyed_int(interpreter, child_class_array, 3, temp_pmc);

  /* And our full keyed attribute list is our parent's */
  temp_pmc = pmc_new_noinit(interpreter, enum_class_OrderedHash);
  VTABLE_clone(interpreter,
               VTABLE_get_pmc_keyed_int(interpreter,
                                        (PMC *)PMC_data(base_class), 4),
               temp_pmc);
  VTABLE_set_pmc_keyed_int(interpreter, child_class_array, 4, temp_pmc);

  return child_class;
}

/*=for api objects Parrot_new_class
 *
 * Create a brand new class, named what we pass in.
 */
PMC *
Parrot_new_class(Parrot_Interp interpreter, STRING *class_name) 
{
  PMC *new_class;
  PMC *new_class_array;
  PMC *classname_pmc;

  new_class = pmc_new(interpreter, enum_class_ParrotClass);
  new_class_array = PMC_data(new_class);
  /* We have the same number of attributes as our parent */
  new_class->obj.u.int_val = 0;
  /* Our parent class array has nothing in it */
  VTABLE_set_pmc_keyed_int(interpreter, new_class_array, 0,
                           pmc_new(interpreter, enum_class_Array));
  VTABLE_set_pmc_keyed_int(interpreter, new_class_array, 2,
                           pmc_new(interpreter, enum_class_Array));
  VTABLE_set_pmc_keyed_int(interpreter, new_class_array, 3,
                           pmc_new(interpreter, enum_class_OrderedHash));
  VTABLE_set_pmc_keyed_int(interpreter, new_class_array, 4,
                           pmc_new(interpreter, enum_class_OrderedHash));

  /* Set the classname, if we have one */
  classname_pmc = pmc_new(interpreter, enum_class_PerlString);
  VTABLE_set_string_native(interpreter, classname_pmc, class_name);
  VTABLE_set_pmc_keyed_int(interpreter, new_class_array, 1, classname_pmc);

  /* Add ourselves to the interpreter's class hash */
  if(Parrot_class_lookup(interpreter, class_name)) {
     internal_exception(1, "Class %s already registered!\n",
                        string_to_cstring(interpreter, class_name));
  }

  Parrot_class_register(interpreter, class_name, new_class);

  return new_class;
}


PMC *
Parrot_class_lookup(Parrot_Interp interpreter, STRING *class_name)
{
  return VTABLE_get_pmc_keyed(interpreter, interpreter->class_hash,
                              key_new_string(interpreter, class_name));
}

void
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name, PMC *new_class)
{
  VTABLE_set_pmc_keyed(interpreter, interpreter->class_hash,
                       key_new_string(interpreter,class_name), new_class);

}


/*=for api objects Parrot_instantiate_object
 *
 * Create a new parrot object. Takes a passed-in class PMC that has
 * sufficient information to describe the layout of the object and,
 * well, makes the darned object.
 *
 */
PMC *
Parrot_instantiate_object(Parrot_Interp interpreter, PMC *class) {
    PMC *new_object;
    PMC *new_object_array;
    INTVAL attrib_count;
    PMC *class_array;

    /* Grab the attribute count from the parent */
    attrib_count = class->cache.int_val;

    class_array = PMC_data(class);

    /* Build the array that hangs off the new object */
    new_object_array = pmc_new(interpreter, enum_class_Array);
    /* Presize it */
    VTABLE_set_integer_native(interpreter, new_object_array, attrib_count + 2);
    /* 0 - class PMC, 1 - class name */
    VTABLE_set_pmc_keyed_int(interpreter, new_object_array, 0, class);
    VTABLE_set_pmc_keyed_int(interpreter, new_object_array, 1,
                             VTABLE_get_pmc_keyed_int(interpreter, class_array, 1));

    /* Allocate the object itself */
    new_object = pmc_new(interpreter, enum_class_ParrotObject);
    /* Note the number of used slots */
    new_object->cache.int_val = 2;
    
    PMC_data(new_object) = new_object_array;
    PObj_flag_SET(is_PMC_ptr, new_object);
    
    /* We really ought to call the class init routines here... */
    return new_object;
}

PMC *
Parrot_add_parent(Parrot_Interp interpreter, PMC *new_base_class,
           PMC *existing_class) {
    return NULL;
}

PMC *
Parrot_remove_parent(Parrot_Interp interpreter, PMC *removed_class,
                     PMC *existing_class) {
    return NULL;
}

PMC *
Parrot_multi_subclass(Parrot_Interp interpreter, PMC *base_class_array,
                      STRING *child_class_name) {
    return NULL;
}

/*=for api objects Parrot_object_is
 *
 * Is the object an instance of class.
 * XXX: This should check parent classes as well, but it currently doesn't.
 */
INTVAL
Parrot_object_isa(Parrot_Interp interpreter, PMC *obj, PMC *cl) {
    PMC * t;
    PMC * object_array = PMC_data(obj);
    t = VTABLE_get_pmc_keyed_int(interpreter, object_array, 0);
    if(t == cl)
       return 1;
    return 0;
}

/*=for api objects Parrot_new_method_cache
 *
 * Create a new method cache PMC.
 */
PMC *
Parrot_new_method_cache(Parrot_Interp interpreter) {
    return NULL;
}

/*=for api objects Parrot_find_method
 *
 * Find a method PMC for a named method, given the class PMC, current
 * interpreter, and name of the method.
 *
 * This routine should use the current scope's method cache, if there
 * is one. If not, it creates a new method cache
 *
 */
PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name) {
    return NULL;
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
