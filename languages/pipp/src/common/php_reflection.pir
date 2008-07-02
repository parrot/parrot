# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_reflection.pir - PHP reflection  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed Reflection::export(Reflector r [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'Reflection::export'
    not_implemented()
.end

=item C<array Reflection::getModifierNames(int modifiers)>

Returns an array of modifier names

NOT IMPLEMENTED.

=cut

.sub 'Reflection::getModifierNames'
    not_implemented()
.end

=item C<void ReflectionClass::__construct(mixed argument)>

Constructor. Takes a string or an instance as an argument

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::__construct'
    not_implemented()
.end

=item C<string ReflectionClass::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::__toString'
    not_implemented()
.end

=item C<mixed ReflectionClass::export(mixed argument [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::export'
    not_implemented()
.end

=item C<mixed ReflectionClass::getConstant(string name)>

Returns the class' constant specified by its name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getConstant'
    not_implemented()
.end

=item C<array ReflectionClass::getConstants()>

Returns an associative array containing this class' constants and their values

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getConstants'
    not_implemented()
.end

=item C<ReflectionMethod ReflectionClass::getConstructor()>

Returns the class' constructor if there is one, NULL otherwise

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getConstructor'
    not_implemented()
.end

=item C<array ReflectionClass::getDefaultProperties()>

Returns an associative array containing copies of all default property values of the class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getDefaultProperties'
    not_implemented()
.end

=item C<string ReflectionClass::getDocComment()>

Returns the doc comment for this class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getDocComment'
    not_implemented()
.end

=item C<int ReflectionClass::getEndLine()>

Returns the line this class' declaration ends at

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getEndLine'
    not_implemented()
.end

=item C<ReflectionExtension|NULL ReflectionClass::getExtension()>

Returns NULL or the extension the class belongs to

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getExtension'
    not_implemented()
.end

=item C<string|false ReflectionClass::getExtensionName()>

Returns false or the name of the extension the class belongs to

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getExtensionName'
    not_implemented()
.end

=item C<string ReflectionClass::getFileName()>

Returns the filename of the file this class was declared in

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getFileName'
    not_implemented()
.end

=item C<String[] ReflectionClass::getInterfaceNames()>

Returns an array of names of interfaces this class implements

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getInterfaceNames'
    not_implemented()
.end

=item C<ReflectionClass[] ReflectionClass::getInterfaces()>

Returns an array of interfaces this class implements

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getInterfaces'
    not_implemented()
.end

=item C<ReflectionMethod ReflectionClass::getMethod(string name)>

Returns the class' method specified by its name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getMethod'
    not_implemented()
.end

=item C<ReflectionMethod[] ReflectionClass::getMethods([long $filter])>

Returns an array of this class' methods

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getMethods'
    not_implemented()
.end

=item C<int ReflectionClass::getModifiers()>

Returns a bitfield of the access modifiers for this class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getModifiers'
    not_implemented()
.end

=item C<string ReflectionClass::getName()>

Returns the class' name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getName'
    not_implemented()
.end

=item C<ReflectionClass ReflectionClass::getParentClass()>

Returns the class' parent class, or, if none exists, FALSE

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getParentClass'
    not_implemented()
.end

=item C<ReflectionProperty[] ReflectionClass::getProperties([long $filter])>

Returns an array of this class' properties

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getProperties'
    not_implemented()
.end

=item C<ReflectionProperty ReflectionClass::getProperty(string name)>

Returns the class' property specified by its name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getProperty'
    not_implemented()
.end

=item C<int ReflectionClass::getStartLine()>

Returns the line this class' declaration starts at

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getStartLine'
    not_implemented()
.end

=item C<array ReflectionClass::getStaticProperties()>

Returns an associative array containing all static property values of the class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getStaticProperties'
    not_implemented()
.end

=item C<mixed ReflectionClass::getStaticPropertyValue(string name [, mixed default])>

Returns the value of a static property

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::getStaticPropertyValue'
    not_implemented()
.end

=item C<bool ReflectionClass::hasConstant(string name)>

Returns whether a constant exists or not

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::hasConstant'
    not_implemented()
.end

=item C<bool ReflectionClass::hasMethod(string name)>

Returns whether a method exists or not

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::hasMethod'
    not_implemented()
.end

=item C<bool ReflectionClass::hasProperty(string name)>

Returns whether a property exists or not

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::hasProperty'
    not_implemented()
.end

=item C<bool ReflectionClass::implementsInterface(string|ReflectionClass interface_name)>

Returns whether this class is a subclass of another class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::implementsInterface'
    not_implemented()
.end

=item C<bool ReflectionClass::isAbstract()>

Returns whether this class is abstract

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isAbstract'
    not_implemented()
.end

=item C<bool ReflectionClass::isFinal()>

Returns whether this class is final

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isFinal'
    not_implemented()
.end

=item C<bool ReflectionClass::isInstance(stdclass object)>

Returns whether the given object is an instance of this class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isInstance'
    not_implemented()
.end

=item C<bool ReflectionClass::isInstantiable()>

Returns whether this class is instantiable

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isInstantiable'
    not_implemented()
.end

=item C<bool ReflectionClass::isInterface()>

Returns whether this is an interface or a class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isInterface'
    not_implemented()
.end

=item C<bool ReflectionClass::isInternal()>

Returns whether this class is an internal class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isInternal'
    not_implemented()
.end

=item C<bool ReflectionClass::isIterateable()>

Returns whether this class is iterateable (can be used inside foreach)

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isIterateable'
    not_implemented()
.end

=item C<bool ReflectionClass::isSubclassOf(string|ReflectionClass class)>

Returns whether this class is a subclass of another class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isSubclassOf'
    not_implemented()
.end

=item C<bool ReflectionClass::isUserDefined()>

Returns whether this class is user-defined

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::isUserDefined'
    not_implemented()
.end

=item C<stdclass ReflectionClass::newInstance(mixed* args, ...)>

Returns an instance of this class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::newInstance'
    not_implemented()
.end

=item C<stdclass ReflectionClass::newInstanceArgs([array args])>

Returns an instance of this class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::newInstanceArgs'
    not_implemented()
.end

=item C<void ReflectionClass::setStaticPropertyValue($name, $value)>

Sets the value of a static property

NOT IMPLEMENTED.

=cut

.sub 'ReflectionClass::setStaticPropertyValue'
    not_implemented()
.end

=item C<void ReflectionExtension::__construct(string name)>

Constructor. Throws an Exception in case the given extension does not exist

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::__construct'
    not_implemented()
.end

=item C<string ReflectionExtension::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::__toString'
    not_implemented()
.end

=item C<mixed ReflectionExtension::export(string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::export'
    not_implemented()
.end

=item C<array ReflectionExtension::getClassNames()>

Returns an array containing all names of all classes of this extension

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getClassNames'
    not_implemented()
.end

=item C<ReflectionClass[] ReflectionExtension::getClasses()>

Returns an array containing ReflectionClass objects for all classes of this extension

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getClasses'
    not_implemented()
.end

=item C<array ReflectionExtension::getConstants()>

Returns an associative array containing this extension's constants and their values

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getConstants'
    not_implemented()
.end

=item C<array ReflectionExtension::getDependencies()>

Returns an array containing all names of all extensions this extension depends on

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getDependencies'
    not_implemented()
.end

=item C<ReflectionFunction[] ReflectionExtension::getFunctions()>

Returns an array of this extension's fuctions

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getFunctions'
    not_implemented()
.end

=item C<array ReflectionExtension::getINIEntries()>

Returns an associative array containing this extension's INI entries and their values

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getINIEntries'
    not_implemented()
.end

=item C<string ReflectionExtension::getName()>

Returns this extension's name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getName'
    not_implemented()
.end

=item C<string ReflectionExtension::getVersion()>

Returns this extension's version

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::getVersion'
    not_implemented()
.end

=item C<void ReflectionExtension::info()>

Prints phpinfo block for the extension

NOT IMPLEMENTED.

=cut

.sub 'ReflectionExtension::info'
    not_implemented()
.end

=item C<void ReflectionFunction::__construct(string name)>

Constructor. Throws an Exception in case the given function does not exist

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::__construct'
    not_implemented()
.end

=item C<string ReflectionFunction::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::__toString'
    not_implemented()
.end

=item C<mixed ReflectionFunction::export(string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::export'
    not_implemented()
.end

=item C<string ReflectionFunction::getDocComment()>

Returns the doc comment for this function

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getDocComment'
    not_implemented()
.end

=item C<int ReflectionFunction::getEndLine()>

Returns the line this function's declaration ends at

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getEndLine'
    not_implemented()
.end

=item C<ReflectionExtension|NULL ReflectionFunction::getExtension()>

Returns NULL or the extension the function belongs to

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getExtension'
    not_implemented()
.end

=item C<string|false ReflectionFunction::getExtensionName()>

Returns false or the name of the extension the function belongs to

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getExtensionName'
    not_implemented()
.end

=item C<string ReflectionFunction::getFileName()>

Returns the filename of the file this function was declared in

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getFileName'
    not_implemented()
.end

=item C<string ReflectionFunction::getName()>

Returns this function's name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getName'
    not_implemented()
.end

=item C<bool ReflectionFunction::getNumberOfParameters()>

Gets the number of required parameters

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getNumberOfParameters'
    not_implemented()
.end

=item C<bool ReflectionFunction::getNumberOfRequiredParameters()>

Gets the number of required parameters

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getNumberOfRequiredParameters'
    not_implemented()
.end

=item C<ReflectionParameter[] ReflectionFunction::getParameters()>

Returns an array of parameter objects for this function

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getParameters'
    not_implemented()
.end

=item C<int ReflectionFunction::getStartLine()>

Returns the line this function's declaration starts at

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getStartLine'
    not_implemented()
.end

=item C<array ReflectionFunction::getStaticVariables()>

Returns an associative array containing this function's static variables and their values

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::getStaticVariables'
    not_implemented()
.end

=item C<mixed ReflectionFunction::invoke(mixed* args)>

Invokes the function

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::invoke'
    not_implemented()
.end

=item C<mixed ReflectionFunction::invokeArgs(array args)>

Invokes the function and pass its arguments as array.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::invokeArgs'
    not_implemented()
.end

=item C<bool ReflectionFunction::isDeprecated()>

Returns whether this function is deprecated

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::isDeprecated'
    not_implemented()
.end

=item C<bool ReflectionFunction::isDisabled()>

Returns whether this function has been disabled or not

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::isDisabled'
    not_implemented()
.end

=item C<bool ReflectionFunction::isInternal()>

Returns whether this is an internal function

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::isInternal'
    not_implemented()
.end

=item C<bool ReflectionFunction::isUserDefined()>

Returns whether this is an user-defined function

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::isUserDefined'
    not_implemented()
.end

=item C<bool ReflectionFunction::returnsReference()>

Gets whether this function returns a reference

NOT IMPLEMENTED.

=cut

.sub 'ReflectionFunction::returnsReference'
    not_implemented()
.end

=item C<void ReflectionMethod::__construct(mixed class_or_method [, string name])>

Constructor. Throws an Exception in case the given method does not exist

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::__construct'
    not_implemented()
.end

=item C<string ReflectionMethod::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::__toString'
    not_implemented()
.end

=item C<mixed ReflectionMethod::export(mixed class, string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::export'
    not_implemented()
.end

=item C<ReflectionClass ReflectionMethod::getDeclaringClass()>

Get the declaring class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::getDeclaringClass'
    not_implemented()
.end

=item C<int ReflectionMethod::getModifiers()>

Returns a bitfield of the access modifiers for this method

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::getModifiers'
    not_implemented()
.end

=item C<ReflectionClass ReflectionMethod::getPrototype()>

Get the prototype

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::getPrototype'
    not_implemented()
.end

=item C<mixed ReflectionMethod::invoke(mixed object, mixed* args)>

Invokes the method.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::invoke'
    not_implemented()
.end

=item C<mixed ReflectionMethod::invokeArgs(mixed object, array args)>

Invokes the function and pass its arguments as array.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::invokeArgs'
    not_implemented()
.end

=item C<bool ReflectionMethod::isAbstract()>

Returns whether this method is abstract

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isAbstract'
    not_implemented()
.end

=item C<bool ReflectionMethod::isConstructor()>

Returns whether this method is the constructor

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isConstructor'
    not_implemented()
.end

=item C<bool ReflectionMethod::isDestructor()>

Returns whether this method is static

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isDestructor'
    not_implemented()
.end

=item C<bool ReflectionMethod::isFinal()>

Returns whether this method is final

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isFinal'
    not_implemented()
.end

=item C<bool ReflectionMethod::isPrivate()>

Returns whether this method is private

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isPrivate'
    not_implemented()
.end

=item C<bool ReflectionMethod::isProtected()>

Returns whether this method is protected

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isProtected'
    not_implemented()
.end

=item C<bool ReflectionMethod::isPublic()>

Returns whether this method is public

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isPublic'
    not_implemented()
.end

=item C<bool ReflectionMethod::isStatic()>

Returns whether this method is static

NOT IMPLEMENTED.

=cut

.sub 'ReflectionMethod::isStatic'
    not_implemented()
.end

=item C<void ReflectionObject::__construct(mixed argument)>

Constructor. Takes an instance as an argument

NOT IMPLEMENTED.

=cut

.sub 'ReflectionObject::__construct'
    not_implemented()
.end

=item C<mixed ReflectionObject::export(mixed argument [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionObject::export'
    not_implemented()
.end

=item C<void ReflectionParameter::__construct(mixed function, mixed parameter)>

Constructor. Throws an Exception in case the given method does not exist

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::__construct'
    not_implemented()
.end

=item C<string ReflectionParameter::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::__toString'
    not_implemented()
.end

=item C<bool ReflectionParameter::allowsNull()>

Returns whether NULL is allowed as this parameters's value

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::allowsNull'
    not_implemented()
.end

=item C<mixed ReflectionParameter::export(mixed function, mixed parameter [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::export'
    not_implemented()
.end

=item C<ReflectionClass|NULL ReflectionParameter::getClass()>

Returns this parameters's class hint or NULL if there is none

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getClass'
    not_implemented()
.end

=item C<ReflectionClass|NULL ReflectionParameter::getDeclaringClass()>

Returns in which class this parameter is defined (not the typehint of the parameter)

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getDeclaringClass'
    not_implemented()
.end

=item C<ReflectionFunction ReflectionParameter::getDeclaringFunction()>

Returns the ReflectionFunction for the function of this parameter

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getDeclaringFunction'
    not_implemented()
.end

=item C<bool ReflectionParameter::getDefaultValue()>

Returns the default value of this parameter or throws an exception

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getDefaultValue'
    not_implemented()
.end

=item C<string ReflectionParameter::getName()>

Returns this parameters's name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getName'
    not_implemented()
.end

=item C<bool ReflectionParameter::getPosition()>

Returns whether this parameter is an optional parameter

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::getPosition'
    not_implemented()
.end

=item C<bool ReflectionParameter::isArray()>

Returns whether parameter MUST be an array

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::isArray'
    not_implemented()
.end

=item C<bool ReflectionParameter::isDefaultValueAvailable()>

Returns whether the default value of this parameter is available

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::isDefaultValueAvailable'
    not_implemented()
.end

=item C<bool ReflectionParameter::isOptional()>

Returns whether this parameter is an optional parameter

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::isOptional'
    not_implemented()
.end

=item C<bool ReflectionParameter::isPassedByReference()>

Returns whether this parameters is passed to by reference

NOT IMPLEMENTED.

=cut

.sub 'ReflectionParameter::isPassedByReference'
    not_implemented()
.end

=item C<void ReflectionProperty::__construct(mixed class, string name)>

Constructor. Throws an Exception in case the given property does not exist

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::__construct'
    not_implemented()
.end

=item C<string ReflectionProperty::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::__toString'
    not_implemented()
.end

=item C<mixed ReflectionProperty::export(mixed class, string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::export'
    not_implemented()
.end

=item C<ReflectionClass ReflectionProperty::getDeclaringClass()>

Get the declaring class

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::getDeclaringClass'
    not_implemented()
.end

=item C<string ReflectionProperty::getDocComment()>

Returns the doc comment for this property

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::getDocComment'
    not_implemented()
.end

=item C<int ReflectionProperty::getModifiers()>

Returns a bitfield of the access modifiers for this property

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::getModifiers'
    not_implemented()
.end

=item C<string ReflectionProperty::getName()>

Returns the class' name

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::getName'
    not_implemented()
.end

=item C<mixed ReflectionProperty::getValue([stdclass object])>

Returns this property's value

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::getValue'
    not_implemented()
.end

=item C<bool ReflectionProperty::isDefault()>

Returns whether this property is default (declared at compilation time).

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::isDefault'
    not_implemented()
.end

=item C<bool ReflectionProperty::isPrivate()>

Returns whether this property is private

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::isPrivate'
    not_implemented()
.end

=item C<bool ReflectionProperty::isProtected()>

Returns whether this property is protected

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::isProtected'
    not_implemented()
.end

=item C<bool ReflectionProperty::isPublic()>

Returns whether this property is public

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::isPublic'
    not_implemented()
.end

=item C<bool ReflectionProperty::isStatic()>

Returns whether this property is static

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::isStatic'
    not_implemented()
.end

=item C<void ReflectionProperty::setValue([stdclass object,] mixed value)>

Sets this property's value

NOT IMPLEMENTED.

=cut

.sub 'ReflectionProperty::setValue'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
