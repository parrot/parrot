#! nqp

class lasm is Hash;

my %reg_map;
%reg_map{'INT'} := "I";
%reg_map{'NUM'} := "N";
%reg_map{'STR'} := "S";
%reg_map{'PMC'} := "P";

my %int_enums;
%int_enums{'PARROT_ERRORS_NONE_FLAG'}         := 0x00;
%int_enums{'PARROT_ERRORS_OVERFLOW_FLAG'}     := 0x02;
%int_enums{'PARROT_ERRORS_PARAM_COUNT_FLAG'}  := 0x04;
%int_enums{'PARROT_ERRORS_RESULT_COUNT_FLAG'} := 0x08;
%int_enums{'PARROT_ERRORS_ALL_FLAG'}          := 0xFF;

%int_enums{'SUB_FLAG_TAILCALL'}          := 0x04;

method new(:$fh)
{
  self<fh> := $fh;
  my @alloc;
  my @decl;
  my @free := (0,1,2,3,4,5,6,7,8);
  self<alloc> := @alloc;
  self<decl>  := @decl;
  self<free>  := @free;
  self<label> := 1;
  self;
}

P6metaclass.register('ResizablePMCArray');

method outputOp($op)
{
  my $fh := self<fh>;
  self<cur_opsop> := $op;

  my $op_name := $op<name>;
  my $arg_types := $op<arg_types>;
  my %scope_vars;
  self<scope> := %scope_vars;

  if (!($arg_types ~~ ResizablePMCArray))
  {
    $arg_types := [$arg_types];
  }

  for $arg_types -> $t
  {
    $op_name := $op_name ~ "_" ~ $t;
  }

  $fh.print(".op '" ~ $op_name ~ "'\n");

  self.show_alloc();

  for $op.iterator() -> $node
  {
    my $node_ret := self.handle_node($node);
    self.dealloc($node_ret);
  }

  self.show_alloc();

  my @all;

  for self<alloc>
  {
    @all.push($_);
  }
  for self<decl>
  {
    @all.push($_);
  }

  for @all -> $r
  {
    $fh.print("  # Dealloc $r\n");
    self.dealloc($r);
    self.dealloc($r, 1);
  }

  $fh.print(".end\n\n");
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

  self<fh>.print("  # Unhandled node: $node\n");
  return "";
}

method handle_block($block)
{
  for $block.iterator() -> $node
  {
    my $node_ret := self.handle_node($node);
    self.dealloc($node_ret);
  }
  self<fh>.print("\n");

  return "";
}

my $null   := '$P0';
my $ctx    := '$P9';
my $compat := '$P10';

method alloc($type, $decl?)
{
  $type := $type || "";
  if (self<free> == 0)
  {
    say("No more free registers");
    self.show_alloc();
    return "\$$type-1";
  }
  my $reg := self<free>.pop;
  if ($decl)
  {
    self<decl>.push($reg);
  }
  else
  {
    self<alloc>.push($reg);
  }
  return "\$$type$reg";
}

# Take a allocated register and make it declared
method realloc($reg)
{
  my $num := $reg ~~ /\d+/;
  $num := +$num;
  if ($num <= 0)
  {
    return undef;
  };

  my @set := self<alloc>;
  my $i := 0;
  while $i < @set
  {
    if @set[$i] == $num
    {
      @set[$i] := @set[0];
      @set.shift;
      self<decl>.push($num);
      last;
    }
    $i++;
  }
}

method dealloc($reg, $decl?)
{
  if (!defined($reg))
  {
    return undef;
  }

  my $num := $reg ~~ /\d+/;
  $num := +$num;
  if ($num <= 0)
  {
    return undef;
  };
  my $i := 0;

  my @set;
  if ($decl)
  {
    @set := self<decl>;
  }
  else
  {
    @set := self<alloc>;
  }
  while $i < @set
  {
    if @set[$i] == $num
    {
      self<free>.push($num);
      @set[$i] := @set[0];
      @set.shift;
      last;
    }
    $i++;
  }
}

method show_alloc()
{
  my $s := "";
  $s := $s ~ "free: ";
  for self<free> {
    $s := $s ~ "$_ ";
  }
  $s := $s ~ " - alloc: ";
  for self<alloc> {
    $s := $s ~ "$_ ";
  }
  $s := $s ~ " - decl: ";
  for self<decl> {
    $s := $s ~ "$_ ";
  }
  #say($s);
  self<fh>.print("  # $s\n");
}

method show_scope()
{
  for self<scope>.keys -> my $k
  {
    self<fh>.print("  #- $k := " ~ self<scope>{$k} ~ "\n");
  }
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
      self.dealloc($dest);
      self.dealloc($rhs);
    }
    if ($op<pirop> eq '+=')
    {
      my $dest := self.handle_node($op[0]);
      my $rhs  := self.handle_node($op[1]);

      self<fh>.print("  $dest = INT ADD $dest, $rhs;\n");
      self.dealloc($dest);
      self.dealloc($rhs);

      return "";
    }
    if ($op<pirop> eq '+')
    {
      my $dest := self.alloc('I');
      my $src1 := self.handle_node($op[0]);
      my $src2 := self.handle_node($op[1]);

      self<fh>.print("  $dest = INT ADD $src1, $src2;\n");

      self.dealloc($src1);
      self.dealloc($src2);

      return $dest;
    }

    if ($op<pirop> eq '~')
    {
      my $dest := self.alloc('I');
      my $src1 := self.handle_node($op[0]);

      self<fh>.print("  $dest = INT NOT $src1;\n");

      self.dealloc($src1);

      return $dest;
    }

    if ($op<pirop> eq '&=')
    {
      my $dest := self.handle_node($op[0]);
      my $rhs  := self.handle_node($op[1]);

      self<fh>.print("  $dest = INT AND $dest, $rhs;\n");

      self.dealloc($dest);
      self.dealloc($rhs);

      return "";
    }
    if ($op<pirop> eq '&')
    {
      my $dest := self.alloc('I');
      my $src1 := self.handle_node($op[0]);
      my $src2 := self.handle_node($op[1]);

      self<fh>.print("  $dest = INT AND $src1, $src2;\n");

      self.dealloc($src1);
      self.dealloc($src2);

      return $dest;
    }

    self<fh>.print("  # Unhandled pirop: " ~ $op<pirop> ~ "\n");
    return "";
  }

  if (defined($op<pasttype>))
  {
    if ($op<pasttype> eq "call")
    {
      my $method := $op<name>;

      my $pmc := self.alloc('P');
      my $str := self.alloc('S');

      self<fh>.print("  $str = STR LOAD_CONST :[$method];\n");
      self<fh>.print("  $pmc = STR LOOKUP $compat, $str;\n");
      self<fh>.print("  $pmc = PMC NEW_CTX $pmc;\n");

      for $op.iterator -> $arg
      {
        my $dest := self.handle_node($arg);
        self<fh>.print("  PUSH $pmc, $dest;\n");
        self.dealloc($dest);
      }

      self.dealloc($str);

      self<fh>.print("  CALL $pmc;\n");
      self<fh>.print("  $pmc = POP_ARG $pmc;\n");

      return "$pmc";
    }

    if ($op<pasttype> eq "if")
    {
      # [0] is the condition, [1] is true, [2] is false
      my $cond := self.handle_op($op[0]);

      my $true  := self<label>++;
      my $false := self<label>++;
      my $end   := self<label>++;

      self<fh>.print("  INT IF $cond :l$true;\n");
      self<fh>.print("  INT GOTO :l$false;\n");
      self<fh>.print("  l$true: INT NOOP;\n");

      self.dealloc($cond);

      my $node_ret := self.handle_node($op[1]);
      self.dealloc($node_ret);

      if (defined($op[2]))
      {
        self<fh>.print("  INT GOTO :l$end;\n");
        self<fh>.print("  l$false: INT NOOP;\n");

        my $node_ret := self.handle_node($op[1]);
        self.dealloc($node_ret);

        self<fh>.print("  l$end: INT NOOP;\n");
      }
      else
      {
        self<fh>.print("  l$false: INT NOOP;\n");
      }

      return "";
    }

    self<fh>.print("  # Unhandled pasttype: " ~ $op<pasttype> ~ "\n");
    return "";
  }
  
  self<fh>.print("  # Unhandled op: $op\n");
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
  }

  my $scope := self<scope>;
  my $name  := $var<name>;

  if (defined($var<isdecl>))
  {
    if (defined($var<viviself>))
    {
      my $node_ret := self.handle_node($var<viviself>);
      self.realloc($node_ret);
      $scope{$name} := $node_ret;
      self<fh>.print("  # $name := $node_ret := " ~ self<scope>{$name} ~ "\n");
      return "";
    }

    if (defined($var<vivibase>))
    {
      if ($var<vivibase> ~~ /INTVAL/)
      {
        my $node_ret := self.alloc('I');
        self.realloc($node_ret);
        $scope{$name} := $node_ret;
        self<fh>.print("  # $name := $node_ret := " ~ self<scope>{$name} ~ "\n");
        return "";
      }
    }
  }

  if ($var<name> eq "interp")
  {
    return "$compat";
  }
  if ($var<name> eq "CUR_OPCODE")
  {
    return "$null";
  }

  if (defined(%int_enums{$name}))
  {
    my $node_ret := self.alloc('I');
    my $i := %int_enums{$name};
    self<fh>.print("  $node_ret = INT LOAD_IMM :$i;\n");
    return $node_ret;
  }

  if (defined($scope{$name}))
  {
    self<fh>.print("  # $name := " ~ self<scope>{$name} ~ "\n");
    return $scope{$name};
  }

  self<fh>.print("  # Unhandled var: $var\n");
  return "";
}
