package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

use Config;

$description = 'Determining what types Parrot should use...';

@args=qw(ask intval opcode floatval);

sub runstep {
  my %args;
  @args{@args}=@_;
  
  my $intval=$Config{ivtype}   || 'long';
  my $floatval=$Config{nvtype} || 'double';
  my $opcode=$Config{ivtype}   || 'long';
  
  $intval=$args{intval}     if defined $args{intval};
  $floatval=$args{floatval} if defined $args{floatval};
  $opcode=$args{opcode}     if defined $args{opcode};

  if($args{ask}) {
    $intval=prompt("\n\nHow big would you like your integers to be?", $intval);
    $floatval=prompt("And your floats?", $floatval);
    $opcode=prompt("What's your native opcode type?", $opcode);
    print "\n";
  }
  
  Configure::Data->set(
    iv       => $intval,
    nv       => $floatval,
    opcode_t => $opcode
  );
}

1;