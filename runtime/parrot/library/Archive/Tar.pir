# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

Archive/Tar

=head2 DESCRIPTION

Partial port of Archive::Tar (version 1.60)

See L<http://search.cpan.org/~bingos/Archive-Tar/>

=cut

.include 'stat.pasm'

=head3 Class Archive;Tar;File

=over 4

=cut

.namespace ['Archive';'Tar';'File']

.sub '' :init :load :anon
    load_bytecode 'osutils.pbc' # splitpath
    $P0 = newclass ['Archive';'Tar';'File']
    $P0.'add_attribute'('name')
    $P0.'add_attribute'('mode')
    $P0.'add_attribute'('uid')
    $P0.'add_attribute'('gid')
    $P0.'add_attribute'('size')
    $P0.'add_attribute'('mtime')
    $P0.'add_attribute'('type')
    $P0.'add_attribute'('linkname')
    $P0.'add_attribute'('magic')
    $P0.'add_attribute'('version')
    $P0.'add_attribute'('uname')
    $P0.'add_attribute'('gname')
    $P0.'add_attribute'('devmajor')
    $P0.'add_attribute'('devminor')
    $P0.'add_attribute'('prefix')
    $P0.'add_attribute'('data')
    .globalconst int MODE = 0o666
    .globalconst string FILE = '0'
    .globalconst string MAGIC = 'ustar'
    .globalconst string TAR_VERSION = '00'
    .globalconst int BLOCK = 512
.end

=item data

=cut

.sub 'data' :method
    $P0 = getattribute self, 'data'
    .return ($P0)
.end

=item new_from_file

=cut

.sub 'new_from_file'
    .param string path
    .local string data
    $P0 = new 'FileHandle'
    push_eh _handler
    .local string data
    data = $P0.'readall'(path)
    pop_eh
    .local int mode, uid, gid, mtime
    mode = stat path, .STAT_PLATFORM_MODE
    mode &= 0o777
    uid = stat path, .STAT_UID
    gid = stat path, .STAT_GID
    mtime = stat path, .STAT_MODIFYTIME
    .tailcall new_from_data(path, data, mode :named('mode'), uid :named('uid'), gid :named('gid'), mtime :named('mtime'))
  _handler:
    null $P0
    .return ($P0)
.end

=item new_from_data

=cut

.sub 'new_from_data'
    .param string path
    .param string data
    .param int mode             :named('mode') :optional
    .param int has_mode         :opt_flag
    .param int uid              :named('uid') :optional
    .param int has_uid          :opt_flag
    .param int gid              :named('gid') :optional
    .param int has_gid          :opt_flag
    .param int mtime            :named('mtime') :optional
    .param int has_mtime        :opt_flag
    .param string type          :named('type') :optional
    .param int has_type         :opt_flag
    .param string linkname      :named('linkname') :optional
    .param int has_linkname     :opt_flag
    .param string uname         :named('uname') :optional
    .param int has_uname        :opt_flag
    .param string gname         :named('gname') :optional
    .param int has_gname        :opt_flag
    .param int devmajor         :named('devmajor') :optional
    .param int has_devmajor     :opt_flag
    .param int devminor         :named('devminor') :optional
    .param int has_devminor     :opt_flag
    $P0 = new ['Archive';'Tar';'File']
    .local string prefix, name
    (prefix, name) = _prefix_and_file(path)
    if has_mode goto L1
    mode = MODE
  L1:
    if has_uid goto L2
    uid = 0
  L2:
    if has_gid goto L3
    gid = 0
  L3:
    if has_mtime goto L4
    mtime = time
  L4:
    if has_type goto L5
    type = FILE
  L5:
    if has_linkname goto L6
    linkname = ''
  L6:
    if has_uname goto L7
    uname = 'unknown'
  L7:
    if has_gname goto L8
    gname = 'unknown'
  L8:
    if has_devmajor goto L9
    devmajor = 0
  L9:
    if has_devminor goto L10
    devminor = 0
  L10:
    $P1 = box data
    setattribute $P0, 'data', $P1
    $P1 = box name
    setattribute $P0, 'name', $P1
    $P1 = box mode
    setattribute $P0, 'mode', $P1
    $P1 = box uid
    setattribute $P0, 'uid', $P1
    $P1 = box gid
    setattribute $P0, 'gid', $P1
    $I0 = length data
    $P1 = box $I0
    setattribute $P0, 'size', $P1
    $I0 = mtime
    $P1 = box $I0
    setattribute $P0, 'mtime', $P1
    $P1 = box type
    setattribute $P0, 'type', $P1
    $P1 = box linkname
    setattribute $P0, 'linkname', $P1
    $P1 = box MAGIC
    setattribute $P0, 'magic', $P1
    $P1 = box TAR_VERSION
    setattribute $P0, 'version', $P1
    $P1 = box uname
    setattribute $P0, 'uname', $P1
    $P1 = box gname
    setattribute $P0, 'gname', $P1
    $P1 = box devminor
    setattribute $P0, 'devminor', $P1
    $P1 = box devmajor
    setattribute $P0, 'devmajor', $P1
    $P1 = box prefix
    setattribute $P0, 'prefix', $P1
    .return ($P0)
.end

.sub '_prefix_and_file' :anon
    .param string path
    .local string volume, directories, file
    (volume, directories, file) = splitpath(path)
    .return (directories, file)
.end

=item full_path

=cut

.sub 'full_path' :method
    .local string prefix, name
    $P0 = getattribute self, 'name'
    name = $P0
    $P0 = getattribute self, 'prefix'
    prefix = $P0
    unless prefix == '' goto L1
    .return (name)
  L1:
    $S0 = catfile(prefix, name)
    .return ($S0)
.end

=item rename

=cut

.sub 'rename' :method
    .param string path
    .local string prefix, name
    (prefix, name) = _prefix_and_file(path)
    $P0 = box name
    setattribute self, 'name', $P0
    $P0 = box prefix
    setattribute self, 'prefix', $P0
.end

=item _format_tar_entry

=cut

.sub '_format_tar_entry' :method
    $P0 = new 'ResizableStringArray'
    $P1 = new 'FixedPMCArray'
    set $P1, 1
    .const string f1 = '%06o'
    .const string f2 = '%11o'
    $P2 = getattribute self, 'name'
    $S0 = pad_string_with_null($P2, 100)
    push $P0, $S0
    $P2 = getattribute self, 'mode'
    $P1[0] = $P2
    $S0 = sprintf f1, $P1
    $S0 = pad_string_with_null($S0, 8)
    push $P0, $S0
    $P2 = getattribute self, 'uid'
    $P1[0] = $P2
    $S0 = sprintf f1, $P1
    $S0 = pad_string_with_null($S0, 8)
    push $P0, $S0
    $P2 = getattribute self, 'gid'
    $P1[0] = $P2
    $S0 = sprintf f1, $P1
    $S0 = pad_string_with_null($S0, 8)
    push $P0, $S0
    $P2 = getattribute self, 'size'
    $P1[0] = $P2
    $S0 = sprintf f2, $P1
    $S0 = pad_string_with_null($S0, 12)
    push $P0, $S0
    $P2 = getattribute self, 'mtime'
    $P1[0] = $P2
    $S0 = sprintf f2, $P1
    $S0 = pad_string_with_null($S0, 12)
    push $P0, $S0
    push $P0, "        " # checksum
    $P2 = getattribute self, 'type'
    $S0 = pad_string_with_null($P2, 1)
    push $P0, $S0
    $P2 = getattribute self, 'linkname'
    $S0 = pad_string_with_null($P2, 100)
    push $P0, $S0
    $P2 = getattribute self, 'magic'
    $S0 = pad_string_with_null($P2, 6)
    push $P0, $S0
    $P2 = getattribute self, 'version'
    $S0 = pad_string_with_null($P2, 2)
    push $P0, $S0
    $P2 = getattribute self, 'uname'
    $S0 = pad_string_with_null($P2, 32)
    push $P0, $S0
    $P2 = getattribute self, 'gname'
    $S0 = pad_string_with_null($P2, 32)
    push $P0, $S0
    $P2 = getattribute self, 'devmajor'
    $P1[0] = $P2
    $S0 = sprintf f1, $P1
    $S0 = pad_string_with_null($S0, 8)
    push $P0, $S0
    $P2 = getattribute self, 'devminor'
    $P1[0] = $P2
    $S0 = sprintf f1, $P1
    $S0 = pad_string_with_null($S0, 8)
    push $P0, $S0
    $P2 = getattribute self, 'prefix'
    $S0 = pad_string_with_null($P2, 155)
    push $P0, $S0
    $S0 = join '', $P0
    $I0 = compute_checksum($S0)
    $P1[0] = $I0
    $S1 = sprintf "%6o\0\0", $P1
    $S0 = replace $S0, 148, 8, $S1
    $S0 = pad_string_with_null($S0, BLOCK)
    .return ($S0)
.end

.sub 'pad_string_with_null' :anon
    .param string str
    .param int size
    $S0 = substr str, 0, size
    $I0 = length str
    $I0 = size - $I0
    unless $I0 > 0 goto L1
    $S1 = repeat "\0", $I0
    $S0 .= $S1
  L1:
    .return ($S0)
.end

.sub 'compute_checksum' :anon
    .param string str
    .local int chk
    chk = 0
    $P0 = split '', str
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $I0 = ord $S0
    chk += $I0
    goto L1
  L2:
    .return (chk)
.end

=back

=head3 Class Archive;Tar

=over 4

=cut

.namespace ['Archive';'Tar']

.sub '' :init :load :anon
    $P0 = newclass ['Archive';'Tar']
    $P0.'add_attribute'('data')
.end

.sub 'init' :vtable :method
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'data', $P0
.end

=item add_files

=cut

.sub 'add_files' :method
    .param pmc filenames :slurpy
    .local pmc rv
    rv = new 'ResizablePMCArray'
    $P0 = iter filenames
  L1:
    unless $P0 goto L2
    .local string filename
    filename = shift $P0
    $I0 = stat filename, .STAT_EXISTS
    if $I0 goto L3
    self.'_error'("No such file: '", filename, "'")
    goto L1
  L3:
    .local pmc obj
    $P1 = get_hll_global ['Archive';'Tar';'File'], 'new_from_file'
    obj = $P1(filename)
    unless null obj goto L4
    self.'_error'("Unable to add file: '", filename, "'")
    goto L1
  L4:
    push rv, obj
    goto L1
  L2:
    $P0 = getattribute self, 'data'
    $P1 = iter rv
  L5:
    unless $P1 goto L6
    $P2 = shift $P1
    push $P0, $P2
    goto L5
  L6:
    .return (rv)
.end

=item add_data

=cut

.sub 'add_data' :method
    .param string filename
    .param string data
    .param pmc opt :slurpy :named
    .local pmc obj
    $P0 = get_hll_global ['Archive';'Tar';'File'], 'new_from_data'
    obj = $P0(filename, data, opt :flat :named)
    $P0 = getattribute self, 'data'
    push $P0, obj
    .return (obj)
.end

=item write

=cut

.sub 'write' :method
    .param pmc fh
    $P0 = getattribute self, 'data'
    $P1 = iter $P0
  L1:
    unless $P1 goto L2
    .local pmc entry
    entry = shift $P1
    .local string header
    header = entry.'_format_tar_entry'()
    fh.'puts'(header)
    $S0 = entry.'data'()
    fh.'puts'($S0)
    $I0 = length $S0
    $I0 %= BLOCK
    unless $I0 goto L1
    .local string TAR_PAD
    $I0 = BLOCK - $I0
    TAR_PAD = repeat "\0", $I0
    fh.'puts'(TAR_PAD)
    goto L1
  L2:
    .local string TAR_END
    TAR_END = repeat "\0", BLOCK
    $S0 = repeat TAR_END, 2
    fh.'puts'($S0)
.end

=item _error

=cut

.sub '_error' :method
    .param pmc args :slurpy
    $S0 = join '', args
    printerr $S0
    printerr "\n"
.end

=back

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
