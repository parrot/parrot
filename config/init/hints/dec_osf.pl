# True64
my $ccflags = Configure::Data->get('ccflags');
if ( $ccflags !~ /-pthread/ ) {
    $ccflags .= ' -pthread';
}
Configure::Data->set(
    ccflags => $ccflags,
);

my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
Configure::Data->set(
    libs => $libs,
);

my $linkflags = Configure::Data->get('linkflags');
if ( $linkflags !~ /-shared/ ) {
    $linkflags = "-expect_unresolved '*' -O4 -msym -std $linkflags";
}
Configure::Data->set(
    linkflags => $linkflags,
);
