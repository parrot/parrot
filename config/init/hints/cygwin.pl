# A note about building shared libraries:  Perl5 uses the 'ld2' tool, which
# is installed as part of the perl5 installation.  So far, it appears
# parrot can get by with simply using gcc -shared, so we override the
# perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.
# If this later causes problems, it might be worth revisiting.
# A. Dougherty 9/9/2002
Configure::Data->set(
  ld => 'gcc',
  ld_shared => '-shared',
);
