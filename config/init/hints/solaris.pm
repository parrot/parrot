# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$
use Parrot::Configure::Step qw(cc_gen cc_run);

my $libs = Parrot::Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
if ( $libs !~ /-lrt\b/ ) {
    $libs .= ' -lrt';      # Needed for sched_yield.
}
Parrot::Configure::Data->set(
    libs => $libs,
);

################################################################
# If we're going to be using ICU (or any other C++-compiled library) we
# need to use the c++ compiler as a linker.  As soon as the user
# selects a compiler, we will run the gccversion test.  (If we were to
# wait till it's normally run, the linker question would have already
# been asked.)
my $solaris_link_cb = sub {
    use Carp;
    my ($key, $cc) = @_;
    my %gnuc;
    my $link = Parrot::Configure::Data->get('link');
    cc_gen("config/auto/gcc/test_c.in");
    # Can't call cc_build since we haven't set all the flags yet.
    # This should suffice for this test.
    Parrot::Configure::Step::_run_command("$cc -o test test.c", 'test.cco', 'test.cco')
        and confess "C compiler failed (see test.cco)";
    %gnuc=eval cc_run() or die "Can't run the test program: $!";
    if (defined $gnuc{__GNUC__}) {
	$link = 'g++';
    }
    else {
	$link =~ s/\bcc\b/CC/;
    }
    Parrot::Configure::Data->set('link', $link);
    Parrot::Configure::Data->deltrigger("cc", "solaris_link");
};
Parrot::Configure::Data->settrigger("cc", "solaris_link", $solaris_link_cb);

################################################################
# cc_shared:  Flags to instruct the compiler to use position-independent
# code for use in shared libraries.  -KPIC for Sun's compiler, -fPIC for
# gcc.  We don't know which compiler we're using till after the
# gccversion test.
# XXX Should this go into the shlibs.pl Configure.pl unit instead?
my $solaris_cc_shared_cb = sub {
    my ($key, $gccversion) = @_;
    if ($gccversion) {
	Parrot::Configure::Data->set('cc_shared', '-fPIC');
    }
    else {
	Parrot::Configure::Data->set('cc_shared', '-KPIC');
    }
    Parrot::Configure::Data->deltrigger("gccversion", "solaris_cc_shared");
};
Parrot::Configure::Data->settrigger("gccversion", "solaris_cc_shared", 
			$solaris_cc_shared_cb);

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
	my $linkflags = Parrot::Configure::Data->get('linkflags');
	Parrot::Configure::Data->add(' ', 'linkflags', '-xlibmieee')
		unless $linkflags =~ /-xlibmieee/;
    }
    Parrot::Configure::Data->deltrigger("gccversion", "solaris_ieee");
};
Parrot::Configure::Data->settrigger("gccversion", "solaris_ieee", $solaris_ieee_cb);
