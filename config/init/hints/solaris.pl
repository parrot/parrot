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

# my $cc = Configure::Data->get('cc');
my $link = Configure::Data->get('link');
if (Configure::Data->get('gccversion')) {
    Configure::Data->set('link', 'c++');
} else {
    # Going to assume Sun's compiler
    # In which case we need to link with the C++ compiler (CC) rather than the
    # C compiler (cc)
    $link =~ s/\bcc\b/CC/;
    Configure::Data->set('link', $link);
}
