#!/home/tewk/srcs/parrot/perl6

# $Id$
# Copyright (C) 2008, The Perl Foundation.

use v6;

evalfile('./ncigen.pbc', lang => 'Parrot');

my $fn = @*ARGS[0];
my $pp_fn = mktempfile('ptemp');

run("gcc -x c -E $fn > $pp_fn");
my $compiler = compreg('NCIGEN');
my $ast = $compiler.parse(slurp($pp_fn));

my $b = $ast.item();

for ($ast.item().kv) -> $k,$v {
  say "====================================================";
  say $k;
  say $v.perl;
  for ($v.list) -> $x {
    say $x.perl;
  }
  say pir($v);
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
    my $fmt = ".namespace [$nsname]\n";
    $fmt ~= ".sub __load_lib_dlfunc_init__ :anon :init :load\n";

    if $libname {
        $fmt ~= "loadlib \$P1, '$libname'\nif \$P1 goto has_lib\n";
    }
    else {
        $fmt ~= "\$P1 = null\ngoto has_lib\n";
    }

    $fmt ~= "\$P2 = new 'Exception'";
    $fmt ~= "\$P2[0] = 'error loading $libname - loadlib failed'";
    $fmt ~= "throw \$P2";
    $fmt ~= "has_lib:";

    return $fmt;
}

multi sub pir($node) {
    return  pir_children($node);
}
multi sub pir(NCIGENAST::TypeDef $node) { return ""; }
multi sub pir(NCIGENAST::VarDecl $node) { return ""; } 
multi sub pir(NCIGENAST::FuncDecl $node) {
    ##  get list of arguments to operation
    my $arglist = $node.list();

    my $type = param_to_code($node, 1);

    for @($arglist) -> $x {
        $type ~= param_to_code($x);
    }

    my $name = $node.name();
    my $fmt = "dlfunc \$P2, \$P1, '$name', '$type'\nstore_global '$name', \$P2";

    return $fmt;
}

sub param_to_code($node, $returncode) {
    my $I0 = $node.'pointer'();
    my $I2 = $node.'pointer_cnt'();
    my $pt = $node.'primitive_type'();

    if ($node.pointer()) {
        if ($pt ~~ 'void' ) {
            if ($returncode) { return ""; }
            else { return "v"; }
        }
        elsif ($pt ~~ 'int') { return "i"; }
        elsif ($pt ~~ 'long') { return "l"; }
        elsif ($pt ~~ 'char') { return "c"; }
        elsif ($pt ~~ 'short') { return "s"; }
        else { return "p"; }
    }
    else {
        if ($node.pointer_cnt() > 1 ) {
            return "V";
        }
        if ($pt ~~ 'void' ) {
            if ($returncode) { return "p"; } #probably should be "V"
            else { return "p"; } 
        }
        elsif ($pt ~~ 'int') { return "V"; }
        elsif ($pt ~~ 'long') { return "V"; }
        elsif ($pt ~~ 'char') { return "t"; }
        elsif ($pt ~~ 'short') { return "V"; }
        else { 
            say "ERROR";
            say $pt;
            say "what is this";
            return "p"; }
    }
}

sub to_pir($ast, $adverbs) {
#    .param pmc ast
#    .param pmc adverbs         :slurpy :named
    
    my $code = "";
    my $raw = $adverbs['raw'];
    unless ($raw) {
        $code = gen_preamble($adverbs);
    }

    ##  now generate the pir
    $code = pir(ast);

    return $code;
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
# vim: expandtab shiftwidth=4 ft=perl6:

