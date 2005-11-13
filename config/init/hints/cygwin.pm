# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

# cygwin's perl is compiled with -lutil, which for some reason is not 
# in the standard installation, so we get rid of it
my $libs = Parrot::Configure::Data->get('libs');
$libs =~ s/-lutil\b//g;

# A note about building shared libraries:  Perl5 uses the 'ld2' tool, which
# is installed as part of the perl5 installation.  So far, it appears
# parrot can get by with simply using gcc -shared, so we override the
# perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.
# If this later causes problems, it might be worth revisiting.
# A. Dougherty 9/9/2002
Parrot::Configure::Data->set(
  ld => 'gcc',
  ld_share_flags => '-shared',
  ld_load_flags => '-shared',
  libs => $libs,
);

#We need to define inet_aton on Cygwin.  The contents of the --define switch 
# are in $_[2].
# XXX EVIL EVIL EVIL HACK.  If you need to do this elsewhere, please do 
# everyone a favor and write a proper interface for modifying the command-line
# args, or even better do something to make the define interface not suck.
unless($_[2]) {
  $_[2]='inet_aton';
}
elsif($_[2] !~ /inet_[ap]ton/) {
  $_[2]=join(',', 'inet_aton', $_[2]);
}
