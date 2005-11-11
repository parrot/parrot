# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

Configure::Data->set(
  ccflags => qq{/Standard=Relaxed_ANSI/Prefix=All/Obj=.obj/NoList/NOANSI_ALIAS/include="./include"},
  perl    => "MCR $^X",
  exe     => "exe"
);

{
  local $^W;		#no warnings on redefinition

  *Parrot::Configure::Step::cc_build=sub {
    system("$c{cc} $c{ccflags} test.c") and die "C compiler died!";
    system("link/exe=test test") and die "Link failed!";
  };

  *Parrot::Configure::Step::cc_run=sub {
    `mcr []test`
  };
}
