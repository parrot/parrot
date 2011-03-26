#! parrot-nqp

=begin Description

LLVM JITter?

=end Description

class Ops::JIT;

# Ops::OpsFile
has $!ops_file;

# OpLib
has $!oplib;

# Packfile used.
has $!packfile;
has $!constants;
has $!bytecode;
has $!opmap;

=item new
Create new JITter for given PBC and OpsFile.

method new(Str $pbc, Ops::File $ops_file, OpLib $oplib) {
    $!ops_file := $ops_file;
    $!oplib    := $oplib;

    self._load_pbc($pbc);
}

=item load_pbc
Load PBC file.

method _load_pbc(Str $file) {
    # Load PBC into memory
    my $handle   := open($file, :r, :bin);
    my $contents := $handle.readall;
    $handle.close();

    $!packfile := pir::new('Packfile');
    $!packfile.unpack($contents);

    # Find Bytecode and Constants segments.
    my $dir := $!packfile.get_directory();
    die unless pir::defined($dir);

    # Types:
    # 2 Constants.
    # 3 Bytecode.
    # 4 DEBUG
    for $dir -> $it {
        say("Segment { $it.key } => { $it.value.type }");
        my $segment := $it.value;
        if $segment.type == 2 {
            $!constants := $segment;
        }
        elsif $segment.type == 3 {
            $!bytecode := $segment;
        }
    }

    # Sanity check
    $!bytecode // die("Couldn't find Bytecode");
    $!constants // die("Couldn't find Constants");

    $!opmap := $!bytecode.opmap() // die("Couldn't load OpMap");
}

method process(Ops::Op $op, %c) {
}

# Recursively process body chunks returning string.
our multi method process(PAST::Val $val, %c) {
    die('!!!');
}

our multi method process(PAST::Var $var, %c) {
    die('!!!');
}

our method process:pasttype<inline> (PAST::Op $chunk, %c) {
    die('!!!');
}

our method process:pasttype<macro> (PAST::Op $chunk, %c) {
}

our method process:pasttype<macro_define> (PAST::Op $chunk, %c) {
}


our method process:pasttype<macro_if> (PAST::Op $chunk, %c) {
}

our method process:pasttype<call> (PAST::Op $chunk, %c) {
}

our method process:pasttype<if> (PAST::Op $chunk, %c) {
}

our method process:pasttype<while> (PAST::Op $chunk, %c) {
}

our method process:pasttype<do-while> (PAST::Op $chunk, %c) {
}

our method process:pasttype<for> (PAST::Op $chunk, %c) {
}

our method process:pasttype<switch> (PAST::Op $chunk, %c) {
}

our method process:pasttype<undef> (PAST::Op $chunk, %c) {
}

our multi method process(PAST::Op $chunk, %c) {
}

our multi method process(PAST::Stmts $chunk, %c) {
}

our multi method process(PAST::Block $chunk, %c) {
}

our multi method process(String $str, %c) {
}

# vim: ft=perl6
