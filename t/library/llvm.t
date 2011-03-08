#! parrot-nqp

pir::load_bytecode("LLVM.pbc");

Q:PIR {
        # We want Test::More features for testing. Not NQP's builtin.
        .include "test_more.pir"
        load_bytecode "dumper.pbc"
};
pir::loadlib("llvm_engine");

my $module := LLVM::Module.create("HELLO");
ok(pir::defined($module), "LLVM::Module created");
ok( $module ~~ LLVM::Module, ".. with proper type");

my $printf := $module.add_function("printf", LLVM::Type::int32(), LLVM::Type::pointer(LLVM::Type::int8()), :va_args<1>);
#$printf.set_linkage(9);

my $function := $module.add_function("hello", LLVM::Type::int32());
ok(pir::defined($function), "Function created");
ok( $function ~~ LLVM::Function, ".. with proper type");

my $bb := $function.append_basic_block("the_block");
ok( pir::defined($bb), "BasicBlock appended");
ok( $bb ~~ LLVM::BasicBlock, ".. with proper type");

my $builder := LLVM::Builder.create();
ok( pir::defined($builder), "LLVM::Builder created");
ok( $builder ~~ LLVM::Builder, ".. with proper type");

$builder.set_position($bb);
ok( 1, "Builder positioned");

#$builder.call($function, :name<foo>);
#ok( 1, "Call created");

my $hello_str := $builder.global_string("****** Hello LLVM World ******\n", "");
ok( 1, "Global string created");

$builder.call($printf, $hello_str);
ok( 1, "Call created with args");

my $answer := LLVM::Constant::integer(42);
ok( 1, "Constant created");
$builder.ret($answer);
ok( 1, "return created");

# This will dump to stderr.
$module.dump();
ok(1, "LLVM::Module dumped");

my $engine := pir::new__psp("LLVM_Engine", $module);
my $call   := $engine.create($function, "i");
my $res    := -1;
$res       := $call();
ok(1, "Function called");
is($res, 42, "Proper answer found");


# Let's try to pass arguments.

# char* type.
my $str_type := LLVM::Type::pointer(LLVM::Type::int8());

# Create new function with params.
my $f2 := $module.add_function(
    "hello2",
    $str_type,
    $str_type,
);
$bb := $f2.append_basic_block("entry");
$builder.set_position($bb);

my @params;

my $i := 0;
my $last := $f2.params_count;
is( $last, 1, "We had 1 param of the function");

while $i < $last {
    # Create storage for params
    my $arg        := $f2.param($i);
    ok( $arg, "Argument fetched");
    $arg.name("arg" ~ $i);
    is( $arg.name, "arg" ~ $i, "Arg name set/get");

    my $arg_alloca := $builder.alloca($str_type);
    ok( pir::defined($arg_alloca), "Alloca created");

    my $arg_store  := $builder.store($arg, $arg_alloca);
    ok( pir::defined($arg_store), "Store created");

    # Remeber it for future use
    @params.push($arg_alloca);

    $i++;
}

# Call print
# Load arg first
my $val := $builder.load(@params[0]);
ok( pir::defined($val), "Value loaded");
$builder.call($printf, $val);

# Return same shit from function
$builder.ret($val);

# Dump and execute it
$module.dump();

$call   := $engine.create($f2, "tt");
$res    := $call("Hello from Parrot!\n");
is($res, "Hello from Parrot!\n", "Got same string back");



done_testing();

# vim: ft=perl6
