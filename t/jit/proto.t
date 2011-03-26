#! parrot-nqp

pir::load_bytecode("opsc.pbc");
pir::load_bytecode("LLVM.pbc");
pir::load_bytecode("nqp-setting.pbc");
pir::load_bytecode("dumper.pbc");

Q:PIR { .include "test_more.pir" };

# Some preparation
my $pir    := 't/jit/data/03.pir';
my $pbc    := subst($pir, / 'pir' $/, 'pbc');

# Generate PBC file
my @args   := list("./parrot", "-o", $pbc, $pir);
my $res    := pir::spawnw__ip(@args);

# OpLib
my $oplib := pir::new__psp("OpLib", "core_ops");

# Parse "jitted.ops"
my $ops_file := Ops::File.new("t/jit/jitted.ops",
    :oplib($oplib),
    :core(0),
    :quiet(0),
);

my $jitter := Ops::JIT.new($pbc, $ops_file, $oplib);

ok( 1, "JITter created");

=begin

# JIT context.
my %jit_context := hash(
    level       => 1,
    bc          => $bc,
    trans       => $trans,
    cur_opcode  => 0,
    constants   => $dir{ 'CONSTANT_' ~ $pir },

    basic_blocks => hash(), # offset->basic_block
);


#$module.dump();
#$module.verify(LLVM::VERIFYER_FAILURE_ACTION::PRINT_MESSAGE);

my $total := +$bc;
my $i := 0;

# Enumerate ops and create BasicBlock for each.
while ($i < $total) {
    # Mapped op
    my $id     := $bc[$i];

    # Real opname
    my $opname := $opmap[$id];

    # Get op
    my $op     := $oplib{$opname};

    say("# $opname");
    my $bb := $leave.insert_before("L$i");
    %jit_context<basic_blocks>{$i} := hash(
        label => "L$i",
        bb    => $bb,
    );

    # Next op
    $i := $i + 1 + count_args($op, %jit_context);
}

#$module.dump();

# Branch from "entry" BB to next one.
$builder.set_position($entry);
$builder.br($entry.next);

#$module.verify(LLVM::VERIFYER_FAILURE_ACTION::PRINT_MESSAGE);

# "JIT" Sub
$i := 0;
while ($i < $total) {
    # Mapped op
    my $id     := $bc[$i];

    # Real opname
    my $opname := $opmap[$id];

    # Get op
    my $op     := $oplib{$opname};
    # Op itself
    say("# $i $opname");

    # Position Builder to previousely created BB.
    $builder.set_position(%jit_context<basic_blocks>{$i}<bb>);

    #_dumper(%parsed_op{ $opname });
    my $parsed_op := %parsed_op{ $opname };
    my $jitted_op := $parsed_op.source( %jit_context );

    #%jit_context<basic_blocks>{$i}<body> := $jitted_op;
    #say($jitted_op);

    # Next op
    $i := $i + 1 + count_args($op, %jit_context);
    %jit_context<cur_opcode> := $i;
}

$module.dump();
$module.verify(LLVM::VERIFYER_FAILURE_ACTION::PRINT_MESSAGE);
ok( 1, "Module verified");

# Dump
for %jit_context<basic_blocks>.keys.sort -> $id {
    my $b := %jit_context<basic_blocks>{$id};
    #print($b<label> ~ ": ");
    #say($b<body>);
}


sub count_args($op, %jit_context) {
    Q:PIR {
        .local pmc op
        .local int s
        find_lex op, '$op'
        s = elements op
        %r = box s
    };

}

=end

done_testing();
# vim: ft=perl6
