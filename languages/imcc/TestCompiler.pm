package TestCompiler;
use strict;
use lib '../../lib';
use Parrot::Config;
require Test::Builder;

my $Builder = Test::Builder->new;

$| = 1;

sub import {
  my( $class, $plan, @args ) = @_;
  $Builder->plan( $plan, @args );
}

sub per_test {
  my ($ext,$count) = @_;
  my $t = $0;
  $t =~ s/\.t$/_$count$ext/;
  return $t;
}
# Map the Parrot::Test function to a Test::Builder method.
my %Test_Map = ( output_is   => 'is_eq',
                 output_isnt => 'isnt_eq',
                 output_like => 'like'
               );

my $count = 0;

sub generate_functions {
  my ($package, $directory) = @_;

  sub slurp_file {
    open SLURP, "< $_[0]";
    local $/ = undef;
    my $file = <SLURP> . '';
    $file =~ s/\cM\cJ/\n/g;
    $file =~ s/^\s*$//gm if ($_[1]);
    $file =~ s/[\t ]+/ /gm if ($_[1]);
    $file =~ s/[\t ]+$//gm if ($_[1]);
    close SLURP;
    return $file;
  }

  foreach my $func ( keys %Test_Map ) {
    no strict 'refs';

    *{$package.'::'.$func} = sub ($$;$) {
	my( $assembly, $output, $desc ) = @_;

	$count++;

	#set up default description
	(undef, my $file, my $line) = caller;
	unless ($desc) {
	    $desc = "($file line $line)";
	}

	my $by_f = per_test('.imc',$count);
	my $gen_pasm;
	$gen_pasm = 1 if ($by_f =~ m!/imcpasm/!);
	my $opt = '';
	$opt = "-O$1" if ($by_f =~ m!/imcpasm/opt(.)!);

	$output =~ s/\cM\cJ/\n/g;
	if ($gen_pasm) {
	    $output =~ s/^\s*$//gm;
	    $output =~ s/[\t ]+/ /gm;
	    $output =~ s/[\t ]+$//gm;
	}

	open IM, "> $by_f" or die "Unable to open '$by_f'";
	print IM $assembly;
	close IM;

	my $out_f = per_test('.out',$count);

	my $TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '';

	if ($gen_pasm) {
	    system("./imcc ${TEST_PROG_ARGS} $opt -o $out_f $by_f");
	}
	else {
	    system("./imcc -r ${TEST_PROG_ARGS} $by_f >$out_f");
	}

	my $meth = $Test_Map{$func};
	my $pass = $Builder->$meth( slurp_file($out_f, $gen_pasm),
	$output, $desc );

	unless($ENV{POSTMORTEM}) {
	    unlink $out_f;
	}

	return $pass;
    }
  }
}

generate_functions(caller, "./");

# vim:set sw=4:
1;
