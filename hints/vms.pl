$c{ccflags} = "/Standard=Relaxed_ANSI/Prefix=All/Obj=.obj/NoList/NOANSI_ALIAS/include=[.include]";

{
	local $^W;		#no warnings on redefinition

	*compiletestc=sub {
		system("$c{cc} $c{ccflags} test.c") and die "C compiler died!";
		system("link/exe=test_siz test") and die "Link failed!";
	};

	*runtestc=sub {
		`mcr []test_siz`
	};
}