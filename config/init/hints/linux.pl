my $libs = Configure::Data->get('libs');
my $cflags = Configure::Data->get('ccflags');
if ($libs !~ /-lpthread/) {
    $libs .= ' -lpthread';
}

$cflags = "-falign-functions=8 " . $cflags;

Configure::Data->set(
    ccflags => $cflags,
    libs => $libs,
    i_lib_pthread => 1,		# XXX fake a header entry
    linkflags     => '-Wl,-E',  # --export-dynamic, s. info gcc, ld
    link          => 'c++',
);

