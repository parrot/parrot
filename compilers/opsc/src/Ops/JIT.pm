#! parrot-nqp

=begin Description

JITter?

=end Description

class Ops::JIT;


method new() {
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
