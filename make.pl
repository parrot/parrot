#!/usr/bin/perl -w

use strict;
use Data::Dumper;

package Makefile::Parser;

use File::Spec;

use Data::Dumper;

use FindBin;

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
  $self->{expansion}{MAKE} = { exp => $FindBin::Bin, line => -1 };
  return $self;
}

sub __parse_expansion {
  my ($self,$line,$line_num) = @_;

  my ($macro,$value) = split /=/,$line;
  $macro=~s/\s+$//;
  $value=~s/^\s+//;
  $self->{expansion}{$macro} = {
    exp => $value,
    line => $line_num-1,
  };
}

sub __parse_dependency {
  my ($self,$junkref,$line) = @_;
  for(split /\s+/,$junkref->{dependent}) {
    $self->{depend}{$_} = {
      files => $junkref->{upon},
      actions => $junkref->{action},
      line => $line-1,
    };
  }
  $junkref->{action} = [];
  ($junkref->{dependent},$junkref->{upon}) = split /:/;
  $junkref->{dependent} =~ s/\s+$//;
  $junkref->{upon} =~ s/^\s+// if defined $junkref->{upon};
}

sub _parse_file {
  my $self = shift;
  my $line = 0;
  my $junkref = {
    action => [],
    dependent => '',
    upon => '',
  };
  for(@{$self->{line}}) {
    $line++;
    next if /^\s*$/;
    next if /^\s*#/;
    if(!/^\t/) {
      if(/=/) {
        $self->__parse_expansion($_,$line);
      }
      elsif(/:/) {
        $self->__parse_dependency($junkref,$line);
      }
    }
    else {
      s/^\s+//;
      push @{$junkref->{action}},$_;
    }
  }
  $self->__parse_dependency($junkref,$line);
}

sub parse {
  my $self = shift;
  $self->_parse_file;
  $self->_validate_macros;
  $self->_expand;
  $self->_unpack_files;
  $self->_toposort( $self->_depgraph_edges() );;


  #  $self->_walk($self->{depend});
}

sub _uptodate {
  my $self = shift;
  my $target = shift;

#  print "$target is dependent on...\n";
#  print "$_\n" for keys %{$self->{depend}{$_}{files}};
  return 0 unless -e $target;

  my $M = -M $target;
  for (keys %{$self->{depend}{$target}{files}}) {
    print "$_ < $target\n";
    return 0 if (-M $_ > $M);
  }

  return 1;
}

sub run {
  my $self   = shift;
  my $target = shift;

  my @order = $self->_order($target);
  for my $t (@order) {
#    print "# building $t\n";
    my $target = $self->{depend}{$t};

    unless ($target->{actions}) {
      # handle implicit stuff - this should be split out
      $t =~ /\.([^\.]+)$/;
      next unless $1;
      # FIXME: this only handles the first implicit match
      my ($implicit) = grep  {/^\.\w+\.$1/ } (keys %{$self->{depend}});
      if ($implicit) {
	my $src = $t;
	my ($q,$r) = $implicit =~ /^(\.\w)(\.\w)/ or die;
	$src =~ s/$r$/$q/;
	print "HERE $src\n";
	if (-e $src) {
	  $target->{actions} = $self->{depend}{$implicit}{actions};
	  $target->{files} = { $src => 1 };
	  $target->{selif} = { reverse %{$target->{files}} };
	}
      }
    } # end implicit handler

    if (!$self->_uptodate($t)) {
      for (@{$target->{actions}}) {
	# handle special variables
	{
	  my $first = $target->{selif}->{1};
	  $_ =~ s/\$@/$t/g;
	  $_ =~ s/\$</$first/g;
	}
	print "$_\n";
	system($_);
      }
    }
  }


#  if(defined $self->{depend}{$target}) {
#    $self->_run($self->{depend}{$target});
#  }
#  else {
#    print STDERR "*** Target '$target' not defined.\n";
#    exit 1;
#  }
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
    my $i = 1;
    $dependency->{files} = {
      map { $_ => $i++ }
      split /\s+/, $dependency->{files}
    };
    $dependency->{selif} = { reverse %{$dependency->{files}} };
  }
  # reversed so we can get the n'th element.

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
  push @{$self->{line}},$line;
  close FILE;
}


sub _depgraph_edges {
  my $self = shift;
  my @out;

  for my $k (keys %{$self->{depend}}) {
    for my $v (keys %{$self->{depend}{$k}{files}}) {
      push @out,[$k,$v];
    }
  }
  return @out
}

sub _toposort {
  my ($self,@pairs) = @_;               # list of lists
  my %numpreds = ();
  my %successors = ();

  foreach (@pairs) {
    my ($k,$v) = @$_;
    # make sure every element is in numpreds
    $numpreds{$k} = 0 unless exists $numpreds{$k};
    $numpreds{$v} = 0 unless exists $numpreds{$v};
    # since k < v , second gains a pred
    $numpreds{$v}++;
    # and first gains a succ
    if ( exists $successors{$k} ) {
      push @{$successors{$k}},$v;
    } else {
      $successors{$k} = [$v];
    }
  }

  my @answer = grep { $numpreds{$_} == 0} keys %numpreds;

  foreach my $x (@answer) {
    delete $numpreds{$x};
    if ( exists $successors{$x} ) {
      for my $y ( @{$successors{$x}} ) {
        $numpreds{$y}--;
        push @answer,$y if $numpreds{$y} == 0;
      }
      delete $successors{$x};
    }
  }

  if (keys %numpreds) {
    # can get a more detailed error by printing the remaining values
    # in numpreds
    die "Cycle Error!";
  }

  $self->{tsort} = [@answer];
}



sub _order {
  my ($self, $target) = @_;
  my @order = @{ $self->{tsort} };
  my @working = ( $target );
  my %seen;
  # walk the graph starting at our target, and mark everything we pass
  while (@working) {
    my $c = shift @working;
    $seen{$c}++;
    push @working, (grep { !$seen{$_} } (keys %{$self->{depend}{$c}{files}}));
  }
  # trim @order (into @deps) with only the stuff we've seen;
  my (@deps) = grep { $seen{$_} } @order;
  return reverse @deps;
}


package main;

my $parser = Makefile::Parser->new($ARGV[0]);
$parser->parse();
#print Dumper($parser->{expansion});
#print Dumper($parser->{depend});

$parser->run($ARGV[1]||'test');


# make.pl by Jeff Goff and Robert Spier (test for bonsai)
