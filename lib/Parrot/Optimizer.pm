package Parrot::Optimizer;

use strict;
use Data::Dumper;

sub new {
  bless {},shift;
}

sub read {
  my $self = shift;
  my $file = shift;

  unless(open INPUT,"< $file") {
    warn "Could not open <$file: $!\n";
    return;
  }
  while(<INPUT>) {
    chomp;
    push @{$self->{text}},$_;
  }
  close INPUT;
  $self->_parse;
}

sub _parse {
  my $self = shift;

  for(@{$self->{text}}) {
    if(/^\s*#/) {
      push @{$self->{lines}},{comment=>1,value=>$_};
      next;
    }
    if(/^\s*$/) {
      push @{$self->{lines}},{blank=>1};
      next;
    }
    my $line={};

    # Line will have the following format:
    #
    # {label}? {instruction} {instruction_parameters}? 
    #
    s/^\s+//;
    if(s/^(\w+):\s+//) {
      $line->{label} = $1;
    }
    if(s/^(\w+)\s*//) {
      $line->{instruction} = $1;
    }

    #
    # Collect arbitrary parameters
    #
    while(/\S/) {
      if(s/^([a-zA-Z][a-zA-Z0-9]+)//) {                # global label
        push @{$line->{parameter}},{type=>'label_global',value=>$1};
      }
      elsif(s/^(\$\w+)//) {                            # local label
        push @{$line->{parameter}},{type=>'label_local',value=>$1};
      }
      elsif(s/^([INSP]\d+\b)//) {                      # Register name
        push @{$line->{parameter}},{type=>'register',value=>$1};
      }
      elsif(s/^(-?\d+)(?!\.)//) {                      # integer
        push @{$line->{parameter}},{type=>'constant_i',value=>$1};
      }
      elsif(s/^(-?\d+\.\d+)//) {                       # float
        push @{$line->{parameter}},{type=>'constant_n',value=>$1};
      }
      elsif(s/^("(?:[^\\"]|(?:\\(?>["tnr\\])))*")// or # single-quoted string
            s/^('(?:[^\\']|(?:\\(?>['tnr\\])))*')//) { # double-quoted string
        push @{$line->{parameter}},{type=>'constant_s',value=>$1};
      }
      s/^\s+//; # Remove the optional whitespace between parameters
      s/^,//;   # Remove the optional comma
    }

    push @{$self->{lines}},$line;
  }
}

sub _constant_fold {
  my $self = shift;
  my $inst = shift;
  return unless $inst->{parameter};
  return unless @{$inst->{parameter}}>=3;
  return unless $inst->{parameter}[1]{type} =~ /^constant/;
  if($inst->{parameter}[2]{type} =~/^label/) {
    return unless $inst->{parameter}[0]{type} =~ /^constant/;
  }
  else {
    return unless $inst->{parameter}[2]{type} =~ /^constant/;
  }

  my $instruction = $inst->{instruction};
  if($instruction eq 'add') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => $inst->{parameter}[1]{type},
                             value => $inst->{parameter}[1]{value} +
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'sub') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => $inst->{parameter}[1]{type},
                             value => $inst->{parameter}[1]{value} -
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'mul') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => $inst->{parameter}[1]{type},
                             value => $inst->{parameter}[1]{value} *
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'div') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => $inst->{parameter}[1]{type},
                             value => $inst->{parameter}[1]{value} /
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'mod') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => $inst->{parameter}[1]{type},
                             value => $inst->{parameter}[1]{value} %
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'concat') {
    $inst->{instruction} = 'set';
    $inst->{parameter} = [ $inst->{parameter}[0],
                           { type  => 'constant_s',
                             value => $inst->{parameter}[1]{value} .
                                      $inst->{parameter}[2]{value}
                           }
                         ];
    return 1;
  }
  elsif($instruction eq 'eq') {
    if($inst->{parameter}[0]{value} == $inst->{parameter}[1]{value}) {
      $inst->{instruction} = 'branch';
      $inst->{parameter} = [ $inst->{parameter}[2],
                           ];
    }
    else {
      $inst->{instruction} = 'noop';
      $inst->{parameter} = undef;
    }
    return 1;
  }
  elsif($instruction eq 'leq') {
    if($inst->{parameter}[0]{value} <= $inst->{parameter}[1]{value}) {
      $inst->{instruction} = 'branch';
      $inst->{parameter} = [ $inst->{parameter}[2],
                           ];
    }
    else {
      $inst->{instruction} = 'noop';
      $inst->{parameter} = undef;
    }
    return 1;
  }
  elsif($instruction eq 'geq') {
    if($inst->{parameter}[0]{value} >= $inst->{parameter}[1]{value}) {
      $inst->{instruction} = 'branch';
      $inst->{parameter} = [ $inst->{parameter}[2],
                           ];
    }
    else {
      $inst->{instruction} = 'noop';
      $inst->{parameter} = undef;
    }
    return 1;
  }
  return undef;
}

sub _strength_reduce {
  my $self = shift;
  my $inst = shift;

  if($inst->{instruction} eq 'mul') {
    #
    # 'mul Im,0,In' => 'set Im,0'
    #
    if($inst->{parameter}[1]{type} =~ /^constant/ and
       $inst->{parameter}[2]{type} eq 'register' and
       $inst->{parameter}[1]{value} == 0)
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             { type  => $inst->{parameter}[0]{type},
                               value => $inst->{parameter}[0]{value} =~ /^I/ ? 0 : 0.0}
                           ];
      return 1;
    }
    #
    # 'mul Im,In,0' => 'set Im,0'
    #
    if($inst->{parameter}[2]{type} =~ /^constant/ and
       $inst->{parameter}[1]{type} eq 'register' and
       $inst->{parameter}[2]{value} == 0)
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             { type  => $inst->{parameter}[1]{type},
                               value => $inst->{parameter}[0]{value} =~ /^I/ ? 0 : 0.0}
                        ];
      return 1;
    }
    #
    # 'mul Im,1,In' => 'set Im,In'
    #
    if($inst->{parameter}[1]{type} =~ /^constant/ and
       $inst->{parameter}[2]{type} eq 'register' and
       $inst->{parameter}[1]{value} == 1)
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             $inst->{parameter}[2],
                           ];
      return 1;
    }
    #
    # 'mul Im,In,1' => 'set Im,In'
    #
    if($inst->{parameter}[2]{type} =~ /^constant/ and
       $inst->{parameter}[1]{type} eq 'register' and
       $inst->{parameter}[2]{value} == 0)
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             $inst->{parameter}[1],
                           ];
      return 1;
    }
    #
    # 'mul Im,2,In' => 'add Im,In,In'
    #
    if($inst->{parameter}[1]{type} =~ /^constant/ and
       $inst->{parameter}[2]{type} eq 'register' and
       $inst->{parameter}[1]{value} == 2)
    {
      $inst->{instruction} = 'add';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             $inst->{parameter}[2],
                             $inst->{parameter}[2],
                           ];
      return 1;
    }
    #
    # 'mul Im,In,2' => 'add Im,In,In'
    #
    if($inst->{parameter}[2]{type} =~ /^constant/ and
       $inst->{parameter}[1]{type} eq 'register' and
       $inst->{parameter}[2]{value} == 2)
    {
      $inst->{instruction} = 'add';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             $inst->{parameter}[1],
                             $inst->{parameter}[1],
                           ];
      return 1;
    }
  }
  elsif($inst->{instruction} eq 'div') {
    #
    # 'div Im,0,In' => 'set Im,0'
    #
    if($inst->{parameter}[1]{type} =~ /^constant/ and
       $inst->{parameter}[1]{value} == 0          and
       $inst->{parameter}[2]{type} eq 'register')
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             { type  => $inst->{parameter}[0]{type},
                               value => $inst->{parameter}[0]{value} =~ /^I/ ? 0 : 0.0}
                           ];
      return 1;
    }
    #
    # 'div Im,In,In' => 'set Im,1'
    #
    if($inst->{parameter}[1]{type} eq 'register' and
       $inst->{parameter}[1]{value} eq $inst->{parameter}[2]{value})
    {
      $inst->{instruction} = 'set';
      $inst->{parameter} = [ $inst->{parameter}[0],
                             { type  => $inst->{parameter}[0]{type},
                               value => $inst->{parameter}[0]{value} =~ /^I/ ? 1 : 1.0}
                           ];
      return 1;
    }
  }
  return;
}

sub _peephole {
  my ($self,$prev,$cur) = @_;
  #
  # set Xy,c
  # set Xy,c2 => set Xy,c2
  #
  if($prev->{instruction} eq 'set' and
     $cur->{instruction} eq 'set' and
     $prev->{parameter}[0]{value} eq $cur->{parameter}[0]{value}) {
    $prev->{comment} = 1;
    $prev->{value} = "# set ".(join ",",map{$_->{value}}@{$prev->{parameter}});
    delete $prev->{instruction};
  }
}

sub optimize {
  my $self  = shift;
  my $lines = $self->{lines};

  for(@$lines) {
    next if $_->{blank} or $_->{comment};
    next if $self->_constant_fold($_);
    next if $self->_strength_reduce($_);
  }

  my @foo;
  for(my $i = 0; $i<@$lines; $i++) {
    next if $lines->[$i]{blank};
    next if $lines->[$i]{comment};
    push @foo,$lines->[$i];
    if(@foo==2) {
      $self->_peephole(@foo);
      shift @foo;
    }
  }
}

sub write {
  my $self = shift;
  my $file = shift;

  unless(open OUTPUT,"> $file") {
    warn "Could not open >$file: $!\n";
    return;
  }
  for(@{$self->{lines}}) {
    if($_->{blank}) {
      print OUTPUT "\n";
      next;
    }
    if($_->{comment}) {
      print OUTPUT "$_->{value}\n";
      next;
    }
    print OUTPUT "$_->{label}: "              if exists $_->{label};
    print OUTPUT "$_->{instruction} "         if exists $_->{instruction};
    print OUTPUT join ', ',map{$_->{value}}
                   @{$_->{parameter}}         if exists $_->{parameter};
    print OUTPUT "\n";
  }
  close OUTPUT;
}

1;

=head1 NAME

Parrot::Optimizer - The Parrot Optimizer

=head1 SYNOPSIS

  use Parrot::Optimizer;

  my $opt = Parrot::Optimizer->new();
  $opt->read($file);
  $opt->optimize();
  $opt->write($file.".opt");

=head1 DESCRIPTION

Takes a parrot assembler file B<after macro expansion>, and optimizes it.
Currently does basic constant folding, strength reduction, and one peephole
optimization.

=head1 AUTHOR

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<parrot>

=cut

