my $libs = Configure::Data->get('libs');
if ($libs !~ /-lpthread/) {
    $libs .= ' -lpthread';
}

Configure::Data->set(
    libs => $libs,
    i_lib_pthread => 1,		# XXX fake a header entry
    linkflags     => '-Wl,-E',  # --export-dynamic, s. info gcc, ld
    link          => 'c++',
);

