my $libs = Configure::Data->get('libs');
my $cflags = Configure::Data->get('ccflags');
if ($libs !~ /-lpthread/) {
    $libs .= ' -lpthread';
}
my $ld_shared = Configure::Data->get('ld_shared');
if ( $ld_shared !~ /-fPIC/ ) {
    $ld_shared .= ' -fPIC';
}

Configure::Data->set(
    ccflags => $cflags,
    libs => $libs,
    ld_shared     => $ld_shared,
    i_lib_pthread => 1,		# XXX fake a header entry
    linkflags     => '-Wl,-E',  # --export-dynamic, s. info gcc, ld
    link          => 'c++',
);

