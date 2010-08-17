# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

.sub greet
	.param pmc    name

	.local string name_str
	name_str = name

	.local pmc greeting
	greeting  = new 'String'
	greeting  = 'Hello, '
	greeting .= name_str
	greeting .= '!'

	.return( greeting )
.end

.namespace [ 'Elsewhere' ]

.sub greet
	.return( 'Hiya!' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
