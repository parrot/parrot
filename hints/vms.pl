use Cwd;
$c{ccflags} = "/Standard=Relaxed_ANSI/Prefix=All/Obj=.obj/NoList/NOANSI_ALIAS/include=([.include],\"/here\")";
if (!defined $c{exe}) {
  $c{exe} = "exe";
}
{
	local $^W;		#no warnings on redefinition

	*compiletestc=sub {
	        my $name;
		$name = shift;
		$name = "test" unless $name;
		system("$c{cc} $c{ccflags} $name.c") and die "C compiler died!";
		system("link/exe=test_siz $name") and die "Link failed!";
	};

	*runtestc=sub {
		`mcr []test_siz`
	};
}
