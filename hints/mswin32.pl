{
	my $is_msvc = grep { $c{cc} eq $_ } ( qw(cl cl.exe) );
	my $is_mingw = grep { $c{cc} eq $_ } ( qw(gcc gcc.exe) );
	my $is_bcc = grep { $c{cc} eq $_ } ( qw(bcc32 bcc32.exe) );
	
	$c{rm_f} = '$(PERL) -MExtUtils::Command -e rm_f';
	$c{rm_rf} = '$(PERL) -MExtUtils::Command -e rm_rf';

	if( $is_msvc ) {
		$c{o} = '.obj';
		$c{cc_o_out} = '-Fo';
		$c{cc_exe_out} = '-Fe';
		$c{cc_ldflags} = '/link';
		$c{cc_debug} = '-Zi';
		$c{ld_debug} = '-debug';
		$c{ld_shard} = '-dll';
		$c{ld_out}   = '-out:';
		$c{platform} = 'win32';
		$c{cp} = 'copy';
		$c{slash} = '\\';
		
		# Check the output of cl.exe to see if it contains the
		# string 'Standard' and remove the -O1 option if it does.
		# This will prevent the 'optimization is not available in the
		# standard edition compiler' warning each time we compile.
		# The logo gets printed to STDERR; hence the redirection.
		my $cc_output = `$c{cc} 2>&1`;
		$c{ccflags} =~ s/-O1 // if $cc_output =~ m/Standard/;
	    }
	if( $is_bcc ) {
	    $c{o} = '.obj';
	    $c{ccflags} = '-O2 -w-8066 -DWIN32 -DNO_STRICT -DNDEBUG -D_CONSOLE';
	    $c{cc_o_out} = '-o';
	    $c{cc_exe_out} = '-e';
	    $c{cc_debug} = '-v';
	    
	    $c{ld} = 'bcc32.exe';
	    $c{ldflags} = '';
	    $c{ld_out} = '-e';
	    $c{cc_ldflags} = '';
	    $c{ld_debug} = '-v';
	    $c{ld_shard} = '-WD';
	    $c{libs} = 'import32.lib cw32.lib';
	    
	    $c{platform} = 'win32';
	    $c{cp} = 'copy';
	    $c{slash} = '\\';
	}
	elsif( $is_mingw ) {
		$c{ld} = 'gcc';
		# if your perl is ActivePerl, then libs are .lib files,
		# not necessary, and gcc does not like them
		$c{libs} = ' ' if $c{libs} =~ m/\.lib\s/i;
	}
}
