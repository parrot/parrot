#!/usr/bin/perl
use lib qw(../../../lib);
use Parrot::Config;

package run_pir;
@ISA = qw(Exporter);
@EXPORT = qw(output);

$obj_ref = new run_pir();

sub new { bless {}; }

# write calling code as if it were going to be executed in the top level
# parrot directory (due to relative inc pathing.)

my $file = "test.imc";

sub output {
  my $pir = shift;
  my $sl = $::PConfig{slash};
  my $exe = $::PConfig{exe};
  my $PARROT = "parrot$exe";
  open (PIR,">$file");
  print PIR $pir;
  close (PIR);
  $cmd = "(cd ../../.. && $PARROT languages/tcl/t/$file)";
  return `$cmd`;
}

DESTROY {
  unlink($file); 
}
