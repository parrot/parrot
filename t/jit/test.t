#! parrot-nqp

pir::load_bytecode("opsc.pbc");
pir::load_bytecode("LLVM.pbc");
pir::load_bytecode("nqp-setting.pbc");
pir::load_bytecode("dumper.pbc");
pir::loadlib("llvm_engine");

Q:PIR { .include "test_more.pir" };

my $pir    := 't/jit/data/02.pir';
my $pbc    := subst($pir, / 'pir' $/, 'pbc');

# Generate PBC file
my @args   := list("./parrot", "-o", $pbc, $pir);
my $res    := pir::spawnw__ip(@args);

# Load PBC into memory
my $handle   := open($pbc, :r, :bin);
my $contents := $handle.readall;
$handle.close();

my $pf := pir::new('Packfile');
$pf.unpack($contents);

ok( 1, "Unpacked" );

my $dir := $pf.get_directory();
ok( pir::defined($dir), "Got PF Directory");

my $bc := $dir{'BYTECODE_' ~ $pir};
ok( pir::defined($bc), "Got bytecode" );

my $opmap := $bc.opmap();
ok( pir::defined($opmap), "Got OpMap");

my $oplib := pir::new__psp("OpLib", "core_ops");

my $interp  := pir::new("ParrotInterpreter");
my $context := pir::new("CallContext");

my %jit_context := hash(
    bc => $bc,
);

# Parse "jitted.ops"
my $ops_file := Ops::File.new("t/jit/jitted.ops",
    :oplib($oplib),
    :core(0),
    :quiet(0),
);

# Convert it to hash for faster lookup. Also cleanup a bit.
my %parsed_op;
for $ops_file.ops -> $op {
    $op := Ops::Util::strip_source($op);
    %parsed_op{$op.full_name} := $op;
};

# Just dump content of PBC file with "disassemble"
my $total := +$bc;
my $i := 0;
while ($i < $total) {
    # Mapped op
    my $id     := $bc[$i];

    # Real opname
    my $opname := $opmap[$id];

    # Get op
    my $op     := $oplib{$opname};
    my $args   := Q:PIR {
        .local pmc op
        .local int s
        find_lex op, '$op'
        s = elements op
        %r = box s
    };

    # Op itself
    print("\t$i $opname");

    # Args
    while ($args) {
        $i++;
        $args--;
        print(" {$bc[$i]}");
    }

    say("");

    _dumper(%parsed_op{ $opname });

    # Next op
    $i++;
}

# vim: ft=perl6
