package Miniperl::Test;

use strict;
use vars qw(@EXPORT @ISA);
use lib '../..';
use Parrot::Config;

require Exporter;
require Test::More;

@EXPORT = ( qw(output_is output_like output_isnt), @Test::More::EXPORT );
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

  system "$^X -e \"$redir_string;system q{$command};\"";
}

my $count;

foreach my $i ( qw(is isnt like) ) {
  no strict 'refs';

  *{"Miniperl::Test::output_$i"} = sub ($$;$) {
    ++$count;
    my( $assembly, $output, $desc ) = @_;
    local( *SCHEME, *OUTPUT ); # JMG
    my( $scheme_f, $as_f, $by_f, $out_f ) = map { # JMG
      my $t = $0; $t =~ s/\.t$/$count\.$_/; $t
    } ( qw(mpl pasm pbc out) ); # JMG

    open SCHEME, "> $scheme_f" or die "Unable to open '$scheme_f'"; # JMG
    binmode SCHEME; # JMG
    print SCHEME $assembly; # JMG
    close SCHEME; # JMG

    _run_command("./miniperlc $scheme_f >$as_f"); # JMG
    _run_command("(cd ../.. ; $PConfig{perl} assemble.pl languages/miniperl/$as_f --output languages/miniperl/$by_f)"); # JMG
    _run_command( "(cd ../.. ; ./$PConfig{test_prog} languages/miniperl/$by_f)", 'STDOUT' => $out_f, 'STDERR' => $out_f); # JMG

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
    if( $ok ) { foreach my $i ( $scheme_f, $as_f, $by_f, $out_f ) { unlink $i } } # JMG
  }
}

1;
