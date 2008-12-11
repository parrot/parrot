# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/lfs.pir - Lua File System Library v1.4.0

=head1 DESCRIPTION

LuaFileSystem is a Lua library developed to complement the set of functions
related to file systems offered by the standard Lua distribution.

LuaFileSystem offers a portable way to access the underlying directory
structure and file attributes.

See original on L<http://luaforge.net/projects/luafilesystem/>

=head2 Functions

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'lfs' ]

.sub '__onload' :anon :load
#    print "__onload lfs\n"
    .const 'Sub' entry = 'luaopen_lfs'
    set_hll_global 'luaopen_lfs', entry
.end

.sub 'luaopen_lfs'

#    print "luaopen_lfs\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _lfs
    new _lfs, 'LuaTable'
    set $P1, 'lfs'
    _lua__GLOBAL[$P1] = _lfs

    $P2 = split "\n", <<'LIST'
attributes
chdir
currentdir
dir
lock
mkdir
rmdir
symlinkattributes
touch
unlock
LIST
    lua_register($P1, _lfs, $P2)

    new $P2, 'LuaString'

    set $P2, "Copyright (C) 2007-2008, The Perl Foundation"
    set $P1, "_COPYRIGHT"
    _lfs[$P1] = $P2

    set $P2, "LuaFileSystem is a Lua library developed to complement the set of functions related to file systems offered by the standard Lua distribution"
    set $P1, "_DESCRIPTION"
    _lfs[$P1] = $P2

    set $P2, "LuaFileSystem 1.4.0"
    set $P1, "_VERSION"
    _lfs[$P1] = $P2

    .return (_lfs)
.end

.sub 'check_file' :anon
    .param int narg
    .param pmc fh
    .param string funcname
    .local pmc res
    res = lua_checkudata(narg, fh, 'FileHandle')
    unless null res goto L1
    lua_error(funcname, ": closed file")
  L1:
    .return (res)
.end

=item C<lfs.attributes (filepath [, aname])>

Returns a table with the file attributes corresponding to C<filepath> (or
C<nil> followed by an error message in case of error). If the second optional
argument is given, then only the value of the named attribute is returned
(this use is equivalent to C<lfs.attributes(filepath).aname>, but the table
is not created and only one attribute is retrieved from the O.S.). The
attributes are described as follows; attribute C<mode> is a string, all the
others are numbers, and the time related attributes use the same time
reference of C<os.time>:

=over 4

=item B<"dev">

on Unix systems, this represents the device that the inode resides on.
On Windows systems, represents the drive number of the disk containing the file

=item B<"ino">

on Unix systems, this represents the inode number.
On Windows systems this has no meaning

=item B<"mode">

string representing the associated protection mode (the values could be
C<file>, C<directory>, C<link>, C<socket>, C<named pipe>, C<char device>,
C<block device> or C<other>)

=item B<"nlink">

number of hard links to the file

=item B<"uid">

user-id of owner (Unix only, always 0 on Windows)

=item B<"gid">

group-id of owner (Unix only, always 0 on Windows)

=item B<"rdev">

on Unix systems, represents the device type, for special file inodes.
On Windows systems represents the same as dev

=item B<"access">

time of last access

=item B<"modification">

time of last data modification

=item B<"changes">

time of last file status change

=item B<"size">

file size, in bytes

=item B<"blocks">

block allocated for file; (Unix only)

=item B<"blksize">

optimal file system I/O blocksize; (Unix only)

=back

=cut

.macro FILE_INFO(func, filepath, aname)
    .local pmc res
    .local pmc members
    $S1 = lua_checkstring(1, .filepath)
    $S0 = $S1
    new members, 'Hash'
    .const 'Sub' st_mode = 'st_mode'
    members['mode'] = st_mode
    .const 'Sub' st_dev = 'st_dev'
    members['dev'] = st_dev
    .const 'Sub' st_ino = 'st_ino'
    members['ino'] = st_ino
    .const 'Sub' st_nlink = 'st_nlink'
    members['nlink'] = st_nlink
    .const 'Sub' st_uid = 'st_uid'
    members['uid'] = st_uid
    .const 'Sub' st_gid = 'st_gid'
    members['gid'] = st_gid
    .const 'Sub' st_rdev = 'st_rdev'
    members['rdev'] = st_rdev
    .const 'Sub' st_atime = 'st_atime'
    members['access'] = st_atime
    .const 'Sub' st_mtime = 'st_mtime'
    members['modification'] = st_mtime
    .const 'Sub' st_ctime = 'st_ctime'
    members['change'] = st_ctime
    .const 'Sub' st_size = 'st_size'
    members['size'] = st_size
    .const 'Sub' st_blocks = 'st_blocks'
    members['blocks'] = st_blocks
    .const 'Sub' st_blksize = 'st_blksize'
    members['blksize'] = st_blksize
    new $P0, 'OS'
    push_eh _handler
    $P1 = $P0. .func($S1)
    pop_eh
    if null .aname goto L1
    $I0 = isa .aname, 'LuaString'
    unless $I0 goto L2
    $S2 = .aname
    $P2 = members[$S2]
    unless null $P2 goto L3
    lua_checkoption(2, $S2, '')
  L3:
    res = $P2($P1)
    .return (res)
  L2:
    $I0 = isa .aname, 'LuaTable'
    unless $I0 goto L1
    res = .aname
    goto L4
  L1:
    new res, 'LuaTable'
  L4:
    .local pmc iter
    new iter, 'Iterator', members
    new $P2, 'LuaString'
  L5:
    unless iter goto L6
    $S2 = shift iter
    set $P2, $S2
    $P3 = members[$S2]
    $P4 = $P3($P1)
    res[$P2] = $P4
    goto L5
  L6:
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    new nil, 'LuaNil'
    new msg, 'LuaString'
    $S0 = concat "cannot obtain information from file `", $S0
    $S0 = concat "'"
    set msg, $S0
    .return (nil, msg)
.endm

.sub 'attributes'
    .param pmc filepath :optional
    .param pmc aname :optional
    .param pmc extra :slurpy
    .FILE_INFO('stat', filepath, aname)
.end

.sub 'st_dev' :anon
    .param pmc st
    $I0 = st[0]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_ino' :anon
    .param pmc st
    $I0 = st[1]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.const int S_IFIFO  = 0x1000    # named pipe (fifo)
.const int S_IFCHR  = 0x2000    # character special
.const int S_IFDIR  = 0x4000    # directory
.const int S_IFBLK  = 0x6000    # block special
.const int S_IFREG  = 0x8000    # regular
.const int S_IFLNK  = 0xA000    # symbolic link
.const int S_IFSOCK = 0xC000    # socket

.const int S_IFMT   = 0xF000    # type of file mask

.sub 'st_mode' :anon
    .param pmc st
    $I0 = st[2]
    $I0 &= S_IFMT
    new $P0, 'LuaString'
    unless $I0 == S_IFREG goto L1
    set $P0, 'file'
    .return ($P0)
  L1:
    unless $I0 == S_IFDIR goto L2
    set $P0, 'dir'
    .return ($P0)
  L2:
    unless $I0 == S_IFLNK goto L3
    set $P0, 'link'
    .return ($P0)
  L3:
    unless $I0 == S_IFSOCK goto L4
    set $P0, 'socket'
    .return ($P0)
  L4:
    unless $I0 == S_IFIFO goto L5
    set $P0, 'named pipe'
    .return ($P0)
  L5:
    unless $I0 == S_IFCHR goto L6
    set $P0, 'char device'
    .return ($P0)
  L6:
    unless $I0 == S_IFBLK goto L7
    set $P0, 'block device'
    .return ($P0)
  L7:
    set $P0, 'other'
    .return ($P0)
.end

.sub 'st_nlink' :anon
    .param pmc st
    $I0 = st[3]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_uid' :anon
    .param pmc st
    $I0 = st[4]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_gid' :anon
    .param pmc st
    $I0 = st[5]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_rdev' :anon
    .param pmc st
    $I0 = st[6]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_size' :anon
    .param pmc st
    $I0 = st[7]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_atime' :anon
    .param pmc st
    $I0 = st[8]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_mtime' :anon
    .param pmc st
    $I0 = st[9]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_ctime' :anon
    .param pmc st
    $I0 = st[10]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end

.sub 'st_blksize' :anon
    .param pmc st
    $I0 = exists st[11]
    unless $I0 goto L1
    $I0 = st[11]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
  L1:
    new $P0, 'LuaNil'
    .return ($P0)
.end

.sub 'st_blocks' :anon
    .param pmc st
    $I0 = exists st[12]
    unless $I0 goto L1
    $I0 = st[12]
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
  L1:
    new $P0, 'LuaNil'
    .return ($P0)
.end


=item C<lfs.chdir (path)>

Changes the current working directory to the given C<path>.

Returns C<true> in case of success or C<nil> plus an error string.

=cut

.sub 'chdir'
    .param pmc path :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, path)
    $S0 = $S1
    new $P0, 'OS'
    push_eh _handler
    $P0.'chdir'($S1)
    pop_eh
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    new nil, 'LuaNil'
    new msg, 'LuaString'
    $S0 = concat "Unable to change working directory to '", $S0
    $S0 = concat "'\n"
    $S0 = concat s
    $S0 = concat "\n"
    set msg, $S0
    .return (nil, msg)
.end


=item C<lfs.currentdir ()>

Returns a string with the current working directory or C<nil> plus an error
string.

=cut

.sub 'currentdir'
    .param pmc extra :slurpy
    .local pmc res
    new $P0, 'OS'
    push_eh _handler
    $S0 = $P0.'cwd'()
    pop_eh
    new res, 'LuaString'
    set res, $S0
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    new nil, 'LuaNil'
    new msg, 'LuaString'
    set msg, s
    .return (nil, msg)
.end


=item C<lfs.dir (path)>

Lua iterator over the entries of a given directory. Each time the iterator is
called it returns a string with an entry of the directory; C<nil> is returned
when there is no more entries. Raises an error if C<path> is not a directory.

=cut

.sub 'dir'
    .param pmc path :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, path)
    $S0 = $S1
    new $P0, 'OS'
    push_eh _handler
    $P1 = $P0.'readdir'($S1)
    pop_eh
    .lex 'upvar_dir', $P1
    .const 'Sub' dir_aux = 'dir_aux'
    res = newclosure dir_aux
    .return (res)
  _handler:
    .local pmc e
    .local string msg
    .get_results (e)
    msg = e
    $S0 = lua_x_error("cannot open ", $S0, ": ", msg)
    e = $S0
    rethrow e
.end

.sub 'dir_aux' :anon :lex :outer(dir)
    .local pmc res
    $P1 = find_lex 'upvar_dir'
    unless $P1 goto L1
    $S1 = shift $P1
    new res, 'LuaString'
    set res, $S1
    .return (res)
  L1:
    new res, 'LuaNil'
    .return (res)
.end


=item C<lfs.lock (filehandle, mode[, start[, length]])>

Locks a file or a part of it. This function works on I<open files>; the file
handle should be specified as the first argument. The string C<mode> could be
either C<r> (for a read/shared lock) or C<w> (for a write/exclusive lock).
The optional arguments C<start> and C<length> can be used to specify a
starting point and its length; both should be numbers.

Returns C<true> if the operation was successful; in case of error, it returns
C<nil> plus an error string.

NOT YET IMPLEMENTED.

=cut

.sub 'lock'
    .param pmc filehandle :optional
    .param pmc mode :optional
    .param pmc start :optional
    .param pmc length_ :optional
    .param pmc extra :slurpy
    $P1 = check_file(1, filehandle, 'lock')
    $S2 = lua_checkstring(2, mode)
    $I3 = lua_optint(3, start, 0)
    $I4 = lua_optint(4, length_, 0)
    not_implemented()
.end


=item C<lfs.mkdir (dirname)>

Creates a new directory. The argument is the name of the new directory.

Returns C<true> if the operation was successful; in case of error, it returns
C<nil> plus an error string.

=cut

.sub 'mkdir'
    .param pmc dirname :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, dirname)
    new $P0, 'OS'
    push_eh _handler
    $I1 = 0o775
    $P0.'mkdir'($S1, $I1)
    pop_eh
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    new nil, 'LuaNil'
    new msg, 'LuaString'
    set msg, s
    .return (nil, msg)
.end


=item C<lfs.rmdir (dirname)>

Removes an existing directory. The argument is the name of the directory.

Returns C<true> if the operation was successful; in case of error, it returns
C<nil> plus an error string.

=cut

.sub 'rmdir'
    .param pmc dirname :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, dirname)
    new $P0, 'OS'
    push_eh _handler
    $P0.'rm'($S1)
    pop_eh
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    new nil, 'LuaNil'
    new msg, 'LuaString'
    set msg, s
    .return (nil, msg)
.end


=item C<lfs.symlinkattributes (filepath [, aname])>

Identical to C<lfs.attributes> except that it obtains information about
the link itself (not the file it refers to).

=cut

.sub 'symlinkattributes'
    .param pmc filepath :optional
    .param pmc aname :optional
    .param pmc extra :slurpy
    .FILE_INFO('lstat', filepath, aname)
.end


=item C<lfs.touch (filepath [, atime [, mtime]])>

Set access and modification times of a file. This function is a bind to
C<utime> function. The first argument is the filename, the second argument
(C<atime>) is the access time, and the third argument (C<mtime>) is the
modification time. Both times are provided in seconds (which should be
generated with Lua standard function C<os.date>). If the modification time is
omitted, the access time provided is used; if both times are omitted, the
current time is used.

Returns C<true> if the operation was successful; in case of error, it returns
C<nil> plus an error string.

NOT YET IMPLEMENTED.

=cut

.sub 'touch'
    .param pmc filepath :optional
    .param pmc atime :optional
    .param pmc mtime :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, filepath)
    not_implemented()
.end


=item C<lfs.unlock (filehandle[, start[, length]])>

Unlocks a file or a part of it. This function works on I<open files>; the file
handle should be specified as the first argument. The optional arguments
C<start> and C<length> can be used to specify a starting point and its length;
both should be numbers.

Returns C<true> if the operation was successful; in case of error, it returns
C<nil> plus an error string.

NOT YET IMPLEMENTED.

=cut

.sub 'unlock'
    .param pmc filehandle :optional
    .param pmc start :optional
    .param pmc length_ :optional
    .param pmc extra :slurpy
    $P1 = check_file(1, filehandle, 'unlock')
    $I2 = lua_optint(2, start, 0)
    $I3 = lua_optint(3, length_, 0)
    not_implemented()
.end

=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
