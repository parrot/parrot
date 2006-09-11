
package Lua::parser;

use strict;

use Lua::opcode;
use Lua::symbtab;

sub new_tmp {
    my ( $parser, $type, $subtype ) = @_;
    my $idf = 'tmp_' . $parser->YYData->{idx_tmp}++;
    return new defn( $idf, 'tmp', $type, $subtype );
}

sub new_label {
    my ($parser) = @_;
    my $idf = 'L' . $parser->YYData->{idx_lbl}++;
    return new defn( $idf, 'label' );
}

sub new_fct {
    my ($parser) = @_;
    my $idf = 'fct_' . $parser->YYData->{idx_fct}++;
    return new defn( $idf, 'fct' );
}

sub get_global {
    my ($parser) = @_;
    my @opcodes = ();
    unless ( $parser->YYData->{_G} ) {
        $parser->YYData->{_G} = new_tmp( $parser, 'pmc' );
        push @opcodes, new LocalDir( $parser,
            'prolog' => 1,
            'result' => $parser->YYData->{_G},
        );
        push @opcodes, new GetGlobalOp( $parser,
            'prolog' => 1,
            'result' => $parser->YYData->{_G},
            'arg1'   => '_G',
        );
    }
    return [ $parser->YYData->{_G}, \@opcodes ];
}

sub get_cond {
    my ( $parser, $expr )    = @_;
    my ( $defn,   $opcodes ) = @{$expr};
    if ( scalar( @{$opcodes} ) and $opcodes->[-1]->isa('ToBoolOp') ) {
        my $tobool = pop @{$opcodes};
        my $new    = pop @{$opcodes};
        my $loc    = pop @{$opcodes};
        $defn = $opcodes->[-1]->{result};
    }
    return [ $defn, $opcodes ];
}

sub PushScopeF {
    my ($parser) = @_;

    PushScope($parser);
    push @{ $parser->YYData->{scope} }, $parser->YYData->{_G};
    $parser->YYData->{_G} = undef;
    unshift @{ $parser->YYData->{scopef} }, $parser->YYData->{symbtab_cst};
    $parser->YYData->{symbtab_cst} = new SymbTabConst($parser);
    unshift @{ $parser->YYData->{scopef} }, $parser->YYData->{scope};
    $parser->YYData->{scope} = [];
    unshift @{ $parser->YYData->{scopef} }, $parser->YYData->{lex_num};
    $parser->YYData->{lex_num} = 0;
##    warn "PushScopeF\n";
}

sub PopScopeF {
    my ($parser) = @_;

    my $lex_num = shift @{ $parser->YYData->{scopef} };
    $parser->YYData->{lex_num} = $lex_num;
    my $scope = shift @{ $parser->YYData->{scopef} };
    $parser->YYData->{scope} = $scope;
    my $symbtab = shift @{ $parser->YYData->{scopef} };
    $parser->YYData->{symbtab_cst} = $symbtab;
    my $g = pop @{ $parser->YYData->{scope} };
    $parser->YYData->{_G} = $g;
##    warn "PopScopeF\n";
    PopScope($parser);
}

sub PushScope {
    my ($parser) = @_;

    unshift @{ $parser->YYData->{scope} }, $parser->YYData->{symbtab};
    $parser->YYData->{symbtab} = new SymbTabVar($parser);
    $parser->YYData->{lex_num} ++;
##    warn "PushScope\n";
}

sub PopScope {
    my ($parser) = @_;

    my $symbtab = shift @{ $parser->YYData->{scope} };
    $parser->YYData->{symbtab} = $symbtab;
    $parser->YYData->{lex_num} ++;
##    warn "PopScope\n";
}

sub Insert {
    my ( $parser, $var ) = @_;

    $parser->YYData->{symbtab}->Insert( $var->[0] );
    return $var;
}

sub InsertList {
    my ( $parser, $vars ) = @_;

    for my $var ( @{$vars} ) {
        Insert( $parser, $var );
    }
}

sub BuildLiteral {
    my ( $parser, $value, $type ) = @_;

    my $defn = $parser->YYData->{symbtab_cst}->Lookup( $type . $value );
    if ($defn) {
        return [ $defn, [] ];
    }
    else {
        my $name    = 'cst_' . $parser->YYData->{idx_cst}++;
        my @opcodes = ();
        $defn = new defn( $name, 'const', 'pmc', $type );
        $parser->YYData->{symbtab_cst}->Insert( $type . $value, $defn );
        if ( $type eq 'key' ) {
            push @opcodes, new ConstDir( $parser,
                'prolog' => 1,
                'result' => $defn,
                'arg1'   => $value,
                'type'   => 'LuaString',
            );
        }
        else {
            push @opcodes, new LocalDir( $parser,
                'prolog' => 1,
                'result' => $defn,
            );
            push @opcodes, new NewOp( $parser,
                'prolog' => 1,
                'result' => $defn,
                'arg1'   => '.Lua' . ucfirst($type),
            );
            unless ( $type eq 'nil' ) {
                if ( $type eq 'string' ) {
                    my $str = q{};
                    for ( split //, $value ) {
                        if ( ord $_ < 32 ) {
                            $str .= sprintf( '\x%02x', ord $_ );
                        }
                        elsif ( ord $_ >= 128 ) {
                            $str .= sprintf( '\u%04x', ord $_ );
                        }
                        elsif ( $_ eq '"' ) {
                            $str .= '\"';
                        }
                        else {
                            $str .= $_;
                        }
                    }
                    $value = "\"$str\"";
                }
                elsif ( $type eq 'boolean' ) {
                    $value = ( $value eq 'true' ) ? 1 : 0;
                }
                my $expr = new defn( $value, 'literal', 'pmc', $type );
                push @opcodes, new AssignOp( $parser,
                    'prolog' => 1,
                    'arg1'   => $expr,
                    'result' => $defn,
                );
            }
        }
        return [ $defn, \@opcodes ];
    }
}

sub BuildTable {
    my ( $parser, $fields ) = @_;
    my @opcodes1 = ();
    my @opcodes2 = ();
    my $result   = new_tmp( $parser, 'pmc', 'table' );
    push @opcodes1, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes1, new NewOp( $parser,
        'result' => $result,
        'arg1'   => '.LuaTable',
    );
    my $num_key;
    while ( my $field = shift @{$fields} ) {
        my ( $val, $key );
        if ( scalar( @{$field} ) == 1 ) {
            $val = $field->[0];
            if ( defined $num_key ) {
                my $incr = new IncrOp( $parser,
                    'result' => $num_key,
                );
                $key = [ $num_key, [$incr] ];
            }
            else {
                my $unit = BuildLiteral( $parser, 1, 'number' );
                my @opcodes3 = @{ $unit->[1] };
                $num_key = new_tmp( $parser, 'pmc' );
                push @opcodes3, new LocalDir( $parser,
                    'result' => $num_key,
                );
                push @opcodes3, new CloneOp( $parser,
                    'arg1'   => $unit->[0],
                    'result' => $num_key,
                );
                $key = [ $num_key, \@opcodes3 ];
            }
            if (    scalar @{$fields} == 0
                and scalar @{ $val->[1] } != 0
                and $val->[1]->[-1]->isa('CallOp')
                and !exists $val->[1]->[-1]->{result}[0]->{pragma} )
            {
                my $callop = $val->[1]->[-1];
                $callop->{result}[0]->{pragma} = 'multi';
                push @opcodes1, @{ $val->[1] };
                push @opcodes2, @{ $key->[1] };
                my $fct = new defn( 'tconstruct', 'util' );
                push @opcodes2, new CallOp( $parser,
                    'result' => [$result],
                    'arg1'   => $fct,
                    'arg2'   => [ $result, $num_key, $callop->{result}[0] ],
                );
                push @opcodes2, new NoOp($parser);
                push @opcodes1, @opcodes2;
                return [ $result, \@opcodes1 ];
            }
        }
        else {
            $key = $field->[0];
            $val = $field->[1];
        }
        push @opcodes1, @{ $val->[1] };
        push @opcodes2, @{ $key->[1] };
        push @opcodes2, new KeyedSetOp( $parser,
            'arg1'   => $key->[0],
            'arg2'   => $val->[0],
            'result' => $result,
        );
    }
    push @opcodes1, @opcodes2;
    return [ $result, \@opcodes1 ];
}

sub BuildVariable {
    my ( $parser, $var ) = @_;
    my @opcodes = ();
    my $idf     = shift @{$var};
    if ( ref($idf) eq 'ARRAY' ) {
        my $defn = $idf->[0];
        push @opcodes, @{ $idf->[1] };
        my $last_key = pop @{$var};
        my $result   = $defn;
        foreach my $key ( @{$var} ) {
            push @opcodes, @{ $key->[1] };
            my $result2 = new_tmp( $parser, 'pmc' );
            push @opcodes, new LocalDir( $parser,
                'result' => $result2,
            );
            push @opcodes, new KeyedGetOp( $parser,
                'result' => $result2,
                'arg1'   => $result,
                'arg2'   => $key->[0],
            );
            $result = $result2;
        }
        push @opcodes, @{ $last_key->[1] };
        my $assign = new KeyedSetOp( $parser,
            'arg1'   => $last_key->[0],
            'arg2'   => undef,
            'result' => $result,
        );
        return [ $defn, \@opcodes, $assign ];
    }
    else {
        my $defn = $parser->YYData->{symbtab}->Lookup($idf);
        if ( defined $defn ) {

            # local variable
            if ( scalar( @{$var} ) ) {
                my $result   = $defn;
                my $last_key = pop @{$var};
                foreach my $key ( @{$var} ) {
                    push @opcodes, @{ $key->[1] };
                    my $result2 = new_tmp( $parser, 'pmc' );
                    push @opcodes, new LocalDir( $parser,
                        'result' => $result2,
                    );
                    push @opcodes, new KeyedGetOp(
                        $parser,
                        'result' => $result2,
                        'arg1'   => $result,
                        'arg2'   => $key->[0],
                    );
                    $result = $result2;
                }
                push @opcodes, @{ $last_key->[1] };
                my $assign = new KeyedSetOp( $parser,
                    'arg1'   => $last_key->[0],
                    'arg2'   => undef,
                    'result' => $result,
                );
                return [ $defn, \@opcodes, $assign ];
            }
            else {
                my $assign = new AssignOp( $parser,
                    'arg1'   => undef,
                    'result' => $defn,
                );
                return [ $defn, [], $assign ];
            }
        }
        else {
            my $defn = $parser->YYData->{symbtab}->LookupU($idf);
            if ( defined $defn ) {

                # upvariable
                if ( scalar( @{$var} ) ) {
                    my $result = new_tmp( $parser, 'pmc' );
                    push @opcodes,
                        new LocalDir( $parser, 'result' => $result, );
                    push @opcodes, new FindLexOp( $parser,
                        'result' => $result,
                        'arg1'   => $defn,
                    );
                    my $last_key = pop @{$var};
                    foreach my $key ( @{$var} ) {
                        push @opcodes, @{ $key->[1] };
                        my $result2 = new_tmp( $parser, 'pmc' );
                        push @opcodes, new LocalDir( $parser,
                            'result' => $result2,
                        );
                        push @opcodes, new KeyedGetOp( $parser,
                            'result' => $result2,
                            'arg1'   => $result,
                            'arg2'   => $key->[0],
                        );
                        $result = $result2;
                    }
                    push @opcodes, @{ $last_key->[1] };
                    my $assign = new KeyedSetOp( $parser,
                        'arg1'   => $last_key->[0],
                        'arg2'   => undef,
                        'result' => $result,
                    );
                    return [ $defn, \@opcodes, $assign ];
                }
                else {
                    my $assign = new StoreLexOp( $parser,
                        'arg1' => $defn,
                        'arg2' => undef,
                    );
                    return [ $defn, [], $assign ];
                }
            }
            else {

                # global variable
                my $global = get_global($parser);
                push @opcodes, @{ $global->[1] };
                my $key = BuildLiteral( $parser, $idf, 'key' );
                push @opcodes, @{ $key->[1] };
                my $result = $global->[0];
                foreach my $key2 ( @{$var} ) {
                    my $result2 = new_tmp( $parser, 'pmc' );
                    push @opcodes, new LocalDir( $parser,
                        'result' => $result2,
                    );
                    push @opcodes, new KeyedGetOp( $parser,
                        'result' => $result2,
                        'arg1'   => $result,
                        'arg2'   => $key->[0],
                    );
                    $result = $result2;
                    $key    = $key2;
                    push @opcodes, @{ $key->[1] };
                }
                my $assign = new KeyedSetOp( $parser,
                    'arg1'   => $key->[0],
                    'arg2'   => undef,
                    'result' => $result,
                );
                return [ $result, \@opcodes, $assign ];
            }
        }
    }
}

sub BuildAssigns {
    my ( $parser, $vars, $exprs ) = @_;
    my @opcodes1 = ();
    my @opcodes2 = ();
    my @opcodes3 = ();
    while ( my $var = shift @{$vars} ) {
        push @opcodes1, @{ $var->[1] };
        my $expr = shift @{$exprs};
        unless ( defined $expr ) {
            $expr = BuildLiteral( $parser, 'nil', 'nil' );
        }
        if (    scalar( @{$exprs} ) == 0
            and scalar( @{$vars} ) != 0
            and scalar( @{ $expr->[1] } ) != 0
            and $expr->[1]->[-1]->isa('CallOp') )
        {
            my $result;
            my $callop = pop @{ $expr->[1] };
            my $nil = BuildLiteral( $parser, 'nil', 'nil' );
            push @{ $expr->[1] }, @{ $nil->[1] };
            my $n = scalar( @{$vars} );
            while ( $n-- ) {
                $result = new_tmp( $parser, 'pmc' );
                push @{ $expr->[1] }, new LocalDir( $parser,
                    'result' => $result,
                );
                push @{ $expr->[1] }, new AssignOp( $parser,
                    'result' => $result,
                    'arg1'   => $nil->[0],
                );
                push @{$exprs}, [ $result, [] ];
                push @{ $callop->{result} }, $result;
            }
            push @{ $expr->[1] }, $callop;
        }
        push @opcodes2, @{ $expr->[1] };
        my $assign = $var->[2];
        if ( $assign->isa('AssignOp') ) {
            $assign->configure(
                'arg1' => $expr->[0],
            );
        }
        else {
            $assign->configure(
                 'arg2' => $expr->[0],
            );
        }
        push @opcodes3, $assign;
    }
    push @opcodes1, @opcodes2, @opcodes3;
    return \@opcodes1;
}

sub BuildCallVararg {
    my ($parser) = @_;
    my $result;
    my @opcodes = ();
    my $nil = BuildLiteral( $parser, 'nil', 'nil' );
    push @opcodes, @{ $nil->[1] };
    $result = new_tmp( $parser, 'pmc' );
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new AssignOp( $parser,
        'result' => $result,
        'arg1'   => $nil->[0],
    );
    my $argv = new defn( 'vararg', 'local', 'pmc' );
    my $fct = new defn( 'mkarg', 'util' );
    push @opcodes, new CallOp( $parser,
        'result' => [$result],
        'arg1'   => $fct,
        'arg2'   => [$argv],
    );
    return [ $result, \@opcodes ];
}

sub BuildCallVariable {
    my ( $parser, $var ) = @_;
    my $result;
    my @opcodes = ();
    my $idf     = shift @{$var};
    if ( ref($idf) eq 'ARRAY' ) {
        $result = $idf->[0];
        push @opcodes, @{ $idf->[1] };
    }
    else {
        my $defn = $parser->YYData->{symbtab}->Lookup($idf);
        if ( defined $defn ) {
            $result = $defn;
        }
        else {
            $defn = $parser->YYData->{symbtab}->LookupU($idf);
            if ( defined $defn ) {
                $result = new_tmp( $parser, 'pmc' );
                push @opcodes, new LocalDir( $parser,
                    'result' => $result,
                );
                push @opcodes, new FindLexOp( $parser,
                    'result' => $result,
                    'arg1'   => $defn,
                );
            }
            else {
                my $global = get_global($parser);
                push @opcodes, @{ $global->[1] };
                my $key = BuildLiteral( $parser, $idf, 'key' );
                push @opcodes, @{ $key->[1] };
                $result = new_tmp( $parser, 'pmc' );
                push @opcodes, new LocalDir( $parser,
                    'result' => $result,
                );
                push @opcodes, new KeyedGetOp( $parser,
                    'result' => $result,
                    'arg1'   => $global->[0],
                    'arg2'   => $key->[0],
                );
            }
        }
    }
    foreach my $key ( @{$var} ) {
        push @opcodes, @{ $key->[1] };
        my $result2 = new_tmp( $parser, 'pmc' );
        push @opcodes, new LocalDir( $parser,
            'result' => $result2,
        );
        push @opcodes, new KeyedGetOp( $parser,
            'result' => $result2,
            'arg1'   => $result,
            'arg2'   => $key->[0],
        );
        $result = $result2;
    }
    return [ $result, \@opcodes ];
}

sub BuildCallMethod {
    my ( $parser, $obj, $meth, $args ) = @_;
    my @opcodes = ();
    my $key = BuildLiteral( $parser, $meth, 'key' );
    push @opcodes, @{ $key->[1] };
    my $result = new_tmp( $parser, 'pmc' );
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new KeyedGetOp( $parser,
        'result' => $result,
        'arg1'   => $obj->[0],
        'arg2'   => $key->[0],
    );
    my $fct = [ $result, \@opcodes ];
    unshift @{$args}, $obj;
    return BuildCallFunction( $parser, $fct, $args );
}

sub BuildCallFunction {
    my ( $parser, $fct, $args ) = @_;
    my $result;
    my @opcodes = ();
    my @params  = ();
    my @returns = ();
    for my $arg ( @{$args} ) {
        if ( scalar @{ $arg->[1] } ) {
            push @opcodes, @{ $arg->[1] };
        }
        else {
            push @opcodes, new NoOp($parser);
        }
        push @params, $arg->[0];
    }
    if ( scalar(@opcodes) and $opcodes[-1]->isa('CallOp') ) {
        unless ( exists $params[-1]->{pragma} ) {
            $params[-1]->{pragma} = 'multi';
        }
    }
    push @opcodes, @{ $fct->[1] };
    my $nil = BuildLiteral( $parser, 'nil', 'nil' );
    push @opcodes, @{ $nil->[1] };
    $result = new_tmp( $parser, 'pmc' );
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new AssignOp( $parser,
        'result' => $result,
        'arg1'   => $nil->[0],
    );
    push @returns, $result;
    push @opcodes, new CallOp( $parser,
        'result' => \@returns,
        'arg1'   => $fct->[0],
        'arg2'   => \@params,
    );
    return [ $result, \@opcodes ];
}

sub BuildVoidFunctionCall {
    my ( $parser, $expr )    = @_;
    my ( $defn,   $opcodes ) = @{$expr};
    my $call = pop @{$opcodes};
    my $ass  = pop @{$opcodes};
    my $decl = pop @{$opcodes};
    delete $call->{result};
    push @{$opcodes}, $call;
    return $opcodes;
}

sub BuildUnop {
    my ( $parser, $op, $expr ) = @_;
    my %type = (
        '-'   => 'number',
        '#'   => 'number',
        'not' => 'boolean',
    );
    my %opcode = (
        '-'   => 'neg',
        'not' => 'not',
    );
    my @opcodes = ();
    my $result = new_tmp( $parser, 'pmc', $type{$op} );
    push @opcodes, @{ $expr->[1] };
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new NewOp( $parser,
        'result' => $result,
        'arg1'   => '.Lua' . ucfirst( $type{$op} ),
    );

    if ( $op eq '#' ) {
        push @opcodes, new CallMethOp( $parser,
            'result' => [$result],
            'arg1'   => 'len',
            'arg2'   => [ $expr->[0] ],
        );
    }
    else {
        push @opcodes, new UnaryOp( $parser,
            'op'     => $opcode{$op},
            'arg1'   => $expr->[0],
            'result' => $result,
        );
    }
    return [ $result, \@opcodes ];
}

sub BuildBinop {
    my ( $parser, $expr1, $op, $expr2 ) = @_;
    my %type = (
        '+'  => 'number',
        '-'  => 'number',
        '*'  => 'number',
        '/'  => 'number',
        '^'  => 'number',
        '%'  => 'number',
        '..' => 'string',
    );
    my %opcode = (
        '+'  => 'add',
        '-'  => 'sub',
        '*'  => 'mul',
        '/'  => 'div',
        '^'  => 'pow',
        '%'  => 'mod',
        '..' => 'concat',
    );
    my @opcodes = ();
    my $result = new_tmp( $parser, 'pmc', $type{$op} );
    push @opcodes, @{ $expr1->[1] };
    push @opcodes, @{ $expr2->[1] };
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new NewOp( $parser,
        'result' => $result,
        'arg1'   => ".Lua" . ucfirst( $type{$op} ),
    );
    push @opcodes, new BinaryOp( $parser,
        'op'     => $opcode{$op},
        'arg1'   => $expr1->[0],
        'arg2'   => $expr2->[0],
        'result' => $result,
    );
    return [ $result, \@opcodes ];
}

sub BuildRelop {
    my ( $parser, $expr1, $op, $expr2 ) = @_;
    my %opcode = (
        '<'  => 'islt',
        '<=' => 'isle',
        '>'  => 'isgt',
        '>=' => 'isge',
        '==' => 'iseq',
        '~=' => 'isne',
    );
    my @opcodes = ();
    my $flag = new_tmp( $parser, 'int' );
    push @opcodes, @{ $expr1->[1] };
    push @opcodes, @{ $expr2->[1] };
    push @opcodes, new LocalDir( $parser,
        'result' => $flag,
    );
    push @opcodes, new RelationalOp( $parser,
        'op'     => $opcode{$op},
        'arg1'   => $expr1->[0],
        'arg2'   => $expr2->[0],
        'result' => $flag,
    );
    my $result = new_tmp( $parser, 'pmc', 'boolean' );
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, new NewOp( $parser,
        'result' => $result,
        'arg1'   => '.LuaBoolean',
    );
    push @opcodes, new ToBoolOp( $parser,
        'arg1'   => $flag,
        'result' => $result,
    );
    return [ $result, \@opcodes ];
}

sub BuildLogop {
    my ( $parser, $expr1, $op, $expr2 ) = @_;
    my @opcodes = ();
    my $result = new_tmp( $parser, 'pmc' );
    push @opcodes, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes, @{ $expr1->[1] };
    my $lbl1 = new_label($parser);
    if ( $op eq 'and' ) {
        push @opcodes, new BranchIfOp( $parser,
            'arg1'   => $expr1->[0],
            'result' => $lbl1,
        );
    }
    else {    # "or"
        push @opcodes, new BranchUnlessOp( $parser,
            'arg1'   => $expr1->[0],
            'result' => $lbl1,
        );
    }
    push @opcodes, new AssignOp( $parser,
        'result' => $result,
        'arg1'   => $expr1->[0],
    );
    my $lbl2 = new_label($parser);
    push @opcodes, new BranchOp( $parser,
        'result' => $lbl2,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl1,
    );
    push @opcodes, @{ $expr2->[1] };
    push @opcodes, new AssignOp( $parser,
        'result' => $result,
        'arg1'   => $expr2->[0],
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl2,
    );
    return [ $result, \@opcodes ];
}

sub BuildParenthesedExpression {
    my ( $parser, $expr )    = @_;
    my ( $defn,   $opcodes ) = @{$expr};
    if ( scalar( @{$opcodes} ) and $opcodes->[-1]->isa('CallOp') ) {
        $defn->{pragma} = 'first';
    }
    return $expr;
}

sub BuildLocalVariable {
    my ( $parser, $idf ) = @_;
    my @opcodes = ();
    my $defn    = $parser->YYData->{symbtab}->LookupS($idf);
    unless ( defined $defn ) {
        my $name;
        $name = 'var_' . $parser->YYData->{lex_num} . '_' . $idf;
        $defn = new defn( $name, 'local', 'pmc', undef, $idf );
        push @opcodes, new LocalDir( $parser,
            'prolog' => 1,
            'result' => $defn,
        );
        push @opcodes, new LexDir( $parser,
            'prolog' => 1,
            'result' => $idf,
            'arg1'   => $defn,
        );
    }
    my $assign = new AssignOp( $parser,
        'arg1'   => undef,
        'result' => $defn,
    );
    return [ $defn, \@opcodes, $assign ];
}

sub BuildIf {
    my ( $parser, $expr, $then, $elseifs, $else ) = @_;
    my @opcodes = ();
    my $cond = get_cond( $parser, $expr );
    push @opcodes, @{ $cond->[1] };
    my $l_end  = new_label($parser);
    my $l_next = new_label($parser);
    push @opcodes, new BranchUnlessOp( $parser,
        'arg1'   => $cond->[0],
        'result' => $l_next,
    );
    push @opcodes, @{$then};
    push @opcodes, new BranchOp( $parser,
        'result' => $l_end,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_next,
    );

    for my $elseif ( @{$elseifs} ) {
        $cond = get_cond( $parser, $elseif->[0] );
        $l_next = new_label($parser);
        push @opcodes, @{ $cond->[1] };
        push @opcodes, new BranchUnlessOp( $parser,
            'arg1'   => $cond->[0],
            'result' => $l_next,
        );
        push @opcodes, @{ $elseif->[1] };
        push @opcodes, new BranchOp( $parser,
            'result' => $l_end,
        );
        push @opcodes, new LabelOp( $parser,
            'arg1' => $l_next,
        );
    }
    if ( defined $else ) {
        push @opcodes, @{$else};
    }
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_end,
    );
    return \@opcodes;
}

sub BuildWhile {
    my ( $parser, $expr, $block ) = @_;
    my @opcodes    = ();
    my $l_continue = new_label($parser);
    my $l_break    = new_label($parser);
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_continue,
    );
    my $cond = get_cond( $parser, $expr );
    push @opcodes, @{ $cond->[1] };
    push @opcodes, new BranchUnlessOp( $parser,
        'arg1'   => $cond->[0],
        'result' => $l_break,
    );

    foreach my $op ( @{$block} ) {
        if ( $op and $op->isa('BranchOp') ) {
            if ( $op->{result} eq 'break' ) {
                $op->{result} = $l_break;
            }
        }
    }
    push @opcodes, @{$block};
    push @opcodes, new BranchOp( $parser,
        'result' => $l_continue,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_break,
    );
    return \@opcodes;
}

sub BuildRepeat {
    my ( $parser, $block, $expr ) = @_;
    my @opcodes    = ();
    my $l_continue = new_label($parser);
    my $l_break    = new_label($parser);
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_continue,
    );
    foreach my $op ( @{$block} ) {
        if ( $op and $op->isa('BranchOp') ) {
            if ( $op->{result} eq 'break' ) {
                $op->{result} = $l_break;
            }
        }
    }
    push @opcodes, @{$block};
    my $cond = get_cond( $parser, $expr );
    push @opcodes, @{ $cond->[1] };
    push @opcodes, new BranchIfOp( $parser,
        'arg1'   => $cond->[0],
        'result' => $l_break,
    );
    push @opcodes, new BranchOp( $parser,
        'result' => $l_continue,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $l_break,
    );
    return \@opcodes;
}

sub BuildForNum {
    my ( $parser, $var, $e_start, $e_limit, $e_step, $block ) = @_;
    my @opcodes = ();
    unless ( defined $e_step ) {
        $e_step = BuildLiteral( $parser, 1, 'number' );
    }
    push @opcodes, @{ $e_start->[1] };
    push @opcodes, @{ $e_limit->[1] };
    push @opcodes, @{ $e_step->[1] };
    my $_var = new_tmp( $parser, 'pmc', 'number' );
    push @opcodes, new LocalDir( $parser,
        'result' => $_var,
    );
    my $_limit = new_tmp( $parser, 'pmc', 'number' );
    push @opcodes, new LocalDir( $parser,
        'result' => $_limit,
    );
    my $_step = new_tmp( $parser, 'pmc', 'number' );
    push @opcodes, new LocalDir( $parser,
        'result' => $_step,
    );
    my $fct = new defn( 'checkforloop', 'util' );
    push @opcodes, new CallOp( $parser,
        'result' => [ $_var,         $_limit,       $_step ],
        'arg1'   => $fct,
        'arg2'   => [ $e_start->[0], $e_limit->[0], $e_step->[0] ],
    );
    my $lbl_loop = new_label($parser);
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl_loop,
    );
    my $lbl_or = new_label($parser);
    my $zero = BuildLiteral( $_[0], 0, 'number' );
    push @opcodes, @{ $zero->[1] };
    push @opcodes, new BranchUnlessOp( $parser,
        'arg1'   => $_step,
        'op'     => '>',
        'arg2'   => $zero->[0],
        'result' => $lbl_or,
    );
    my $lbl_end = new_label($parser);
    push @opcodes, new BranchUnlessOp( $parser,
        'arg1'   => $_var,
        'op'     => '<=',
        'arg2'   => $_limit,
        'result' => $lbl_end,
    );
    my $lbl_blk = new_label($parser);
    push @opcodes, new BranchOp( $parser,
        'result' => $lbl_blk,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl_or,
    );
    push @opcodes, new BranchUnlessOp( $parser,
        'arg1'   => $_var,
        'op'     => '>=',
        'arg2'   => $_limit,
        'result' => $lbl_end,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl_blk,
    );
    push @opcodes, @{ $var->[1] };
    push @opcodes, new AssignOp( $parser,
        'result' => $var->[0],
        'arg1'   => $_var,
    );

    foreach my $op ( @{$block} ) {
        if ( $op and $op->isa('BranchOp') ) {
            if ( $op->{result} eq 'break' ) {
                $op->{result} = $lbl_end;
            }
        }
    }
    push @opcodes, @{$block};
    push @opcodes, new BinaryOp(
        $parser,
        'op'     => 'add',
        'arg1'   => $_var,
        'arg2'   => $_step,
        'result' => $_var,
    );
    push @opcodes, new BranchOp( $parser,
        'result' => $lbl_loop,
    );
    push @opcodes, new LabelOp( $parser,
        'arg1' => $lbl_end,
    );
    return \@opcodes;
}

sub BuildForList {
    my ( $parser, $vars, $exprs, $block ) = @_;
    my @opcodes1 = ();
    my @opcodes2 = ();
    my @opcodes3 = ();
    my @params1  = ();
    my @return1  = ();
    my $var1     = ${$vars}[0];
    my $nil      = BuildLiteral( $parser, 'nil', 'nil' );
    push @opcodes1, @{ $nil->[1] };

    for ( @{$vars} ) {
        push @opcodes1, @{ $_->[1] };
    }
    my $expr = shift @{$exprs};
    my $iter = new_tmp( $parser, 'pmc' );
    push @opcodes1, new LocalDir( $parser,
        'result' => $iter,
    );
    if (    scalar( @{$exprs} ) == 0
        and scalar( @{ $expr->[1] } ) != 0
        and $expr->[1]->[-1]->isa('CallOp') )
    {
        push @opcodes1, new AssignOp( $parser,
            'result' => $iter,
            'arg1'   => $nil->[0],
        );
        push @return1, $iter;
    }
    else {
        push @opcodes2, @{ $expr->[1] };
        push @opcodes3, new AssignOp( $parser,
            'result' => $iter,
            'arg1'   => $expr->[0],
        );
        $expr = shift @{$exprs};
    }
    my $state = new_tmp( $parser, 'pmc' );
    push @opcodes1, new LocalDir( $parser,
        'result' => $state,
    );
    if (    scalar( @{$exprs} ) == 0
        and scalar( @{ $expr->[1] } ) != 0
        and $expr->[1]->[-1]->isa('CallOp') )
    {
        push @opcodes1, new AssignOp( $parser,
            'result' => $state,
            'arg1'   => $nil->[0],
        );
        push @return1, $state;
    }
    else {
        push @opcodes2, @{ $expr->[1] };
        push @opcodes3, new AssignOp( $parser,
            'result' => $state,
            'arg1'   => $expr->[0],
        );
        $expr = shift @{$exprs};
    }
    my $var = new_tmp( $parser, 'pmc' );
    push @opcodes1, new LocalDir( $parser,
        'result' => $var,
    );
    if (    scalar( @{$exprs} ) == 0
        and scalar( @{ $expr->[1] } ) != 0
        and $expr->[1]->[-1]->isa('CallOp') )
    {
        push @opcodes1, new AssignOp( $parser,
            'result' => $var,
            'arg1'   => $nil->[0],
        );
        push @return1, $var;
    }
    else {
        push @opcodes2, @{ $expr->[1] };
        push @opcodes3, new AssignOp( $parser,
            'result' => $var,
            'arg1'   => $expr->[0],
        );
        $expr = shift @{$exprs};
    }
    if (    scalar( @{$exprs} ) == 0
        and scalar( @{ $expr->[1] } ) != 0
        and $expr->[1]->[-1]->isa('CallOp') )
    {
        push @opcodes2, @{ $expr->[1] };
        my $callop = pop @opcodes2;
        my $ass    = pop @opcodes2;
        my $decl   = pop @opcodes2;
        $callop->{result} = \@return1;
        push @opcodes2, $callop;
    }
    push @opcodes1, @opcodes2, @opcodes3;
    my $lbl_loop = new_label($parser);
    push @opcodes1, new LabelOp( $parser,
        'arg1' => $lbl_loop,
    );
    my @params2 = ( $state, $var );
    my @return2 = ();
    @opcodes2 = ();
    for ( @{$vars} ) {
        my $result = new_tmp( $parser, 'pmc' );
        push @opcodes1, new LocalDir( $parser,
            'result' => $result,
        );
        push @opcodes1, new AssignOp( $parser,
            'result' => $result,
            'arg1'   => $nil->[0],
        );
        push @return2,  $result;
        push @opcodes2, new AssignOp( $parser,
            'result' => $_->[0],
            'arg1'   => $result,
        );
    }
    push @opcodes1, new CallOp( $parser,
        'result' => \@return2,
        'arg1'   => $iter,
        'arg2'   => \@params2,
    );
    push @opcodes1, @opcodes2;
    push @opcodes1, new AssignOp( $parser,
        'result' => $var,
        'arg1'   => $var1->[0],
    );
    my $lbl_end = new_label($parser);
    push @opcodes1, new BranchIfOp( $parser,
        'arg1'   => $nil->[0],
        'op'     => '==',
        'arg2'   => $var,
        'result' => $lbl_end,
    );
    foreach my $op ( @{$block} ) {
        if ( $op and $op->isa('BranchOp') ) {
            if ( $op->{result} eq 'break' ) {
                $op->{result} = $lbl_end;
            }
        }
    }
    push @opcodes1, @{$block};
    push @opcodes1, new BranchOp( $parser,
        'result' => $lbl_loop,
    );
    push @opcodes1, new LabelOp( $parser,
        'arg1' => $lbl_end,
    );
    return \@opcodes1;
}

sub BuildBreak {
    my ($parser) = @_;
    my @opcodes = ();
    push @opcodes, new BranchOp( $parser,
        'result' => 'break',
    );
    return \@opcodes;
}

sub BuildReturn {
    my ( $parser, $exprs ) = @_;
    my @opcodes = ();
    my @returns = ();
    for my $expr ( @{$exprs} ) {
        if ( scalar @{ $expr->[1] } ) {
            push @opcodes, @{ $expr->[1] };
        }
        else {
            push @opcodes, new NoOp($parser);
        }
        push @returns, $expr->[0];
    }
    if ( scalar(@opcodes) and $opcodes[-1]->isa('CallOp') ) {
        unless ( exists $returns[-1]->{pragma} ) {
            $returns[-1]->{pragma} = 'multi';
        }
    }
    push @opcodes, new ReturnDir( $parser,
        'result' => \@returns,
    );
    return \@opcodes;
}

sub BuildParam {
    my ( $parser, $idf ) = @_;
    my @opcodes1 = ();
    my @opcodes2 = ();
    my $defn;
    if ( $idf eq '...' ) {
        $defn = new defn( 'vararg', 'local', 'pmc' );
        push @opcodes1, new ParamDir( $parser,
            'prolog' => 1,
            'result' => $defn,
            'pragma' => ':slurpy',
        );
    }
    else {
        my $name
            = 'var_' . scalar( @{ $parser->YYData->{scope} } ) . '_' . $idf;
        $defn = new defn( $name, 'local', 'pmc', undef, $idf );
        push @opcodes1, new ParamDir( $parser,
            'prolog' => 1,
            'result' => $defn,
        );
        my $nil = BuildLiteral( $parser, 'nil', 'nil' );
        push @opcodes2, @{ $nil->[1] };
        push @opcodes2, new LexDir( $parser,
            'prolog' => 1,
            'result' => $idf,
            'arg1'   => $defn,
        );
        my $lbl = new_label($parser);
        push @opcodes2, new BranchUnlessNullOp( $parser,
            'prolog' => 1,
            'arg1'   => $defn,
            'result' => $lbl,
        );
        push @opcodes2, new AssignOp( $parser,
            'prolog' => 1,
            'result' => $defn,
            'arg1'   => $nil->[0],
        );
        push @opcodes2, new LabelOp( $parser,
            'prolog' => 1,
            'arg1'   => $lbl,
        );
        $parser->YYData->{symbtab}->Insert($defn);
    }
    return [ $defn, \@opcodes1, \@opcodes2 ];
}

sub PrepareMethod {
    my ($parser) = @_;
    $parser->YYData->{self} = BuildParam( $parser, 'self' );
}

sub BuildFunctionBody {
    my ( $parser, $params, $block ) = @_;
    my @opcodes1 = ();
    my @opcodes2 = ();
    if ( $parser->YYData->{self} ) {
        unshift @{$params}, $parser->YYData->{self};
        $parser->YYData->{self} = undef;
    }
    my $fct = new_fct($parser);
    push @opcodes2, new SubDir(
        $parser,
        'prolog' => 1,
        'result' => $fct,
        'outer'  => '_main',
    );
    for my $param ( @{$params} ) {
        push @opcodes2, @{ $param->[1] };
    }
    if ( scalar( @{$params} ) != 0
        and !exists $params->[-1]->[1]->[-1]->{pragma} )
    {
        my $extra = new defn( 'extra', 'local', 'pmc' );
        push @opcodes2, new ParamDir( $parser,
            'prolog' => 1,
            'result' => $extra,
            'pragma' => ':slurpy',
        );
    }
    for my $param ( @{$params} ) {
        push @opcodes2, @{ $param->[2] };
    }
    push @opcodes2, @{$block};
    push @opcodes2, new EndDir( $parser );
    foreach my $op (@opcodes2) {
        if ( $op and $op->isa('BranchOp') ) {
            if ( $op->{result} eq 'break' ) {
                $parser->Error("no loop to break\n");
            }
        }
    }
    unshift @{ $parser->YYData->{functs} }, \@opcodes2;
    my $result = new_tmp( $parser, 'pmc', 'function' );
    push @opcodes1, new LocalDir( $parser,
        'result' => $result,
    );
    push @opcodes1, new ConstDir( $parser,
        'result' => $fct,
        'arg1'   => $fct->{symbol},
        'type'   => 'Sub',
    );
    push @opcodes1, new NewClosureOp( $parser,
        'result' => $result,
        'arg1'   => $fct,
    );
    return [ $result, \@opcodes1 ];
}

sub BuildMain {
    my ( $parser, $stat ) = @_;
    if ( scalar @{$stat} ) {
        my @opcodes = ();
        my $main = new defn( '_main', 'fct' );
        push @opcodes, new SubDir( $parser,
            'prolog' => 1,
            'result' => $main,
        );
        push @opcodes, @{$stat};
        push @opcodes, new EndDir($parser);
        foreach my $op (@opcodes) {
            if ( $op and $op->isa('BranchOp') ) {
                if ( $op->{result} eq 'break' ) {
                    $parser->Error("no loop to break\n");
                }
            }
        }
        unshift @{ $parser->YYData->{functs} }, \@opcodes;
    }
}

1;

