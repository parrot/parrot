# cygwin's perl is compiled with -lutil, which for some reason is not 
# in the standard installation, so we get rid of it
my $libs = Configure::Data->get('libs');
$libs =~ s/-lutil\b//g;

# A note about building shared libraries:  Perl5 uses the 'ld2' tool, which
# is installed as part of the perl5 installation.  So far, it appears
# parrot can get by with simply using gcc -shared, so we override the
# perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.
# If this later causes problems, it might be worth revisiting.
# A. Dougherty 9/9/2002
Configure::Data->set(
  ld => 'gcc',
  ld_shared => '-shared',
  libs => $libs,
);

#$_[2] is the inet_aton argument to Configure.
#XXX This is an evil, evil, evil hack.  If we ever have to duplicate it, it's
# time to design some new interfaces into Configure.
$_[2]=1 unless defined $_[2];
