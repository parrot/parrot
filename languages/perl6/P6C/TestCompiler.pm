package P6C::TestCompiler;

=head1 DESCRIPTION

A Module for test Perl6.

=head1 SYNOPSIS

See t/harness

=cut

use File::Basename qw(dirname);
use lib dirname($INC{'P6C/TestCompiler.pm'})."/../../regex/lib";

use Parrot::Config;
use Exporter;
require Parrot::Test;
require Test::Builder;
@EXPORT = ( qw(output_is output_like output_isnt) );
@ISA = qw(Exporter);

$| = 1;

sub dumperr {
    my $file = shift;

    my $name = "test-$file-$testno";
    open IN, $ERR;
    print STDERR <IN>;
    close IN;
    open O, ">$name.p6";
    print O $code;
    close O;
    open O, ">$name.out";
    print O $out;
    close O;
    for my $ext (qw(pasm pbc imc err)) {
	rename "a.$ext", "$name.$ext";
    }
    print STDERR "See $name.{p6,imc,pasm,pbc,out}, ",
	"and $name.err for errors\n";
}

sub import {
  my( $class, $plan, @args ) = @_;
  Test::Builder->plan( $plan, @args );

  __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

sub generate_pbc_for {
    my ($code, $package, $count) = @_;

    my $p6_f = Parrot::Test::per_test('.p6',$count);
    open P6, ">$p6_f";
    print P6 $code;
    close P6;
    my $imc_f  = Parrot::Test::per_test('.imc',$count);
    my $err_f  = Parrot::Test::per_test('.err',$count);
    my $pasm_f = Parrot::Test::per_test('.pasm',$count);
    my $pbc_f  = Parrot::Test::per_test('.pbc',$count);
    my $parrot = "..$PConfig{slash}..$PConfig{slash}parrot$PConfig{exe}";

    Parrot::Test::_run_command("$PConfig{perl} perl6 $p6_f --imc", 'STDERR' => $err_f);
    Parrot::Test::_run_command("$parrot -o $pasm_f $imc_f", 'STDERR' => $err_f);
    my $pasm;
    {
      open PASM, $pasm_f;
      local $/ = undef;
      $pasm = <PASM>;
      close PASM;
    }
    Parrot::Test::generate_code($pasm, $package, $count, $pbc_f);
}

Parrot::Test::generate_functions(__PACKAGE__, \&generate_pbc_for, "../../");

# vim:set sw=4:
1;
