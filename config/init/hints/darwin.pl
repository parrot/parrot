my($ccflags, $ldflags, $libs)=Configure::Data->get(qw(ccflags ldflags libs));

$ccflags .= " -pipe -fno-common ";
$ccflags =~ s/-flat_namespace\s*//;
$ldflags =~ s/-flat_namespace\s*//;
$ldflags .= " -flat_namespace ";
$libs    .= " -ldl ";

Configure::Data->set(
  ccflags => $ccflags,
  ldflags => $ldflags,
  cc_warn => "-Wno-shadow",
  libs => $libs
);
