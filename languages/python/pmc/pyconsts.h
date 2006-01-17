#if defined(INSIDE_PYBUILTIN)
#  define PYVAR_SCOPE
#else
#  define PYVAR_SCOPE extern
#endif /* INSIDE_PYBUILTIN */

/* Python class types */

PYVAR_SCOPE INTVAL PyBuiltin_PyBoolean;
PYVAR_SCOPE INTVAL PyBuiltin_PyBoundMeth;
PYVAR_SCOPE INTVAL PyBuiltin_PyBoundCall;
PYVAR_SCOPE INTVAL PyBuiltin_PyClass;
PYVAR_SCOPE INTVAL PyBuiltin_PyComplex;
PYVAR_SCOPE INTVAL PyBuiltin_PyDict;
PYVAR_SCOPE INTVAL PyBuiltin_PyException;
PYVAR_SCOPE INTVAL PyBuiltin_PyFloat;
PYVAR_SCOPE INTVAL PyBuiltin_PyFunc;
PYVAR_SCOPE INTVAL PyBuiltin_PyGen;
PYVAR_SCOPE INTVAL PyBuiltin_PyInt;
PYVAR_SCOPE INTVAL PyBuiltin_PyIter;
PYVAR_SCOPE INTVAL PyBuiltin_PyList;
PYVAR_SCOPE INTVAL PyBuiltin_PyLong;
PYVAR_SCOPE INTVAL PyBuiltin_PyNCI;
PYVAR_SCOPE INTVAL PyBuiltin_PyNone;
PYVAR_SCOPE INTVAL PyBuiltin_PyObject;
PYVAR_SCOPE INTVAL PyBuiltin_PyProxyClass;
PYVAR_SCOPE INTVAL PyBuiltin_PyProxyType;
PYVAR_SCOPE INTVAL PyBuiltin_PySlice;
PYVAR_SCOPE INTVAL PyBuiltin_PyStaticMeth;
PYVAR_SCOPE INTVAL PyBuiltin_PyString;
PYVAR_SCOPE INTVAL PyBuiltin_PyTuple;
PYVAR_SCOPE INTVAL PyBuiltin_PyType;

/* Python class objects */

PYVAR_SCOPE PMC *PyBuiltin_PyBoolean_class;
PYVAR_SCOPE PMC *PyBuiltin_PyComplex_class;
PYVAR_SCOPE PMC *PyBuiltin_PyDict_class;
PYVAR_SCOPE PMC *PyBuiltin_PyException_class;
PYVAR_SCOPE PMC *PyBuiltin_PyInt_class;
PYVAR_SCOPE PMC *PyBuiltin_PyIter_class;
PYVAR_SCOPE PMC *PyBuiltin_PyFloat_class;
PYVAR_SCOPE PMC *PyBuiltin_PyFunc_class;
PYVAR_SCOPE PMC *PyBuiltin_PyList_class;
PYVAR_SCOPE PMC *PyBuiltin_PyLong_class;
PYVAR_SCOPE PMC *PyBuiltin_PyProxyClass_class;
PYVAR_SCOPE PMC *PyBuiltin_PySlice_class;
PYVAR_SCOPE PMC *PyBuiltin_PyStaticMeth_class;
PYVAR_SCOPE PMC *PyBuiltin_PyString_class;
PYVAR_SCOPE PMC *PyBuiltin_PyTuple_class;
PYVAR_SCOPE PMC *PyBuiltin_PyType_class;

/* constant strings */

PYVAR_SCOPE STRING *PyString_bases;
PYVAR_SCOPE STRING *PyString_call;
PYVAR_SCOPE STRING *PyString_class;
PYVAR_SCOPE STRING *PyString_cmp;
PYVAR_SCOPE STRING *PyString_dict;
PYVAR_SCOPE STRING *PyString_get;
PYVAR_SCOPE STRING *PyString_hex;
PYVAR_SCOPE STRING *PyString_hash;
PYVAR_SCOPE STRING *PyString_init;
PYVAR_SCOPE STRING *PyString_int;
PYVAR_SCOPE STRING *PyString_iter;
PYVAR_SCOPE STRING *PyString_name;
PYVAR_SCOPE STRING *PyString_new;
PYVAR_SCOPE STRING *PyString_next;
PYVAR_SCOPE STRING *PyString_oct;
PYVAR_SCOPE STRING *PyString_proxy;
PYVAR_SCOPE STRING *PyString_repr;
PYVAR_SCOPE STRING *PyString_str;

PYVAR_SCOPE STRING *PyFunc_args;
PYVAR_SCOPE STRING *PyFunc_varargs;
PYVAR_SCOPE STRING *PyFunc_defaults;

/* utility functions */

struct parrot_regs_t *
Parrot_PyClass_runops_fromc(Parrot_Interp interpreter, PMC *sub);

PMC *Parrot_PyClass_call_meth_fromc_P_P(Parrot_Interp interpreter, PMC *obj,
    STRING *meth, PMC* arg1);

PMC* Parrot_py_make_slice(Interp *interpreter, PMC *self, PMC *key);
