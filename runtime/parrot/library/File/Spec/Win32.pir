.namespace [ 'File::Spec::Win32' ]

=head2 Description

=cut

.sub '__onload' :load
	load_bytecode 'File/Spec/Unix.pir'
	load_bytecode 'PGE.pbc'

	.local pmc self
	subclass self, 'File::Spec::Unix', 'File::Spec::Win32'

	.local pmc tmpdir
	tmpdir= new .ResizableStringArray

	store_global '_tmpdir', tmpdir
.end


.sub 'devnull' method
	.return( 'nul' )
.end


.sub 'tmpdir' method
	.local pmc tmpdir
	tmpdir= new .ResizableStringArray

	tmpdir= global '_tmpdir'

	.local int size
	size= tmpdir

	if size, return_cached

	.local pmc env
	env= new .Env

	.local string env_val

find_tmpdir:
	env_val= env['TMPDIR']
	if env_val, found_tmpdir
	goto find_temp

found_tmpdir:
	push tmpdir, env_val
	env_val= ''

find_temp:
	env_val= env['TEMP']
	if env_val, found_temp
	goto find_tmp

found_temp:
	push tmpdir, env_val
	env_val= ''

find_tmp:
	env_val= env['TMP']
	if env_val, found_tmp
	goto add_more

found_tmp:
	push tmpdir, env_val
	env_val= ''

add_more:
	push tmpdir, 'SYS:/temp'
	push tmpdir, 'C:/temp'
	push tmpdir, '/tmp'
	push tmpdir, '/'

store:
	store_global '_tmpdir', tmpdir
return_cached:
	.return( tmpdir )
.end


.sub case_tolerant method
	.return( 1 )
.end


.sub 'file_name_is_absolute' method
	.param string file

	.local pmc p6rule
	.local pmc rulesub
	.local pmc match

	p6rule= find_global 'PGE', 'p6rule'

	## m{^([a-z]:)?[\\/]}is
	rulesub= p6rule( ':ignorecase ^ ( <?alpha> \: )? <[\\/]>' )
	match= rulesub( file )

	.return match.'__get_bool'()
.end


.sub 'catfile' method
	_E_not_yet_implemented()

=for later development

	.param pmc args :slurpy
	.local pmc dir
	.local pmc file

	$I0= args
	unless $I0, return

	$P1= pop args
	file= new .String
	file= $P1

	file= self.'canonpath'( file )

	$I0= args
	unless $I0, return_file

	dir= self.'catdir'( args :flat )

	.local pmc p6rule
	.local pmc rulesub
	.local pmc match

	p6rule= find_global 'PGE', 'p6rule'

	## dir =~ m{\\$}is
	rulesub= p6rule( '\\ $' )
	match= rulesub( dir )

	if match, return_dir_file
	dir .= "\\"

return_dir_file:
	dir .= file
	.return( dir )
return_file:
	.return( file )
return:

=cut

.end


.sub 'catdir' method
	.param pmc dirs :slurpy

	.local int num_args
	num_args= dirs

	unless num_args, return

	.local pmc p6rule, rulesub, match
	p6rule= find_global 'PGE', 'p6rule'

	.local pmc dir
	dir= new .String
	.local int i
	i= 0

loop_dirs:
	if num_args <= i goto join_dirs
	dir= dirs[i]

	.local string s_dir, slash, bslash
	s_dir= dir
	slash= '/'
	bslash= '\'

loop_rule:
	$I0= index s_dir, slash
	if -1 == $I0 goto final_slash
	$I1= $I0 + 1
	$S2= substr s_dir, $I1
	substr s_dir, $I0, $I1, bslash
	concat s_dir, $S2
	goto loop_rule

final_slash:
	## $_ .= "\\" unless m{\\$};
	$S0= substr s_dir, -1
	eq bslash, $S0, next_arg
	concat s_dir, bslash

	dir= s_dir
	dirs[i]= dir

next_arg:
	i += 1
	goto loop_dirs

join_dirs:
    ## return $self->canonpath(join('', @args));
	s_dir= join '', dirs
	dir= s_dir
	dir= self.'canonpath'( dir )
	.return( dir )
return:
.end


.sub 'path' method
##TODO
	'_E_not_yet_implemented'()
.end


.sub 'canonpath' method
	.param string path

	.local pmc p6rule, rulesub, match
	p6rule= find_global 'PGE', 'p6rule'

match_1:
	## $path =~ s/^([a-z]:)/\u$1/s;
	rulesub= p6rule( '^ ( <?[a..z]> \: )' )
do_match_1:
	match= rulesub( path )
	unless match, no_match_1
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= $P0
	$S0= upcase $S0
	substr path, $I0, $I1, $S0
no_match_1:

print "-1 "
print path
print "\n"

match_2:
	## $path =~ s|/|\\|g;
	rulesub= p6rule( "/" )
do_match_2:
	match= rulesub( path )
	unless match, no_match_2
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= "\\"
	substr path, $I0, $I1, $S0
	goto do_match_2
no_match_2:

print "-2 "
print path
print "\n"

match_3:
	## $path =~ s|([^\\])\\+|$1\\|g;
		## xx\\\\xx  -> xx\xx
	rulesub= p6rule( '( <-[\\]> ) \+' )
do_match_3:
	match= rulesub( path )
	unless match, no_match_3
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= $P0
	$S0 .= "\\"
	substr path, $I0, $I1, $S0
	goto do_match_3
no_match_3:

print "-3 "
print path
print "\n"

match_4:
	## $path =~ s|(\\\.)+\\|\\|g;
	## xx\.\.\xx -> xx\xx
	rulesub= p6rule( '( \\ \. )+ \\' )
do_match_4:
	match= rulesub( path )
	unless match, no_match_4
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= "\\"
	substr path, $I0, $I1, $S0
	goto do_match_4
no_match_4:

print "-4 "
print path
print "\n"

match_5:
    ## $path =~ s|^(\.\\)+||s unless $path eq ".\\";
	## .\xx      -> xx
	.local string relpath
	relpath= ".\\"

	iseq $I0, relpath, path
	if $I0, no_match_5
	rulesub= p6rule( '^ ( \. \\ )+ \\' )
do_match_5:
	match= rulesub( path )
	unless match, no_match_5
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= ""
	substr path, $I0, $I1, $S0
no_match_5:

print "-5 "
print path
print "\n"

match_6:
    ## $path =~ s|\\\Z(?!\n)||
	##     unless $path =~ m{^([A-Z]:)?\\\Z(?!\n)}s;
	## xx\       -> xx
   	## xx1/xx2/xx3/../../xx -> xx1/xx
	rulesub= p6rule( '$$ <!before \n>' )
	match= rulesub( path )
	if match, no_match_6

	rulesub= p6rule( '\\ \n? $' )
	match= rulesub( path )
	unless match, no_match_3
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= ""
	substr path, $I0, $I1, $S0
no_match_6:

print "-6 "
print path
print "\n"

match_7:
    ## $path =~ s|\\\.\.\.\\|\\\.\.\\\.\.\\|g;
	## \...\ is 2 levels up
	rulesub= p6rule( '\\ \. \. \. \\' )
do_match_7:
	match= rulesub( path )
	unless match, no_match_7
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= "\\\.\.\\\.\.\\"
	substr path, $I0, $I1, $S0
	goto do_match_7
no_match_7:

print "-7 "
print path
print "\n"

match_8:
    ## $path =~ s|^\.\.\.\\|\.\.\\\.\.\\|g;
	## ...\ is 2 levels up
	rulesub= p6rule( '^ \. \. \. \\' )
	match= rulesub( path )
do_match_8:
	unless match, no_match_8
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= "\.\.\\\.\.\\"
	substr path, $I0, $I1, $S0
	goto do_match_8
no_match_8:

print "-8 "
print path
print "\n"

match_9:
    ## return $path if $path =~ m|^\.\.|;
	## skip relative paths
	rulesub= p6rule( '^ \. \.' )
	match= rulesub( path )
do_match_9:
	if match, return
no_match_9:

print "-9 "
print path
print "\n"

match_10:
    ## return $path unless $path =~ /\.\./;
	## too few .'s to cleanup
	rulesub= p6rule( '\. \.' )
	match= rulesub( path )
do_match_10:
	unless match, return
no_match_10:

print "10 "
print path
print "\n"

match_11:
    ## return $path if $path =~ /\.\.\.\./;
	## too many .'s to cleanup
	rulesub= p6rule( '\. \. \. \.' )
	match= rulesub( path )
do_match_11:
	if match, return
no_match_11:

print "11 "
print path
print "\n"

match_12:
    ## $path =~ s{^\\\.\.$}{\\};
	## \..    -> \
	rulesub= p6rule( '^ \\ \. \. $' )
do_match_12:
	match= rulesub( path )
	unless match, no_match_12
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= "\\"
	substr path, $I0, $I1, $S0
no_match_12:

print "12 "
print path
print "\n"

match_13:
    ## 1 while $path =~ s{^\\\.\.}{};
	## \..\xx -> \xx
	rulesub= p6rule( '^ \\ \. \.' )
do_match_13:
	match= rulesub( path )
	unless match, no_match_13
	$P0= match[0]
	$I0= $P0.from()
	$I1= $P0.to()
	$S0= ""
	substr path, $I0, $I1, $S0
	goto match_13
no_match_13:

print "13 "
print path
print "\n"

#    my ($vol,$s_dirs,$file) = $self->splitpath($path);
	.local string vol, s_dirs, file
	( vol, s_dirs, file )= self.'splitpath'( path )

#    my @dirs = $self->splitdir($dirs);
	.local pmc a_dirs
	a_dirs= new .ResizableStringArray
	( a_dirs )= self.splitdir( s_dirs )

## TODO unfinished
#    my (@base_dirs, @path_dirs);
#    my $dest = \@base_dirs;
#    for my $dir (@dirs){
#	$dest = \@path_dirs if $dir eq $self->updir;
#	push @$dest, $dir;
#    }
#    # for each .. in @path_dirs pop one item from 
#    # @base_dirs
#    while (my $dir = shift @path_dirs){ 
#	unless ($dir eq $self->updir){
#	    unshift @path_dirs, $dir;
#	    last;
#	}
#	pop @base_dirs;
#    }
#    $path = $self->catpath( 
#			   $vol, 
#			   $self->catdir(@base_dirs, @path_dirs), 
#			   $file
#			  );

return:
	.return( path )
.end


## TODO probably broken
.sub 'splitpath' method
	.param string path
	.param int no_file
	.local string volume, directory, file

	'_E_not_yet_implemented'()
	volume= ''
	directory= ''
	file= ''

	.local pmc p6rule
	.local pmc rulesub
	.local pmc match

	p6rule= find_global 'PGE', 'p6rule'

	unless no_file, with_file
    ## m{^( (?:[a-zA-Z]:|(?:\\\\|//)[^\\/]+[\\/][^\\/]+)? ) 
    ##       (.*)
    ##  }xs;

## TODO these are funky and might not be right
	rulesub= p6rule( ' ^ ( <[a..zA..Z]> \: | [\\ | //] <-[\\/]>+ <[\\/]> <-[\\/]>+ )?  (.*) ' )
	match= rulesub( path )
	unless match, return
	$P0= match[0]
	$S0= $P0
	volume= $S0

	$P0= match[1]
	$S0= $P0
	directory= $P0
	goto return
	
with_file:
## TODO these are funky and might not be right
	rulesub= p6rule( ' ^ ( < [a..zA..Z] \: | <\\ \\ | //> [^\\/]+ [\\/] [^\\/]+ >)?  ( < .* [\\/] < \. \.? <\n? $$>? >?) (.*) ' )
	match= rulesub( path )
	unless match, return

	$P0= match[0]
	$S0= $P0
	volume= $S0

	$P0= match[1]
	$S0= $P0
	directory= $P0

	$P0= match[2]
	$S0= $P0
	file= $P0

return:
	.return( volume, directory, file )
.end


## TODO unfinished
.sub 'splitdir' method
	.param string directories
	'_E_not_yet_implemented'()

	.local string dir_copy
	dir_copy= directories

	.local pmc a_directories
	a_directories= new .ResizableStringArray

	.local pmc p6rule
	.local pmc rulesub
	.local pmc match

	p6rule= find_global 'PGE', 'p6rule'

## TODO this whole rule section
	rulesub= p6rule( '^ <[\\/]>? ( <-[\\/]>? ) <[\\/]>? ' )
match_1:
	match= rulesub( dir_copy )
	unless match, trailing_nulls
	$I0= 0
split:

trailing_nulls:

return:
	.return( a_directories )
.end


## TODO unfinished
.sub 'catpath' method
	.param string volume
	.param string directory
	.param string file

	## TODO
	'_E_not_yet_implemented'()
.end


## TODO unfinished
.sub 'abs2rel' method
	'_E_not_yet_implemented'()
.end


## TODO unfinished
.sub 'rel2abs' method
	'_E_not_yet_implemented'()
.end


.sub 'VERSION' method
	.local pmc version
	version= global 'VERSION'
	.return( version )
.end


## TODO more functions

.sub '_fixup_args'
	'_E_not_yet_implemented'()
.end


## throw an error that the sub isn't yet implemented
.sub '_E_not_yet_implemented'
	new $P0, .Exception
	$P0['_message']= 'not yet implemented'
	throw $P0
.end
