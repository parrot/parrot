#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynpmc/os_unicode.t - test the OS PMC with Unicode filenames

=head1 SYNOPSIS

        % parrot t/dynpmc/os_unicode.t

=head1 DESCRIPTION

Tests the C<OS> PMC with Unicode filenames.

=cut

.loadlib 'math_ops'

.sub 'main' :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'
    .local pmc config_hash, interp

    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['osname']
    if $S0 == 'linux' goto has_unicode
    if $S0 != 'MSWin32' goto no_unicode

  has_unicode:
    plan(6)
    $P0 = loadlib 'os'
    $P0 = loadlib 'file'
    test_unicode()
    .return()

  no_unicode:
    skip_all('Unicode filenames not supported on this platform')
    .return()
.end

.sub 'test_unicode'
    .local pmc os, file, array, it
    .local int rnd, found
    .local string filename, unicode

    os = new ['OS']
    isa_ok(os, 'OS', 'new OS')
    file = new ['File']
    isa_ok(file, 'File', 'new File')

    array = new ['ResizablePMCArray']
    rnd = rand 1000000
    push array, rnd
    unicode = ucs4:"\x{2022}\x{20000}"
    push array, unicode
    filename = sprintf "test_%06d_%s", array

    os.'mkdir'(filename, 0o777)
    $I0 = file.'is_dir'(filename)
    ok($I0, 'mkdir')

    array = os.'readdir'('.')
    found = 0
    it = iter array
  loop:
    unless it goto done
    $S0 = shift it
    if $S0 != filename goto loop
    found = 1
    goto loop
  done:
    ok(found, 'readdir')

    os.'chdir'(filename)
    $S0 = concat '../', filename
    $I0 = file.'is_dir'($S0)
    ok($I0, 'chdir')

    os.'chdir'('..')
    os.'rm'(filename)
    $I0 = file.'exists'(filename)
    nok($I0, 'rmdir')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
