use Cwd;
$c{ccflags} = qq{/Standard=Relaxed_ANSI/Prefix=All/Obj=.obj/NoList/NOANSI_ALIAS/include="./include"};

$c{perl} = "MCR $c{perl}";

if (!defined $c{exe}) {
  $c{exe} = "exe";
}

{
	local $^W;		#no warnings on redefinition

	*compiletestc=sub {
	        my $name;
		$name = shift;
		$name = "test" unless $name;
        my $cmd = "$c{cc} $c{ccflags} $name.c";
		system($cmd) and die "C compiler died!  Command was '$cmd'";

        $cmd = "link/exe=test_siz $name";
		system($cmd) and die "Link failed!  Command was '$cmd'";
	};

	*runtestc=sub {
		`mcr []test_siz`
	};
}
