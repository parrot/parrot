=head1 NAME

PAST::Sub - A subroutine declaration

=head1 DESCRIPTION

PAST::Sub is a subroutine declaration in the AST. It is a subclass of
Node.

=cut

.namespace [ 'PAST::Sub' ]

.sub '__onload' :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Sub'
	addattribute base, 'name'
    .return ()
.end

.sub 'name' :method
	.param string name      :optional
	.param int    have_name :opt_flag

	.local pmc    name_att

	unless have_name goto return_name

	name_att = new .String
	name_att = name
	setattribute self, 'name', name_att
	.return( name_att )

  return_name:
	name_att = getattribute self, 'name'
	.return( name_att )
.end
