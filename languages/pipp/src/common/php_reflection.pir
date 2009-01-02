# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_reflection.pir - PHP reflection  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.HLL 'Pipp'

.sub 'onload' :anon :init :load
    .local pmc p6meta, reflectionclass_proto
    p6meta = get_hll_global ['PippObject'], '$!P6META'
    reflectionclass_proto = p6meta.'new_class'('ReflectionClass')      #, 'parent'=>'Boolean Any')
    p6meta.'register'('ReflectionClass', 'parent'=>reflectionclass_proto, 'protoobject'=>reflectionclass_proto)
.end





=item C<mixed Reflection::export(Reflector r [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['Reflection']
.sub 'export'
    not_implemented()
.end

=item C<array Reflection::getModifierNames(int modifiers)>

Returns an array of modifier names

NOT IMPLEMENTED.

=cut

.namespace['Reflection']
.sub 'getModifierNames'
    not_implemented()
.end

=item C<void ReflectionClass::__construct(mixed argument)>

Constructor. Takes a string or an instance as an argument

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub '__construct' :method
    .param pmc name
.end

=item C<string ReflectionClass::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub '__toString' :method
    not_implemented()
.end

=item C<mixed ReflectionClass::export(mixed argument [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'export' :method
    not_implemented()
.end

=item C<mixed ReflectionClass::getConstant(string name)>

Returns the class' constant specified by its name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getConstant' :method
    not_implemented()
.end

=item C<array ReflectionClass::getConstants()>

Returns an associative array containing this class' constants and their values

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getConstants' :method
    not_implemented()
.end

=item C<ReflectionMethod ReflectionClass::getConstructor()>

Returns the class' constructor if there is one, NULL otherwise

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getConstructor' :method
    not_implemented()
.end

=item C<array ReflectionClass::getDefaultProperties()>

Returns an associative array containing copies of all default property values of the class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getDefaultProperties' :method
    not_implemented()
.end

=item C<string ReflectionClass::getDocComment()>

Returns the doc comment for this class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getDocComment' :method
    not_implemented()
.end

=item C<int ReflectionClass::getEndLine()>

Returns the line this class' declaration ends at

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getEndLine' :method
    not_implemented()
.end

=item C<ReflectionExtension|NULL ReflectionClass::getExtension()>

Returns NULL or the extension the class belongs to

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getExtension' :method
    not_implemented()
.end

=item C<string|false ReflectionClass::getExtensionName()>

Returns false or the name of the extension the class belongs to

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getExtensionName' :method
    not_implemented()
.end

=item C<string ReflectionClass::getFileName()>

Returns the filename of the file this class was declared in

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getFileName' :method
    not_implemented()
.end

=item C<String[] ReflectionClass::getInterfaceNames()>

Returns an array of names of interfaces this class implements

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getInterfaceNames' :method
    not_implemented()
.end

=item C<ReflectionClass[] ReflectionClass::getInterfaces()>

Returns an array of interfaces this class implements

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getInterfaces' :method
    not_implemented()
.end

=item C<ReflectionMethod ReflectionClass::getMethod(string name)>

Returns the class' method specified by its name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getMethod' :method
    not_implemented()
.end

=item C<ReflectionMethod[] ReflectionClass::getMethods([long $filter])>

Returns an array of this class' methods

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getMethods' :method
    not_implemented()
.end

=item C<int ReflectionClass::getModifiers()>

Returns a bitfield of the access modifiers for this class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getModifiers' :method
    not_implemented()
.end

=item C<string ReflectionClass::getName()>

Returns the class' name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getName' :method
    .return ('Foo')
.end

=item C<ReflectionClass ReflectionClass::getParentClass()>

Returns the class' parent class, or, if none exists, FALSE

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getParentClass' :method
    not_implemented()
.end

=item C<ReflectionProperty[] ReflectionClass::getProperties([long $filter])>

Returns an array of this class' properties

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getProperties' :method
    not_implemented()
.end

=item C<ReflectionProperty ReflectionClass::getProperty(string name)>

Returns the class' property specified by its name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getProperty' :method
    not_implemented()
.end

=item C<int ReflectionClass::getStartLine()>

Returns the line this class' declaration starts at

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getStartLine' :method
    not_implemented()
.end

=item C<array ReflectionClass::getStaticProperties()>

Returns an associative array containing all static property values of the class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getStaticProperties' :method
    not_implemented()
.end

=item C<mixed ReflectionClass::getStaticPropertyValue(string name [, mixed default])>

Returns the value of a static property

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'getStaticPropertyValue' :method
    not_implemented()
.end

=item C<bool ReflectionClass::hasConstant(string name)>

Returns whether a constant exists or not

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'hasConstant' :method
    not_implemented()
.end

=item C<bool ReflectionClass::hasMethod(string name)>

Returns whether a method exists or not

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'hasMethod' :method
    not_implemented()
.end

=item C<bool ReflectionClass::hasProperty(string name)>

Returns whether a property exists or not

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'hasProperty' :method
    not_implemented()
.end

=item C<bool ReflectionClass::implementsInterface(string|ReflectionClass interface_name)>

Returns whether this class is a subclass of another class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'implementsInterface' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isAbstract()>

Returns whether this class is abstract

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isAbstract' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isFinal()>

Returns whether this class is final

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isFinal' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isInstance(stdclass object)>

Returns whether the given object is an instance of this class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isInstance' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isInstantiable()>

Returns whether this class is instantiable

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isInstantiable' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isInterface()>

Returns whether this is an interface or a class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isInterface' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isInternal()>

Returns whether this class is an internal class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isInternal' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isIterateable()>

Returns whether this class is iterateable (can be used inside foreach)

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isIterateable' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isSubclassOf(string|ReflectionClass class)>

Returns whether this class is a subclass of another class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isSubclassOf' :method
    not_implemented()
.end

=item C<bool ReflectionClass::isUserDefined()>

Returns whether this class is user-defined

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'isUserDefined' :method
    not_implemented()
.end

=item C<stdclass ReflectionClass::newInstance(mixed* args, ...)>

Returns an instance of this class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'newInstance' :method
    not_implemented()
.end

=item C<stdclass ReflectionClass::newInstanceArgs([array args])>

Returns an instance of this class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'newInstanceArgs' :method
    not_implemented()
.end

=item C<void ReflectionClass::setStaticPropertyValue($name, $value)>

Sets the value of a static property

NOT IMPLEMENTED.

=cut

.namespace['ReflectionClass']
.sub 'setStaticPropertyValue' :method
    not_implemented()
.end

=item C<void ReflectionExtension::__construct(string name)>

Constructor. Throws an Exception in case the given extension does not exist

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub '__construct' :method
    not_implemented()
.end

=item C<string ReflectionExtension::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub '__toString' :method
    not_implemented()
.end

=item C<mixed ReflectionExtension::export(string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'export' :method
    not_implemented()
.end

=item C<array ReflectionExtension::getClassNames()>

Returns an array containing all names of all classes of this extension

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getClassNames' :method
    not_implemented()
.end

=item C<ReflectionClass[] ReflectionExtension::getClasses()>

Returns an array containing ReflectionClass objects for all classes of this extension

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getClasses' :method
    not_implemented()
.end

=item C<array ReflectionExtension::getConstants()>

Returns an associative array containing this extension's constants and their values

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getConstants' :method
    not_implemented()
.end

=item C<array ReflectionExtension::getDependencies()>

Returns an array containing all names of all extensions this extension depends on

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getDependencies' :method
    not_implemented()
.end

=item C<ReflectionFunction[] ReflectionExtension::getFunctions()>

Returns an array of this extension's fuctions

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getFunctions' :method
    not_implemented()
.end

=item C<array ReflectionExtension::getINIEntries()>

Returns an associative array containing this extension's INI entries and their values

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getINIEntries' :method
    not_implemented()
.end

=item C<string ReflectionExtension::getName()>

Returns this extension's name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getName' :method
    not_implemented()
.end

=item C<string ReflectionExtension::getVersion()>

Returns this extension's version

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'getVersion' :method
    not_implemented()
.end

=item C<void ReflectionExtension::info()>

Prints phpinfo block for the extension

NOT IMPLEMENTED.

=cut

.namespace['ReflectionExtension']
.sub 'info' :method
    not_implemented()
.end

=item C<void ReflectionFunction::__construct(string name)>

Constructor. Throws an Exception in case the given function does not exist

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub '__construct' :method
    not_implemented()
.end

=item C<string ReflectionFunction::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub '__toString' :method
    not_implemented()
.end

=item C<mixed ReflectionFunction::export(string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'export' :method
    not_implemented()
.end

=item C<string ReflectionFunction::getDocComment()>

Returns the doc comment for this function

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getDocComment' :method
    not_implemented()
.end

=item C<int ReflectionFunction::getEndLine()>

Returns the line this function's declaration ends at

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getEndLine' :method
    not_implemented()
.end

=item C<ReflectionExtension|NULL ReflectionFunction::getExtension()>

Returns NULL or the extension the function belongs to

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getExtension' :method
    not_implemented()
.end

=item C<string|false ReflectionFunction::getExtensionName()>

Returns false or the name of the extension the function belongs to

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getExtensionName' :method
    not_implemented()
.end

=item C<string ReflectionFunction::getFileName()>

Returns the filename of the file this function was declared in

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getFileName' :method
    not_implemented()
.end

=item C<string ReflectionFunction::getName()>

Returns this function's name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getName' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::getNumberOfParameters()>

Gets the number of required parameters

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getNumberOfParameters' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::getNumberOfRequiredParameters()>

Gets the number of required parameters

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getNumberOfRequiredParameters' :method
    not_implemented()
.end

=item C<ReflectionParameter[] ReflectionFunction::getParameters()>

Returns an array of parameter objects for this function

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getParameters' :method
    not_implemented()
.end

=item C<int ReflectionFunction::getStartLine()>

Returns the line this function's declaration starts at

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getStartLine' :method
    not_implemented()
.end

=item C<array ReflectionFunction::getStaticVariables()>

Returns an associative array containing this function's static variables and their values

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'getStaticVariables' :method
    not_implemented()
.end

=item C<mixed ReflectionFunction::invoke(mixed* args)>

Invokes the function

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'invoke' :method
    not_implemented()
.end

=item C<mixed ReflectionFunction::invokeArgs(array args)>

Invokes the function and pass its arguments as array.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'invokeArgs' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::isDeprecated()>

Returns whether this function is deprecated

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'isDeprecated' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::isDisabled()>

Returns whether this function has been disabled or not

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'isDisabled' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::isInternal()>

Returns whether this is an internal function

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'isInternal' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::isUserDefined()>

Returns whether this is an user-defined function

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'isUserDefined' :method
    not_implemented()
.end

=item C<bool ReflectionFunction::returnsReference()>

Gets whether this function returns a reference

NOT IMPLEMENTED.

=cut

.namespace['ReflectionFunction']
.sub 'returnsReference' :method
    not_implemented()
.end

=item C<void ReflectionMethod::__construct(mixed class_or_method [, string name])>

Constructor. Throws an Exception in case the given method does not exist

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub '__construct' :method
    not_implemented()
.end

=item C<string ReflectionMethod::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub '__toString' :method
    not_implemented()
.end

=item C<mixed ReflectionMethod::export(mixed class, string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'export' :method
    not_implemented()
.end

=item C<ReflectionClass ReflectionMethod::getDeclaringClass()>

Get the declaring class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'getDeclaringClass' :method
    not_implemented()
.end

=item C<int ReflectionMethod::getModifiers()>

Returns a bitfield of the access modifiers for this method

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'getModifiers' :method
    not_implemented()
.end

=item C<ReflectionClass ReflectionMethod::getPrototype()>

Get the prototype

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'getPrototype' :method
    not_implemented()
.end

=item C<mixed ReflectionMethod::invoke(mixed object, mixed* args)>

Invokes the method.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'invoke' :method
    not_implemented()
.end

=item C<mixed ReflectionMethod::invokeArgs(mixed object, array args)>

Invokes the function and pass its arguments as array.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'invokeArgs' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isAbstract()>

Returns whether this method is abstract

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isAbstract' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isConstructor()>

Returns whether this method is the constructor

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isConstructor' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isDestructor()>

Returns whether this method is static

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isDestructor' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isFinal()>

Returns whether this method is final

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isFinal' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isPrivate()>

Returns whether this method is private

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isPrivate' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isProtected()>

Returns whether this method is protected

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isProtected' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isPublic()>

Returns whether this method is public

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isPublic' :method
    not_implemented()
.end

=item C<bool ReflectionMethod::isStatic()>

Returns whether this method is static

NOT IMPLEMENTED.

=cut

.namespace['ReflectionMethod']
.sub 'isStatic' :method
    not_implemented()
.end

=item C<void ReflectionObject::__construct(mixed argument)>

Constructor. Takes an instance as an argument

NOT IMPLEMENTED.

=cut

.namespace['ReflectionObject']
.sub '__construct' :method
    not_implemented()
.end

=item C<mixed ReflectionObject::export(mixed argument [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionObject']
.sub 'export' :method
    not_implemented()
.end

=item C<void ReflectionParameter::__construct(mixed function, mixed parameter)>

Constructor. Throws an Exception in case the given method does not exist

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub '__construct' :method
    not_implemented()
.end

=item C<string ReflectionParameter::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub '__toString' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::allowsNull()>

Returns whether NULL is allowed as this parameters's value

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'allowsNull' :method
    not_implemented()
.end

=item C<mixed ReflectionParameter::export(mixed function, mixed parameter [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'export' :method
    not_implemented()
.end

=item C<ReflectionClass|NULL ReflectionParameter::getClass()>

Returns this parameters's class hint or NULL if there is none

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getClass' :method
    not_implemented()
.end

=item C<ReflectionClass|NULL ReflectionParameter::getDeclaringClass()>

Returns in which class this parameter is defined (not the typehint of the parameter)

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getDeclaringClass' :method
    not_implemented()
.end

=item C<ReflectionFunction ReflectionParameter::getDeclaringFunction()>

Returns the ReflectionFunction for the function of this parameter

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getDeclaringFunction' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::getDefaultValue()>

Returns the default value of this parameter or throws an exception

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getDefaultValue' :method
    not_implemented()
.end

=item C<string ReflectionParameter::getName()>

Returns this parameters's name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getName' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::getPosition()>

Returns whether this parameter is an optional parameter

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'getPosition' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::isArray()>

Returns whether parameter MUST be an array

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'isArray' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::isDefaultValueAvailable()>

Returns whether the default value of this parameter is available

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'isDefaultValueAvailable' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::isOptional()>

Returns whether this parameter is an optional parameter

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'isOptional' :method
    not_implemented()
.end

=item C<bool ReflectionParameter::isPassedByReference()>

Returns whether this parameters is passed to by reference

NOT IMPLEMENTED.

=cut

.namespace['ReflectionParameter']
.sub 'isPassedByReference' :method
    not_implemented()
.end

=item C<void ReflectionProperty::__construct(mixed class, string name)>

Constructor. Throws an Exception in case the given property does not exist

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub '__construct' :method
    not_implemented()
.end

=item C<string ReflectionProperty::__toString()>

Returns a string representation

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub '__toString' :method
    not_implemented()
.end

=item C<mixed ReflectionProperty::export(mixed class, string name [, bool return])>

Exports a reflection object. Returns the output if TRUE is specified for return, printing it otherwise.

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'export' :method
    not_implemented()
.end

=item C<ReflectionClass ReflectionProperty::getDeclaringClass()>

Get the declaring class

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'getDeclaringClass' :method
    not_implemented()
.end

=item C<string ReflectionProperty::getDocComment()>

Returns the doc comment for this property

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'getDocComment' :method
    not_implemented()
.end

=item C<int ReflectionProperty::getModifiers()>

Returns a bitfield of the access modifiers for this property

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'getModifiers' :method
    not_implemented()
.end

=item C<string ReflectionProperty::getName()>

Returns the class' name

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'getName' :method
    not_implemented()
.end

=item C<mixed ReflectionProperty::getValue([stdclass object])>

Returns this property's value

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'getValue' :method
    not_implemented()
.end

=item C<bool ReflectionProperty::isDefault()>

Returns whether this property is default (declared at compilation time).

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'isDefault' :method
    not_implemented()
.end

=item C<bool ReflectionProperty::isPrivate()>

Returns whether this property is private

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'isPrivate' :method
    not_implemented()
.end

=item C<bool ReflectionProperty::isProtected()>

Returns whether this property is protected

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'isProtected' :method
    not_implemented()
.end

=item C<bool ReflectionProperty::isPublic()>

Returns whether this property is public

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'isPublic' :method
    not_implemented()
.end

=item C<bool ReflectionProperty::isStatic()>

Returns whether this property is static

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'isStatic' :method
    not_implemented()
.end

=item C<void ReflectionProperty::setValue([stdclass object,] mixed value)>

Sets this property's value

NOT IMPLEMENTED.

=cut

.namespace['ReflectionProperty']
.sub 'setValue' :method
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
