$c{ccflags} .= " -I/sw/include";
$c{ccflags} =~ s/-flat_namespace\s*//;
$c{ldflags} .= " -L/sw/lib -flat_namespace ";
$c{libs} .= " -ldl";
$c{cc_warn} = "-Wno-shadow"
