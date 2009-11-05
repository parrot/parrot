#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/library/configure.t - Test the Configure PBC

=head1 SYNOPSIS

    % prove t/library/configure.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'Configure.pbc'

    plan(12)
    test_subst_config()
    test_subst_slash()
.end

.sub 'test_subst_config'
    .local pmc config
    config = new 'Hash'
    config['foo'] = 'bar'
    $S0 = subst_config("# plain text", config)
    is($S0, "# plain text\n", "plain text")
    $S0 = subst_config("\t@echo foo", config)
    is($S0, "\t@echo foo\n", "@ alone")
    $S0 = subst_config("here @foo@ variable", config)
    is($S0, "here bar variable\n", "variable")
    $S0 = subst_config("here @foo@ variable, and here @foo@.", config)
    is($S0, "here bar variable, and here bar.\n", "variable")
.end

.sub 'test_subst_slash'
    $S1 = "path/to/somewhere/"
    $S0 = subst_slash($S1, 'MSWin32')
    is($S0, "path\\to\\somewhere\\", "paths on win32")
    $S0 = subst_slash($S1, '*nix')
    is($S0, $S1, "paths on *nix")

    $S1 = "prove t/*.t"
    $S0 = subst_slash($S1, 'MSWin32')
    is($S0, "prove t\\\\*.t")
    $S0 = subst_slash($S1, '*nix')
    is($S0, $S1)

    $S1 = "prove t//*.t"
    $S0 = subst_slash($S1, 'MSWin32')
    is($S0, "prove t/*.t")
    $S0 = subst_slash($S1, '*nix')
    is($S0, "prove t/*.t")

    $S1 = "http:////host//paths//"
    $S0 = subst_slash($S1, 'MSWin32')
    is($S0, "http://host/paths/", "url on win32")
    $S0 = subst_slash($S1, '*nix')
    is($S0, "http://host/paths/", "url on *nix")
.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
