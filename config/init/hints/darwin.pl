my($ccflags, $ldflags, $libs)=Configure::Data->get(qw(ccflags ldflags libs));

$ccflags .= " -I/sw/include ";
$ccflags =~ s/-flat_namespace\s*//;
$ldflags =~ s/-flat_namespace\s*//;
$ldflags .= " -L/sw/lib -flat_namespace ";
$libs    .= " -ldl ";

Configure::Data->set(
  ccflags => $ccflags,
  ldflags => $ldflags,
  cc_warn => " -Wno-shadow "
);
