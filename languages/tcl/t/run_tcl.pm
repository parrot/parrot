#! perl -w
use lib '../../../lib';
use Parrot::Config;

@EXPORT = qw(output);
sub output {
  my $tcl = shift;
  my $sl = $PConfig{slash};
  my $exe = $PConfig{exe};
  my $PARROT = "..$sl..$sl..${sl}parrot$exe";
  open (TCL,">test.tcl");
  print TCL $tcl;
  close (TCL);
  return `$PARROT ..${sl}tcl.pbc test.tcl`;
}
