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

/* This should be public, but for right now it's internal */
static PMC *
find_global(Parrot_Interp interpreter, STRING *globalname) {
    PMC* key = key_new_string(interpreter, globalname);
    if (!VTABLE_exists_keyed(interpreter,
                             interpreter->globals->stash_hash, key)) {
        return NULL;
    }

    return VTABLE_get_pmc_keyed(interpreter,
				interpreter->globals->stash_hash, key);
}

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


  Parrot_class_register(interpreter, child_class_name, child_class);

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
  if(Parrot_class_lookup(interpreter, class_name) != PMCNULL) {
     internal_exception(1, "Class %s already registered!\n",
                        string_to_cstring(interpreter, class_name));
  }

  Parrot_class_register(interpreter, class_name, new_class);

  return new_class;
}


PMC *
Parrot_class_lookup(Parrot_Interp interpreter, STRING *class_name)
{
  if (VTABLE_exists_keyed(interpreter, interpreter->class_hash,
                          key_new_string(interpreter, class_name)))
     return VTABLE_get_pmc_keyed(interpreter, interpreter->class_hash,
                                 key_new_string(interpreter, class_name));
  return PMCNULL;
}

void
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name, PMC *new_class)
{
  VTABLE_set_pmc_keyed(interpreter, interpreter->class_hash,
                       key_new_string(interpreter,class_name), new_class);

  return;
  /* Now build a new vtable for this class and register it in the
     global registry */
  {
      /* The child class PMC has a ParrotClass vtable, which is a
         good base to work from */
      VTABLE *new_vtable = Parrot_clone_vtable(interpreter, new_class->vtable);
      INTVAL new_type = pmc_register(interpreter, class_name);

      /* Set the vtable's type to the newly allocated type */
      Parrot_vtable_set_type(interpreter, new_vtable, new_type);

      /* Reset the init method */
      new_vtable->init = NULL;
      new_class->vtable = new_vtable;
      
  }

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
 * is one. If not, it creates a new method cache. Or, rather, it will
 * when we've got that bit working. For now it unconditionally goes
 * and looks up the name in the global stash.
 *
 */
PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name) {
    PMC* key = key_new_string(interpreter, method_name);
    PMC* method = NULL;  /* The method we ultimately return */
    PMC* classname;      /* The classname PMC for the currently
                            searched class */
    PMC* curclass;          /* PMC for the current search class */
    PMC* classsearch_array; /* The array of classes we're searching
                               for the method in */
    INTVAL searchoffset = 0; /* Where in that array we are */
    INTVAL classcount = 0;   /* The number of classes we need to
                                search */
    STRING *FQ_method;   /* The fully qualified name of the method
                            that we're going to look for, rebuilt for
                            each class we search */
    STRING *fallback_name; /* The name of the fallback method for
                              this class */
    STRING *shortcut_name; /* The method name with the separator
                              prepended */

    /* For right now, no methods for non-classes. This should change,
       but it'll do for the moment. */
    if (!PObj_is_class_TEST(class)) {
        return NULL;
    }

    /* We're going to make this over and over, so get it once and
       skip the repeated string makes */
    shortcut_name = string_concat(interpreter, string_from_cstring(interpreter, PARROT_NAMESPACE_SEPARATOR, PARROT_NAMESPACE_SEPARATOR_LENGTH), method_name, 0);

    /* The order of operations:
     *
     * - Look for the method in the class we were passed
     * - If that doesn't exist, grab the parent class array
     * -  For each element in the parent class array, look for the
     *    method
     * - If none of that works, try again looking for the fallback method
     */

    /* See if we get lucky and its in the class of the PMC */
    FQ_method = string_concat(interpreter, VTABLE_get_string(interpreter, VTABLE_get_pmc_keyed_int(interpreter, (PMC *)PMC_data(class), 1)), shortcut_name, 0);

    method = find_global(interpreter, FQ_method);

    /* Bail immediately if we got something */
    if (NULL != method) {
        return method;
    }

    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array = VTABLE_get_pmc_keyed_int(interpreter, (PMC *)PMC_data(class), 2);
    classcount = VTABLE_get_integer(interpreter, classsearch_array);

    for (searchoffset = 0; NULL == method && searchoffset < classcount; searchoffset++) {
        curclass = VTABLE_get_pmc_keyed_int(interpreter, classsearch_array, searchoffset);
        
        FQ_method = string_concat(interpreter, VTABLE_get_string(interpreter, VTABLE_get_pmc_keyed_int(interpreter, (PMC *)PMC_data(curclass), 1)), shortcut_name, 0);
        method = find_global(interpreter, FQ_method);
    }


    /* Ultimately, if we've failed, pitch an exception */
    if (NULL == method) {
        real_exception(interpreter, NULL, METH_NOT_FOUND,
                       "Method '%s' not found\n",
                       string_to_cstring(interpreter, method_name));
    }
    return method;
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
