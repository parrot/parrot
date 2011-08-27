/* Contains the logic that bootstraps KnowHOW, the foundation for implementing
 * the various other bits of the object model. Works in conjunction with
 * KnowHOWREPR. */

#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "sixmodelobject.h"
#include "repr_registry.h"
#include "reprs/KnowHOWREPR.h"
#include "knowhow_bootstrapper.h"

/* Cached string constants. */
static STRING *repr_str     = NULL;
static STRING *name_str     = NULL;
static STRING *empty_str    = NULL;
static STRING *p6opaque_str = NULL;

/* Creates a new type with this HOW as its meta-object. */
static void new_type(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    /* We first create a new HOW instance. */
    PMC *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC *HOW     = REPR(self)->instance_of(interp, STABLE(self)->WHAT);
    
    /* See if we have a representation name; if not default to P6opaque. */
    STRING *repr_name = VTABLE_exists_keyed_str(interp, capture, repr_str) ?
        VTABLE_get_string_keyed_str(interp, capture, repr_str) :
        p6opaque_str;
        
    /* Create a new type object of the desired REPR. (Note that we can't
     * default to KnowHOWREPR here, since it doesn't know how to actually
     * store attributes, it's just for bootstrapping knowhow's. */
    REPROps *repr_to_use = REPR_get_by_name(interp, repr_name);
    PMC     *type_object = repr_to_use->type_object_for(interp, HOW);
    
    /* See if we were given a name; put it into the meta-object if so. */
    STRING *name = VTABLE_exists_keyed_str(interp, capture, name_str) ?
        VTABLE_get_string_keyed_str(interp, capture, name_str) :
        empty_str;
    ((KnowHOWREPRInstance *)PMC_data(HOW))->name = name;
    PARROT_GC_WRITE_BARRIER(interp, HOW);
    
    /* Set .WHO to an empty hash. */
    STABLE(type_object)->WHO = pmc_new(interp, enum_class_Hash);
    PARROT_GC_WRITE_BARRIER(interp, STABLE_PMC(type_object));

    /* Put it into capture to act as return value. */
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", type_object);
}

/* Adds a method. */
static void add_method(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    /* Get methods table out of meta-object. */
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC    *methods = ((KnowHOWREPRInstance *)PMC_data(self))->methods;

    /* Get name and method to add. */
    STRING *name   = VTABLE_get_string_keyed_int(interp, capture, 2);
    PMC    *method = VTABLE_get_pmc_keyed_int(interp, capture, 3);

    /* Add it, and return added method as result. */
    VTABLE_set_pmc_keyed_str(interp, methods, name, method);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", method);
}

/* Adds an attribute meta-object to the list. */
static void add_attribute(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    /* Get attributes list out of meta-object. */
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC    *attrs   = ((KnowHOWREPRInstance *)PMC_data(self))->attributes;

    /* Add meta-attribute to it. */
    PMC *meta_attr = VTABLE_get_pmc_keyed_int(interp, capture, 2);
    VTABLE_push_pmc(interp, attrs, meta_attr);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", meta_attr);
}

/* Finds a method. */
static void find_method(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    /* Get methods table out of meta-object and look up method. */
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC    *methods = ((KnowHOWREPRInstance *)PMC_data(self))->methods;
    STRING *name    = VTABLE_get_string_keyed_int(interp, capture, 2);
    PMC    *method  = VTABLE_get_pmc_keyed_str(interp, methods, name);

    /* Put into capture to act as return value. */
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", method);
}

/* Composes the meta-object. */
static void compose(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *obj     = VTABLE_get_pmc_keyed_int(interp, capture, 1);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", obj);
}

/* Introspects the parents. Since a KnowHOW doesn't support inheritance,
 * just hand back an empty list. */
static void parents(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC *empty   = pmc_new(interp, enum_class_FixedPMCArray);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", empty);
}

/* Introspects the attributes. For now just hand back real list. */
static void attributes(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC    *attrs   = ((KnowHOWREPRInstance *)PMC_data(self))->attributes;
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", attrs);
}

/* Introspects the methods. For now just hand back real method table. */
static void methods(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    PMC    *meths   = ((KnowHOWREPRInstance *)PMC_data(self))->methods;
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", meths);
}

/* Introspects the MRO. That's just a list with ourself. */
static void mro(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC *obj     = VTABLE_get_pmc_keyed_int(interp, capture, 1);
    PMC *mro     = pmc_new(interp, enum_class_ResizablePMCArray);
    VTABLE_push_pmc(interp, mro, STABLE(obj)->WHAT);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", mro);
}

/* Introspects the name. */
static void name(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    STRING *name    = ((KnowHOWREPRInstance *)PMC_data(self))->name;
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "S", name);
}

/* Wraps up a C function as a raw NCI method. */
static PMC * wrap_c(PARROT_INTERP, void *func) {
    PMC * const wrapped = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
    VTABLE_set_pointer_keyed_str(interp, wrapped, Parrot_str_new_constant(interp, "->"), func);
    return wrapped;
}

/* This is the find_method where things eventually bottom out. */
static PMC * bottom_find_method(PARROT_INTERP, PMC *obj, STRING *name, INTVAL hint) {
    PMC *methods = ((KnowHOWREPRInstance *)PMC_data(obj))->methods;
    PMC *method  = VTABLE_get_pmc_keyed_str(interp, methods, name);
    if (PMC_IS_NULL(method))
        /* XXX Awesomeize. */
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Could not find method '%Ss'", name);
    return method;
}

/* Bootstraps the KnowHOW. This is were things "bottom out" in the meta-model
 * so it's a tad loopy. Basically, we create a KnowHOW type object. We then
 * create an instance from that and add a bunch of methods to it. Returns the
 * bootstrapped object. */
PMC * SixModelObject_bootstrap_knowhow(PARROT_INTERP, PMC *sc) {
    /* Create our KnowHOW type object. Note we don't have a HOW just yet, so
     * pass in null. */
    REPROps *REPR        = REPR_get_by_name(interp, Parrot_str_new_constant(interp, "KnowHOWREPR"));
    PMC     *knowhow_pmc = REPR->type_object_for(interp, PMCNULL);

    /* We create a KnowHOW instance that can describe itself. This means
     * .HOW.HOW.HOW.HOW etc will always return that, which closes the model
     * up. Also pull out its underlying struct. */
    PMC *knowhow_how_pmc = REPR->instance_of(interp, knowhow_pmc);
    KnowHOWREPRInstance *knowhow_how = (KnowHOWREPRInstance *)PMC_data(knowhow_how_pmc);

    /* Need to give the knowhow_how a twiddled STable with a different
     * dispatcher, so things bottom out. */
    PMC *st_copy = create_stable(interp, REPR, knowhow_how_pmc);
    STABLE_STRUCT(st_copy)->WHAT = knowhow_pmc;
    STABLE_STRUCT(st_copy)->find_method = bottom_find_method;
    knowhow_how->common.stable = st_copy;

    /* Add various methods to the KnowHOW's HOW. */
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "new_type"),
        wrap_c(interp, F2DPTR(new_type)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "find_method"),
        wrap_c(interp, F2DPTR(find_method)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "add_method"),
        wrap_c(interp, F2DPTR(add_method)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "add_attribute"),
        wrap_c(interp, F2DPTR(add_attribute)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "compose"),
        wrap_c(interp, F2DPTR(compose)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "parents"),
        wrap_c(interp, F2DPTR(parents)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "attributes"),
        wrap_c(interp, F2DPTR(attributes)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "methods"),
        wrap_c(interp, F2DPTR(methods)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "mro"),
        wrap_c(interp, F2DPTR(mro)));
    VTABLE_set_pmc_keyed_str(interp, knowhow_how->methods,
        Parrot_str_new_constant(interp, "name"),
        wrap_c(interp, F2DPTR(name)));

    /* Set name KnowHOW for the KnowHOW's HOW. */
    knowhow_how->name = Parrot_str_new_constant(interp, "KnowHOW");

    /* Set this built up HOW as the KnowHOW's HOW. */
    STABLE(knowhow_pmc)->HOW = knowhow_how_pmc;

    /* Set up some string constants that the methods here use. */
    repr_str     = Parrot_str_new_constant(interp, "repr");
    name_str     = Parrot_str_new_constant(interp, "name");
    empty_str    = Parrot_str_new_constant(interp, "");
    p6opaque_str = Parrot_str_new_constant(interp, "P6opaque");

    /* Associate the created objects with the intial core serialization
     * context. */
    VTABLE_set_pmc_keyed_int(interp, sc, 0, knowhow_pmc);
    SC_PMC(knowhow_pmc) = sc;
    VTABLE_set_pmc_keyed_int(interp, sc, 1, knowhow_how_pmc);
    SC_PMC(knowhow_how_pmc) = sc;

    return knowhow_pmc;
}

/* Attribute new method. */
static void attr_new(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *type    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    STRING *name    = VTABLE_get_string_keyed_str(interp, capture, name_str);
    PMC    *self    = REPR(type)->instance_of(interp, type);
    REPR(self)->set_str(interp, self, name);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "P", self);
}

/* Attribute name introspection. */
static void attr_name(PARROT_INTERP, PMC *nci) {
    PMC * unused;
    PMC    *capture = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    PMC    *self    = VTABLE_get_pmc_keyed_int(interp, capture, 0);
    STRING *name    = REPR(self)->get_str(interp, self);
    unused = Parrot_pcc_build_call_from_c_args(interp, capture, "S", name);
}

/* Sets up a very simple attribute meta-object. Just supports having a
 * name, and even uses the P6str representation to store it, so that's
 * really all that it supports. */
PMC * SixModelObject_setup_knowhow_attribute(PARROT_INTERP, PMC *sc, PMC *knowhow) {
    PMC *old_ctx, *cappy, *meth, *knowhow_attr, *how;
    
    /* Create a new KnowHOWAttribute type using P6str repr.. */
    meth = STABLE(knowhow)->find_method(interp, knowhow,
        Parrot_str_new_constant(interp, "new_type"), NO_HINT);
    old_ctx = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, knowhow);
    VTABLE_set_string_keyed_str(interp, cappy, name_str,
        Parrot_str_new_constant(interp, "KnowHOWAttribute"));
    VTABLE_set_string_keyed_str(interp, cappy, repr_str,
        Parrot_str_new_constant(interp, "P6str"));
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);
    cappy = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    knowhow_attr = VTABLE_get_pmc_keyed_int(interp, cappy, 0);
    how = STABLE(knowhow_attr)->HOW;
    
    /* Add new method. */
    meth = STABLE(how)->find_method(interp, how,
        Parrot_str_new_constant(interp, "add_method"), NO_HINT);
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, how);
    VTABLE_push_pmc(interp, cappy, knowhow_attr);
    VTABLE_push_string(interp, cappy, Parrot_str_new_constant(interp, "new"));
    VTABLE_push_pmc(interp, cappy, wrap_c(interp, F2DPTR(attr_new)));
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    
    /* Add name method. */
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, how);
    VTABLE_push_pmc(interp, cappy, knowhow_attr);
    VTABLE_push_string(interp, cappy, name_str);
    VTABLE_push_pmc(interp, cappy, wrap_c(interp, F2DPTR(attr_name)));
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    
    /* Compose. */
    meth = STABLE(knowhow)->find_method(interp, how,
        Parrot_str_new_constant(interp, "compose"), NO_HINT);
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, how);
    VTABLE_push_pmc(interp, cappy, knowhow_attr);
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    
    /* Associate the created object with the intial core serialization
     * context. */
    VTABLE_set_pmc_keyed_int(interp, sc, 2, knowhow_attr);
    SC_PMC(knowhow_attr) = sc;
    
    return knowhow_attr;
}
