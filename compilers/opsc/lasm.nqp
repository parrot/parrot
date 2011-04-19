#! nqp

class lasm is Hash;

my %reg_map;
%reg_map{'INT'} := "I";
%reg_map{'NUM'} := "N";
%reg_map{'STR'} := "S";
%reg_map{'PMC'} := "P";

method new(:$fh)
{
  self<fh> := $fh;
  self;
}

method outputOp($op)
{
  say("a");
  my $fh := self<fh>;
  self<cur_opsop> := $op;

  my $op_name := $op<name>;
  for $op<arg_types> -> $t
  {
    $op_name := $op_name ~ "_" ~ $t;
  }

  $fh.print(".op '" ~ $op_name ~ "'\n");

  for $op.iterator() -> $node
  {
    self.handle_node($node);
  }

  $fh.print(".end\n\n");

  say("b");
}

method handle_node($node)
{
  if ($node ~~ PAST::Block)
  {
    return self.handle_block($node);
  }

  if ($node ~~ PAST::Stmts)
  {
  }
  if ($node ~~ PAST::Op)
  {
    return self.handle_op($node);
  }
  if ($node ~~ PAST::Val)
  {
  }
  if ($node ~~ PAST::Var)
  {
    return self.handle_var($node);
  }
}

method handle_block($block)
{
  for $block.iterator() -> $node
  {
    self.handle_node($node);
  }
  self<fh>.print("\n");
}

method handle_op($op)
{
  if (defined($op<pirop>))
  {
    if ($op<pirop> eq '=')
    {
      my $dest := self.handle_node($op[0]);
      my $rhs  := self.handle_node($op[1]);

      self<fh>.print("  $dest = $rhs;\n");
    }
    if ($op<pirop> eq '+=')
    {
      my $dest := self.handle_node($op[0]);
      my $rhs  := self.handle_node($op[1]);

      self<fh>.print("  $dest = ADD $dest, $rhs;\n");
    }
    if ($op<pirop> eq '+')
    {
      my $dest := '$';# ~ %reg_map{$type} ~ "1";
      my $src1 := self.handle_node($op[0]);
      my $src2 := self.handle_node($op[1]);

      self<fh>.print("  $dest = ADD $src1, $src2;\n");

      return $dest;
    }
    return;
  }

  if (defined($op<pasttype>))
  {
    if ($op<pasttype> eq "call")
    {
      my $method := $op<name>;
      self<fh>.print("  \$S1 = STR LOAD_CONST :[$method];\n");
      self<fh>.print("  \$P1 = STR LOOKUP \$P10, \$S1;\n");
      self<fh>.print("  \$P1 = PMC NEW_CTX \$P1;\n");

      for $op.iterator -> $arg
      {
        my $dest := self.handle_node($arg);
        self<fh>.print("  PUSH \$P1, $dest;\n");
      }

      self<fh>.print("  CALL \$P2;\n");

      return "POP_ARG \$P1";
    }
  }
  
  return "";
}

method handle_var($var)
{
  if ($var<scope> eq "register")
  {
    my $reg := $var<name>;
    my $type := self<cur_opsop><args>[$reg-1]<type>;
    return '$O' ~ %reg_map{$type} ~ $reg;
  }
  if (!defined($var<scope>))
  {
    if ($var<name> eq "interp")
    {
      return "\$P10";
    }
  }
}
