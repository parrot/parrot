=head1 NAME

PAST::Sub - A subroutine declaration

=head1 DESCRIPTION

PAST::Sub is a subroutine declaration in the AST. It is a subclass of
PAST::Node.

=cut

.namespace [ "PAST::Sub" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Sub'
	addattribute base, 'name'
    .return ()
.end

.sub name :method
	.param string new_name  :optional
	.param int    have_name :opt_flag

	.local pmc name

	unless have_name goto return_it
	name = new .String
	name = new_name
	setattribute self, 'name', name
	.return( name )

  return_it:
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
