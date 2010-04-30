#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/archive_tar.t

=head1 DESCRIPTION

Test the Archive/TAR library

=head1 SYNOPSIS

    % prove t/library/archive_tar.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'Archive/TAR.pir'

    plan(12)
    test_new()
    test_tar()
.end

.sub 'test_new'
    $P0 = new ['Archive';'TAR']
    $I0 = isa $P0, ['Archive';'TAR']
    ok($I0, "new ['Archive';'TAR']")
    $P0 = new ['Archive';'TAR';'File']
    $I0 = isa $P0, ['Archive';'TAR';'File']
    ok($I0, "new ['Archive';'TAR';'File']")
.end

.sub 'test_tar'
    .local pmc archive, entry
    archive = new ['Archive';'TAR']
    $I0 = isa archive, ['Archive';'TAR']
    ok($I0, "test_tar")
    entry = archive.'add_data'('msg.txt', "some data")
    $I0 = isa entry, ['Archive';'TAR';'File']
    ok($I0, "entry is an ['Archive';'TAR';'File']")
    $S0 = entry.'data'()
    is($S0, "some data", "data")
    $S0 = entry.'full_path'()
    is($S0, 'msg.txt', "full_path")
    .local string header
    header = entry.'_format_tar_entry'()
    $I0 = length header
    is($I0, 512, "length header")
    $I0 = index header, 'msg.txt'
    is($I0, 0, "header starts by filename")
    $I0 = index header, 'ustar'
    is($I0, 257, "magic at 257")

    .local pmc fh
    fh = new 'StringHandle'
    fh.'open'('in_memory', 'wb')
    archive.'write'(fh)
    $S0 = fh.'readall'()
    fh.'close'()
    $I0 = length $S0
    is($I0, 2048, "size")
    $I0 = index $S0, 'msg.txt'
    is($I0, 0, 'filename')
    $I0 = index $S0, 'some data'
    is($I0, 512, 'data')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
