# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_builtin.pir - PHP builtin Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'

=item C<bool class_exists(string classname [, bool autoload])>

Checks if the class exists

NOT IMPLEMENTED.

=cut

.sub 'class_exists'
    not_implemented()
.end

=item C<string create_function(string args, string code)>

Creates an anonymous function, and returns its name (funny, eh?)

NOT IMPLEMENTED.

=cut

.sub 'create_function'
    not_implemented()
.end

=item C<array debug_backtrace([bool provide_object])>

Return backtrace as array

NOT IMPLEMENTED.

=cut

.sub 'debug_backtrace'
    not_implemented()
.end

=item C<void debug_print_backtrace(void)>



NOT IMPLEMENTED.

=cut

.sub 'debug_print_backtrace'
    not_implemented()
.end

=item C<bool define(string constant_name, mixed value, boolean case_sensitive=true)>

Define a new constant

STILL INCOMPLETE.

=cut

.sub 'define'
    .param pmc args :slurpy

    .local int argc
    argc = args
    .local int case_sensitive
    case_sensitive = 1 # not used
    unless argc == 2 goto L1
    $P1 = shift args
    $P2 = shift args
    goto L2
  L1:
    unless argc == 3 goto L3
    $P1 = shift args
    $P2 = shift args
    $P3 = shift args
    case_sensitive = $P3
    goto L2
  L3:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $I0 = isa $P2, 'PhpInteger'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpFloat'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpString'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpBoolean'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpResource'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpNull'
    if $I0 goto L4
    $I0 = isa $P2, 'PhpObject'
    unless $I0 goto L5
    #
  L5:
    error(E_WARNING,"Constants may only evaluate to scalar values")
    .RETURN_FALSE()
  L4:
    .local string name
    name = $P1
    .local pmc val
    val = get_hll_global name
    unless null val goto L6        # don't overwrite an existing value
    set_hll_global name, $P2
    .RETURN_TRUE()
  L6:
    .RETURN_FALSE()
.end

=item C<bool defined(string constant_name)>

Check whether a constant exists

=cut

.sub 'defined'
    .param pmc args :slurpy

    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    .local string name
    name = $P1
    .local pmc val
    val = get_hll_global name
    $I0 = isnull val    # check the nullness and invert it
    $I0 = $I0 - 1
    $I0 = neg $I0

    .RETURN_BOOL($I0)
.end


=item C<array each(array arr)>

Return the currently pointed key..value pair in the passed array, and advance the pointer to the next element

NOT IMPLEMENTED.

=cut

.sub 'each'
    not_implemented()
.end

=item C<int error_reporting(int new_error_level=null)>

Return the current error_reporting level, and if an argument was passed - change to the new level

DUMMY IMPLEMENTATION.

=cut

.sub 'error_reporting'
    .param pmc level       :optional
    .param int has_level   :opt_flag

    unless has_level goto L1
       set_hll_global 'php_errorreporting', level
    L1:
    get_hll_global $P0, 'php_errorreporting'

    .return($P0)
.end

=item C<bool extension_loaded(string extension_name)>

Returns true if the named extension is loaded.
As currently no extensions are supported, this function always returns false.

=cut

.sub 'extension_loaded'
    .RETURN_BOOL(0)
.end

=item C<mixed func_get_arg(int arg_num)>

Get the $arg_num'th argument that was passed to the function

NOT IMPLEMENTED.

=cut

.sub 'func_get_arg'
    not_implemented()
.end

=item C<array func_get_args()>

Get an array of the arguments that were passed to the function

NOT IMPLEMENTED.

=cut

.sub 'func_get_args'
    not_implemented()
.end

=item C<int func_num_args(void)>

Get the number of arguments that were passed to the function

NOT IMPLEMENTED.

=cut

.sub 'func_num_args'
    not_implemented()
.end

=item C<bool function_exists(string function_name)>

Checks if the function exists

NOT IMPLEMENTED.

=cut

.sub 'function_exists'
    not_implemented()
.end

=item C<string get_class([object object])>

Retrieves the class name

NOT IMPLEMENTED.

=cut

.sub 'get_class'
    not_implemented()
.end

=item C<array get_class_methods(mixed class)>

Returns an array of method names for class or class instance.

NOT IMPLEMENTED.

=cut

.sub 'get_class_methods'
    not_implemented()
.end

=item C<array get_class_vars(string class_name)>

Returns an array of default properties of the class.

NOT IMPLEMENTED.

=cut

.sub 'get_class_vars'
    not_implemented()
.end

=item C<array get_declared_classes()>

Returns an array of all declared classes.

NOT IMPLEMENTED.

=cut

.sub 'get_declared_classes'
    not_implemented()
.end

=item C<array get_declared_interfaces()>

Returns an array of all declared interfaces.

NOT IMPLEMENTED.

=cut

.sub 'get_declared_interfaces'
    not_implemented()
.end

=item C<array get_defined_constants([mixed categorize])>

Return an array containing the names and values of all defined constants

NOT IMPLEMENTED.

=cut

.sub 'get_defined_constants'
    not_implemented()
.end

=item C<array get_defined_functions(void)>

Returns an array of all defined functions

NOT IMPLEMENTED.

=cut

.sub 'get_defined_functions'
    not_implemented()
.end

=item C<array get_defined_vars(void)>

Returns an associative array of names and values of all currently defined variable names (variables in the current scope)

NOT IMPLEMENTED.

=cut

.sub 'get_defined_vars'
    not_implemented()
.end

=item C<array get_extension_funcs(string extension_name)>

Returns an array with the names of functions belonging to the named extension

NOT IMPLEMENTED.

=cut

.sub 'get_extension_funcs'
    not_implemented()
.end

=item C<array get_included_files(void)>

Returns an array with the file names that were include_once()'d

NOT IMPLEMENTED.

=cut

.sub 'get_included_files'
    not_implemented()
.end

=item C<array get_loaded_extensions([bool zend_extensions])>

Return an array containing names of loaded extensions

NOT IMPLEMENTED.

=cut

.sub 'get_loaded_extensions'
    not_implemented()
.end

=item C<array get_object_vars(object obj)>

Returns an array of object properties

NOT IMPLEMENTED.

=cut

.sub 'get_object_vars'
    not_implemented()
.end

=item C<string get_parent_class([mixed object])>

Retrieves the parent class name for object or class or current scope.

NOT IMPLEMENTED.

=cut

.sub 'get_parent_class'
    not_implemented()
.end

=item C<string get_resource_type(resource res)>

Get the resource type name for a given resource

=cut

.sub 'get_resource_type'
    .param pmc args :slurpy

    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = isa $P1, 'PhpResource'
    if $I0 goto L2
    error(E_WARNING, "Supplied argument is not a valid resource handle")
    .RETURN_FALSE()
  L2:
    $P0 = deref $P1
    $S0 = typeof $P0
    .RETURN_STRING($S0)
.end

=item C<bool interface_exists(string classname [, bool autoload])>

Checks if the class exists

NOT IMPLEMENTED.

=cut

.sub 'interface_exists'
    not_implemented()
.end

=item C<bool is_a(object object, string class_name)>

Returns true if the object is of this class or has this class as one of its parents

NOT IMPLEMENTED.

=cut

.sub 'is_a'
    not_implemented()
.end

=item C<bool is_subclass_of(object object, string class_name)>

Returns true if the object has this class as one of its parents

NOT IMPLEMENTED.

=cut

.sub 'is_subclass_of'
    not_implemented()
.end

=item C<void leak(int num_bytes=3)>

Cause an intentional memory leak, for testing/debugging purposes

NOT IMPLEMENTED.

=cut

.sub 'leak'
    not_implemented()
.end

=item C<bool method_exists(object object, string method)>

Checks if the class method exists

NOT IMPLEMENTED.

=cut

.sub 'method_exists'
    not_implemented()
.end

=item C<bool property_exists(mixed object_or_class, string property_name)>

Checks if the object or class has a property

NOT IMPLEMENTED.

=cut

.sub 'property_exists'
    not_implemented()
.end

=item C<void restore_error_handler(void)>

Restores the previously defined error handler function

NOT IMPLEMENTED.

=cut

.sub 'restore_error_handler'
    not_implemented()
.end

=item C<void restore_exception_handler(void)>

Restores the previously defined exception handler function

NOT IMPLEMENTED.

=cut

.sub 'restore_exception_handler'
    not_implemented()
.end

=item C<string set_error_handler(string error_handler [, int error_types])>

Sets a user-defined error handler function.  Returns the previously defined error handler, or false on error

NOT IMPLEMENTED.

=cut

.sub 'set_error_handler'
    not_implemented()
.end

=item C<string set_exception_handler(callable exception_handler)>

Sets a user-defined exception handler function.  Returns the previously defined exception handler, or false on error

NOT IMPLEMENTED.

=cut

.sub 'set_exception_handler'
    not_implemented()
.end

=item C<int strcasecmp(string str1, string str2)>

Binary safe case-insensitive string comparison

NOT IMPLEMENTED.

=cut

.sub 'strcasecmp'
    not_implemented()
.end

=item C<int strcmp(string str1, string str2)>

Binary safe string comparison

=cut

.sub 'strcmp'
    .param pmc args :slurpy

    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    $P2 = shift args
    $S2 = $P2
    $I0 = cmp $S1, $S2
    .RETURN_LONG($I0)
.end

=item C<int strlen(string str)>

Get string length

=cut

.sub 'strlen'
    .param pmc args :slurpy

    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S0 = $P1
    $I0 = length $S0
    .RETURN_LONG($I0)
.end

=item C<int strncasecmp(string str1, string str2, int len)>

Binary safe string comparison

NOT IMPLEMENTED.

=cut

.sub 'strncasecmp'
    not_implemented()
.end

=item C<int strncmp(string str1, string str2, int len)>

Binary safe string comparison

NOT IMPLEMENTED.

=cut

.sub 'strncmp'
    not_implemented()
.end

=item C<void trigger_error(string messsage [, int error_type])>

Generates a user-level error/warning/notice message

NOT IMPLEMENTED.

=cut

.sub 'trigger_error'
    not_implemented()
.end

=item C<string zend_version(void)>

Get the version of the Zend Engine

NOT IMPLEMENTED.

=cut

.sub 'zend_version'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
