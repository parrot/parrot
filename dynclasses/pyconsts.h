/* Python class types */

INTVAL PyBuiltin_PyObject;
INTVAL PyBuiltin_PyBoolean;
INTVAL PyBuiltin_PyClass;
INTVAL PyBuiltin_PyComplex;
INTVAL PyBuiltin_PyDict;
INTVAL PyBuiltin_PyException;
INTVAL PyBuiltin_PyInt;
INTVAL PyBuiltin_PyIter;
INTVAL PyBuiltin_PyFloat;
INTVAL PyBuiltin_PyList;
INTVAL PyBuiltin_PyLong;
INTVAL PyBuiltin_PyNCI;
INTVAL PyBuiltin_PyNone;
INTVAL PyBuiltin_PyProxyClass;
INTVAL PyBuiltin_PyProxyType;
INTVAL PyBuiltin_PySlice;
INTVAL PyBuiltin_PyStaticMeth;
INTVAL PyBuiltin_PyString;
INTVAL PyBuiltin_PyTuple;
INTVAL PyBuiltin_PyType;

/* Python class objects */

PMC *PyBuiltin_PyBoolean_class;
PMC *PyBuiltin_PyComplex_class;
PMC *PyBuiltin_PyDict_class;
PMC *PyBuiltin_PyException_class;
PMC *PyBuiltin_PyInt_class;
PMC *PyBuiltin_PyFloat_class;
PMC *PyBuiltin_PyList_class;
PMC *PyBuiltin_PyLong_class;
PMC *PyBuiltin_PySlice_class;
PMC *PyBuiltin_PyStaticMeth_class;
PMC *PyBuiltin_PyTuple_class;
PMC *PyBuiltin_PyType_class;

/* constant strings */

STRING *PyString_bases;
STRING *PyString_call;
STRING *PyString_class;
STRING *PyString_cmp;
STRING *PyString_hex;
STRING *PyString_init;
STRING *PyString_int;
STRING *PyString_iter;
STRING *PyString_name;
STRING *PyString_new;
STRING *PyString_oct;
STRING *PyString_proxy;
STRING *PyString_repr;
STRING *PyString_str;

/* utility functions */

struct parrot_regs_t *
Parrot_PyClass_runops_fromc(Parrot_Interp interpreter, PMC *sub);
