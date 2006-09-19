.sub greet
	.param pmc    name

	.local string name_str
	name_str = name

	.local pmc greeting
	greeting  = new .String
	greeting  = 'Hello, '
	greeting .= name_str
	greeting .= '!'

	.return( greeting )
.end

.namespace [ 'Elsewhere' ]

.sub greet
	.return( 'Hiya!' )
.end
