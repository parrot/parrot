=head1 NAME

POST::Sub - A subroutine declaration

=head1 DESCRIPTION

POST::Sub is a subroutine declaration in the OST. It is a subclass of
POST::Node.

=cut

.namespace [ 'POST::Sub' ]

.sub '__onload' :load
    .local pmc base
    $P0  = getclass 'POST::Node'
    base = subclass $P0, 'POST::Sub'
	addattribute base, 'name'
    .return ()
.end

.sub name :method
	.param string new_name  :optional
	.param int    have_name :opt_flag

	.local pmc name
	unless have_name goto get

  set:
	name = new .String
	name = new_name
	setattribute self, 'name', name
	.return( name )

  get:
 	name = getattribute self, 'name'
  .return( name )
.end

.sub "dump" :method
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    level += 1 # set level for attributes
    $S0 = typeof self
    print indent
    print "<"
    print $S0
    print "> => { \n"

    # print source for this node
    self.dump_attribute("source", level)
    self.dump_attribute("pos", level)
    self.dump_attribute("name", level)
    self.dump_children(level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end
