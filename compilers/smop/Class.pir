# Copyright (C) 2007, The Perl Foundation.

=head1 NAME

Class - Core structure of a class

=head1 DESCRIPTION

Classes are instances of the C<Class> PMC. Currently implemented in PIR,
but ultimately implemented as low-level .pmc.

=head1 SYNOPSIS

    .local pmc class, init_args, obj
    init_args = new Hash
    init_args['name'] = 'MyClass'
    class = new 'Class', init_args
#   class = newclass 'MyClass'

    class.add_attribute('myattribute')
    obj = class.'new'( 'myattribute' => "Foo" )

=head2 find_class

This subroutine prototypes the C<find_class> opcode. It looks up a class
by name and returns a class object.

=cut

.sub find_class
  .param pmc name
  .local pmc class

  # Currently storing the class object as a namespace variable, mimicing
  # whatever strategy Namespace objects will use to store a link to the
  # associated class.
  class = find_global name, "class_object"
  .return(class)
.end

.namespace ['Class']

.sub onload :load
  .local pmc class
  load_bytecode "compilers/smop/Attribute.pir"
  class = newclass "Class"

  .local pmc atts, attribs
  atts = split ", ", "name, namespace, _parrotclass, attributes, methods, superclasses"
  attribs = new ResizablePMCArray
  .local pmc iter, new_attribute
  iter = new Iterator, atts
  iter = 0
iter_loop:
  unless iter goto iter_end
  $S1 = shift iter
  addattribute class, $S1
  new_attribute = new 'Attribute'
  new_attribute.'name'($S1)
  new_attribute.'class'(class)
  push attribs, new_attribute
  goto iter_loop
iter_end:
  
  # we sidestep the MetaModel bootstrap problem by building the
  # MetaClass manually
  $P0 = new String
  $P0 = "Class"
  .local pmc class_mc
  class_mc = new "Class"
  setattribute class_mc, "name", $P0
  setattribute class_mc, "_parrotclass", class
  class_mc.init()
  setattribute class_mc, "attributes", attribs
  store_global "class_object", class_mc

.end


.sub init :vtable :method
  $P0 = new Hash
  setattribute self, "attributes", $P0
  $P0 = new Hash
  setattribute self, "methods", $P0
  $P0 = new ResizablePMCArray
  setattribute self, "superclasses", $P0
.end

.sub init_pmc :vtable :method
  .param pmc init_args
  self.init()

  # Iterate over the constructor arguments, calling the accessor for each
  .local pmc iter
  iter = new Iterator, init_args
  iter = 0
iter_loop:
  unless iter goto iter_end
  $S1 = shift iter
  $P1 = iter[$S1]
  self.$S1($P1)
  goto iter_loop
iter_end:
.end

.include "compilers/smop/_accessor.pir"

=head2 name

The accessor for the name attribute. With no argument, it simply returns
the current value for name. When passed an argument, it sets the name of
the class, and also sets the association with a namespace.

=cut

.sub name :method
  .param pmc name :optional
  .param int got_name :opt_flag
  .local pmc rv
  
  rv = self._accessor( "name", name, got_name )

  unless got_name goto get_only
  store_global name, "class_object", self # namespace entry for class object
  $P1 = newclass name
  setattribute self, "_parrotclass", $P1 # dummy old-style class object within
  $P1 = get_namespace
  setattribute self, "namespace", $P1 # class entry for namespace object
get_only:

  .return(rv)
.end

=head2 new

    obj = class.'new'( 'myattrib' => "Foo" )

Create a new instance object from the class object. It takes an optional
slurpy, named list of attributes and values to initialize the object.

=cut

.sub 'new' :method
  .param pmc args :slurpy :named

  .local pmc obj
  .local string name
  name = self.'name'()

  $I0 = find_type name
  obj = new $I0, args

  .return(obj)
.end

=head2 attributes

An accessor for the attributes attribute of the class. It returns the a
Hash of all attributes, with a key of the attribute name, and a value of
the Attribute object. The accessor is set by a hash of attributes, with
a key name and a value type.

=cut

.sub attributes :method
  .param pmc attribs :optional
  .param int got_attribs :opt_flag
  .local pmc rv

  unless got_attribs goto skip_set
  .local pmc iter
  iter = new Iterator, attribs
  iter = 0
iter_loop:
  unless iter goto iter_end
  $S1 = shift iter # NOTE: convert to hash to add attribute types
  $P1 = iter[$S1]
  self.add_attribute($S1, $P1)
  goto iter_loop
iter_end:

skip_set:
   rv = getattribute self, 'attributes'
  .return(rv)
.end

=head2 add_attribute

Adds a single attribute to the class. It takes a simple string name, and
a simple string value for type.

=cut

.sub 'add_attribute' :method
  .param string attribute_name
  .param string attribute_type :optional
  .param int got_type :opt_flag

  .local pmc new_attribute, attributes
  new_attribute = new 'Attribute'
  new_attribute.'name'(attribute_name)
  new_attribute.'class'(self)

  unless got_type goto no_type
  new_attribute.'type'(attribute_type)
no_type:

  # store the attribute in the class
  attributes = getattribute self, 'attributes'
  attributes[attribute_name] = new_attribute

  # add the attribute to the dummy internal class
  .local pmc delegclass
  delegclass = getattribute self, '_parrotclass'
  addattribute delegclass, attribute_name
.end

.sub add_superclass :method
  .param string superclass
  .local pmc newsuper
  newsuper = find_class(superclass)

  $P0 = getattribute self, '_parrotclass'
  $P1 = getattribute newsuper, '_parrotclass'
  # FIXME - remove this debug output
  print "# addparent "
  $S0 = classname $P0
  $S1 = classname $P1
  print $S0
  print ", "
  say $S1
  addparent $P0, $P1
.end

.sub superclasses :method
  .param pmc supers :optional
  .param int got_supers :opt_flag
  .local pmc rv
  rv = self._accessor( "superclasses", supers, got_supers )
  unless got_supers goto out

  .local pmc iter
  iter = new Iterator, supers
  iter = 0
iter_loop:
  unless iter goto iter_end
  $S1 = shift iter
  ##print "iter, item = "
  #say $S1
  self.add_superclass($S1)
  goto iter_loop
iter_end:

out:
  .return(rv)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
