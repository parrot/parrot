{
	my %args;
	@args{@args}=@_;

	my($cc, $ccflags, $libs)=Configure::Data->get(qw(cc ccflags libs));

	# Later in the Parrot::Configure::RunSteps->runsteps process,
	# inter/progs.pl will merge the command-line overrides with the defaults.
	# We do one bit of its work early here, because we need the result now.
	$cc = $args{cc} if defined $args{cc};

	my $is_msvc  = grep { $cc eq $_ } ( qw(cl cl.exe) );
	my $is_mingw = grep { $cc eq $_ } ( qw(gcc gcc.exe) );
	my $is_bcc   = grep { $cc eq $_ } ( qw(bcc32 bcc32.exe) );

	Configure::Data->set(
		rm_f  => '$(PERL) -MExtUtils::Command -e rm_f',
		rm_rf => '$(PERL) -MExtUtils::Command -e rm_rf',
                PQ    => '"',
                make_c=> '$(PERL) -e "chdir shift @ARGV; system \'$(MAKE)\', @ARGV; exit $$? >> 8;"'
	);

	if( $is_msvc ) {
		# Check the output of cl.exe to see if it contains the
		# string 'Standard' and remove the -O1 option if it does.
		# This will prevent the 'optimization is not available in the
		# standard edition compiler' warning each time we compile.
		# The logo gets printed to STDERR; hence the redirection.
		my $cc_output = `$cc /? 2>&1`;
		$ccflags =~ s/-O1 // if $cc_output =~ m/Standard/ || $cc_output =~ m{/ZI};
		$ccflags =~ s/-Gf/-GF/ if $cc_output =~ m/Version (\d+)/ && $1 >= 13;
		

		Configure::Data->set(
			so         => '.dll',
			a          => '.lib',
			o          => '.obj',
			cc_o_out   => '-Fo',
			cc_exe_out => '-Fe',
			cc_ldflags => '/link',
			              #Use Edit and Continue debugging if available
			cc_debug   => ($cc_output =~ m{/ZI} ? '-ZI' : '-Zi'),
			ld_debug   => '-debug',
			ld_shared  => '-dll',
			ld_shared_flags=> '-def:libparrot.def',
			ld_out     => '-out:',
			ldflags    => '-nologo',
			blib_lib_libparrot_a => 'blib/lib/libparrot_s$(A)',
			cp         => 'copy',
			ar_flags   => '',
			ar_out     => '-out:',
			slash      => '\\',
			ccflags    => $ccflags,
            ccwarn     => ''
		);
		# 'link' needs to be link.exe, not cl.exe.
		# This makes 'link' and 'ld' the same.
		Configure::Data->set('link', Configure::Data->get('ld'));
		
		# We can't use -opt: and -debug together.
		if (Configure::Data->get('ld_debug') =~ /-debug/) {
			my $linkflags = Configure::Data->get('linkflags');
			$linkflags =~ s/-opt:\S+//;
			Configure::Data->set('linkflags', $linkflags);
		}
	    }
	if( $is_bcc ) {
		Configure::Data->set(
			o => '.obj',
                        a => '.lib',
                        so => '.dll',
                        cc => ${cc},
			ccflags => '-O2 -w-8066 -DWIN32 -DNO_STRICT -DNDEBUG -D_CONSOLE',
			cc_o_out => '-o',
			cc_exe_out => '-e',
			cc_debug => '-v',
			
			ld => ${cc},
			ldflags => '',
			ld_out => '-e',
			cc_ldflags => '',
			ld_debug => '-v',
			ld_shared => '-WD',
			libs => 'import32.lib cw32.lib',
			
                        link => ${cc},
                        linkflags => '',

			cp => 'copy',
                        ar => 'tlib',
                        ar_flags => '',
                        ar_out => '',
                        ar_extra => '/au',
                        slash => '\\',
                        make_and => "\n\t",

                        blib_lib_libparrot_a => 'blib\lib\libparrot.lib',
		);
	}
	elsif( $is_mingw ) {
		$libs='' if $libs =~ /\.lib\s/i;
		Configure::Data->set(
			link      => 'gcc',
			libs      => $libs,
			slash     => '/',
			ar        => 'ar',
		);
	}
}
