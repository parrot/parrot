#! parrot-nqp

=begin Description
"JIT" transformer. Just pure prototype for now.
=end Description

class Ops::Trans::JIT is Ops::Trans::C {

method access_arg($type, $num, %ctx) {
    # Dispatch to actual handler.
    my $sub  := pir::find_sub_not_null__ps('access_arg:type<' ~ $type ~ '>');
    $sub(self, $num, %ctx);
}

our method access_arg:type<i> ($num, %ctx) {
    'CTX_REG_INT(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<n> ($num, %ctx) {
    'CTX_REG_NUM(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<p> ($num, %ctx) {
    'CTX_REG_PMC(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<s> ($num, %ctx) {
    'CTX_REG_STR(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<k> ($num, %ctx) {
    'CTX_REG_PMC(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<ki> ($num, %ctx) {
    'CTX_REG_INT(interp, interp->ctx, ' ~ self.opcode_at($num, %ctx) ~ ')';
}

our method access_arg:type<ic> ($num, %ctx) {
    self.opcode_at($num, %ctx);
}

our method access_arg:type<sc> ($num, %ctx) {
    my $c := %ctx<constants>;
    my $i := self.opcode_at($num, %ctx);
    my $res := Q:PIR{
        .local string s
        .local int    I
        .local pmc    c
        .local pmc    i
        find_lex c, '$c'
        find_lex i, '$i'
        I = i
        s = c[I]
        %r = box s
    };
    '"' ~ $res ~ '"';
}

#        :nc("NCONST(NUM)"),
#        :pc("PCONST(NUM)"),
#        :sc("SCONST(NUM)"),
#        :kc("PCONST(NUM)"),
#        :kic("ICONST(NUM)")

our method access_arg:type<kic> ($num, %ctx) {
    self.opcode_at($num, %ctx);
}


=item opcode_at
Return opcode at offset.

method opcode_at($offset, %ctx) {
    %ctx<bc>[%ctx<cur_opcode> + $offset];
}

};

# vim: ft=perl6
