my($ccflags, $ldflags, $libs)=Configure::Data->get(qw(ccflags ldflags libs));

my $OSVers = `uname -r`;
chomp $OSVers;
{
    local $^W;
    if ($OSVers >= 7) {
	$libs =~ s/-ldl//;
    }
}

$ccflags .= " -pipe -fno-common -Wno-long-double ";
$ccflags =~ s/-flat_namespace\s*//;
$ldflags =~ s/-flat_namespace\s*//;
$ldflags .= " -flat_namespace ";

Configure::Data->set(
  ccflags => $ccflags,
  ldflags => $ldflags,
  ccwarn => "-Wno-shadow",
  libs => $libs,
  so => '.dylib',
  link => 'c++',
);
