{
	my $is_msvc = grep { $c{cc} eq $_ } ( qw(cl cl.exe) );
	my $is_mingw = grep { $c{cc} eq $_ } ( qw(gcc gcc.exe) );

	$c{rm_f} = '$(PERL) -MExtUtils::Command -e rm_f';
	$c{rm_rf} = '$(PERL) -MExtUtils::Command -e rm_rf';

	if( $is_msvc ) {
		$c{o} = '.obj';
		$c{cc_o_out} = '-Fo';
		$c{cc_exe_out} = '-Fe';
		$c{ld_out} = '/OUT:';
		$c{cc_debug} = '-Zi';
		$c{ld_debug} = '-debug';
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
	elsif( $is_mingw ) {
		$c{ld} = 'gcc';
		# if your perl is ActivePerl, then libs are .lib files,
		# not necessary, and gcc does not like them
		$c{libs} = ' ' if $c{libs} =~ m/\.lib\s/i;
	}
}
