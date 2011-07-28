# Copyright (C) 2009-2011, Parrot Foundation.

=head1 NAME

osutils - operating system utilities for Parrot

=head1 SYNOPSIS

    .sub 'main' :main
        load_bytecode 'osutils.pbc'

        # Print current working directory
        $S0 = cwd()
        say $S0

        # Make a new directory, then enter it
        $S1 = 'foobar'
        mkdir($S1)
        chdir($S1)
    .end

=head1 DESCRIPTION

The C<osutils> library provides a procedural interface to many common shell
utilities. Think of it as a watered down version of GNU coreutils for Parrot.

=head1 FUNCTIONS

=over 4

=cut

.loadlib 'math_ops'

.sub '' :init :load :anon
    $P0 = loadlib 'os'
.end

=item B<system(string cmd, int :verbose(), int :ignore_error())>

Executes a shell command.

The first argument is a string that specifies which command to execute. The
C<:verbose()> argument is an optional integer indicating whether or not to be
verbose. If given, the name of the command in C<cmd> will be displayed. The
C<:ignore_error()> argument is also an optional integer indicating whether or
not errors should be ignored.

Returns the exit status of the C<cmd> command.

=cut

.sub 'system'
    .param string cmd
    .param int    verbose          :named('verbose') :optional
    .param int    has_verbose      :opt_flag
    .param int    ignore_error     :named('ignore_error') :optional
    .param int    has_ignore_error :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

    say cmd
  L1:
    $I0 = spawnw cmd

    unless $I0              goto L2
    unless has_ignore_error goto L3

    if ignore_error goto L2
  L3:
    $S0  = "exit status: "
    $S1  = $I0
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

=item B<file_exists(string filename)>

Returns an integer value indicating whether or not the file in C<filename>
exists. A value of 1 means that it does exist while a value of 0 means that it
does not.

=cut

.sub 'file_exists'
    .param string filename

    $I0 = stat filename, .STAT_EXISTS

    .return ($I0)
.end

=item B<newer(string target, pmc depend)>

=item B<newer(string target, string depend)>

=item B<newer(pmc target, pmc depend)>

Checks whether or not the file in C<target> is newer than the file in
C<depend>. If either of the arguments are aggregates (i.e. array or hash), then
C<newer()> checks whether or not I<all> the file(s) in C<target> are newer than
I<all> the file(s) in C<depend>.

Returns 1 if C<target> is newer than C<depend> and 0 if it's not. If the file
in C<target> doesn't exist, then 0 is returned.

=cut

.sub 'newer' :multi(string, pmc)
    .param string target
    .param pmc    depend

    $I0 = does depend, 'array'
    if $I0 goto L1

    $S0 = depend

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
    $P0 = iter depend
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

=item B<mkpath(string pathname, int :verbose())>

Creates the file path given in C<pathname>.

The C<:verbose()> argument is an optional integer which indicates whether or
not to be verbose. If given, the string I<mkdir> will be displayed along with
each directory name as it is created.

=cut

.sub 'mkpath'
    .param string pathname
    .param int    verbose  :named('verbose') :optional

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

=item B<mkdir(string dirname, int :verbose())>

Creates the directory given in C<dirname> if it does not already exist.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<mkdir C<dirname>> will be displayed.

An exception is thrown if C<dirname> already exists.

Note that unlike C<mkpath()>, subdirectories cannot be created at the same
time. For example, creating C<foo/bar/baz> will fail with C<mkdir()> but will
succeed with C<mkpath()>. In this case, C<foo> must be created first, then
C<foo/bar> (in that order), before C<foo/bar/baz> can be created.

=cut

.sub 'mkdir'
    .param string dirname
    .param int verbose     :named('verbose') :optional
    .param int has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

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

    $S0  = "Can't mkdir '"
    $S0 .= dirname
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<install(string src, string dst, int :exe(), int :verbose())>

TODO: I have no idea what this thing does

=cut

.include 'iglobals.pasm'

.sub 'install'
    .param string src
    .param string dst
    .param int    exe     :named('exe') :optional
    .param int    has_exe :opt_flag
    .param int    verbose :named('verbose') :optional

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
    unless exe     goto L3

    $P0 = getinterp
    $P0 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P0['win32']
    if $I0 goto L3

    chmod(dst, 0o755, verbose :named('verbose'))
  L3:
.end

=item B<cp(string src, string dst, int :verbose())>

Copies the file given in C<src> to C<dst>. The copy is completely independent
of the original.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<cp C<src> C<dst>> will be displayed.

The C<src> file must be readable and the C<dst> file must be writable. If not,
an exception will be thrown.

Note that unlike the C<cp> shell command, the second argument I<cannot> be a
directory. For example, to copy C<foo.txt> to C<bar/baz/qux>, C<cp()> must be
called as C<cp('foo.txt', 'bar/baz/qux/foo.txt')>.

=cut

.sub 'cp'
    .param string src
    .param string dst
    .param int    verbose     :named('verbose') :optional
    .param int    has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

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

    $S0  = "Can't open '"
    $S0 .= src
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
  _handler2:
    .local pmc e

    .get_results (e)

    $S0  = "Can't open '"
    $S0 .= dst
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<chmod(string filename, int mode, int :verbose())>

Changes the file mode bits for C<filename> according to C<mode>. The second
argument, C<mode>, is an octal number representing the bit pattern for the new
mode bits.

The C<:verbose()> argument is an optional integer which indicates whether or
not to be verbose. If given, the string I<chmod C<filename> C<mode>> will be displayed.

A full discussion of file permissions and mode bits is outside the scope of this
reference. For a more in-depth explanation, see the L<chmod(1)> man page.

Note that unlike the C<chmod> shell command, the C<mode> argument I<cannot>
alternatively be a symbolic string representation of the changes to make.

=cut

.sub 'chmod'
    .param string filename
    .param int mode
    .param int verbose     :named('verbose') :optional
    .param int has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

    $P0 = new 'ResizablePMCArray'
    push $P0, mode

    $S0 = sprintf '%o', $P0

    print "chmod "
    print filename
    print " 0o"
    say   $S0
  L1:
    $P0 = new 'OS'
    $P0.'chmod'(filename, mode)
.end

=item B<unlink(string filename, int :verbose())>

=item B<unlink(pmc filename, int :verbose())>

Removes a link to the file given in C<filename>.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<unlink C<filename>> will be displayed.

If the file's link count becomes 0, its contents will be removed. Note that if
one or more processes currently have the file open, it is not actually removed
until those processes have been terminated.

If C<pathname> is a symbolic link, then only the link itself is removed and
will not affect the file that it points to.

=cut

.sub 'unlink' :multi(string)
    .param string filename
    .param int    verbose     :named('verbose') :optional
    .param int    has_verbose :opt_flag

    $I0 = stat filename, .STAT_EXISTS
    unless $I0 goto L1

    $I0 = stat filename, .STAT_ISREG
    unless $I0 goto L1

    unless has_verbose goto L2
    unless verbose     goto L2

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

    $S0  = "Can't remove '"
    $S0 .= filename
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

.sub 'unlink' :multi(pmc)
    .param pmc filename
    .param int verbose  :named('verbose') :optional

    $I0 = does filename, 'array'
    if $I0 goto L1

    $S0 = filename
    unlink($S0, verbose :named('verbose'))
    goto L2
  L1:
    $P0 = iter filename
  L3:
    unless $P0 goto L2

    $S0 = shift $P0
    unlink($S0, verbose :named('verbose'))
    goto L3
  L2:
.end

=item B<rmtree(string path, int :verbose())>

Removes the directory path given in C<path>.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<rmtree C<path>> will be displayed.

=cut

.sub 'rmtree'
    .param string path
    .param int verbose     :named('verbose') :optional
    .param int has_verbose :opt_flag

    $I0 = stat path, .STAT_EXISTS
    unless $I0 goto L1

    $I0 = stat path, .STAT_ISDIR
    unless $I0 goto L1

    unless has_verbose goto L2
    unless verbose     goto L2

    print "rmtree "
    say path
  L2:
    new $P0, 'OS'
    $P1 = $P0.'readdir'(path)

    push_eh _handler
  L3:
    unless $P1 goto L4

    $S0 = shift $P1
    if $S0 == '.'  goto L3
    if $S0 == '..' goto L3

    $S1  = path . '/'
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

    $S0  = "Can't remove '"
    $S0 .= $S1
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<basename(string path)>

Returns C<path> with all leading directory components removed. Put differently,
it returns the filename portion of C<path>.

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

=item B<dirname(string path)>

Returns C<path> with the trailing component removed. Put differently, it
returns the directory portion of C<path>.

If C<path> contains no /'s, then "." (the current working directory) is
returned.

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

=item B<cwd>B<(>B<)>

Returns the pathname of the current working directory.

=cut

.sub 'cwd'
    new $P0, 'OS'

    $S0 = $P0.'cwd'()
    $P0 = split "\\", $S0
    $S0 = join "/", $P0

    .return ($S0)
.end

=item B<chdir(string dirname, int :verbose())>

Changes the current working directory to C<dirname>.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<chdir C<dirname>> will be displayed.

Note that unlike the C<cd> shell command, not specifying a directory
I<does not> change the working directory to the home directory.

=cut

.sub 'chdir'
    .param string dirname
    .param int    verbose     :named('verbose') :optional
    .param int    has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose goto L1

    print "chdir "
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

    $S0  = "Can't chdir '"
    $S0 .= dirname
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<chomp(string str)>

Behaves similar to the C<chomp()> function in Perl by removing any trailing
newline characters from C<str>.

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

=item B<glob(string patterns)>

Searches the current working directory for all the pathnames matching
C<patterns>.

For more information about pattern matching and wilcard expansion, see the
C<glob(7)> man page.

Returns a (possibly empty) C<ResizableStringArray> of all the matched
pathnames.

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

    if $S0 == '.'  goto L5
    if $S0 == '..' goto L5
    if dir == '.'  goto L6

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

=item B<getenv(string name)>

Searches the environment list for the environment variable given in C<name>.

Returns a string representing the value of C<name>. If the C<name> environment
variable is not defined, an empty string will be returned.

=cut

.sub 'getenv'
    .param string name

    new $P0, 'Env'
    $S0 = $P0[name]

    .return ($S0)
.end

=item B<setenv(string name, string value, int :verbose())>

Adds or changes an environment variable.

If the C<name> environment variable does not already exist, it will be added.
However, if C<name> I<does> already exist, its value is changed to C<value>.

The C<:verbose()> argument is an optional integer indicating whether or not to be
verbose. If given, the string I<setenv C<name> = C<value>> will be displayed.

=cut

.sub 'setenv'
    .param string name
    .param string value
    .param int verbose     :named('verbose') :optional
    .param int has_verbose :opt_flag

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

=item B<slurp(string filename, string :encoding())>

Reads the entire contents of the file given in C<filename>.

The C<:encoding()> argument is an optional string containing the character
encoding used by C<filename>.

An exception is thrown if C<filename> does not exist.

The C<filename> file must already exist and be readable. If not, an exception
will be thrown.

Returns the contents of C<filename> as a string.

=cut

.sub 'slurp'
    .param string filename
    .param string encoding     :named('encoding') :optional
    .param int    has_encoding :opt_flag

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

    $S0  = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<spew(string filename, string content, int :verbose())>

Creates a new file called C<filename> and writes the contents of C<content> to
it. If C<filename> already exists, its contents will be truncated to length 0
before writing.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<spew C<filename>> will be displayed.

=cut

.sub 'spew'
    .param string filename
    .param string content
    .param int    verbose     :named('verbose') :optional
    .param int    has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

    print "spew "
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

    $S0  = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<append(string filename, string content, int :verbose())>

Appends the contents of C<content> to the file given in C<filename>. If
C<filename> does not exist, it will be created under the same conditions as
C<spew()>.

The C<:verbose()> argument is an optional integer indicating whether or not to
be verbose. If given, the string I<append C<filename>> will be displayed.

=cut

.sub 'append'
    .param string filename
    .param string content
    .param int    verbose     :named('verbose') :optional
    .param int    has_verbose :opt_flag

    unless has_verbose goto L1
    unless verbose     goto L1

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

    $S0  = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
.end

=item B<tempdir(string :SUFFIX())>

Returns a string representing a unique filename that can be used for
creating a temporary file.

The format of the filename is C<TEMPXXX> where C<XXX> represents 3 random
characters.

Optionally, the C<:SUFFIX()> argument may be given which will append the
string to the filename. For example, the call
C<tempdir("foobar" :named('SUFFIX'))> could create a filename like
C<TEMP48tfoobar>.

=cut

.sub 'tempdir'
    .param string suffix     :named('SUFFIX') :optional
    .param int    has_suffix :opt_flag

    $S0  = tmpdir()
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

.sub 'tmpdir'
    .local pmc env, dirlist

    env     = new 'Env'
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

=item B<gzip(string filename)>

Compresses the file given in C<filename> using the Lempel-Ziv algorithm.
This replaces the file with one with the C<.gz> extension.

An exception is thrown if C<filename> does not exist.

For more information, see the C<gzip(1)> man page.

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
    gh  = new 'GzipHandle'
    $S1 = filename . '.gz'

    gh.'open'($S1, 'wb')
    gh.'puts'($S0)
    gh.'close'()
    unlink(filename)

    .return ()
  _handler1:
    .local pmc e

    .get_results (e)

    $S0  = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1  = err
    $S0 .= $S1
    $S0 .= ")\n"
    e    = $S0

    rethrow e
  _handler2:
    .local pmc e

    .get_results (e)

    $S0  = "Can't gzip '"
    $S0 .= filename
    $S0 .= "'\n"
    e    = $S0

    rethrow e
.end

=item B<catfile(pmc args, int :native())>

Concatenates the directory names and filename in C<args>.

The C<:native()> argument is an optional integer indicating whether or not to
use the native path separator. The default is C</>.

Returns a string representing a complete path ending with a filename.

=cut

.sub 'catfile'
    .param pmc args       :slurpy
    .param int native     :named('native') :optional
    .param int has_native :opt_flag

    .local string slash
    slash = '/'

    unless has_native goto L1
    unless native     goto L1

    $P0   = getinterp
    $P0   = $P0[.IGLOBALS_CONFIG_HASH]
    slash = $P0['slash']
  L1:
    $S0 = join slash, args
    .return ($S0)
.end

=item B<splitpath(string path)>

Returns a string representing the path given in C<path> split into volume,
directory, and filename portions. On systems that don't have the concept of
"volumes", returns '' for the volume portion.

=cut

.sub 'splitpath'
    .param string path

    .local string volume, directories, file
    volume = ''
    $I0    = index path, ':'
    unless $I0 == 1 goto L1

    volume = substr path, 0, 2
    path   = substr path, 2
  L1:
    $I0 = 0
  L2:
    $I1 = index path, '/', $I0
    if $I1 < 0 goto L3

    $I0 = $I1 + 1
    goto L2
  L3:
    file        = substr path, $I0
    directories = ''

    dec $I0
    unless $I0 > 0 goto L4

    directories = substr path, 0, $I0
  L4:
    .return (volume, directories, file)
.end

=item B<rindex(string str, string sstr, int :pos())>

Returns an integer representing the index of the I<last> occurence of the
string C<sstr> in C<str>.

The C<:pos()> argument is an optional integer representing the index of C<str>
to start searching at. Defaults to 0.

=cut

.sub 'rindex'
    .param string str
    .param string sstr
    .param int    pos     :optional
    .param int    has_pos :opt_flag

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

