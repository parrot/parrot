my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
if ( $libs !~ /-lrt\b/ ) {
    $libs .= ' -lrt';
}
Configure::Data->set(
    libs => $libs,
);

