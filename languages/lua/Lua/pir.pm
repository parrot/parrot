
use strict;
use warnings;

package pirVisitor;
{

    sub new {
        my $proto = shift;
        my $class = ref($proto) || $proto;
        my $self  = {};
        bless $self, $class;
        my ($fh) = @_;
        $self->{fh}       = $fh;
        $self->{prologue} = q{.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.include 'languages/lua/lib/luaaux.pir'

.sub '__start' :main
#  print "start Lua\n"

  load_bytecode 'languages/lua/lib/luabasic.pbc'
#  load_bytecode 'languages/lua/lib/luacoroutine.pbc'
  load_bytecode 'languages/lua/lib/luacoroutine.pir'
  load_bytecode 'languages/lua/lib/luapackage.pbc'
  load_bytecode 'languages/lua/lib/luastring.pbc'
  load_bytecode 'languages/lua/lib/luatable.pbc'
  load_bytecode 'languages/lua/lib/luamath.pbc'
  load_bytecode 'languages/lua/lib/luaio.pbc'
  load_bytecode 'languages/lua/lib/luaos.pbc'
  load_bytecode 'languages/lua/lib/luadebug.pbc'
  _main()
.end

};
        return $self;
    }

    sub visitUnaryOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = $op->{op} $op->{arg1}->{symbol}\n";
        return;
    }

    sub visitBinaryOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        if ( $op->{result} == $op->{arg1} ) {
            print {$FH}
                "  $op->{op} $op->{result}->{symbol}, $op->{arg2}->{symbol}\n";
        }
        else {
            print {$FH}
                "  $op->{result}->{symbol} = $op->{op} $op->{arg1}->{symbol}, $op->{arg2}->{symbol}\n";
        }
        return;
    }

    sub visitRelationalOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = $op->{op} $op->{arg1}->{symbol}, $op->{arg2}->{symbol}\n";
        return;
    }

    sub visitAssignOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  $op->{result}->{symbol} = $op->{arg1}->{symbol}\n";
        return;
    }

    sub visitKeyedGetOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = $op->{arg1}->{symbol}\[$op->{arg2}->{symbol}\]\n";
        return;
    }

    sub visitKeyedSetOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol}\[$op->{arg1}->{symbol}\] = $op->{arg2}->{symbol}\n";
        return;
    }

    sub visitIncrOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  inc $op->{result}->{symbol}\n";
        return;
    }

    sub visitGetGlobalOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = get_global '$op->{arg1}'\n";
        return;
    }

    sub visitFindLexOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = find_lex '$op->{arg1}->{symbol}'\n";
        return;
    }

    sub visitStoreLexOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  store_lex '$op->{arg1}->{symbol}', $op->{arg2}->{symbol}\n";
        return;
    }

    sub visitCloneOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = clone $op->{arg1}->{symbol}\n";
        return;
    }

    sub visitNewOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        if ( exists $op->{arg2} ) {
            print {$FH}
                "  new $op->{result}->{symbol}, $op->{arg1}, $op->{arg2}\n";
        }
        else {
            print {$FH} "  new $op->{result}->{symbol}, $op->{arg1}\n";
        }
        return;
    }

    sub visitNewClosureOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  $op->{result}->{symbol} = newclosure $op->{arg1}->{symbol}\n";
        return;
    }

    sub visitNoOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};

        #    print {$FH} "  noop\n";
        return;
    }

    sub visitToBoolOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  $op->{result}->{symbol} = $op->{arg1}->{symbol}\n";
        return;
    }

    sub visitCallOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  ";
        if ( exists $op->{result} and scalar( @{ $op->{result} } ) ) {
            print {$FH} "(";
            my $first = 1;
            foreach ( @{ $op->{result} } ) {
                print {$FH} ", " unless ($first);
                print {$FH} "$_->{symbol}";
                if ( exists $_->{pragma} and $_->{pragma} eq 'multi' ) {
                    print {$FH} " :slurpy";
                }
                $first = 0;
            }
            print {$FH} ") = ";
        }
        print {$FH} "$op->{arg1}->{symbol}(";
        my $first = 1;
        foreach ( @{ $op->{arg2} } ) {
            print {$FH} ", " unless ($first);
            print {$FH} "$_->{symbol}";
            if ( exists $_->{pragma} and $_->{pragma} eq 'multi' ) {
                print {$FH} " :flat";
            }
            $first = 0;
        }
        print {$FH} ")\n";
        return;
    }

    sub visitCallMethOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  ";
        if ( exists $op->{result} and scalar( @{ $op->{result} } ) ) {
            print {$FH} "(";
            my $first = 1;
            foreach ( @{ $op->{result} } ) {
                print {$FH} ", " unless ($first);
                print {$FH} "$_->{symbol}";
                if ( exists $_->{pragma} and $_->{pragma} eq 'multi' ) {
                    print {$FH} " :slurpy";
                }
                $first = 0;
            }
            print {$FH} ") = ";
        }
        my @args = @{ $op->{arg2} };
        my $obj  = shift @args;
        print {$FH} "$obj->{symbol}.'$op->{arg1}'(";
        my $first = 1;
        foreach (@args) {
            print {$FH} ", " unless ($first);
            print {$FH} "$_->{symbol}";
            if ( exists $_->{pragma} and $_->{pragma} eq 'multi' ) {
                print {$FH} " :flat";
            }
            $first = 0;
        }
        print {$FH} ")\n";
        return;
    }

    sub visitBranchIfOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        if ( exists $op->{op} ) {
            print {$FH}
                "  if $op->{arg1}->{symbol} $op->{op} $op->{arg2}->{symbol} goto $op->{result}->{symbol}\n";
        }
        else {
            print {$FH}
                "  if $op->{arg1}->{symbol} goto $op->{result}->{symbol}\n";
        }
        return;
    }

    sub visitBranchUnlessOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        if ( exists $op->{op} ) {
            print {$FH}
                "  unless $op->{arg1}->{symbol} $op->{op} $op->{arg2}->{symbol} goto $op->{result}->{symbol}\n";
        }
        else {
            print {$FH}
                "  unless $op->{arg1}->{symbol} goto $op->{result}->{symbol}\n";
        }
        return;
    }

    sub visitBranchUnlessNullOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH}
            "  unless_null $op->{arg1}->{symbol}, $op->{result}->{symbol}\n";
        return;
    }

    sub visitBranchOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "  goto $op->{result}->{symbol}\n";
        return;
    }

    sub visitLabelOp {
        my $self = shift;
        my ($op) = @_;
        my $FH   = $self->{fh};
        print {$FH} "\n";
        print {$FH} "$op->{arg1}->{symbol}:\n";
        return;
    }

    sub visitSubDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH} "\n";
        print {$FH} ".sub '$dir->{result}->{symbol}' :anon";
        if ( exists $dir->{outer} ) {
            print {$FH} " :outer($dir->{outer})";
        }
        print {$FH} "\n";
        return;
    }

    sub visitEndDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH} ".end\n";
        print {$FH} "\n";
        return;
    }

    sub visitParamDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        if ( exists $dir->{pragma} ) {
            print {$FH}
                "  .param $dir->{result}->{type} $dir->{result}->{symbol} $dir->{pragma}\n";
        }
        else {
            print {$FH}
                "  .param $dir->{result}->{type} $dir->{result}->{symbol} :optional\n";
        }
        return;
    }

    sub visitReturnDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH} "  .return (";
        my $first = 1;
        foreach ( @{ $dir->{result} } ) {
            print {$FH} ", " unless ($first);
            print {$FH} "$_->{symbol}";
            if ( exists $_->{pragma} and $_->{pragma} eq 'multi' ) {
                print {$FH} " :flat";
            }
            $first = 0;
        }
        print {$FH} ")\n";
        return;
    }

    sub visitLocalDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH}
            "  .local $dir->{result}->{type} $dir->{result}->{symbol}\n";
        return;
    }

    sub visitLexDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH}
            "  .lex '$dir->{arg1}->{symbol}', $dir->{arg1}->{symbol}\n";
        return;
    }

    sub visitConstDir {
        my $self  = shift;
        my ($dir) = @_;
        my $FH    = $self->{fh};
        print {$FH}
            "  .const .$dir->{type} $dir->{result}->{symbol} = \"$dir->{arg1}\"\n";
        return;
    }

}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

