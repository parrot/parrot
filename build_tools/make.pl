#!/usr/bin/perl -w

use strict;
use Data::Dumper;

package Makefile::Parser;

use File::Spec;

use Data::Dumper;

sub new {
  my $proto = shift;
  my $file  = shift || 'Makefile';
  my $class = ref $proto || $proto;
  my $self = { };
  unless(-e $file) {
    warn "File $file does not exist for opening!";
    return undef;
  }
  bless $self,$proto;
  $self->_unfold_lines($file);
  return $self;
}

sub _parse_file {
  my $self = shift;
  my $line = 0;
  my @action;
  my ($dependent,$upon);
  for(@{$self->{line}}) {
    $line++;
    next if /^\s*$/;
    next if /^\s*#/;
    if(!/^\t/) {
      if(/=/) {
        my ($macro,$value) = split /=/;
        $macro=~s/\s+$//;
        $value=~s/^\s+//;
        $self->{expansion}{$macro} = {
          exp => $value,
          line => $line-1,
        };
      }
      elsif(/:/) {
        for(split /\s+/,$dependent) {
          $self->{depend}{$_} = {
            files => $upon,
            actions => [@action],
            line => $line-1,
          };
        }
        @action = ();
        ($dependent,$upon) = split /:/;
        $dependent =~ s/\s+$//;
        $upon =~ s/^\s+// if defined $upon;
      }
    }
    else {
      s/^\s+//;
      push @action,$_;
    }
  }
}

sub parse {
  my $self = shift;
  $self->_parse_file;
  $self->_validate_macros;
  $self->_expand;
  $self->_unpack_files;
  $self->_walk($self->{depend});
}

sub _run {
  my $self = shift;
  my $target = shift;

  for my $file (values %{$target->{files}}) {
    next unless ref($file) eq 'HASH';
    $self->_run($file);
  }
  for(@{$target->{actions}}) {
    print "$_\n";
  }
}

sub run {
  my $self   = shift;
  my $target = shift;

  if(defined $self->{depend}{$target}) {
    $self->_run($self->{depend}{$target});
  }
  else {
    print STDERR "*** Target '$target' not defined.\n";
    exit 1;
  }
}

sub _validate_macros {
  my $self = shift;
  my $exp  = $self->{expansion};
  my $dep  = $self->{depend};
  my $fail = 0;

  for my $key (keys %$exp) {
    if($exp->{$key}{exp}=~/\$\($key\)/) {
      $fail++;
      print STDERR
        "*** Macro '$key' recursive at line $exp->{$key}{line}\n";
    }
    for my $macro ($exp->{$key}{exp}=~/\$\((.*?)\)/g) {
      next if defined $exp->{$macro};
      $fail++;
      print STDERR
        "*** Macro '$macro' does not exist at line $exp->{$key}{line}\n";
    }
  }
  for my $key (keys %$dep) {
    for my $macro ($dep->{$key}{files}=~/\$\((.*?)\)/g) {
      next if defined $exp->{$macro};
      $fail++;
      print STDERR
        "*** Macro '$macro' does not exist at line $dep->{$key}{line}\n";
    }
    for my $action (@{$dep->{$key}{actions}}) {
      for my $macro ($action=~/\$\((.*?)\)/g) {
        next if defined $exp->{$macro};
        $fail++;
        print STDERR
          "*** Macro '$macro' does not exist at line $dep->{$key}{line}\n";
      }
    }
  }
  exit if $fail;
}

sub _expand {
  my $self = shift;
  my $exp  = $self->{expansion};
  my $dep  = $self->{depend};

  $exp->{$_}{exp}=~s/\$\((.*?)\)/$exp->{$1}{exp}/eg for keys %$exp;

  for my $key(keys %$dep) {
    $dep->{$key}{files}=~s/\$\((.*?)\)/$exp->{$1}{exp}/eg;
    foreach(@{$dep->{$key}{actions}}) {
      s/\$\((.*?)\)/defined $exp->{$1} ? $exp->{$1}{exp} : $1/eg;
    }
    my $new_key = $key;
    if($new_key=~s/\$\((.*?)\)/$exp->{$1}{exp}/eg) {
      $dep->{$new_key} = $dep->{$key};
      delete $dep->{$key};
    }
  }
}

sub _unpack_files {
  my $self = shift;
  my $dep = $self->{depend};

  for my $dependency (values %$dep) {
    $dependency->{files} = {
      map { $_ => 1 }
      split /\s+/, $dependency->{files}
    };
  }
}

sub _walk {
  my $self = shift;
  my $child = shift;

  if(defined $child->{files}) {
    for(keys %{$child->{files}}) {
      $child->{files}{$_} = $self->{depend}{$_}
        if defined $self->{depend}{$_};
    }
  }

  for(keys %$child) {
    next unless ref $child->{$_} eq 'HASH';
    $self->_walk($child->{$_});
  }
}

sub _unfold_lines {
  my $self = shift;
  my $file = shift;
  my @line;
  my $line='';
  unless(open FILE,"<$file") {
    print STDERR "Can't open file <$file: $!\n";
    return undef;
  }
  while(<FILE>) {
    chomp;
    if($line=~/\\$/) {
      $line=~s/.$//;
      $line .= $_;
    }
    else {
      push @{$self->{line}},$line;
      $line = $_;
    }
  }
  close FILE;
}

package main;

my $parser = Makefile::Parser->new($ARGV[0]);
$parser->parse();
#print Dumper($parser->{expansion});
#print Dumper($parser->{depend});

$parser->run('test');
