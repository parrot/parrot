#

package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA);
use Parrot::Config;

require Exporter;
require Test::More;

@EXPORT = ( qw(output_is), @Test::More::EXPORT );
@ISA = qw(Exporter Test::More);

sub import {
  my( $class, $plan, @args ) = @_;

  Test::More->import( $plan, @args );

  __PACKAGE__->_export_to_level( 2, __PACKAGE__ );
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

  system "$^X -e \"$redir_string;system qq{$command};\"";
}

my $count;

foreach my $i ( qw(is isnt like) ) {
  no strict 'refs';

  *{"Parrot::Test::output_$i"} = sub ($$;$) {
    ++$count;
    my( $assembly, $output, $desc ) = @_;
    local( *ASSEMBLY, *OUTPUT );
    my( $as_f, $by_f, $out_f ) = map {
      my $t = $0; $t =~ s/\.t$/$count\.$_/; $t
    } ( qw(pasm pbc out) );

    open ASSEMBLY, "> $as_f" or die "Unable to open '$as_f'";
    binmode ASSEMBLY;
    print ASSEMBLY $assembly;
    close ASSEMBLY;

    _run_command( "$PConfig{perl} assemble.pl $as_f --output $by_f" );
    _run_command( "./test_prog $by_f", 'STDOUT' => $out_f );

    my $prog_output;
    open OUTPUT, "< $out_f";
    {
      local $/ = undef;
      $prog_output = <OUTPUT>;
    }
    close OUTPUT;

    @_ = ( $prog_output, $output, $desc );
    #goto &{"Test::More::$i"};
    my $ok = &{"Test::More::$i"}( @_ );
    if( $ok ) { foreach my $i ( $as_f, $by_f, $out_f ) { unlink $i } }
  }
}

1;

