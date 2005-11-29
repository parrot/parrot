=head1 TITLE

File::Spec - portably perform operations on file names

=head1 SYNOPSIS

	.local int classtype
	.local pmc spec

	load_bytecode 'File/Spec.pir'

	find_type classtype, 'File::Spec'
	new spec, classtype

	.local pmc x
	.local String a, b, c
	x= spec.'catdir'( 'a', 'b', 'c' )

which returns 'a/b/c' under Unix.

=head1 DESCRIPTION

This module is designed to support operations commonly performed on file
specifications (usually called "file names", but not to be confused with the
contents of a file, or Perl's file handles), such as concatenating several
directory and file names into a single path, or determining whether a path
is rooted. It is based on code directly taken from MakeMaker 5.17, code
written by Andreas KE<ouml>nig, Andy Dougherty, Charles Bailey, Ilya
Zakharevich, Paul Schinder, and others.

Since these functions are different for most operating systems, each set of
OS specific routines is available in a separate module, including:

	*File::Spec::Unix
	*File::Spec::Mac
	*File::Spec::OS2
	File::Spec::Win32
	*File::Spec::VMS

*These modules have not yet been created in this release.

The module appropriate for the current OS is automatically loaded by
File::Spec. Since some modules (like VMS) make use of facilities available
only under that OS, it may not be possible to load all modules under all
operating systems.

Since File::Spec is object oriented, subroutines should not be called directly,
and since parrot does not yet support class methods, subroutines should be
called as object methods.

=cut


.namespace [ 'File::Spec' ]


.sub VERSION method
	.local string version
	version= '0.1'
	.return( version )
.end


.sub '__onload' :load
	'_init'()

	.local string osname
	osname= '_get_osname'()

	.local string platform
	platform= '_get_module'( osname )

	'_load_lib'( platform )

	.local string baseclass
	concat baseclass, 'File::Spec::', platform

	## make this class a subclass of the base class
	.local pmc self
	subclass self, baseclass, 'File::Spec'

	.return()
.end


.sub '_init'
	.local pmc modules
	modules= new .Hash

	## TODO implement the other platforms
	set modules['MSWin32'], 'Win32'
	set modules['NetWare'], 'Win32'
	## set modules['MacOS'], 'Mac'
	## set modules['os2'], 'OS2'
	## set modules['VMS'], 'VMS'
	## set modules['epoc'], 'Epoc'
	## set modules['dos'], 'OS2'
	## set modules['cygwin'], 'Cygwin'

	store_global '_modules', modules
.end


.sub '_get_osname'
	.local pmc config
	.local pmc osname

	config= '_config'()
	osname= config['osname']

	.return( osname )
.end


.sub '_get_module'
	.param string osname

	.local pmc modules
	modules= new .Hash

	modules= find_global '_modules'

	.local string module
	module= modules[ osname ]

	## FIXME: when undef doesn't return 'None' in scalar context
	ne 'None', module, found_module
	module= 'Unix'

found_module:
	.return( module )
.end


.sub '_load_lib'
	.param string module

	.local string filename
	.local string libname

	concat filename, module, ".pir"
	concat libname, "File/Spec/", filename
	load_bytecode libname

	.return()
.end


.sub '__isa' method
	.local pmc sub
	.local string name
	
	classname name, self

	.local string osname
	osname= '_get_osname'()

	.local string module
	module= '_get_module'( osname )

	.local pmc platform
	platform= new String
	platform= module

	.local pmc class
	class= new String
	class= name

	concat class, class, '::'
	concat class, class, platform
	.return(class)
.end


.include 'library/config.imc'
