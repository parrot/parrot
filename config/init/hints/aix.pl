my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthreads/ ) {
    $libs .= ' -lpthreads';
}
Configure::Data->set(
    libs => $libs,
);
