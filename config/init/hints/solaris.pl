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

my $link = Configure::Data->get('link');
# Going to assume Sun's compiler
# In which case we need to link with the C++ compiler (CC) rather than the
# C compiler (cc)
$link =~ s/\bcc\b/CC/;
Configure::Data->set('link', $link);

# if it turns out we're using gcc, then we need to make sure we're linking
# with g++, not gcc.  We can't make this decision until later, because the
# gcc test hasn't been run yet.
my $solaris_cb = sub {
  my ($key, $gccversion) = @_;
  if ($gccversion) {
    Configure::Data->set('link', 'g++');
    Configure::Data->deltrigger("gccversion", "solaris_hints");
  }
};

Configure::Data->settrigger("gccversion", "solaris_hints", $solaris_cb);
