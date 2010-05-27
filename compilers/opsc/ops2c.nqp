#! ./parrot-nqp
# $Id$

pir::load_bytecode("opsc.pbc");
pir::load_bytecode("Getopt/Obj.pbc");

my $core := 0;
my @files;
my $emit_lines := 1;

my $getopts := Q:PIR{ %r = new ['Getopt';'Obj'] };

$getopts.notOptStop();

# build core ops
my $arg := $getopts.add();
$arg.long('core');
$arg.short('c');

# build the dynops in one .ops file
$arg := $getopts.add();
$arg.long('dynamic');
$arg.short('d');
$arg.type('String');

# don't write to any files
$arg := $getopts.add();
$arg.long('debug');
$arg.short('g');

# don't add line numbers to generated files (not implemented)
$arg := $getopts.add();
$arg.long('no-lines');
$arg.short('n');

# print anemic usage information and exit
$arg := $getopts.add();
$arg.long('help');
$arg.short('h');

# regenerate ops.num et. al. even if it's not necessary
$arg := $getopts.add();
$arg.long('force-regen');
$arg.short('f');

# suppress timing and debug output on stdout
$arg := $getopts.add();
$arg.long('quiet');
$arg.short('q');

my $opts := $getopts.get_options(pir::getinterp__p()[2]);

if $opts<core> {
    @files := <
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/cmp.ops
        src/ops/io.ops
        src/ops/math.ops
        src/ops/object.ops
        src/ops/pmc.ops
        src/ops/set.ops
        src/ops/string.ops
        src/ops/sys.ops
        src/ops/var.ops
        src/ops/experimental.ops
    >;
    $core := 1;
}
elsif $opts<dynamic> {
    $core := 0;
    @files.push( $opts<dynamic>);
}
elsif (+$opts == 0 || $opts<help>) {
    say("This is ops2c, part of Parrot build infrastructure.
usage:
ops2c --core
ops2c --dynamic path/to/dynops.ops");
    pir::exit(0);
}

my $force_regen := ?$opts<force-regen>;

if ($opts<no-lines>) {
    #TODO: figure out how to generate line numbers
    # $emit_lines is currently ignored
    $emit_lines := 0;
}

my $trans := Ops::Trans::C.new();
my $start_time := pir::time__N();
my $debug := ?$opts<debug>;
my $quiet := ?$opts<quiet>;
my $f;
my $renum;

if $core {
    my $lib := Ops::OpLib.new(
        :skip_file('src/ops/ops.skip'),
        :quiet($quiet)
    );
    $f := Ops::File.new(|@files, :oplib($lib), :core(1), :quiet($quiet));
}
else {
    $f := Ops::File.new(|@files, :core(0), :quiet($quiet));
}

pir::sprintf(my $time, "%.3f", [pir::time__N() - $start_time] );
$quiet || say("# Ops parsed in $time seconds.");

my $emitter := Ops::Emitter.new(
    :ops_file($f), :trans($trans),
    :script('ops2c.nqp'), :file(@files[0]),
    :flags( hash( core => $core, quiet => $quiet ) ),
);

unless $debug {
    if $core {
        $emitter.print_ops_num_files();
    }
    $emitter.print_c_header_files();
    $emitter.print_c_source_file();
}

# vim: expandtab shiftwidth=4 ft=perl6:
