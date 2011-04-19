#!/usr/bin/env perl

use strict;
use warnings;
use FindBin qw($Bin);
use autodie;

my $pbc = shift || die "usage: $0 file.pbc\n";


my $consts = "";

{
  open my $inFH, "-|", "$Bin/pbc_dump -d $pbc";
  while (<$inFH>)
  {
    $consts .= $_
      if m/^CONSTANT_fib.pir/ .. m/^],/;
  }

  close $inFH;
}

#print $consts;

my $pasm = "";

{
  open my $inFH, "-|", "$Bin/pbc_disassemble -b $pbc";
  while (<$inFH>)
  {
    $pasm .= $_
      unless m/^=/ .. /^=cut/;
  }

  close $inFH;
}

#print $pasm;

my %lasm_ops;

foreach my $op_file (glob "$Bin/src/ops/*.lasm")
{
  open my $inFH, "<", $op_file;
  my $current;

  while (<$inFH>)
  {
    my $s = $_;
    if (m/^[.] op \s '(\w*)'$/xms)
    {
      $current = $1;
      die "$current has been seen more than once"
        if exists $lasm_ops{$current};
      $lasm_ops{$current} = "";
      next;
    }
    if (m/^[.] end$/xms)
    {
      undef $current;
      next;
    }
    if (defined $current)
    {
      $lasm_ops{$current} .= $_;
    }
  }
}

my $bss = "";
my $code = "";

foreach my $stmt (split m/\n/xms, $pasm)
{
  next
    if $stmt =~ m/^ \s* [#]/xms;

  next
    if $stmt =~ m/^ \s* $/xms;

  my ($label, $cmd, $arg_str) = split /\s+/, $stmt, 3;
  my @args = split /,/, $arg_str;

  $code .= "  $label\n"
    if defined $label;

  if (!exists $lasm_ops{$cmd})
  {
    $code .= "# TODO - $cmd: not found\n";
    next;
  }

  $code .= "  # $cmd $arg_str\n";
  my $copy = $lasm_ops{$cmd};

  foreach my $arg_cnt (1..@args)
  {
    my $arg = $args[$arg_cnt-1];

    # An arg is either a PMC_CONST(), register ref, constant, string or label
    #  whew.  Probably others as well.
    if ($arg =~ m/^ ([INSP]) (\d+) $/xms)
    {
      # Reserve register 0-9 for the ops themselves
      my $num = $2 + 10;
      $arg = "$1$num";
    }

    $copy =~ s/\$O [INSP] $arg_cnt /$arg/xms;
  }

  $code .= $copy;
}

$code = ".main 'pbc2lasm'\n$code\n.end;\n";
print $code;
