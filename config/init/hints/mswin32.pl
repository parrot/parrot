{
	my($cc, $ccflags, $libs)=Configure::Data->get(qw(cc ccflags libs));
	my $is_msvc  = grep { $cc eq $_ } ( qw(cl cl.exe) );
	my $is_mingw = grep { $cc eq $_ } ( qw(gcc gcc.exe) );
	my $is_bcc   = grep { $cc eq $_ } ( qw(bcc32 bcc32.exe) );
	
	Configure::Data->set(
		rm_f  => '$(PERL) -MExtUtils::Command -e rm_f',
		rm_rf => '$(PERL) -MExtUtils::Command -e rm_rf',
		PQ    => '"'
	);

	if( $is_msvc ) {
		# Check the output of cl.exe to see if it contains the
		# string 'Standard' and remove the -O1 option if it does.
		# This will prevent the 'optimization is not available in the
		# standard edition compiler' warning each time we compile.
		# The logo gets printed to STDERR; hence the redirection.
		my $cc_output = `$cc 2>&1`;
		$ccflags =~ s/-O1 // if $cc_output =~ m/Standard/;

		Configure::Data->set(
			so         => '.dll',
			a          => '.lib',
			o          => '.obj',
			cc_o_out   => '-Fo',
			cc_exe_out => '-Fe',
			cc_ldflags => '/link',
			cc_debug   => '-Zi',
			ld_debug   => '-debug',
			ld_shared  => '-dll',
			ld_shared_flags=> '-def:libparrot.def',
			ld_out     => '-out:',
			ldflags    => '-nologo',
			blib_lib_libparrot_a => '',
			cp         => 'copy',
			slash      => '\\',
			ccflags    => $ccflags
		);
	    }
	if( $is_bcc ) {
		Configure::Data->set(
			o => '.obj',
			ccflags => '-O2 -w-8066 -DWIN32 -DNO_STRICT -DNDEBUG -D_CONSOLE',
			cc_o_out => '-o',
			cc_exe_out => '-e',
			cc_debug => '-v',
			
			ld => 'bcc32.exe',
			ldflags => '',
			ld_out => '-e',
			cc_ldflags => '',
			ld_debug => '-v',
			ld_shared => '-WD',
			libs => 'import32.lib cw32.lib',
			
			cp => 'copy',
			slash => '\\'
		);
	}
	elsif( $is_mingw ) {
		$libs='' if $libs =~ /\.lib\s/i;
		Configure::Data->set(
			ld => 'gcc',
			libs => $libs
		);
	}
}