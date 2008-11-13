=head1 NAME

src/builtins/funcs.pir - built-in functions


=head1 DESCRIPTION

Implements Python's built-in functions. Descriptions are taken from:
http://docs.python.org/lib/built-in-funcs.html

NOTE: most functions are not implemented yet, only stubs are supplied.

=head1 Functions

=over 4

=cut

.namespace []

=item abs(x)

Return the absolute value of a number. The argument may be a plain or
long integer or a floating point number. If the argument is a complex
number, its magnitude is returned.

=cut

.sub 'abs'
    .param pmc x
    $P0 = abs x
    .return ($P0)
.end


=item all(iterable)

Return True if all elements of the iterable are true.

=cut

.sub 'all'
    .param pmc iterable
    .local pmc iter, result, obj
    iter = new 'Iterator', iterable
    result = new 'Integer' # should be boolean or whatever

    .local int bool
  loop_check:
    unless iter goto loop_end
    obj = shift iter
    bool = istrue obj
    unless bool goto fail
    goto loop_check
  loop_end:

    result = 1
    .return (result)

  fail:
    result = 0
    .return (result)
.end


=item any(iterable)

Return True if any element of the iterable is true.

=cut

.sub 'any'
    .param pmc iterable
    .local pmc iter, result, obj
    iter = new 'Iterator', iterable
    result = new 'Integer' # should be bool
    .local int bool

 loop_check:
    unless iter goto fail
    obj = shift iter
    bool = istrue obj
    unless bool goto loop_check

    result = 1
    .return (result)

 fail:
    result = 0
    .return (result)
.end


=item basestring()

This abstract type is the superclass for str and unicode. It cannot be called
or instantiated, but it can be used to test whether an object is an instance
of str or unicode. isinstance(obj, basestring) is equivalent to
isinstance(obj, (str, unicode)). New in version 2.3.

=cut

.sub 'basestring'
    print 'basestring() not implemented'
.end


=item bool([x])

Convert a value to a Boolean, using the standard truth testing procedure.
If x is false or omitted, this returns False; otherwise it returns True.
bool is also a class, which is a subclass of int. Class bool cannot be
subclassed further. Its only instances are False and True.

=cut

.sub 'bool'
    .param pmc x :optional
    .param int has_x :opt_flag

    .local pmc result
    result = new 'Integer' # should be bool or whatever

    if has_x == 0 goto fail
    $I0 = x
    unless $I0 goto fail
    result = 1
    .return (result)

  fail:
    result = 0
    .return (result)
.end


=item callable(object)

Return true if the object argument appears callable, false if not.
If this returns true, it is still possible that a call fails, but
if it is false, calling object will never succeed. Note that classes
are callable (calling a class returns a new instance); class instances
are callable if they have a __call__() method.

=cut

.sub 'callable'
    .param pmc obj
    .local int result
    result = isa obj, 'Sub'
    .return (result)
.end

=item chr(i)

Return a string of one character whose ASCII code is the integer i.
For example, chr(97) returns the string 'a'. This is the inverse of ord().
The argument must be in the range [0..255], inclusive; ValueError will
be raised if i is outside that range.

=cut

.sub 'chr'
    .param int i
    if i < 0 goto valueerror
    if i > 255 goto valueerror
    .local pmc result
    result = new 'String'
    $S0 = chr i
    result = $S0
    .return (result)

  valueerror:
    $P0 = new 'Exception'
    $P0 = "ValueError"
    throw $P0
.end



=item classmethod(function)

Return a class method for function.
A class method receives the class as implicit first argument,
just like an instance method receives the instance.
To declare a class method, use this idiom:

    class C:
        @classmethod
        def f(cls, arg1, arg2, ...): ...

The @classmethod form is a function decorator - see the description
of function definitions in chapter 7 of the Python Reference Manual for details.

It can be called either on the class (such as C.f()) or on an
instance (such as C().f()). The instance is ignored except for its class.
If a class method is called for a derived class, the derived class object
is passed as the implied first argument.

Class methods are different than C++ or Java static methods. If you want
those, see staticmethod() in this section.

For more information on class methods, consult the documentation on the
standard type hierarchy in chapter 3 of the Python Reference Manual
(at the bottom). New in version 2.2. Changed in version 2.4: Function
decorator syntax added.

=cut

.sub 'classmethod'
    .param pmc function
.end


=item cmp(x, y)

Compare the two objects x and y and return an integer according to the outcome.
The return value is negative if x < y, zero if x == y and strictly positive if x > y.

=cut

.sub 'cmp'
    .param pmc x
    .param pmc y
.end


=item compile(string, filename, kind[, flags[, dont_inherit]])

Compile the string into a code object. Code objects can be executed by an exec
statement or evaluated by a call to eval(). The filename argument should give
the file from which the code was read; pass some recognizable value if it
wasn't read from a file ('<string>' is commonly used). The kind argument
specifies what kind of code must be compiled; it can be 'exec' if string
consists of a sequence of statements, 'eval' if it consists of a single
expression, or 'single' if it consists of a single interactive statement
(in the latter case, expression statements that evaluate to something else
than None will be printed).

When compiling multi-line statements, two caveats apply: line endings must be
represented by a single newline character ('\n'), and the input must be
terminated by at least one newline character. If line endings are represented
by '\r\n', use the string replace() method to change them into '\n'.

The optional arguments flags and dont_inherit (which are new in Python 2.2)
control which future statements (see PEP 236) affect the compilation of string.
If neither is present (or both are zero) the code is compiled with those future
statements that are in effect in the code that is calling compile. If the flags
argument is given and dont_inherit is not (or is zero) then the future
statements specified by the flags argument are used in addition to those that
would be used anyway. If dont_inherit is a non-zero integer then the flags
argument is it - the future statements in effect around the call to compile
are ignored.

Future statements are specified by bits which can be bitwise or-ed together to
specify multiple statements. The bitfield required to specify a given feature
can be found as the compiler_flag attribute on the _Feature instance in the
__future__ module.

=cut

.sub 'compile'
    .param pmc str
    .param pmc filename
    .param pmc kind
    .param pmc flags :optional
    .param pmc dont_inherit :optional
.end

=item complex([real[, imag]])

Create a complex number with the value real + imag*j or convert a string or
number to a complex number. If the first parameter is a string, it will be
interpreted as a complex number and the function must be called without a
second parameter. The second parameter can never be a string. Each argument
may be any numeric type (including complex). If imag is omitted, it defaults
to zero and the function serves as a numeric conversion function like int(),
long() and float(). If both arguments are omitted, returns 0j.

=cut

.sub 'complex'
    .param pmc real :optional
    .param pmc imag :optional
.end


=item delattr(object, name)

This is a relative of setattr(). The arguments are an object and a string.
The string must be the name of one of the object's attributes. The function
deletes the named attribute, provided the object allows it. For example,
delattr(x, 'foobar') is equivalent to del x.foobar.

=cut

.sub 'delattr'
    .param pmc obj
    .param pmc name
.end


=item dict([mapping-or-sequence])

Return a new dictionary initialized from an optional positional argument or
from a set of keyword arguments. If no arguments are given, return a new empty
dictionary. If the positional argument is a mapping object, return a dictionary
mapping the same keys to the same values as does the mapping object. Otherwise
the positional argument must be a sequence, a container that supports iteration,
or an iterator object. The elements of the argument must each also be of one of
those kinds, and each must in turn contain exactly two objects. The first is
used as a key in the new dictionary, and the second as the key's value. If a
given key is seen more than once, the last value associated with it is retained
in the new dictionary.

If keyword arguments are given, the keywords themselves with their associated
values are added as items to the dictionary. If a key is specified both in the
positional argument and as a keyword argument, the value associated with the
keyword is retained in the dictionary. For example, these all return a dictionary
equal to {"one": 2, "two": 3}:

        * dict({'one': 2, 'two': 3})
        * dict({'one': 2, 'two': 3}.items())
        * dict({'one': 2, 'two': 3}.iteritems())
        * dict(zip(('one', 'two'), (2, 3)))
        * dict([['two', 3], ['one', 2]])
        * dict(one=2, two=3)
        * dict([(['one', 'two'][i-2], i) for i in (2, 3)])

New in version 2.2. Changed in version 2.3: Support for building a dictionary
from keyword arguments added.

=cut

.sub 'dict'
    .param pmc sequence :optional
    .param pmc mapping :slurpy :named :optional
.end


=item dir([object])

Without arguments, return the list of names in the current local symbol table.
With an argument, attempts to return a list of valid attributes for that object.
This information is gleaned from the object's __dict__ attribute, if defined,
and from the class or type object. The list is not necessarily complete. If the
object is a module object, the list contains the names of the module's attributes.
If the object is a type or class object, the list contains the names of its
attributes, and recursively of the attributes of its bases. Otherwise, the list
contains the object's attributes' names, the names of its class's attributes,
and recursively of the attributes of its class's base classes. The resulting
list is sorted alphabetically. For example:

    >>> import struct
    >>> dir()
    ['__builtins__', '__doc__', '__name__', 'struct']
    >>> dir(struct)
    ['__doc__', '__name__', 'calcsize', 'error', 'pack', 'unpack']

Note: Because dir() is supplied primarily as a convenience for use at an
interactive prompt, it tries to supply an interesting set of names more than it
tries to supply a rigorously or consistently defined set of names, and its
detailed behavior may change across releases.

=cut

.sub 'dir'
    .param pmc obj :optional
.end

=item divmod(a, b)

Take two (non complex) numbers as arguments and return a pair of numbers
consisting of their quotient and remainder when using long division.
With mixed operand types, the rules for binary arithmetic operators apply.
For plain and long integers, the result is the same as (a // b, a % b).
For floating point numbers the result is (q, a % b), where q is usually
math.floor(a / b) but may be 1 less than that. In any case q * b + a % b
is very close to a, if a % b is non-zero it has the same sign as b, and
0 <= abs(a % b) < abs(b).

Changed in version 2.3: Using divmod() with complex numbers is deprecated.

=cut

.sub 'divmod'
    .param pmc a
    .param pmc b
.end


=item enumerate(iterable)

Return an enumerate object. iterable must be a sequence, an iterator, or
some other object which supports iteration. The next() method of the
iterator returned by enumerate() returns a tuple containing a count
(from zero) and the corresponding value obtained from iterating over
iterable. enumerate() is useful for obtaining an indexed series:
(0, seq[0]), (1, seq[1]), (2, seq[2]), .... New in version 2.3.

=cut

.sub 'enumerate'
    .param pmc iterable
.end


=item eval(expression[, globals[, locals]])

The arguments are a string and optional globals and locals. If provided,
globals must be a dictionary. If provided, locals can be any mapping object.
Changed in version 2.4: formerly locals was required to be a dictionary.

The expression argument is parsed and evaluated as a Python expression
(technically speaking, a condition list) using the globals and locals
dictionaries as global and local name space. If the globals dictionary
is present and lacks '__builtins__', the current globals are copied into
globals before expression is parsed. This means that expression normally
has full access to the standard __builtin__ module and restricted
environments are propagated. If the locals dictionary is omitted it
defaults to the globals dictionary. If both dictionaries are omitted,
the expression is executed in the environment where eval is called.
The return value is the result of the evaluated expression.
Syntax errors are reported as exceptions. Example:

    >>> x = 1
    >>> print eval('x+1')
    2

This function can also be used to execute arbitrary code objects
(such as those created by compile()). In this case pass a code object
instead of a string. The code object must have been compiled passing
'eval' as the kind argument.

Hints: dynamic execution of statements is supported by the exec statement.
Execution of statements from a file is supported by the execfile() function.
The globals() and locals() functions returns the current global and local
dictionary, respectively, which may be useful to pass around for use by
eval() or execfile().

=cut

.sub 'eval'
    .param pmc expr
    .param pmc globals :optional
    .param pmc locals  :optional
.end

=item execfile(filename[, globals[, locals]])

This function is similar to the exec statement, but parses a file instead
of a string. It is different from the import statement in that it does
not use the module administration -- it reads the file unconditionally
and does not create a new module.2.2

The arguments are a file name and two optional dictionaries. The file
is parsed and evaluated as a sequence of Python statements (similarly to a module)
using the globals and locals dictionaries as global and local namespace.
If provided, locals can be any mapping object. Changed in version 2.4:
formerly locals was required to be a dictionary. If the locals dictionary
is omitted it defaults to the globals dictionary. If both dictionaries are
omitted, the expression is executed in the environment where execfile() is
called. The return value is None.

Warning: The default locals act as described for function locals() below:
modifications to the default locals dictionary should not be attempted.
Pass an explicit locals dictionary if you need to see effects of the code
on locals after function execfile() returns. execfile() cannot be used
reliably to modify a function's locals.

=cut

.sub 'execfile'
    .param pmc filename
    .param pmc globals :optional
    .param pmc locals  :optional
.end


=item file(filename[, mode[, bufsize]])

Constructor function for the file type, described further in section 3.9,
``File Objects''. The constructor's arguments are the same as those of
the open() built-in function described below.

When opening a file, it's preferable to use open() instead of invoking this
constructor directly. file is more suited to type testing (for example,
writing "isinstance(f, file)").

New in version 2.2.

=cut

.sub 'file'
    .param pmc filename
    .param pmc mode    :optional
    .param pmc bufsize :optional
.end


=item filter(function, list)

Construct a list from those elements of list for which function returns true.
list may be either a sequence, a container which supports iteration, or an
iterator, If list is a string or a tuple, the result also has that type;
otherwise it is always a list. If function is None, the identity function
is assumed, that is, all elements of list that are false are removed.

Note that filter(function, list) is equivalent to [item for item in list if
function(item)] if function is not None and [item for item in list if item]
if function is None.

=cut

.sub 'filter'
    .param pmc function
    .param pmc list
.end


=item float([x])

Convert a string or a number to floating point. If the argument is a string,
it must contain a possibly signed decimal or floating point number, possibly
embedded in whitespace. Otherwise, the argument may be a plain or long integer
or a floating point number, and a floating point number with the same value
(within Python's floating point precision) is returned. If no argument is
given, returns 0.0.

Note: When passing in a string, values for NaN and Infinity may be returned,
depending on the underlying C library. The specific set of strings accepted
which cause these values to be returned depends entirely on the C library
and is known to vary.

=cut

.sub 'float'
    .param pmc x :optional
.end


=item frozenset([iterable])

Return a frozenset object whose elements are taken from iterable. Frozensets
are sets that have no update methods but can be hashed and used as members of
other sets or as dictionary keys. The elements of a frozenset must be immutable
themselves. To represent sets of sets, the inner sets should also be frozenset
objects. If iterable is not specified, returns a new empty set, frozenset([]).
New in version 2.4.

=cut

.sub 'frozenset'
    .param pmc iterable :optional
.end


=item getattr(object, name[, default])

Return the value of the named attributed of object. name must be a string.
If the string is the name of one of the object's attributes, the result is
the value of that attribute. For example, getattr(x, 'foobar') is equivalent
to x.foobar. If the named attribute does not exist, default is returned if
provided, otherwise AttributeError is raised.

=cut

.sub 'getattr'
    .param pmc obj
    .param pmc name
    .param pmc default :optional
.end

=item globals()

Return a dictionary representing the current global symbol table. This is
always the dictionary of the current module (inside a function or method,
this is the module where it is defined, not the module from which it is called).

=cut

.sub 'globals'

.end

=item hasattr(object, name)

The arguments are an object and a string. The result is True if the string
is the name of one of the object's attributes, False if not.
(This is implemented by calling getattr(object, name) and seeing whether
it raises an exception or not.)

=cut

.sub 'hasattr'
    .param pmc obj
    .param pmc name
.end


=item hash(object)

Return the hash value of the object (if it has one). Hash values are integers.
They are used to quickly compare dictionary keys during a dictionary lookup.
Numeric values that compare equal have the same hash value (even if they are
of different types, as is the case for 1 and 1.0).

=cut

.sub 'hash'
    .param pmc obj
.end



=item help([object])

Invoke the built-in help system. (This function is intended for interactive use.)
If no argument is given, the interactive help system starts on the interpreter
console. If the argument is a string, then the string is looked up as the name
of a module, function, class, method, keyword, or documentation topic, and a
help page is printed on the console. If the argument is any other kind of object,
a help page on the object is generated. New in version 2.2.

=cut

.sub 'help'
    .param pmc obj :optional
.end

=item hex(x)

Convert an integer number (of any size) to a hexadecimal string. The result
is a valid Python expression. Changed in version 2.4: Formerly only returned an
unsigned literal.

=cut

.sub 'hex'
    .param pmc x
.end


=item id(object)

Return the ``identity'' of an object. This is an integer (or long integer)
which is guaranteed to be unique and constant for this object during its
lifetime. Two objects with non-overlapping lifetimes may have the same id()
value. (Implementation note: this is the address of the object.)

=cut

.sub 'id'
    .param pmc obj
.end


=item input([prompt])

Equivalent to eval(raw_input(prompt)). Warning: This function is not safe
from user errors! It expects a valid Python expression as input; if the
input is not syntactically valid, a SyntaxError will be raised. Other
exceptions may be raised if there is an error during evaluation.
(On the other hand, sometimes this is exactly what you need when writing
a quick script for expert use.)

If the readline module was loaded, then input() will use it to provide
elaborate line editing and history features.

Consider using the raw_input() function for general input from users.

=cut

.sub 'input'
    .param pmc prompt :optional
.end


=item int([x[, radix]])

Convert a string or number to a plain integer. If the argument is a
string, it must contain a possibly signed decimal number representable
as a Python integer, possibly embedded in whitespace. The radix parameter
gives the base for the conversion and may be any integer in the range
[2, 36], or zero. If radix is zero, the proper radix is guessed based
on the contents of string; the interpretation is the same as for integer
literals. If radix is specified and x is not a string, TypeError is raised.
Otherwise, the argument may be a plain or long integer or a floating point
number. Conversion of floating point numbers to integers truncates
(towards zero). If the argument is outside the integer range a long object
will be returned instead. If no arguments are given, returns 0.

=cut

.sub 'int'
    .param pmc x :optional
    .param pmc radix :optional
.end


=item isinstance(object, classinfo)

Return true if the object argument is an instance of the classinfo argument,
or of a (direct or indirect) subclass thereof. Also return true if classinfo
is a type object and object is an object of that type. If object is not a class
instance or an object of the given type, the function always returns false.
If classinfo is neither a class object nor a type object, it may be a tuple of
class or type objects, or may recursively contain other such tuples
(other sequence types are not accepted). If classinfo is not a class, type,
or tuple of classes, types, and such tuples, a TypeError exception is raised.
Changed in version 2.2: Support for a tuple of type information was added.

=cut

.sub 'isinstance'
    .param pmc obj
    .param pmc classinfo
.end


=item issubclass(class, classinfo)

Return true if class is a subclass (direct or indirect) of classinfo. A class
is considered a subclass of itself. classinfo may be a tuple of class objects,
in which case every entry in classinfo will be checked. In any other case, a
TypeError exception is raised. Changed in version 2.3: Support for a tuple of
type information was added.

=cut

.sub 'issubclass'
    .param pmc class
    .param pmc classinfo
.end


=item iter(o[, sentinel])

Return an iterator object. The first argument is interpreted very differently
depending on the presence of the second argument. Without a second argument,
o must be a collection object which supports the iteration protocol
(the __iter__() method), or it must support the sequence protocol
(the __getitem__() method with integer arguments starting at 0).
If it does not support either of those protocols, TypeError is raised.
If the second argument, sentinel, is given, then o must be a callable object.
The iterator created in this case will call o with no arguments for each call
to its next() method; if the value returned is equal to sentinel, StopIteration
will be raised, otherwise the value will be returned. New in version 2.2.

=cut

.sub 'iter'
    .param pmc o
    .param pmc sentinel :optional
.end

=item len(s)

Return the length (the number of items) of an object. The argument may be a
sequence (string, tuple or list) or a mapping (dictionary).

=cut

.sub 'len'
    .param pmc s
    $I0 = elements s
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end


=item list([sequence])

Return a list whose items are the same and in the same order as sequence's items.
sequence may be either a sequence, a container that supports iteration, or an
iterator object. If sequence is already a list, a copy is made and returned,
similar to sequence[:]. For instance, list('abc') returns ['a', 'b', 'c'] and
list( (1, 2, 3) ) returns [1, 2, 3]. If no argument is given, returns a new
empty list, [].

=cut

.sub 'list'
    .param pmc sequence :optional
    $P0 = 'listmaker'(sequence :flat)
    .return ($P0)
.end

=item locals()

Update and return a dictionary representing the current local symbol table.
Warning: The contents of this dictionary should not be modified; changes may not
affect the values of local variables used by the interpreter.

=cut

.sub 'locals'
.end

=item long([x[, radix]])

Convert a string or number to a long integer. If the argument is a string,
it must contain a possibly signed number of arbitrary size, possibly embedded
in whitespace. The radix argument is interpreted in the same way as for int(),
and may only be given when x is a string. Otherwise, the argument may be a
plain or long integer or a floating point number, and a long integer with the
same value is returned. Conversion of floating point numbers to integers
truncates (towards zero). If no arguments are given, returns 0L.

=cut

.sub 'long'
    .param pmc x     :optional
    .param pmc radix :optional
.end

=item map(function, list, ...)

Apply function to every item of list and return a list of the results. If
additional list arguments are passed, function must take that many arguments
and is applied to the items of all lists in parallel; if a list is shorter
than another it is assumed to be extended with None items. If function is
None, the identity function is assumed; if there are multiple list arguments,
map() returns a list consisting of tuples containing the corresponding items
from all lists (a kind of transpose operation). The list arguments may be any
kind of sequence; the result is always a list.

=cut

.sub 'map'
    .param pmc function
    .param pmc list
    .param pmc args :slurpy
.end


=item max(s[, args...][key])

With a single argument s, return the largest item of a non-empty sequence
(such as a string, tuple or list). With more than one argument, return the
largest of the arguments.

The optional key argument specifies a one-argument ordering function like
that used for list.sort(). The key argument, if supplied, must be in keyword
form (for example, "max(a,b,c,key=func)"). Changed in version 2.5: Added
support for the optional key argument.

=cut

.sub 'max'
    .param pmc s
    .param pmc args :optional
    .param pmc key :optional
.end


=item min(s[, args...][key])

With a single argument s, return the smallest item of a non-empty sequence
(such as a string, tuple or list). With more than one argument, return the
smallest of the arguments.

The optional key argument specifies a one-argument ordering function like
that used for list.sort(). The key argument, if supplied, must be in keyword
form (for example, "min(a,b,c,key=func)"). Changed in version 2.5: Added
support for the optional key argument.

=cut

.sub 'min'
    .param pmc s
    .param pmc args :optional
    .param pmc key :optional
.end

=item object()

Return a new featureless object. object is a base for all new style classes.
It has the methods that are common to all instances of new style classes.
New in version 2.2.

Changed in version 2.3: This function does not accept any arguments.
Formerly, it accepted arguments but ignored them.

=cut

.sub 'object'
.end

=item oct(x)

Convert an integer number (of any size) to an octal string. The result is a
valid Python expression. Changed in version 2.4: Formerly only returned an
unsigned literal.

=cut

.sub 'oct'
    .param pmc x
.end


=item open(filename[, mode[, bufsize]])

Open a file, returning an object of the file type described in section 3.9,
``File Objects''. If the file cannot be opened, IOError is raised. When
opening a file, it's preferable to use open() instead of invoking the file
constructor directly.

The first two arguments are the same as for stdio's fopen(): filename is the
file name to be opened, and mode is a string indicating how the file is to be opened.

The most commonly-used values of mode are 'r' for reading, 'w' for writing
(truncating the file if it already exists), and 'a' for appending
(which on some Unix systems means that all writes append to the end of the
file regardless of the current seek position). If mode is omitted, it
defaults to 'r'. When opening a binary file, you should append 'b' to the
mode value to open the file in binary mode, which will improve portability.
(Appending 'b' is useful even on systems that don't treat binary and text
files differently, where it serves as documentation.) See below for more
possible values of mode.

The optional bufsize argument specifies the file's desired buffer size: 0
means unbuffered, 1 means line buffered, any other positive value means use
a buffer of (approximately) that size. A negative bufsize means to use the
system default, which is usually line buffered for tty devices and fully
buffered for other files. If omitted, the system default is used.2.3

Modes 'r+', 'w+' and 'a+' open the file for updating (note that 'w+'
truncates the file). Append 'b' to the mode to open the file in binary mode,
on systems that differentiate between binary and text files; on systems that
don't have this distinction, adding the 'b' has no effect.

In addition to the standard fopen() values mode may be 'U' or 'rU'. Python is
usually built with universal newline support; supplying 'U' opens the file as
a text file, but lines may be terminated by any of the following: the
Unix end-of-line convention '\n', the Macintosh convention '\r', or the Windows
convention '\r\n'. All of these external representations are seen as '\n' by
the Python program. If Python is built without universal newline support a mode
with 'U' is the same as normal text mode. Note that file objects so opened also
have an attribute called newlines which has a value of None (if no newlines
have yet been seen), '\n', '\r', '\r\n', or a tuple containing all the newline
types seen.

Python enforces that the mode, after stripping 'U', begins with 'r', 'w' or 'a'.

Changed in version 2.5: Restriction on first letter of mode string introduced.

=cut

.sub 'open'
    .param pmc filename
    .param pmc mode :optional
    .param pmc bufsize :optional
.end

=item ord(c)

Given a string of length one, return an integer representing the Unicode code
point of the character when the argument is a unicode object, or the value of
the byte when the argument is an 8-bit string. For example, ord('a') returns
the integer 97, ord(u'\u2020') returns 8224. This is the inverse of chr() for
8-bit strings and of unichr() for unicode objects. If a unicode argument is
given and Python was built with UCS2 Unicode, then the character's code point
must be in the range [0..65535] inclusive; otherwise the string length is two,
and a TypeError will be raised.

=cut

.sub 'ord'
    .param pmc c
.end


=item pow(x, y[, z])

Return x to the power y; if z is present, return x to the power y, modulo z
(computed more efficiently than pow(x, y) % z). The two-argument form
pow(x, y) is equivalent to using the power operator: x**y.

The arguments must have numeric types. With mixed operand types, the coercion
rules for binary arithmetic operators apply. For int and long int operands,
the result has the same type as the operands (after coercion) unless the
second argument is negative; in that case, all arguments are converted to
float and a float result is delivered. For example, 10**2 returns 100, but
10**-2 returns 0.01. (This last feature was added in Python 2.2.
In Python 2.1 and before, if both arguments were of integer types and the
second argument was negative, an exception was raised.) If the second
argument is negative, the third argument must be omitted. If z is present,
x and y must be of integer types, and y must be non-negative.
(This restriction was added in Python 2.2. In Python 2.1 and before,
floating 3-argument pow() returned platform-dependent results depending on
floating-point rounding accidents.)

=cut

.sub 'pow'
    .param pmc x
    .param pmc y
    .param pmc z :optional
.end



=item property([fget[, fset[, fdel[, doc]]]])

Return a property attribute for new-style classes (classes that derive
from object).

fget is a function for getting an attribute value, likewise fset is a function
for setting, and fdel a function for del'ing, an attribute. Typical use is to
define a managed attribute x:

  class C(object):
    def __init__(self): self.__x = None
    def getx(self): return self._x
    def setx(self, value): self._x = value
    def delx(self): del self._x
    x = property(getx, setx, delx, "I'm the 'x' property.")

If given, doc will be the docstring of the property attribute. Otherwise, the
property will copy fget's docstring (if it exists). This makes it possible to
create read-only properties easily using property() as a decorator:

  class Parrot(object):
    def __init__(self):
        self._voltage = 100000

    @property
    def voltage(self):
        """Get the current voltage."""
        return self._voltage

turns the voltage() method into a ``getter'' for a read-only attribute with
the same name.

New in version 2.2. Changed in version 2.5: Use fget's docstring if no doc given.

=cut

.sub 'property'
    .param pmc fget :optional
    .param pmc fset :optional
    .param pmc fdel :optional
    .param pmc doc :optional
.end


=item range([start,] stop[, step])

This is a versatile function to create lists containing arithmetic
progressions. It is most often used in for loops. The arguments must be plain
integers. If the step argument is omitted, it defaults to 1. If the start
argument is omitted, it defaults to 0. The full form returns a list of plain
integers [start, start + step, start + 2 * step, ...]. If step is positive,
the last element is the largest start + i * step less than stop; if step is
negative, the last element is the smallest start + i * step greater than stop.
step must not be zero (or else ValueError is raised). Example:

    >>> range(10)
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    >>> range(1, 11)
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> range(0, 30, 5)
    [0, 5, 10, 15, 20, 25]
    >>> range(0, 10, 3)
    [0, 3, 6, 9]
    >>> range(0, -10, -1)
    [0, -1, -2, -3, -4, -5, -6, -7, -8, -9]
    >>> range(0)
    []
    >>> range(1, 0)
    []

=cut

.sub 'range'
     .param pmc stop
      # XXX start, step

     .local int stopn
     .local pmc lst
     .local pmc tmp

     $I0 = 0
     lst = new 'ResizablePMCArray'
     stopn = stop
loop:
     unless $I0 < stopn goto done
     tmp = new 'Integer'
     tmp = $I0
     lst.'push'(tmp)

     inc $I0
     goto loop
done:
     .return (lst)
.end


=item raw_input([prompt])

If the prompt argument is present, it is written to standard output without a
trailing newline. The function then reads a line from input, converts it to a
string (stripping a trailing newline), and returns that. When EOF is read,
EOFError is raised. Example:

  >>> s = raw_input('--> ')
  --> Monty Python's Flying Circus
  >>> s
  "Monty Python's Flying Circus"

If the readline module was loaded, then raw_input() will use it to provide
elaborate line editing and history features.

=cut

.sub 'raw_input'
    .param pmc prompt :optional
.end


=item reduce(function, sequence[, initializer])

Apply function of two arguments cumulatively to the items of sequence, from
left to right, so as to reduce the sequence to a single value. For example,
reduce(lambda x, y: x+y, [1, 2, 3, 4, 5]) calculates ((((1+2)+3)+4)+5).
The left argument, x, is the accumulated value and the right argument,
y, is the update value from the sequence. If the optional initializer is
present, it is placed before the items of the sequence in the calculation,
and serves as a default when the sequence is empty. If initializer is not
given and sequence contains only one item, the first item is returned.

=cut

.sub 'reduce'
    .param pmc function
    .param pmc sequence
    .param pmc initializer :optional
.end


=item reload(module)

Reload a previously imported module. The argument must be a module object, so
it must have been successfully imported before. This is useful if you have
edited the module source file using an external editor and want to try out the
new version without leaving the Python interpreter. The return value is the
module object (the same as the module argument).

When reload(module) is executed:

    * Python modules' code is recompiled and the module-level code reexecuted,
    defining a new set of objects which are bound to names in the module's
    dictionary. The init function of extension modules is not called a second time.

    * As with all other objects in Python the old objects are only reclaimed
    after their reference counts drop to zero.

    * The names in the module namespace are updated to point to any
    new or changed objects.

    * Other references to the old objects (such as names external to the module)
    are not rebound to refer to the new objects and must be updated in each
    namespace where they occur if that is desired.

There are a number of other caveats:

If a module is syntactically correct but its initialization fails, the first
import statement for it does not bind its name locally, but does store a
(partially initialized) module object in sys.modules. To reload the module you
must first import it again (this will bind the name to the partially initialized
module object) before you can reload() it.

When a module is reloaded, its dictionary (containing the module's global variables)
is retained. Redefinitions of names will override the old definitions, so this is
generally not a problem. If the new version of a module does not define a name that
was defined by the old version, the old definition remains. This feature can be
used to the module's advantage if it maintains a global table or cache of objects
-- with a try statement it can test for the table's presence and skip its
initialization if desired:

  try:
      cache
  except NameError:
      cache = {}

It is legal though generally not very useful to reload built-in or
dynamically loaded modules, except for sys, __main__ and __builtin__.
In many cases, however, extension modules are not designed to be initialized
more than once, and may fail in arbitrary ways when reloaded.

If a module imports objects from another module using from ... import ...,
calling reload() for the other module does not redefine the objects imported
from it -- one way around this is to re-execute the from statement, another
is to use import and qualified names (module.name) instead.

If a module instantiates instances of a class, reloading the module that
defines the class does not affect the method definitions of the instances
-- they continue to use the old class definition. The same is true for
derived classes.

=cut


.sub 'reload'
    .param pmc module
.end



=item repr(object)

Return a string containing a printable representation of an object. This is
the same value yielded by conversions (reverse quotes). It is sometimes useful
to be able to access this operation as an ordinary function. For many types,
this function makes an attempt to return a string that would yield an object
with the same value when passed to eval().

=cut

.sub 'repr'
    .param pmc obj
.end

=item reversed(seq)

Return a reverse iterator. seq must be an object which supports the sequence
protocol (the __len__() method and the __getitem__() method with integer
arguments starting at 0). New in version 2.4.

=cut

.sub 'reversed'
    .param pmc seq
.end

=item round(x[, n])

Return the floating point value x rounded to n digits after the decimal point.
If n is omitted, it defaults to zero. The result is a floating point number.
Values are rounded to the closest multiple of 10 to the power minus n; if two
multiples are equally close, rounding is done away from 0 (so. for example,
round(0.5) is 1.0 and round(-0.5) is -1.0).

=cut

.sub 'round'
    .param pmc x
    .param pmc n :optional
.end

=item set([iterable])

Return a set whose elements are taken from iterable. The elements must be
immutable. To represent sets of sets, the inner sets should be frozenset
objects. If iterable is not specified, returns a new empty set, set([]).
New in version 2.4.

=cut

.sub 'set'
    .param pmc iterable :optional
.end

=item setattr(object, name, value)

This is the counterpart of getattr(). The arguments are an object, a
string and an arbitrary value. The string may name an existing attribute
or a new attribute. The function assigns the value to the attribute, provided
the object allows it. For example, setattr(x, 'foobar', 123) is
equivalent to x.foobar = 123.

=cut

.sub 'setattr'
    .param pmc obj
    .param pmc name
    .param pmc value
.end

=item slice([start,] stop[, step])

Return a slice object representing the set of indices specified by
range(start, stop, step). The start and step arguments default to None.
Slice objects have read-only data attributes start, stop and step which
merely return the argument values (or their default). They have no other
explicit functionality; however they are used by Numerical Python and
other third party extensions. Slice objects are also generated when
extended indexing syntax is used. For example: "a[start:stop:step]"
or "a[start:stop, i]".

=cut

.sub 'slice'
    .param pmc start #:optional?
    .param pmc stop
    .param pmc step :optional
.end


=item sorted(iterable[, cmp[, key[, reverse]]])

Return a new sorted list from the items in iterable.

The optional arguments cmp, key, and reverse have the same meaning as those
for the list.sort() method (described in section 3.6.4).

cmp specifies a custom comparison function of two arguments (iterable elements)
which should return a negative, zero or positive number depending on whether
the first argument is considered smaller than, equal to, or larger than the
second argument: "cmp=lambda x,y: cmp(x.lower(), y.lower())"

key specifies a function of one argument that is used to extract a comparison
key from each list element: "key=str.lower"

reverse is a boolean value. If set to True, then the list elements are sorted
as if each comparison were reversed.

In general, the key and reverse conversion processes are much faster than
specifying an equivalent cmp function. This is because cmp is called multiple
times for each list element while key and reverse touch each element only once.

New in version 2.4.

=cut

.sub 'sorted'
    .param pmc iterable
    .param pmc cmp :optional
    .param pmc key :optional
    .param pmc reverse :optional
.end


=item staticmethod(function)

Return a static method for function.

A static method does not receive an implicit first argument. To declare a
static method, use this idiom:

    class C:
        @staticmethod
        def f(arg1, arg2, ...): ...

The @staticmethod form is a function decorator - see the description of
function definitions in chapter 7 of the Python Reference Manual for details.

It can be called either on the class (such as C.f()) or on an instance
(such as C().f()). The instance is ignored except for its class.

Static methods in Python are similar to those found in Java or C++.
For a more advanced concept, see classmethod() in this section.

For more information on static methods, consult the documentation on the
standard type hierarchy in chapter 3 of the Python Reference Manual
(at the bottom). New in version 2.2. Changed in version 2.4:
Function decorator syntax added.

=cut

.sub 'staticmethod'
    .param pmc function
.end


=item str([object])

Return a string containing a nicely printable representation of an object.
For strings, this returns the string itself. The difference with
repr(object) is that str(object) does not always attempt to return
a string that is acceptable to eval(); its goal is to return a
printable string. If no argument is given, returns the empty string, ''.

=cut

.sub 'str'
    .param pmc obj :optional
    .param int has_obj :opt_flag
    $P0 = new 'String'
    unless has_obj goto done
    $S0 = obj
    $P0 = $S0
done:
    .return ($P0)
.end

=item sum(sequence[, start])

Sums start and the items of a sequence, from left to right, and returns the
total. start defaults to 0. The sequence's items are normally numbers, and are
not allowed to be strings. The fast, correct way to concatenate sequence of
strings is by calling ''.join(sequence). Note that sum(range(n), m) is
equivalent to reduce(operator.add, range(n), m) New in version 2.3.

=cut

.sub 'sum'
    .param pmc sequence
    .param pmc start :optional
.end

=item super(type[, object-or-type])

Return the superclass of type. If the second argument is omitted the super
object returned is unbound. If the second argument is an object,
isinstance(obj, type) must be true. If the second argument is a type,
issubclass(type2, type) must be true. super() only works for new-style classes.

A typical use for calling a cooperative superclass method is:

    class C(B):
        def meth(self, arg):
            super(C, self).meth(arg)

Note that super is implemented as part of the binding process for explicit
dotted attribute lookups such as "super(C, self).__getitem__(name)".
Accordingly, super is undefined for implicit lookups using statements or
operators such as "super(C, self)[name]". New in version 2.2.

=cut

.sub 'super'
    .param pmc type
    .param pmc obj_or_type :optional
.end


=item tuple([sequence])

Return a tuple whose items are the same and in the same order as sequence's
items. sequence may be a sequence, a container that supports iteration, or
an iterator object. If sequence is already a tuple, it is returned unchanged.
For instance, tuple('abc') returns ('a', 'b', 'c') and tuple([1, 2, 3])
returns (1, 2, 3). If no argument is given, returns a new empty tuple, ().

=cut

.sub 'tuple'
    .param pmc sequence :optional
.end


=item type(object)

Return the type of an object. The return value is a type object.
The isinstance() built-in function is recommended for testing the
type of an object.

With three arguments, type functions as a constructor as detailed below.

=cut

.sub 'type' :multi(pmc)
    .param pmc obj
.end


=item type(name, bases, dict)

Return a new type object. This is essentially a dynamic form of the class
statement. The name string is the class name and becomes the __name__
attribute; the bases tuple itemizes the base classes and becomes the
__bases__ attribute; and the dict dictionary is the namespace containing
definitions for class body and becomes the __dict__ attribute.
For example, the following two statements create identical type objects:

      >>> class X(object):
      ...     a = 1
      ...
      >>> X = type('X', (object,), dict(a=1))

New in version 2.2.

=cut

.sub 'type' :multi(pmc, pmc, pmc)
    .param pmc name
    .param pmc bases
    .param pmc dict
.end


=item unichr(i)

Return the Unicode string of one character whose Unicode code is the integer i.
For example, unichr(97) returns the string u'a'. This is the inverse of ord()
for Unicode strings. The valid range for the argument depends how Python was
configured - it may be either UCS2 [0..0xFFFF] or UCS4 [0..0x10FFFF].
ValueError is raised otherwise. New in version 2.0.

=cut

.sub 'unichr'
    .param int i
.end


=item unicode([object[, encoding [, errors]]])

Return the Unicode string version of object using one of the following modes:

If encoding and/or errors are given, unicode() will decode the object which
can either be an 8-bit string or a character buffer using the codec for encoding.
The encoding parameter is a string giving the name of an encoding; if the encoding
is not known, LookupError is raised. Error handling is done according to errors;
this specifies the treatment of characters which are invalid in the input encoding.
If errors is 'strict' (the default), a ValueError is raised on errors, while a
value of 'ignore' causes errors to be silently ignored, and a value of 'replace'
causes the official Unicode replacement character, U+FFFD, to be used to replace
input characters which cannot be decoded. See also the codecs module.

If no optional parameters are given, unicode() will mimic the behaviour of str()
except that it returns Unicode strings instead of 8-bit strings. More precisely,
if object is a Unicode string or subclass it will return that Unicode string
without any additional decoding applied.

For objects which provide a __unicode__() method, it will call this method
without arguments to create a Unicode string. For all other objects, the
8-bit string version or representation is requested and then converted to
a Unicode string using the codec for the default encoding in 'strict' mode.

New in version 2.0. Changed in version 2.2: Support for __unicode__() added.

=cut

.sub 'unicode'
    .param pmc obj      :optional
    .param pmc encoding :optional
    .param pmc errors   :optional
.end

=item vars([object])

Without arguments, return a dictionary corresponding to the current
local symbol table. With a module, class or class instance object as
argument (or anything else that has a __dict__ attribute), returns a
dictionary corresponding to the object's symbol table. The returned
dictionary should not be modified: the effects on the corresponding
symbol table are undefined.2.4

=cut

.sub 'vars'
    .param pmc obj :optional
.end


=item xrange([start,] stop[, step])

This function is very similar to range(), but returns an ``xrange object''
instead of a list. This is an opaque sequence type which yields the same
values as the corresponding list, without actually storing them all
simultaneously. The advantage of xrange() over range() is minimal
(since xrange() still has to create the values when asked for them)
except when a very large range is used on a memory-starved machine or
when all of the range's elements are never used (such as when the
loop is usually terminated with break).

Note: xrange() is intended to be simple and fast. Implementations
may impose restrictions to achieve this. The C implementation of Python
restricts all arguments to native C longs ("short" Python integers),
and also requires that the number of elements fit in a native C long.

=cut

.sub 'xrange'
    .param pmc start #:optional?
    .param pmc stop
    .param pmc step :optional
.end



=item zip([iterable, ...])

This function returns a list of tuples, where the i-th tuple contains the
i-th element from each of the argument sequences or iterables. The returned
 list is truncated in length to the length of the shortest argument sequence.
 When there are multiple arguments which are all of the same length, zip()
 is similar to map() with an initial argument of None. With a single sequence
 argument, it returns a list of 1-tuples. With no arguments, it returns an
 empty list. New in version 2.0.

Changed in version 2.4: Formerly, zip() required at least one argument
and zip() raised a TypeError instead of returning an empty list.

=cut

.sub 'zip'
    .param pmc iterable :optional
    .param pmc args :slurpy
.end




=back

=head1 AUTHOR

Pynie is authored and maintained by Patrick R. Michaud.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
