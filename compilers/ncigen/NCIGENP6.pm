#!/home/tewk/srcs/parrot/perl6

# $Id$
# Copyright (C) 2008, The Perl Foundation.

use v6;

evalfile('./ncigen.pbc', lang => 'Parrot');

sub parse_ast($fn) {
    my $pp_fn = mktempfile('ptemp');

    run("gcc -x c -E $fn > $pp_fn");
    my $compiler = compreg('NCIGEN');
    my $ast = $compiler.parse(slurp($pp_fn));
    unlink $pp_fn;
    $ast.item();
}

sub compreg {
    my $a = q:PIR { %r = compreg 'NCIGEN' };
    return $a;
}

sub mktempfile($prefix) {
    sub nonce() { ".{$*PID}." ~ int 1000.rand }
    $prefix ~ nonce;
}

sub gen_preamble($nsname, $libname) {
    my $fmt = ".namespace ['$nsname']\n";
    $fmt ~= ".sub __load_lib_dlfunc_init__ :anon :init :load\n";

    if $libname {
        $fmt ~= "loadlib \$P1, '$libname'\nif \$P1 goto has_lib\n";
    }
    else {
        $fmt ~= "\$P1 = null\ngoto has_lib\n";
    }

    $fmt ~=
        qq{{\$P2 = new 'Exception'
\$P2[0] = 'error loading $libname - loadlib failed'
throw \$P2
has_lib:
}};

    return $fmt;
}

sub gen_postamble() {
    return ".end\n";
}

sub dump_node($node) {
    say "====================================================";
    say $node.perl;
    for ($node.list) -> $x {
        say $x.perl;
    }
}

=begin
multi sub pir($node) {
    say $node.WHAT;
    return  pir_children($node);
}
=end

#multi sub pir(NCIGENAST::TypeDef $node) { return ""; }
#multi sub pir(NCIGENAST::VarDecl $node) { return ""; }
multi sub pir(NCIGENAST::FuncDecl $node) {
## return type
    my $type = param_to_code($node, 1);

##  get list of arguments to operation
    for ($node.list()) -> $x {
        $type ~= param_to_code($x);
    }
    return ($node.name, $type, $node.source());
}

sub format_func_decl($pirname, $cname, $type) {
    return qq{{dlfunc \$P2, \$P1, '$cname', '$type'
store_global '$pirname', \$P2}};
}

sub param_to_code($node, $returncode = 0) {
    my $pt = $node.'primitive_type'();

    if ($node.pointer()) {
        if ($node.pointer_cnt() > 1 ) { return "V"; } #out params
        given $pt {
          when 'void' {
            if ($returncode) { return "p"; } #probably should be "V"
            else { return "p"; }
          }
          when 'int'    { return "V"; }
          when 'long'   { return "V"; }
          when 'char'   { return "t"; }
          when 'short'  { return "V"; }
          when 'double' { return "V"; }
          when 'floag'  { return "V"; }
          default {
=begin
            say "ERROR";
            say $node.perl;
            say "what is this";
=end
              return "p";
          }
        }
    }
    else {
        given $pt {
            when 'void' {
                if ($returncode) { return ""; } # void return code
                else { return "v"; }
            }
            when 'int'      { return "i"; }
            when 'long'     { return "l"; }
            when 'char'     { return "c"; }
            when 'short'    { return "s"; }
            when 'double'   { return "d"; }
            when 'floag'    { return "f"; }
            default         { return "p"; }
        }
    }
}

sub pir_children($node) {
    my $code = "";
    for ($node.kv) -> $k, $v {
        $code ~= pir($v);
    }
    return $code;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab ft=perl6 shiftwidth=2


