# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
if ( $libs !~ /-lrt\b/ ) {
    $libs .= ' -lrt';      # Needed for sched_yield.
}
Configure::Data->set(
    libs => $libs,
);

################################################################
my $link = Configure::Data->get('link');
# Going to assume Sun's compiler
# In which case we need to link with the C++ compiler (CC) rather than the
# C compiler (cc)
$link =~ s/\bcc\b/CC/;
Configure::Data->set('link', $link);

# if it turns out we're using gcc, then we need to make sure we're linking
# with g++, not gcc.  We can't make this decision until the gccversion test
# has been run.
my $solaris_link_cb = sub {
  my ($key, $gccversion) = @_;
  if ($gccversion) {
    Configure::Data->set('link', 'g++');
    Configure::Data->deltrigger("gccversion", "solaris_link");
  }
};
Configure::Data->settrigger("gccversion", "solaris_link", $solaris_link_cb);

################################################################
# Parrot usually aims for IEEE-754 compliance.
# For Solaris 8/Sun Workshop Pro 4, both
#    atan2( 0.0, -0.0) and atan2(-0.0, -0.0)
# return 0, when they should return +PI and -PI respectively.
# For Sun's compilers, fix this with the -xlibmieee flag.
# I don't know of an equivalent flag for gcc.
# (Alternatively, and more generally, perhahs we should run an
# ieee-conformance test and then call back into a hints-file trigger
# to set platform-specific flags.
#	A. Dougherty  7 March 2005
# We don't know which compiler we're using till after the gccversion test.
my $solaris_ieee_cb = sub {
    my ($key, $gccversion) = @_;
    if ($gccversion) {
	# Don't know how to do this for gcc.
    }
    else {
	my $linkflags = Configure::Data->get('linkflags');
	Configure::Data->add(' ', 'linkflags', '-xlibmieee')
		unless $linkflags =~ /-xlibmieee/;
    }
    Configure::Data->deltrigger("gccversion", "solaris_ieee");
};
Configure::Data->settrigger("gccversion", "solaris_ieee", $solaris_ieee_cb);
