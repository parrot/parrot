$c{ccflags} .= " -I/sw/include";
$c{ldflags} .= " -L/sw/lib ";
$c{libs} .= " -ldl";
$c{cc_warn} = "-Wno-shadow"
