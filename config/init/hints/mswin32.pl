# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

{
	my %args;
	@args{@args}=@_;

	my($cc, $ccflags, $libs)=Configure::Data->get(qw(cc ccflags libs));

	# Later in the Parrot::Configure::RunSteps->runsteps process,
	# inter/progs.pl will merge the command-line overrides with the defaults.
	# We do one bit of its work early here, because we need the result now.
	$cc = $args{cc} if defined $args{cc};

	my $is_msvc  = grep { $cc eq $_ } ( qw(cl cl.exe) );
	my $is_intel = grep { $cc eq $_ } ( qw(icl icl.exe) );
	my $is_mingw = grep { $cc eq $_ } ( qw(gcc gcc.exe) );
	my $is_bcc   = grep { $cc eq $_ } ( qw(bcc32 bcc32.exe) );

	Configure::Data->set(
		rm_f  => '$(PERL) -MExtUtils::Command -e rm_f',
		rm_rf => '$(PERL) -MExtUtils::Command -e rm_rf',
                PQ    => '"',
                make_c=> '$(PERL) -e "chdir shift @ARGV; system \'$(MAKE)\', @ARGV; exit $$? >> 8;"',
		ncilib_link_extra => '-def:src/libnci_test.def',
		slash_exec => '\\',
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
			share_ext  => '.dll',
			load_ext   => '.dll',
			a          => '.lib',
			o          => '.obj',
			cc_o_out   => '-Fo',
			cc_exe_out => '-out:',
			cc_ldflags => '/link',
			cc_debug   => '-Zi', #ZI messes with __LINE__
			ld_debug   => '-debug',
			ld_share_flags => '-dll -def:libparrot.def',
			ld_load_flags  => '-dll -def:libparrot.def',
			ld_out     => '-out:',
			ldflags    => '-nologo -nodefaultlib',
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
		
		# We need to build a .def file to export parrot.exe symbols.
		Configure::Data->set(
			ld_parrot_exe_def	=> '-def:parrot.def',
			parrot_exe_def	=> 'parrot.def'
		);
				
		# When building dynclasses we need to flag up the need to
		# mark shared variables with __declspec(dllimport).
		Configure::Data->set(
			cc_building_dynclass_flag => '-DPARROT_BUILDING_WIN32_DLL'
		);
	}
	elsif( $is_intel ) {
		Configure::Data->set(
			share_ext  => '.dll',
			load_ext   => '.dll',
			a          => '.lib',
			o          => '.obj',
			cc_o_out   => '-Fo',
			cc_exe_out => '-out:',
			cc_ldflags => '/link',
			cc_debug   => '-Zi', #ZI messes with __LINE__
			libs       => "$libs libircmt.lib",
			ld         => 'xilink',
			ld_debug   => '-debug',
			ld_share_flags  => '-dll -def:libparrot.def',
			ld_load_flags   => '-dll -def:libparrot.def',
			ld_out     => '-out:',
			ldflags    => '-nologo -nodefaultlib',
			blib_lib_libparrot_a => 'blib/lib/libparrot_s$(A)',
			cp         => 'copy',
			ar         => 'xilib',
			ar_flags   => '',
			ar_out     => '-out:',
			slash      => '\\',
			ccflags    => $ccflags,
			ccwarn     => ''
		);
		# 'link' needs to be xilink.exe, not icl.exe.
		# This makes 'link' and 'ld' the same.
		Configure::Data->set('link', Configure::Data->get('ld'));

		# We can't use -opt: and -debug together.
		if (Configure::Data->get('ld_debug') =~ /-debug/) {
			my $linkflags = Configure::Data->get('linkflags');
			$linkflags =~ s/-opt:\S+//;
			Configure::Data->set('linkflags', $linkflags);
		}
	}
	elsif( $is_bcc ) {
		Configure::Data->set(
			o => '.obj',
                        a => '.lib',
			share_ext  => '.dll',
			load_ext   => '.dll',
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
			ld_share_flags => '-WD',
			ld_load_flags => '-WD',
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
		my $make=Configure::Data->get(qw(make));
		if ($make =~ /nmake/i) {
			# ActiveState Perl
			Configure::Data->set(
				'a' => '.a',
				'ar' => 'ar',
				'cc' => 'gcc',
				'ccflags' => '-s -O2 -DWIN32 ',
				'cp' => '$(PERL) -MExtUtils::Command -e cp',
				'ld' => 'g++',
				'ld_load_flags' => '-shared ',
				'ld_share_flags' => '-shared ',
				'ldflags' => '-s ',
				'libs' => '-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 ',
				'link' => 'gcc',
				'linkflags' => '-s ',
				'make' => 'mingw32-make',
				'make_set_make' => 'MAKE = mingw32-make',
				'ncilib_link_extra' => 'src/libnci_test.def',
				'o' => '.o',
				'slash' => '\\',
			);
		} elsif ($make =~ /dmake/i) {
			# mingw Perl
			Configure::Data->set(
				'cp' => '$(PERL) -MExtUtils::Command -e cp',
				'ld_load_flags' => '-shared ',
				'ld_share_flags' => '-shared ',
				'make' => 'mingw32-make',
				'ncilib_link_extra' => 'src/libnci_test.def',
			);
		} else {
			warn "unknown configuration";
		}

		# We need to build a .def file to export parrot.exe symbols.
		Configure::Data->set(
			ld_parrot_exe_def	=> 'parrot.def',
			parrot_exe_def	=> 'parrot.def',
			link_dynamic	=> '-Wl,--out-implib,parrot.a',
		);
		# When building dynclasses we need to flag up the need to
		# mark shared variables with __declspec(dllimport).
		Configure::Data->set(
			cc_building_dynclass_flag => '-DPARROT_BUILDING_WIN32_DLL'
		);
	}
}
