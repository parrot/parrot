use Test::More qw(no_plan);
use Ruby;
use Parse::RecDescent;

$::RD_ERRORS = 1;
$::RD_WARN = 1;
$::RD_HINT = 1;
$Parse::RecDescent::skip = undef;

use YAML;
ok(1); # If we made it this far, we're ok.

my $parser = Parse::RecDescent->new($Ruby::grammar);

is_deeply($parser->var('foo'), [ 'var', [ 'tIDENTIFIER', 'foo' ] ],
          "var 1");
is_deeply($parser->var('Foo'), [ 'var', [ 'tIDENTIFIER', 'Foo' ] ],
          "var 2");
is_deeply($parser->var('$foo'), [ 'var', [ 'tGLOBALVAR', '$foo' ] ],
          "var 1");
is_deeply($parser->var('$Foo'), [ 'var', [ 'tGLOBALVAR', '$Foo' ] ],
          "var 2");

is_deeply($parser->value('0x5f'), [ 'value', [ 'tINTEGER', '0x5f' ] ],
          "var 1");
is_deeply($parser->value('-32.7'), [ 'value', [ 'tFLOAT', '-32.7' ] ],
          "var 2");

is_deeply($parser->op_asgn('+='), [ 'op_asgn', '+=' ], "op_asgn 1");
is_deeply($parser->op_asgn('-='), [ 'op_asgn', '-=' ], "op_asgn 2");
is_deeply($parser->op_asgn('**='), [ 'op_asgn', '**=' ], "op_asgn 3");
is_deeply($parser->op_asgn('*='), [ 'op_asgn', '*=' ], "op_asgn 4");
is_deeply($parser->op_asgn('/='), [ 'op_asgn', '/=' ], "op_asgn 5");
is_deeply($parser->op_asgn('%='), [ 'op_asgn', '%=' ], "op_asgn 6");
is_deeply($parser->op_asgn('&&='), [ 'op_asgn', '&&=' ], "op_asgn 7");
is_deeply($parser->op_asgn('&='), [ 'op_asgn', '&=' ], "op_asgn 8");
is_deeply($parser->op_asgn('||='), [ 'op_asgn', '||=' ], "op_asgn 9");
is_deeply($parser->op_asgn('|='), [ 'op_asgn', '|=' ], "op_asgn 10");
is_deeply($parser->op_asgn('^='), [ 'op_asgn', '^=' ], "op_asgn 11");
is_deeply($parser->op_asgn('<<='), [ 'op_asgn', '<<=' ], "op_asgn 12");
is_deeply($parser->op_asgn('>>='), [ 'op_asgn', '>>=' ], "op_asgn 13");

is_deeply($parser->expr_value('$foo'),
          [ 'expr_value', [ 'var', [ 'tGLOBALVAR', '$foo' ] ] ],
          "expr_value 1");
is_deeply($parser->expr_value('@foo'),
          [ 'expr_value', [ 'var', [ 'tINSTANCEVAR', '@foo' ] ] ],
          "expr_value 2");
is_deeply($parser->expr_value('0xab123'),
          [ 'expr_value', [ 'value', [ 'tINTEGER', '0xab123' ] ] ],
          "expr_value 3");

is_deeply($parser->lhs('$foo'),
          [ 'lhs', [ 'var', [ 'tGLOBALVAR', '$foo' ] ] ],
          "lhs 1");

is_deeply($parser->arg('a=1'),
          [ 'arg',
             [ 'lhs', [ 'var', [ 'tIDENTIFIER', 'a' ] ] ],
             '=',
             [ 'arg', [ 'expr_value', [ 'value', [ 'tINTEGER', '1', ] ] ]
             ]
           ],
           "arg 1");
is_deeply($parser->arg('a==1'),
          [ 'arg',
             [ 'expr_value', [ 'var', [ 'tIDENTIFIER', 'a' ] ] ],
             '==',
             [ 'arg', [ 'expr_value', [ 'value', [ 'tINTEGER', '1', ] ] ]
             ]
           ],
           "arg 2");

# ...

is_deeply($parser->arg('a==::foo'),
          [ 'arg',
	    [ 'expr_value', [ 'var', [ 'tIDENTIFIER', 'a' ] ] ],
            '==',
            [ 'arg', [ 'primary', '::', [ 'tIDENTIFIER', 'foo' ] ] ],
          ],
          "arg 3");

# ...

is_deeply($parser->arg('defined(foo)'),
          [ 'arg',
            [ 'primary',
	      [ [ 'kDEFINED', 'defined' ] ],
              '(',
              [ 'arg',
                [ 'expr_value', [ 'var', [ 'tIDENTIFIER', 'foo' ] ] ]
                ],
              ')'
             ],
           ],
           "arg 4");

#$::RD_TRACE = 1;

