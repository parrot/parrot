my $libs = Configure::Data->get('libs');
my $cflags = Configure::Data->get('ccflags');
my $cc = Configure::Data->get('cc');
my $linkflags = Configure::Data->get('linkflags');
my $link = 'c++'; # should find g++ in most cases

if ($libs !~ /-lpthread/) {
    $libs .= ' -lpthread';
}
my $ld_shared = Configure::Data->get('ld_shared');
if ( $ld_shared !~ /-fPIC/ ) {
    $ld_shared .= ' -fPIC';
}

if ( $cc =~ /icc/ ) {
    $link = 'icc'; # Intel C++ compiler has the same name as its C compiler
    $cflags .= ' -no-gcc'; # don't allow icc to pretend it's gcc
    $cflags .= ' -wd269'; # suppress sprintf warnings that don't apply
}
else {
    $linkflags .= ' -Wl,-E';  # --export-dynamic, s. info gcc, ld
}

Configure::Data->set(
    ccflags => $cflags,
    libs => $libs,
    ld_shared     => $ld_shared,
    i_lib_pthread => 1,		# XXX fake a header entry
    linkflags     => $linkflags,
    link          => $link,
);
