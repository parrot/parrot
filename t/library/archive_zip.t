#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/archive_zip.t

=head1 DESCRIPTION

Test the Archive/Zip library

=head1 SYNOPSIS

    % prove t/library/archive_zip.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'Archive/Zip.pir'

    plan(14)
    test_new()
    test_pack()
.end

.sub 'test_new'
    $P0 = new ['Archive';'Zip']
    $I0 = isa $P0, ['Archive';'Zip']
    ok($I0, "new ['Archive';'Zip']")
    $I0 = isa $P0, ['Archive';'Zip';'Base']
    ok($I0, "is a ['Archive';'Zip';'Base']")
    $P0 = new ['Archive';'Zip';'Member']
    $I0 = isa $P0, ['Archive';'Zip';'Member']
    ok($I0, "new ['Archive';'Zip';'Member']")
    $I0 = isa $P0, ['Archive';'Zip';'Base']
    ok($I0, "is a ['Archive';'Zip';'Base']")
    $P0 = new ['Archive';'Zip';'FileMember']
    $I0 = isa $P0, ['Archive';'Zip';'FileMember']
    ok($I0, "new ['Archive';'Zip';'FileMember']")
    $I0 = isa $P0, ['Archive';'Zip';'Member']
    ok($I0, "is a ['Archive';'Zip';'Member']")
    $P0 = new ['Archive';'Zip';'NewFileMember']
    $I0 = isa $P0, ['Archive';'Zip';'NewFileMember']
    ok($I0, "new ['Archive';'Zip';'NewFileMember']")
    $I0 = isa $P0, ['Archive';'Zip';'FileMember']
    ok($I0, "is a ['Archive';'Zip';'FileMember']")
.end

.sub 'test_pack'
    $P0 = new ['Archive';'Zip']
    $S0 = $P0.'pack_C'(0x12)
    is( $S0, "\x12", "pack C (unsigned char)" )
    $I0 = length $S0
    is( $I0, 1 )
    $S0 = $P0.'pack_v'(0x1234)
    is( $S0, "\x34\x12", "pack v (16bits litle endian)" )
    $I0 = length $S0
    is( $I0, 2 )
    $S0 = $P0.'pack_V'(0x12345678)
    is( $S0, "\x78\x56\x34\x12", "pack V (32bits litle endian)" )
    $I0 = length $S0
    is( $I0, 4 )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
