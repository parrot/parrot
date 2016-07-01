#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/ext/winxed/compreg.t - test winxed compreg.

=head1 SYNOPSIS

    % prove t/ext/winxed/compreg.t

=head1 DESCRIPTION

Tests using winxed compreg.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(2)

    .local pmc wcomp
    .local int r

    load_language 'winxed'
    wcomp = compreg 'winxed'
    r = isnull wcomp
    is(r, 0, "winxed compreg is not null")

    .local string source
    .local pmc result

    source = <<'SOURCE'
function main(argv)
{
    string s = "hello";
    say(s);
}
SOURCE

    result = wcomp.'compile'(source, "pir" :named("target"))
    like(result, "hello", "pir geenrated from a simple source looks good")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
