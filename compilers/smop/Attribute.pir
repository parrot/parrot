# Copyright (C) 2007, The Perl Foundation.

=head1 NAME

Attribute - An attribute of a class

=head1 DESCRIPTION

The Attribute class represents a single attribute of a class object.
Attributes have a name, a type, and a link back to the class that
contains them.

=cut

.namespace ['Attribute']

.include 'compilers/smop/_accessor.pir'

.sub onload :load
  .local pmc class
  newclass class, "Attribute"
  addattribute class, "name"
  addattribute class, "type"
  addattribute class, "class"
.end

.sub name :method
  .param pmc name :optional
  .param int got_name :opt_flag
  .local pmc rv
  rv = self._accessor( "name", name, got_name )
  .return(rv)
.end

.sub class :method
  .param pmc class :optional
  .param int got_class :opt_flag
  .local pmc rv
  rv = self._accessor( "class", class, got_class )
  .return(rv)
.end

.sub type :method
  .param pmc type :optional
  .param int got_type :opt_flag
  .local pmc rv
  rv = self._accessor( "type", type, got_type )
  .return(rv)
.end
.sub init :vtable :method
  $P0 = new String
  setattribute self, "name", $P0
.end

.sub init_pmc :vtable :method
  .param pmc init_args
  self.init()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
