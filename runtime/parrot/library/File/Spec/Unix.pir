.namespace [ 'File::Spec::Unix' ]

.sub '__onload' :load
	.local pmc self
	newclass self, 'File::Spec::Unix'
.end

.sub 'curdir' method
	.return( '.' )
.end


.sub 'devnull' method
	.return( '/dev/null' )
.end


.sub 'rootdir' method
	.return( '/' )
.end


.sub 'tmpdir' method
	'_E_not_yet_implemented'()
.end


.sub 'updir' method
	.return( '..' )
.end


.sub 'no_upwards' method
	'_E_not_yet_implemented'()
.end


.sub 'case_tolerant' method
	.return( 1 )
.end


.sub 'file_name_is_absolute' method
	.return( 0 )
.end


.sub 'VERSION' method
	.local pmc version
	version= global 'VERSION'
	.return( version )
.end


.sub 'catfile' method
	'_E_not_yet_implemented'()
.end


.sub 'catdir' method
	'_E_not_yet_implemented'()
.end


.sub 'path' method
	'_E_not_yet_implemented'()
.end


.sub 'canonpath' method
	'_E_not_yet_implemented'()
.end


.sub 'splitpath' method
	'_E_not_yet_implemented'()
.end


.sub 'splitdir' method
	'_E_not_yet_implemented'()
.end


.sub 'catpath' method
	'_E_not_yet_implemented'()
.end


.sub 'abs2rel' method
	'_E_not_yet_implemented'()
.end


.sub 'rel2abs' method
	'_E_not_yet_implemented'()
.end


## TODO more functions


## throw an error that the sub isn't yet implemented
.sub '_E_not_yet_implemented'
	new $P0, .Exception
	$P0['_message']= 'not yet implemented'
	throw $P0
.end
