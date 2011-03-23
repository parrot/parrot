#! nqp

class lasm is Hash;

method new(:$fh)
{
  self<fh> := $fh;
  self;
}

method outputOp($op)
{
  say("a");
  my $fh := self<fh>;

  my $op_name := $op<name>;
  for $op<arg_types> -> $t
  {
    $op_name := $op_name ~ "_" ~ $t;
  }

  $fh.print(".op '" ~ $op_name ~ "'\n");

  for $op.iterator() -> $stmt
  {
    say($stmt);
  }

  $fh.print(".end\n\n");

  say("b");
}
