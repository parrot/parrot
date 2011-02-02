#!/usr/bin/env parrot-nqp

plan(1);

pir::load_bytecode("lib/YAML/Tiny.pbc");
ok(1, "Loaded module");
