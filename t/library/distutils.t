#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/distutils.t

=head1 DESCRIPTION

Test the distutils library

=head1 SYNOPSIS

    % prove t/library/distutils.t

=cut

.sub 'main' :main
    load_bytecode 'distutils.pir'

    .const 'Sub' prebuild = 'prebuild'
    register_step_before('build', prebuild)
    .const 'Sub' postbuild = 'postbuild'
    register_step_after('build', postbuild)

    $P0 = split ' ', 'build'
    $P1 = new 'Hash'
    .const 'Sub' build_hll = 'build_hll'
    $P1['hll_hook'] = build_hll

    say "1..3"
    setup($P0 :flat, $P1 :flat :named)
.end

.sub 'prebuild' :anon
    .param pmc kv :slurpy :named
    say "ok 1 - prebuild"
.end

.sub 'postbuild' :anon
    .param pmc kv :slurpy :named
    say "ok 3 - postbuild"
.end

.sub 'build_hll' :anon
    .param pmc kv :slurpy :named
    say "ok 2 - build_hll"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
