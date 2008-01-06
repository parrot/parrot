# Copyright (C) 2007, The Perl Foundation.
# $Id $

class Punie::Grammar::Actions;

##  The ast of the entire program is the ast of the
##  top-level <lineseq>.
method TOP($/) {
    my $?GLOBAL;
    my $init := PAST::Stmts.new();
    $init.push( PAST::Var.new(:name('$_'), :isdecl(1)) );
    $init.push( PAST::Var.new(:name('$#'), :isdecl(1)) );
    $init.push( PAST::Var.new(:name('$ '), :isdecl(1)) );
    $?GLOBAL := PAST::Block.new(
            PAST::Stmts.new( $init ),
            :blocktype('immediate'),
            :node($/)
    );
    $?GLOBAL.symbol( '$_', :scope('package') );
    $?GLOBAL.symbol( '$#', :scope('package') );
    $?GLOBAL.symbol( '$ ', :scope('package') );
    my $past := PAST::Block.new( :node($/), :name('anon') );
    $past.push( $($<lineseq>) );
    make $past;
}

method block ($/) {
    my $init := PAST::Stmts.new();
    $init.push(
        PAST::Var.new(:name('@_'), :scope('parameter'), :slurpy(1))
    );
    my $past := PAST::Block.new( :node($/), :blocktype('immediate') );
    $past.symbol( '@_', :scope('lexical') );
    $past.push( $init );
    $past.push( $( $<lineseq> ) );
    make $past;
}

method lineseq ($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<line> {
        $past.push( $($_) );
    }
    make $past;
}

method line ($/, $key) {
    make $( $/{$key} );
}

method sideff($/) {
    my $expr := $( $<expr> );
    if $<modifier> {
        my $mod := $( $<modifier>[0] );
        $mod.push($expr);
        make $mod;
    }
    else { # no modifier
        make $expr;
    }
}

method loopmod($/) {
    my $past := PAST::Op.new( $( $<expr> ), :node($/) );
    # pasttype is "repeat_while" or "repeat_until"
    my $pasttype := "repeat_" ~ ~$<sym>;
    $past.pasttype($pasttype);
    make $past;
}

method condmod($/) {
    my $past := PAST::Op.new( :pasttype( ~$<sym> ), :node($/) );
    $past.push( $( $<expr> ) );
    make $past;
}

method subroutine($/) {
    my $past := $($<block>);
    $past.name( ~$<word> );
    $past.blocktype('declaration');
    $past.node($/);
    make $past;
}

method gprint ($/) {
    my $past := PAST::Op.new( :node($/) );
    my $expr := $($<expr>);
    if ~$expr.name() eq 'infix:,' {
        for @($expr) {
            $past.push( $_ );
        }
    }
    else {
        $past.push( $expr );
    }
    $past.name('print');
    $past.pasttype('call');
    make $past;
}

method cond($/) {
    my $cond := +$<expr> - 1;
    my $past := PAST::Op.new( $( $<expr>[$cond] ),
                              $( $<block>[$cond] ),
                              :pasttype( 'if' ),
                              :node( $/ )
                            );
    if ( $<else> ) {
        $past.push( $( $<else>[0] ) );
    }
    while ($cond != 0) {
        $cond := $cond - 1;
        $past := PAST::Op.new( $( $<expr>[$cond] ),
                               $( $<block>[$cond] ),
                               $past,
                               :pasttype('if'),
                               :node( $/ )
                             );
    }
    $past.pasttype( ~$<sym> );
    make $past;
}

method loop($/, $key) {
    # TODO: handle $<label>
    my $past := $( $/{$key} );
    make $past
}

method while_loop($/) {
    my $cond := $( $<texpr> );
    my $block := $( $<block> );
    make PAST::Op.new( $cond, $block, :pasttype( 'while' ), :node($/) );
}

method until_loop($/) {
    my $cond  := $( $<expr> );
    my $block := $( $<block> );
    make PAST::Op.new( $cond, $block, :pasttype( 'until' ), :node($/) );
}

method for_loop($/) {
    # if there's a step statement, create a new loop body,
    # which is the original block and the step, executed
    # after each iteration. Otherwise the body is just the
    # for's <block> node.
    my $body := $( $<block> );
    if $<step> {
        my $step := $( $<step>[0] );
        $body := PAST::Stmts.new( $body, $step, :node($/) );
    }

    my $loop := PAST::Op.new( $( $<texpr> ),
                              $body,
                              :pasttype('while'),
                              :node($/) );

    # if there's an init. step, create a new Stmts node, which has
    # 2 statements: the init. step, and the loop statement. If no
    # step, then the loop is all there is, and no need for a Stmts node.
    if $<init> {
        my $init := $( $<init>[0] );
        make PAST::Stmts.new( $init, $loop, :node($/) );
    }
    else {
        make $loop;
    }
}

method texpr($/) {
    if $<expr> {
        make $( $<expr>[0] );
    }
    else {
        make PAST::Val.new( :value('1'), :returns('Integer'), :node($/) );
    }
}

method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node( $/ ) );
}

method stringdouble($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method stringsingle($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method stringbacktick($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method subcall($/) {
    my $past := PAST::Op.new( :node($/) );
    if $<expr> {
        my $expr := $($<expr>[0]);
        if ~$expr.name() eq 'infix:,' {
            for @($expr) {
                $past.push( $_ );
            }
        }
        else {
            $past.push( $expr );
        }
    }
    $past.name( ~$<sym> );
    $past.pasttype('call');
    $past.node($/);
    make $past;
}

method expr($/, $key) {
    make $( $/{$key} );
}

method oexpr($/, $key) {
    if ($key eq 'end') {
        make $($<expr>);
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $($_) );
        }
        make $past;
    }

}

method term($/, $key) {
    make $( $/{$key} );
}

method variable($/) {
    my $viviself := 'Undef';
    my $sigil := ~$<sigil>[0];
    if    ~$sigil eq '@' { $viviself := 'ResizablePMCArray'; }
    elsif ~$sigil eq '%' { $viviself := 'Hash'; }
    if    ~$<key>[0]<KEY> eq '[' { $viviself := 'ResizablePMCArray'; $sigil := '@'; }
    elsif ~$<key>[0]<KEY> eq '{' { $viviself := 'Hash';  $sigil := '%'; }
    if $<key> {
        my $scope := 'package';
        if ~$sigil ~ ~$<word> eq '@_' { $scope := 'lexical' }
        my $base := PAST::Var.new(
            :name( $sigil ~ $<word> ),
            :scope($scope),
            :viviself($viviself)
        );
        make PAST::Var.new(
            $base,
            $( $<key>[0]<expr> ),
            :scope('keyed'),
            :viviself('Undef')
        );
    }
    else {
        if ~$<sigil> eq '$#' { # XXX not yet implemented
        }
        make PAST::Var.new(
            :node($/),
            :name( $sigil ~ $<word> ),
            :viviself($viviself),
            :scope('package')
        );
    }

}


method special_variable($/) {
    make PAST::Var.new( :node($/), :name(~$/), :scope('package') );
}
