{
	my $is_msvc = grep { $c{cc} eq $_ } ( qw(cl cl.exe) );
	my $is_mingw = grep { $c{cc} eq $_ } ( qw(gcc gcc.exe) );

	$c{rm_f} = '$(PERL) -MExtUtils::Command -e rm_f';

	if( $is_msvc ) {
		$c{o} = '.obj';
		$c{ld_out} = '-out:';
		$c{cc_debug} = '-Zi';
		$c{ld_debug} = '-debug';
	}
	elsif( $is_mingw ) {
		$c{ld} = 'gcc';
		# if your perl is ActivePerl, then libs are .lib files,
		# not necessary, and gcc does not like them
		$c{libs} = ' ' if $c{libs} =~ m/\.lib\s/i;
	}
}