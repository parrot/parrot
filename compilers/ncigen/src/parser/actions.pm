# $Id$
# Copyright (C) 2008, Parrot Foundation.

=begin comments

NCIGEN::Grammar::Actions - ast transformations for NCIGEN

This file contains the methods that are used by the parse grammar
to build the PAST representation of an C program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments


class NCIGEN::Grammar::Actions;

our $decls := NCIGENAST::Decls.new();
our $NCIGENDEBUG :=0;

method TOP($/) {
    if $NCIGENDEBUG { _dumper($decls); }
    make $decls;
}

sub parse_decl_specs($/, $ast) {
    if $/ {
        for $/ {
            $ast.attr( strip_spaces(~$_), 1, 1);
        }
    }
}

sub typedef($/) {
    if $/ {
        for $/ {
            if ('typedef' eq strip_spaces(~$_) ) { return 1; }
        }
    }
    return 0;
}

method declaration($/) {
    my $ast := NCIGENAST::VarDecl.new( :node($/) );
    my $type := "";

    #say("=================================================================================================");
    #_dumper($/);
#    make $decls;
#    return 1;
    my $decl_specs := $<declaration_specifiers><repeatable_declaration_specifiers>;
    if typedef($decl_specs) {
        $ast := NCIGENAST::TypeDef.new( :node($/) );
        $type := "TypeDef";
    }
    elsif $/<init_declarator><init_declarator><declarator><direct_declarator><declarator_suffix><declarator_suffix><parameter_type_list> {
        $ast := NCIGENAST::FuncDecl.new( :node($/) );
        $type := "FuncDecl";
    }
#    elsif $<declaration_specifiers><type_specifier><type> {
#        $ast := NCIGENAST::Struct.new( :node($/) );
#        $type := "Struct";
#    }
    else {
        $ast := NCIGENAST::VarDecl.new( :node($/) );
        $type := "VarDecl";
    }
    parse_decl_specs( $<declaration_specifiers><repeatable_declaration_specifiers>, $ast );

    #  TYPE
    settype($<declaration_specifiers><type_specifier>, $ast);

    if ($type eq "FuncDecl") {
        if (+$<init_declarator> != 1) {
            say("ERROR FuncDecl has more than one <init_declarator>");
        }

        #assert(+$<init_declarator><declarator><direct_declarator><declarator_suffix>  == 1);
        my $params := $<init_declarator><declarator><declarator><direct_declarator><declarator_suffix><parameter_type_list><parameter_type_list><parameter_list><parameter_declaration>;
        for $params {
            my $param := NCIGENAST::Param.new( :node( $_ ) );

            settype($_<declaration_specifiers><type_specifier>, $param);
            my $param_ident := $_<declarator>;
            if $param_ident { setname( $_, $param ); }
            ispointer($_, $param);
            $ast.push( $param );
        }
        my $declarator := $<init_declarator><declarator>;
        my $name := setname($declarator, $ast);
        $decls{ $name } := $ast;
        ispointer($declarator, $ast);
        #if $NCIGENDEBUG { _dumper($ast); }
        #say($name);
    }
    #elsif ($type eq "VarDecl") {
    #elsif $<init_declarator> {
    else {
        for $<init_declarator> {
            my $l_ast := $ast.clone();

            my $name := setname($_, $l_ast);
            $decls{ $name } := $l_ast;
            ispointer($_, $l_ast);
            #if $NCIGENDEBUG { _dumper($l_ast); }
            #say($name);
        }
    }
    #else {
    #    say("OPAQUE STRUCT OR UNTION");
    #    _dumper($/);
    #}

    make $decls;
}

sub countpointer($/) {
    if $<pointer> {
        return countpointer($<pointer>) + 1;
    }
    else {
        return 0;
    }
}

sub ispointer($/, $ast) {
    if $/ {
        if ($<declarator><pointer>)  {
            $ast.pointer(1);
            $ast.pointer_cnt(countpointer($<declarator><pointer>));
        }
        if ($<abstract_declarator><pointer>)  {
            $ast.pointer(1);
            $ast.pointer_cnt(countpointer($<abstract_declarator><pointer>));
        }
    }

    my $lookup_ast := $ast;
    repeat {
=begin comment
        if $lookup_ast.pointer() {
            $ast.pointer(1);
            my $pc := +$ast.pointer_cnt();
            $pc++;
            $ast.pointer_cnt($pc);
        }
=end comment

        if $lookup_ast.builtin_type() {
            $ast.primitive_type(~($lookup_ast.type()));
            return 1;
        }
        my $type_name := $lookup_ast.type();
        my $lookup_ast_name := $lookup_ast.name();

        #FIXME struct or union typedef
        if ($lookup_ast.name() eq $type_name) {
            return 1;
        }

        $lookup_ast := $decls{$type_name};
        unless $lookup_ast {
            #say("Parent " ~~ $lookup_ast_name ~~ " " ~~ $type_name ~~ " not defined");
            return 1;
        }
        if $lookup_ast.pointer() {
            $ast.pointer(1);
            my $pc := +$ast.pointer_cnt();
            $pc := $pc + $lookup_ast.pointer_cnt();
            $ast.pointer_cnt($pc);
        }
    } while (1);
    #_dumper($ast);
}

sub settype($/, $ast) {
    if $/ {
        #is it a struct or union
        my $struct_or_union := strip_spaces(~$<type>);
        if $struct_or_union {
            my $ident := $<struct_or_union_specifier><identifier><identifier>;
            if $ident {
                $ident := strip_spaces($ident.text());
            }
            else {
                $ident := $<struct_or_union_specifier><identifier>;
                if $ident {
                    $ident := strip_spaces($ident.text());
                }
                else {
                    $ident := "anonymous_" ~~ $struct_or_union~~ "1";
                }
            }
            $ast.type($ident);
            my $s_or_u := $<struct_or_union_specifier><struct_declaration>;
            if $s_or_u {
                my $su;
                if ($struct_or_union eq "struct" ) {
                    $su := NCIGENAST::Struct.new( :node($/) );
                }
                else {
                    $su := NCIGENAST::Union.new( :node($/) );
                }
                $su.name($ident);
                build_struct_or_union($s_or_u, $su);
                $ast.complex($su);
            }
        }
        else {
            $ast.type(strip_spaces(~$/));
            #  BUILTIN_TYPE
            if $<builtin_type> { $ast.builtin_type(1); }
        }
    }
    else {
        say("ERROR no type specifier");
    }
}

sub strip_spaces($_) {
    $_.replace(' ', '');
    return $_;
}

sub build_struct_or_union($/, $ast) {
    for $/ {
        my $smt := NCIGENAST::VarDecl.new( :node($_) );
        settype( $_<specifier_qualifier_list><type_specifier>, $smt );
        for $_<struct_declarator_list> {
            my $sm := $smt.clone();
            my $declarator := $_<struct_declarator><declarator>;
            $sm.name(strip_spaces($declarator.text()));
            ispointer($declarator, $sm);
            $ast.push($sm);
        }
    }
}

sub setname($/, $ast) {
    my $name_node := $<declarator><direct_declarator><declarator_prefix>;
    if $name_node {
        $ast.name( ~$name_node );
        return ~$name_node;
    }
    else {
        say("ERROR node doesn't have <direct_declarator><declarator_prefix>");
        _dumper($/);
    }
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 syntax=perl6:

