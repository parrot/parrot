my($ccflags, $ldflags)=Configure::Data->get(qw(ccflags ldflags));

$ccflags .= " -pipe -fno-common -Wno-long-double ";
$ccflags =~ s/-flat_namespace\s*//;
$ldflags =~ s/-flat_namespace\s*//;
$ldflags .= " -flat_namespace ";

Configure::Data->set(
  ccflags => $ccflags,
  ldflags => $ldflags,
  ccwarn => "-Wno-shadow",
);
