#if defined(INSIDE_PYBUILTIN)
#  define VAR_SCOPE
#else
#  define VAR_SCOPE extern
#endif /* INSIDE_PYBUILTIN */

/* Python class types */

VAR_SCOPE INTVAL PyBuiltin_PyObject;
VAR_SCOPE INTVAL PyBuiltin_PyBoolean;
VAR_SCOPE INTVAL PyBuiltin_PyClass;
VAR_SCOPE INTVAL PyBuiltin_PyComplex;
VAR_SCOPE INTVAL PyBuiltin_PyDict;
VAR_SCOPE INTVAL PyBuiltin_PyException;
VAR_SCOPE INTVAL PyBuiltin_PyInt;
VAR_SCOPE INTVAL PyBuiltin_PyIter;
VAR_SCOPE INTVAL PyBuiltin_PyFloat;
VAR_SCOPE INTVAL PyBuiltin_PyList;
VAR_SCOPE INTVAL PyBuiltin_PyLong;
VAR_SCOPE INTVAL PyBuiltin_PyNCI;
VAR_SCOPE INTVAL PyBuiltin_PyNone;
VAR_SCOPE INTVAL PyBuiltin_PyProxyClass;
VAR_SCOPE INTVAL PyBuiltin_PyProxyType;
VAR_SCOPE INTVAL PyBuiltin_PySlice;
VAR_SCOPE INTVAL PyBuiltin_PyStaticMeth;
VAR_SCOPE INTVAL PyBuiltin_PyString;
VAR_SCOPE INTVAL PyBuiltin_PyTuple;
VAR_SCOPE INTVAL PyBuiltin_PyType;

/* Python class objects */

VAR_SCOPE PMC *PyBuiltin_PyBoolean_class;
VAR_SCOPE PMC *PyBuiltin_PyComplex_class;
VAR_SCOPE PMC *PyBuiltin_PyDict_class;
VAR_SCOPE PMC *PyBuiltin_PyException_class;
VAR_SCOPE PMC *PyBuiltin_PyInt_class;
VAR_SCOPE PMC *PyBuiltin_PyFloat_class;
VAR_SCOPE PMC *PyBuiltin_PyList_class;
VAR_SCOPE PMC *PyBuiltin_PyLong_class;
VAR_SCOPE PMC *PyBuiltin_PySlice_class;
VAR_SCOPE PMC *PyBuiltin_PyStaticMeth_class;
VAR_SCOPE PMC *PyBuiltin_PyTuple_class;
VAR_SCOPE PMC *PyBuiltin_PyType_class;

/* constant strings */

VAR_SCOPE STRING *PyString_bases;
VAR_SCOPE STRING *PyString_call;
VAR_SCOPE STRING *PyString_class;
VAR_SCOPE STRING *PyString_cmp;
VAR_SCOPE STRING *PyString_hex;
VAR_SCOPE STRING *PyString_init;
VAR_SCOPE STRING *PyString_int;
VAR_SCOPE STRING *PyString_iter;
VAR_SCOPE STRING *PyString_name;
VAR_SCOPE STRING *PyString_new;
VAR_SCOPE STRING *PyString_oct;
VAR_SCOPE STRING *PyString_proxy;
VAR_SCOPE STRING *PyString_repr;
VAR_SCOPE STRING *PyString_str;

/* utility functions */

struct parrot_regs_t *
Parrot_PyClass_runops_fromc(Parrot_Interp interpreter, PMC *sub);
