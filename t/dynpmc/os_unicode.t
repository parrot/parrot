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
    .local int enc1, enc2

    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['osname']
    if $S0 == 'MSWin32' goto has_unicode
    if $S0 != 'linux' goto no_unicode
    enc1 = find_encoding 'platform'
    enc2 = find_encoding 'utf8'
    if enc1 != enc2 goto no_unicode

  has_unicode:
    plan(17)
    $P0 = loadlib 'os'
    $P0 = loadlib 'file'
    test_unicode_dirs()
    test_unicode_files()
    .return()

  no_unicode:
    skip_all('Unicode filenames not supported on this platform')
    .return()
.end

.sub 'unicode_filename'
    .param string prefix
    .local string filename, unicode
    .local pmc array
    .local int rnd, enc

    array = new ['ResizablePMCArray']
    push array, prefix
    rnd = rand 1000000
    push array, rnd
    unicode = ucs4:"\x{2022}\x{20000}"
    push array, unicode
    filename = sprintf "%s_%06d_%s", array

    # make sure it is not utf-8
    enc = find_encoding 'ucs4'
    filename = trans_encoding filename, enc

    .return (filename)
.end

.sub 'test_unicode_dirs'
    .local pmc os, file, array, it
    .local int found
    .local string filename, cwd

    os = new ['OS']
    isa_ok(os, 'OS', 'new OS')
    file = new ['File']
    isa_ok(file, 'File', 'new File')

    filename = unicode_filename('test')

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

    cwd = os.'cwd'()
    $I0 = length filename
    neg $I0
    cwd = substr cwd, $I0
    is(cwd, filename, 'cwd')

    os.'chdir'('..')
    os.'rm'(filename)
    $I0 = file.'exists'(filename)
    nok($I0, 'rmdir')
.end

.sub 'test_unicode_files'
    .local pmc os, file, fh, stat
    .local string filename, dest_filename
    .local int size

    os = new ['OS']
    isa_ok(os, 'OS', 'new OS')
    file = new ['File']
    isa_ok(file, 'File', 'new File')

    filename = unicode_filename('test1')

    fh = new['FileHandle']
    fh.'open'(filename, 'w')
    isa_ok(fh, 'FileHandle', 'open')
    fh.'print'('1234')
    fh.'close'()

    $I0 = file.'is_file'(filename)
    ok($I0, 'is_file')

    $I0 = os.'can_read'(filename)
    ok($I0, 'can_read')

    stat = os.'stat'(filename)
    size = stat[7]
    is(size, 4, 'stat')

    stat = os.'lstat'(filename)
    size = stat[7]
    is(size, 4, 'lstat')

    dest_filename = unicode_filename('test2')
    os.'rename'(filename, dest_filename)
    $I0 = file.'exists'(filename)
    nok($I0, 'rename old')
    $I0 = file.'exists'(dest_filename)
    ok($I0, 'rename new')

    os.'rm'(dest_filename)
    $I0 = file.'exists'(dest_filename)
    nok($I0, 'rm')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
