# Copyright (C) 2009-2011, Parrot Foundation.

=head1 NAME

osutils - Parrot OS Utilities

=head2 DESCRIPTION

=over 4

=cut

.loadlib 'math_ops'

.sub '' :init :load :anon
    $P0 = loadlib 'os'
.end

=item system

=cut

.sub 'system'
    .param string cmd
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    .param int ignore_error     :named('ignore_error') :optional
    .param int has_ignore_error :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    say cmd
  L1:
    $I0 = spawnw cmd
    unless $I0 goto L2
    unless has_ignore_error goto L3
    if ignore_error goto L2
  L3:
    $S0 = "exit status: "
    $S1 = $I0
    $S0 .= $S1
    $S0 .= "\ncommand: "
    $S0 .= cmd
    $S0 .= "\n"
    die $S0
  L2:
    .return ($I0)
.end

.loadlib 'io_ops'
.include 'stat.pasm'

.sub 'file_exists'
    .param string filename
    $I0 = stat filename, .STAT_EXISTS
    .return ($I0)
.end

=item newer

=cut

.sub 'newer' :multi(string, pmc)
    .param string target
    .param pmc depends
    $I0 = does depends, 'array'
    if $I0 goto L1
    $S0 = depends
    .tailcall newer(target, $S0)
  L1:
    $I0 = stat target, .STAT_EXISTS
    unless $I0 goto L2
    $I0 = stat target, .STAT_FILESIZE
    unless $I0 goto L2
    goto L3
  L2:
    .return (0)
  L3:
    $I0 = stat target, .STAT_MODIFYTIME
    $P0 = iter depends
  L4:
    unless $P0 goto L5
    $S0 = shift $P0
    if $S0 == '' goto L4
    $I1 = stat $S0, .STAT_MODIFYTIME
    if $I1 < $I0 goto L4
    .return (0)
  L5:
    .return (1)
.end

.sub 'newer' :multi(string, string)
    .param string target
    .param string depend
    $I0 = stat target, .STAT_EXISTS
    unless $I0 goto L1
    $I0 = stat target, .STAT_FILESIZE
    unless $I0 goto L1
    goto L2
  L1:
    .return (0)
  L2:
    $I1 = stat target, .STAT_MODIFYTIME
    $I2 = stat depend, .STAT_MODIFYTIME
    $I0 = $I1 > $I2
    .return ($I0)
.end

.sub 'newer' :multi(pmc, pmc)
    .param pmc target
    .param pmc depend
    $S0 = target
    .tailcall newer($S0, depend)
.end

=item mkpath

=cut

.sub 'mkpath'
    .param string pathname
    .param int verbose          :named('verbose') :optional
    $I1 = 1
  L1:
    $I1 = index pathname, '/', $I1
    if $I1 < 0 goto L2
    $S0 = substr pathname, 0, $I1
    inc $I1
    $I0 = stat $S0, .STAT_EXISTS
    if $I0 goto L1
    $I0 = length $S0
    if $I0 != 2 goto L3
    $I0 = index $S0, ':'
    if $I0 == 1 goto L1
  L3:
    mkdir($S0, verbose :named('verbose'))
    goto L1
  L2:
    $I0 = stat pathname, .STAT_EXISTS
    if $I0 goto L4
    mkdir(pathname, verbose :named('verbose'))
  L4:
.end

=item mkdir

=cut

.sub 'mkdir'
    .param string dirname
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "mkdir "
    say dirname
  L1:
    $P0 = new 'OS'
    $I1 = 0o775
    push_eh _handler
    $P0.'mkdir'(dirname, $I1)
    pop_eh
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't mkdir '"
    $S0 .= dirname
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item install

=cut

.include 'iglobals.pasm'

.sub 'install'
    .param string src
    .param string dst
    .param int exe              :named('exe') :optional
    .param int has_exe          :opt_flag
    .param int verbose          :named('verbose') :optional
    # mkpath
    $I1 = 1
  L1:
    $I1 = index dst, '/', $I1
    if $I1 < 0 goto L2
    $S0 = substr dst, 0, $I1
    inc $I1
    $I0 = stat $S0, .STAT_EXISTS
    if $I0 goto L1
    mkdir($S0, verbose :named('verbose'))
    goto L1
  L2:
    $I0 = newer(dst, src)
    if $I0 goto L3
    $I0 = stat dst, .STAT_EXISTS
    unless $I0 goto L4
    unlink(dst, verbose :named('verbose'))
  L4:
    cp(src, dst, verbose :named('verbose'))
    unless has_exe goto L3
    unless exe goto L3
    $P0 = getinterp
    $P0 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P0['win32']
    if $I0 goto L3
    chmod(dst, 0o755, verbose :named('verbose'))
  L3:
.end

=item cp

=cut

.sub 'cp'
    .param string src
    .param string dst
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "cp "
    print src
    print " "
    say dst
  L1:
    $P0 = new 'FileHandle'
    $P0.'encoding'('binary')
    push_eh _handler1
    $S0 = $P0.'readall'(src)
    pop_eh
    push_eh _handler2
    $P0.'open'(dst, 'w')
    pop_eh
    $P0.'puts'($S0)
    $P0.'close'()
    .return ()
  _handler1:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= src
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
  _handler2:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= dst
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item chmod

=cut

.sub 'chmod'
    .param string filename
    .param int mode
    .param int verbose          :named('verbose') :optional
    $P0 = new 'OS'
    $P0.'chmod'(filename, mode)
.end

=item unlink

=cut

.sub 'unlink' :multi(string)
    .param string filename
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    $I0 = stat filename, .STAT_EXISTS
    unless $I0 goto L1
    $I0 = stat filename, .STAT_ISREG
    unless $I0 goto L1
    unless has_verbose goto L2
    unless verbose goto L2
    print "unlink "
    say filename
  L2:
    new $P0, 'OS'
    push_eh _handler
    $P0.'rm'(filename)
    pop_eh
  L1:
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't remove '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

.sub 'unlink' :multi(pmc)
    .param pmc list
    .param int verbose          :named('verbose') :optional
    $I0 = does list, 'array'
    if $I0 goto L1
    $S0 = list
    unlink($S0, verbose :named('verbose'))
    goto L2
  L1:
    $P0 = iter list
  L3:
    unless $P0 goto L2
    $S0 = shift $P0
    unlink($S0, verbose :named('verbose'))
    goto L3
  L2:
.end

=item rmtree

=cut

.sub 'rmtree'
    .param string path
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    $I0 = stat path, .STAT_EXISTS
    unless $I0 goto L1
    $I0 = stat path, .STAT_ISDIR
    unless $I0 goto L1
    unless has_verbose goto L2
    unless verbose goto L2
    print "rmtree "
    say path
  L2:
    new $P0, 'OS'
    $P1 = $P0.'readdir'(path)
    push_eh _handler
  L3:
    unless $P1 goto L4
    $S0 = shift $P1
    if $S0 == '.' goto L3
    if $S0 == '..' goto L3
    $S1 = path . '/'
    $S1 .= $S0
    $I0 = stat $S1, .STAT_ISDIR
    unless $I0 goto L5
    rmtree($S1)
    goto L3
  L5:
    $P0.'rm'($S1)
    goto L3
  L4:
    push_eh _handler
    $S1 = path
    $P0.'rm'($S1)
    pop_eh
  L1:
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't remove '"
    $S0 .= $S1
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item basename

=cut

.sub 'basename'
    .param string path
    $I0 = 0
  L1:
    $I1 = index path, '/', $I0
    if $I1 < 0 goto L2
    $I0 = $I1 + 1
    goto L1
  L2:
    $S0 = substr path, $I0
    .return ($S0)
.end

=item dirname

=cut

.sub 'dirname'
    .param string path
    unless path goto L3
    $I0 = 0
  L1:
    $I1 = index path, '/', $I0
    if $I1 < 0 goto L2
    $I0 = $I1 + 1
    goto L1
  L2:
    dec $I0
    unless $I0 > 0 goto L3
    $S0 = substr path, 0, $I0
    .return ($S0)
  L3:
    .return ('.')
.end

=item cwd

=cut

.sub 'cwd'
    new $P0, 'OS'
    $S0 = $P0.'cwd'()
    $P0 = split "\\", $S0
    $S0 = join "/", $P0
    .return ($S0)
.end

=item chdir

=cut

.sub 'chdir'
    .param string dirname
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "cd "
    say dirname
  L1:
    new $P0, 'OS'
    push_eh _handler
    $P0.'chdir'(dirname)
    pop_eh
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't chdir '"
    $S0 .= dirname
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item chomp

=cut

.include 'cclass.pasm'

.sub 'chomp'
    .param string str
    $I0 = index str, "\r"
    if $I0 < 0 goto L1
    str = substr str, 0, $I0
  L1:
    $I1 = index str, "\n"
    if $I1 < 0 goto L2
    str = substr str, 0, $I1
  L2:
    .return (str)
.end

=item glob

=cut

.sub 'glob'
    .param string patterns
    $P0 = new 'ResizableStringArray'
    $P1 = split ' ', patterns
  L1:
    unless $P1 goto L2
    .local string pattern
    pattern = shift $P1
    $I0 = index pattern, '*'
    unless $I0 < 0 goto L3
    $I0 = index pattern, '?'
    unless $I0 < 0 goto L3
    $I0 = index pattern, '['
    unless $I0 < 0 goto L3
    $I0 = stat pattern, .STAT_EXISTS
    unless $I0 goto L1
    push $P0, pattern
    goto L1
  L3:
    .local pmc matcher
    load_bytecode 'PGE/Glob.pbc'
    $P2 = compreg 'PGE::Glob'
    matcher = $P2.'compile'(pattern)
    $S0 = dirname(pattern)
    $P3 = glob($S0)
    $P4 = new 'OS'
  L4:
    unless $P3 goto L1
    .local string dir
    dir = shift $P3
    $I0 = stat dir, .STAT_ISDIR
    unless $I0 goto L4
    $S0 = basename(dir)
    $P5 = $P4.'readdir'(dir)
  L5:
    unless $P5 goto L4
    $S0 = shift $P5
    if $S0 == '.' goto L5
    if $S0 == '..' goto L5
    if dir == '.' goto L6
    $S1 = dir . '/'
    $S0 = $S1 . $S0
  L6:
    $P6 = matcher($S0)
    unless $P6 goto L5
    push $P0, $S0
    goto L5
  L2:
    .return ($P0)
.end

=item getenv

=cut

.sub 'getenv'
    .param string name
    new $P0, 'Env'
    $S0 = $P0[name]
    .return ($S0)
.end

=item setenv

=cut

.sub 'setenv'
    .param string name
    .param string value
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "setenv "
    print name
    print " = "
    say value
  L1:
    new $P0, 'Env'
    $P0[name] = value
.end

=item slurp

=cut

.sub 'slurp'
    .param string filename
    .param string encoding      :named('encoding') :optional
    .param int has_encoding     :opt_flag
    $P0 = new 'FileHandle'
    unless has_encoding goto L1
    $P0.'encoding'(encoding)
  L1:
    push_eh _handler
    $S0 = $P0.'readall'(filename)
    pop_eh
    .return ($S0)
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item spew

=cut

.sub 'spew'
    .param string filename
    .param string content
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "creat "
    say filename
  L1:
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'w')
    pop_eh
    $P0.'puts'(content)
    $P0.'close'()
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item append

=cut

.sub 'append'
    .param string filename
    .param string content
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    unless has_verbose goto L1
    unless verbose goto L1
    print "append "
    say filename
  L1:
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'a')
    pop_eh
    $P0.'puts'(content)
    $P0.'close'()
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=item tempdir

=cut

.sub 'tempdir'
    .param string suffix        :named('SUFFIX') :optional
    .param int has_suffix       :opt_flag
    $S0 = tmpdir()
    $S0 .= '/TEMPXXX'
    unless has_suffix goto L1
    $S0 .= suffix
  L1:
    .tailcall _gettemp($S0)
.end

.sub '_gettemp' :anon
    .param string template
    $P0 = split "/", template
    $S0 = pop $P0
    .const string TEMPCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    $P1 = split '', TEMPCHARS
    $I1 = elements $P1
    dec $I1
  REDO:
    $S1 = ''
    $P2 = split '', $S0
  L1:
    unless $P2 goto L2
    $S2 = shift $P2
    unless $S2 == 'X' goto L3
    $I0 = rand $I1
    $S2 = $P1[$I0]
  L3:
    $S1 .= $S2
    goto L1
  L2:
    push $P0, $S1
    $S0 = join "/", $P0
    $I0 = stat $S0, .STAT_EXISTS
    if $I0 goto REDO
    .return ($S0)
.end

=item tmpdir

=cut

.sub 'tmpdir'
    .local pmc env, dirlist
    env = new 'Env'
    dirlist = new 'ResizableStringArray'
    $P0 = getinterp
    $P0 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P0['win32']
    unless $I0 goto L1
    $I0 = exists env['TMPDIR']
    unless $I0 goto L2
    $S0 = env['TMPDIR']
    push dirlist, $S0
  L2:
    $I0 = exists env['TEMP']
    unless $I0 goto L3
    $S0 = env['TEMP']
    push dirlist, $S0
  L3:
    $I0 = exists env['TMP']
    unless $I0 goto L4
    $S0 = env['TMP']
    push dirlist, $S0
  L4:
    push dirlist, 'c:/system/temp'
    push dirlist, 'c:/temp'
    push dirlist, '/tmp'
    push dirlist, '/'
    goto L5
  L1:
    $I0 = exists env['TMPDIR']
    unless $I0 goto L6
    $S0 = env['TMPDIR']
    push dirlist, $S0
  L6:
    push dirlist, '/tmp'
  L5:
    unless dirlist goto L7
    $S0 = shift dirlist
    $I0 = stat $S0, .STAT_EXISTS
    unless $I0 goto L5
    $I0 = stat $S0, .STAT_ISDIR
    unless $I0 goto L5
    $P0 = split "\\", $S0
    $S0 = join "/", $P0
    .return ($S0)
  L7:
.end

=item gzip

=cut

.sub 'gzip'
    .param string filename
    .local pmc fh, gh
    fh = new 'FileHandle'
    fh.'encoding'('binary')
    push_eh _handler1
    $S0 = fh.'readall'(filename)
    $I0 = length $S0
    pop_eh
    $P0 = loadlib 'gziphandle'
    push_eh _handler2
    gh = new 'GzipHandle'
    $S1 = filename . '.gz'
    gh.'open'($S1, 'wb')
    gh.'puts'($S0)
    gh.'close'()
    unlink(filename)
    .return ()
  _handler1:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
  _handler2:
    .local pmc e
    .get_results (e)
    $S0 = "Can't gzip '"
    $S0 .= filename
    $S0 .= "'\n"
    e = $S0
    rethrow e
.end

=item catfile

=cut

.sub 'catfile'
    .param pmc args             :slurpy
    .param int native           :named('native') :optional
    .param int has_native       :opt_flag
    .local string slash
    slash = '/'
    unless has_native goto L1
    unless native goto L1
    $P0 = getinterp
    $P0 = $P0[.IGLOBALS_CONFIG_HASH]
    slash = $P0['slash']
  L1:
    $S0 = join slash, args
    .return ($S0)
.end

=item splitpath

=cut

.sub 'splitpath'
    .param string path
    .local string volume, directories, file
    volume = ''
    $I0 = index path, ':'
    unless $I0 == 1 goto L1
    volume = substr path, 0, 2
    path = substr path, 2
  L1:
    $I0 = 0
  L2:
    $I1 = index path, '/', $I0
    if $I1 < 0 goto L3
    $I0 = $I1 + 1
    goto L2
  L3:
    file = substr path, $I0
    directories = ''
    dec $I0
    unless $I0 > 0 goto L4
    directories = substr path, 0, $I0
  L4:
    .return (volume, directories, file)
.end

=item rindex

=cut

.sub 'rindex'
    .param string str
    .param string sstr
    .param int pos              :optional
    .param int has_pos          :opt_flag
    if has_pos goto L1
    pos = 0
  L1:
    $I0 = index str, sstr, pos
    unless $I0 < 0 goto L2
    .return ($I0)
  L2:
    $I1 = $I0
    inc $I0
    $I0 = index str, sstr, $I0
    unless $I0 < 0 goto L2
    .return ($I1)
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
