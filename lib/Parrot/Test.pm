package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA $TEST_PROG_ARGS);
use Parrot::Config;

# 5.005_03 Env.pm doesn't make its arguments immune from use strict 'vars';
use Env qw($TEST_PROG_ARGS);

require Exporter;
require Test::Builder;
require Test::More;
my $Builder = Test::Builder->new;

@EXPORT = ( qw(output_is   output_like   output_isnt),
            qw(c_output_is c_output_like c_output_isnt),
            qw(skip) );
@ISA = qw(Exporter);

sub import {
  my( $class, $plan, @args ) = @_;

  Test::Builder->plan( $plan, @args );

  __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
sub _run_command {
  my( $command, %redir ) = @_;
  
  foreach (keys %redir) {
    /^STD(OUT|ERR)$/ or die "I don't know how to redirect '$_' yet! ";
  }
  foreach (values %redir) {
    $_ = 'NUL:' if $^O eq 'MSWin32' and $_ eq '/dev/null';
  }

  my $out = $redir{'STDOUT'} || '';
  my $err = $redir{'STDERR'} || '';

  if ( $out and $err and $out eq $err ) {
    $err = "&STDOUT";
  }

  local *OLDOUT if $out;
  local *OLDERR if $err;

  # Save the old filehandles; we must not let them get closed.
  open  OLDOUT, ">&STDOUT" or die "Can't save     stdout" if $out;
  open  OLDERR, ">&STDERR" or die "Can't save     stderr" if $err;

  open  STDOUT, ">$out"    or die "Can't redirect stdout" if $out;
  open  STDERR, ">$err"    or die "Can't redirect stderr" if $err;

  system $command;
  my $exit_code = $? >> 8;

  close STDOUT             or die "Can't close    stdout" if $out;
  close STDERR             or die "Can't close    stderr" if $err;
                                                                 
  open  STDOUT, ">&OLDOUT" or die "Can't restore  stdout" if $out;
  open  STDERR, ">&OLDERR" or die "Can't restore  stderr" if $err;

  return $exit_code;
}


sub per_test {
  my ($ext,$count) = @_;
  my $t = $0;
  $t =~ s/\.t$/_$count$ext/;
  return $t;
}

sub generate_pbc_for {
  my ($assembly,$directory,$count) = @_;
  local( *ASSEMBLY, *OUTPUT );
  my $as_f = per_test('.pasm',$count);
  my $by_f = per_test('.pbc',$count);

  my $can_skip_compile = $ENV{PARROT_QUICKTEST};
  if ($by_f =~ /native_pbc/) {
      $can_skip_compile = 1;	# i.e. must skip
  }
  elsif ($can_skip_compile)
  {
    open INASSEMBLY, "$as_f" or $can_skip_compile = 0;
    if ($can_skip_compile) {
      local $/ = undef;
      my $inassembly = <INASSEMBLY>;
      close INASSEMBLY;
      $can_skip_compile = 0 if ($assembly ne $inassembly);
      $can_skip_compile = 0 if (not -e $by_f);
    }
  }

  if (!$can_skip_compile) {
      open ASSEMBLY, "> $as_f" or die "Unable to open '$as_f'";
      binmode ASSEMBLY;
      print ASSEMBLY $assembly;
      close ASSEMBLY;
      unless($ENV{IMCC}) {
        my $cmd = "$PConfig{perl} ${directory}assemble.pl -o $by_f $as_f";
        my $exit_code = _run_command($cmd);
        $Builder->diag("'$cmd' failed with exit code $exit_code") if $exit_code;
      }

  }
}

# Map the Parrot::Test function to a Test::Builder method.
my %Test_Map = ( output_is   => 'is_eq',
                 output_isnt => 'isnt_eq',
                 output_like => 'like'
               );

my $count = 0;

*skip = \&Test::More::skip;

sub generate_functions {
  my ($package, $pbc_generator, $directory) = @_;

  sub slurp_file {
    open SLURP, "< $_[0]" or die "open '$_[0]': $!";
    local $/ = undef;
    my $file = <SLURP> . '';
    $file =~ s/\cM\cJ/\n/g;
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

	$output =~ s/\cM\cJ/\n/g;

	#generate pbc for this test (may be overriden)
	my $imcc;
	my $out_f = per_test('.out',$count);
	$TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '';
	$pbc_generator->( $assembly, $directory, $count );
        my $cmd;
	if (($imcc = $ENV{IMCC})) {
	    my $as_f = per_test('.pasm',$count);

	    if ($as_f =~ /native_pbc/) {
		$as_f = per_test('.pbc',$count);
	    }
	    $cmd = "$imcc ${TEST_PROG_ARGS} $as_f";
	}
	else {

	    my $by_f = per_test('.pbc',$count);

            $cmd = "${directory}$PConfig{test_prog} ${TEST_PROG_ARGS} $by_f";
	}
        my $exit_code = _run_command($cmd, STDOUT => $out_f, STDERR => $out_f);


	my $meth = $Test_Map{$func};
	my $pass = $Builder->$meth( slurp_file($out_f), $output, $desc );
	$Builder->diag("'$cmd' failed with exit code $exit_code")
	  if $exit_code and not $pass;

	unless($ENV{POSTMORTEM}) {
	    unlink $out_f;
	}

	return $pass;
    }
  }

  my %C_Test_Map = ( c_output_is   => 'is_eq',
                     c_output_isnt => 'isnt_eq',
                     c_output_like => 'like'
                   );

  foreach my $func ( keys %C_Test_Map ) {
    no strict 'refs';

    *{$package.'::'.$func} = sub ($$;$ ) {
      my( $source, $output, $desc ) = @_;

      ++$count;

      $output =~ s/\cM\cJ/\n/g;
      local( *SOURCE );
      my $source_f = per_test('.c',$count);
      my $obj_f = per_test($PConfig{o},$count);
      my $exe_f = per_test($PConfig{exe},$count);
      $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
      my $out_f = per_test('.out',$count);
      my $build_f = per_test('.build',$count);

      open SOURCE, "> $source_f" or die "Unable to open '$source_f'";
      binmode SOURCE;
      print SOURCE "/* DO NOT EDIT - Autogenerated test file */\n"; 
      print SOURCE $source;
      close SOURCE;

      my $libparrot = $PConfig{blib_lib_libparrot_a};
      $libparrot =~ s/\$\(A\)/$PConfig{a}/;

      my ($cmd, $exit_code);
      $cmd = "$PConfig{cc} $PConfig{ccflags} $PConfig{cc_debug} -I./include -c " .
             "$PConfig{cc_o_out}$obj_f $source_f";
      $exit_code = _run_command($cmd, 'STDOUT' => $build_f, 'STDERR' => $build_f);
      $Builder->diag("'$cmd' failed with exit code $exit_code") if $exit_code;
      
      $cmd = "$PConfig{link} $PConfig{linkflags} $PConfig{ld_debug} $obj_f " .
             "$PConfig{ld_out}$exe_f $libparrot $PConfig{libs}";
      $exit_code = _run_command($cmd, 'STDOUT' => $build_f, 'STDERR' => $build_f);
      $Builder->diag("'$cmd' failed with exit code $exit_code") if $exit_code;
      

      if (! -e $exe_f) {
	$Builder->diag("Failed to build '$exe_f': " . slurp_file($build_f));
	unlink $build_f;
	return 0;
      }

      $cmd       = ".$PConfig{slash}$exe_f";
      $exit_code = _run_command($cmd, 'STDOUT' => $out_f, 'STDERR' => $out_f);

      my $meth = $C_Test_Map{$func};
      my $pass = $Builder->$meth( slurp_file($out_f), $output, $desc );
      $Builder->diag("'$cmd' failed with exit code $exit_code")
        if $exit_code and not $pass;

      unless($ENV{POSTMORTEM}) {
        unlink $out_f;
	unlink $build_f;
      }
      return $pass;
    }
  }
}

Parrot::Test::generate_functions(__PACKAGE__,\&generate_pbc_for,
                                 $^O eq 'MSWin32' ? '.\\' : "./");

1;
