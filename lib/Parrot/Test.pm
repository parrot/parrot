package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA $TEST_PROG_ARGS);
use Parrot::Config;

# 5.005_03 Env.pm doesn't make its arguments immune from use strict 'vars';
use Env qw($TEST_PROG_ARGS);

require Exporter;
require Test::Builder;
my $Builder = Test::Builder->new;

@EXPORT = ( qw(output_is   output_like   output_isnt),
            qw(c_output_is c_output_like c_output_isnt) );
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
  my( $redir_string ) = '';

  while( my @dup = each %redir ) {
    my( $from, $to ) = @dup;
    if( $to eq 'STDERR' ) { $to = "qq{>&STDERR}" }
    elsif( $to eq 'STDOUT' ) { $to = "qq{>&STDOUT}" }
    elsif( $to eq '/dev/null' ) { $to = ( $^O eq 'MSWin32' ) ?
                                      'qq{> NUL:}' : "qq{> $to}" }
    else { $to = "qq{> $to}" }

    $redir_string .= "open $from, $to;"
  }

  system "$^X -e \"$redir_string;system q{$command};exit (\$?>>8)\"";
  my $exit_code = $? >> 8;
  $Builder->diag("'$command' failed with exit code $exit_code") if $exit_code;
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
  if ($can_skip_compile)
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

    _run_command( "$PConfig{perl} ${directory}assemble.pl $as_f --output $by_f" );
  }
}

# Map the Parrot::Test function to a Test::Builder method.
my %Test_Map = ( output_is   => 'is_eq',
                 output_isnt => 'isnt_eq',
                 output_like => 'like'
               );

my $count = 0;

sub generate_functions {
  my ($package, $pbc_generator, $directory) = @_;
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
      $pbc_generator->( $assembly, $directory, $count );

      my $by_f = per_test('.pbc',$count);
      my $out_f = per_test('.out',$count);

      $TEST_PROG_ARGS = "" unless defined $TEST_PROG_ARGS;
      _run_command( "${directory}$PConfig{test_prog} ${TEST_PROG_ARGS} $by_f", 'STDOUT' => $out_f, 'STDERR' => $out_f);

      my $prog_output;
      open OUTPUT, "< $out_f";
      {
        local $/ = undef;
        $prog_output = <OUTPUT> . '';
        $prog_output =~ s/\cM\cJ/\n/g;
      }
      close OUTPUT;

      my $meth = $Test_Map{$func};
      my $pass = $Builder->$meth( $prog_output, $output, $desc );

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

    *{$package.'::'.$func} = sub ($$;$) {
      my( $source, $output, $desc ) = @_;

      ++$count;

      $output =~ s/\cM\cJ/\n/g;
      local( *SOURCE );
      my $source_f = per_test('.c',$count);
      my $obj_f = per_test($PConfig{o},$count);
      my $exe_f = per_test($PConfig{exe},$count);
      $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
      my $out_f = per_test('.out',$count);

      open SOURCE, "> $source_f" or die "Unable to open '$source_f'";
      binmode SOURCE;
      print SOURCE $source;
      close SOURCE;

      _run_command("$PConfig{cc} $PConfig{ccflags} -I./include -c $PConfig{cc_o_out}$obj_f $source_f");
      _run_command("$PConfig{link} $PConfig{linkflags} $obj_f $PConfig{ld_out}$exe_f blib/lib/libparrot$PConfig{a} $PConfig{libs}");
      my $prog_output;
      _run_command(".$PConfig{slash}$exe_f", 'STDOUT' => $out_f, 'STDERR' => $out_f);

      open OUTPUT, "< $out_f";
      {
        local $/ = undef;
        $prog_output = <OUTPUT> . '';
        $prog_output =~ s/\cM\cJ/\n/g;
      }
      close OUTPUT;

      my $meth = $C_Test_Map{$func};
      my $pass = $Builder->$meth( $prog_output, $output, $desc );

      unless($ENV{POSTMORTEM}) {
        unlink $out_f;
      }
      return $pass;
    }
  }
}

Parrot::Test::generate_functions(__PACKAGE__,\&generate_pbc_for,"./");

1;
