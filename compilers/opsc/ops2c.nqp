#! ./parrot-nqp

# workaround nqp-rx not generating :main
Q:PIR {
.end
.sub 'main' :main
    .const "Sub" $P0 = "MAIN"
    .tailcall $P0()
.end
.sub '' :anon
};

sub MAIN() {
    pir::load_bytecode("opsc.pbc");
    pir::load_bytecode("Getopt/Obj.pbc");

    my $opts := get_options();

    return usage() if $opts<help>;

    #TODO: figure out how to generate line numbers
    # $emit_lines is currently ignored
    my $emit_lines  := !?$opts<no-lines>;
    my $core        := ?$opts<core>;
    my $debug       := ?$opts<debug>;
    my $quiet       := ?$opts<quiet>;

    my @files;
    if $core {
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
    }
    elsif $opts<dynamic> {
        @files.push( $opts<dynamic>);
    }
    else {
        return usage();
    }

    my $trans := Ops::Trans::C.new();
    my $start_time := pir::time__N();
    my $lib   := $core
                 ?? Ops::OpLib.new(
                        :skip_file('src/ops/ops.skip'),
                        :quiet($quiet)
                    )
                 !! undef;

    my $f := Ops::File.new(|@files, :oplib($lib), :core($core), :quiet($quiet));

    $quiet || say("# Ops parsed in { pir::sprintf__ssp("%.3f", [pir::time__N() - $start_time] ) } seconds.");
 
    my $emitter := Ops::Emitter.new(
        :ops_file($f), :trans($trans),
        :script('ops2c.nqp'), :file(@files[0]),
        :flags( hash( core => $core, quiet => $quiet ) ),
    );

    unless $debug {
        $emitter.print_ops_num_files() if $core;
        $emitter.print_c_header_files();
        $emitter.print_c_source_file();
    }
}

sub get_options() {
    my $getopts := pir::new(Getopt::Obj);

    $getopts.notOptStop();

    # build core ops
    $getopts.add_option('core', 'c');

    # build the dynops in one .ops file
    $getopts.add_option('dynamic', 'd', 'String');

    # don't write to any files
    $getopts.add_option('debug', 'g');

    # don't add line numbers to generated files (not implemented)
    $getopts.add_option('no-lines', 'n');

    # print anemic usage information and exit
    $getopts.add_option('help', 'h');

    # suppress timing and debug output on stdout
    $getopts.add_option('quiet', 'q');

    $getopts.get_options(pir::getinterp__p()[2]);
}

sub usage() {
    say("This is ops2c, part of the Parrot VM's build infrastructure.
    normal options:
    -c --core                generate the C code for core ops (must be run from within Parrot's build directory)
    -d --dynamic <file.ops>  generate the C code for the dynamic ops in a single .ops file
    -q --quiet               don't report any non-error messages
    -h --help                print this usage information
    -n --no-lines            do not print #line directives in generated C code (line numbers are not currently supported)

    debugging options:
    -g --debug               perform all processing but do not write to any files
    ");
    pir::exit(0);
}

# Monkey patching
module Getopt::Obj {
    multi method add_option($long, $short, $type?) {
        my $opt := self.add();
        $opt.long($long);
        $opt.short($short);
        $opt.type($type) if $type;
    }
}

# vim: expandtab shiftwidth=4 ft=perl6:
