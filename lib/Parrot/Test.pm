package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA);
use Parrot::Config;

require Exporter;
require Test::Builder;
my $Builder = Test::Builder->new;

@EXPORT = ( qw(output_is output_like output_isnt) );
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

  system "$^X -e \"$redir_string;system q{$command};\"";
  my $exit_code = $? / 256;
  $Builder->diag("'$command' failed with exit code $exit_code") if $exit_code;
}

my $count;

# Map the Parrot::Test function to a Test::Builder method.
my %Test_Map = ( output_is   => 'is_eq', 
                 output_isnt => 'isnt_eq', 
                 output_like => 'like' 
               );

foreach my $func ( keys %Test_Map ) {
  no strict 'refs';

  *{'Parrot::Test::'.$func} = sub ($$;$) {
    ++$count;
    my( $assembly, $output, $desc ) = @_;
    $output =~ s/\cM\cJ/\n/g;
    local( *ASSEMBLY, *OUTPUT );
    my( $as_f, $by_f, $out_f ) = map {
      my $t = $0; $t =~ s/\.t$/$count\.$_/; $t
    } ( qw(pasm pbc out) );

    open ASSEMBLY, "> $as_f" or die "Unable to open '$as_f'";
    binmode ASSEMBLY;
    print ASSEMBLY $assembly;
    close ASSEMBLY;

    _run_command( "$PConfig{perl} assemble.pl $as_f --output $by_f" );
    _run_command( "./$PConfig{test_prog} $by_f", 'STDOUT' => $out_f, 'STDERR' => $out_f);

    my $prog_output;
    open OUTPUT, "< $out_f";
    {
      local $/ = undef;
      $prog_output = <OUTPUT>;
      $prog_output =~ s/\cM\cJ/\n/g;
    }
    close OUTPUT;

    my $meth = $Test_Map{$func};
    my $pass = $Builder->$meth( $prog_output, $output, $desc );

    unless($ENV{POSTMORTERM}) {
      foreach my $i ( $as_f, $by_f, $out_f ) {
        unlink $i;
      }
    }

    return $pass;
  }
}

1;



