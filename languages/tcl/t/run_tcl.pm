#! perl -w
use lib '../../../lib';
use Parrot::Config;

package run_tcl;
@ISA = qw(Exporter);
@EXPORT = qw(output obj_ref);

$obj_ref = bless {};

#sub new { bless {}; }

my $file = "test.tcl";
sub output {
  my $tcl = shift;
  my $sl = $::PConfig{slash};
  my $exe = $::PConfig{exe};
  my $PARROT = "..${sl}..${sl}parrot$exe";
  open (TCL,">$file");
  print TCL $tcl;
  close (TCL);
  return `(cd .. && $PARROT tcl.pbc t/$file)`;
}

DESTROY {
  unlink($file);
}
