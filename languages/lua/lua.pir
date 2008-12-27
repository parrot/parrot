# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

lua.pbc -- A stand-alone interpreter for Lua 5.1

=head1 SYNOPSIS

  $ parrot lua.pbc [options] [script [args]]

=head1 DESCRIPTION

B<lua> is the stand-alone Lua interpreter. It loads and executes Lua programs.

See also "Lua 5.1 Reference Manual", section 6 "Lua Stand-alone",
L<http://www.lua.org/manual/5.1/manual.html#6>.

The given I<options> (see below) are executed and then the Lua program in file
I<script> is loaded and executed. The given I<args> are available to I<script>
as strings in a global table named B<arg>. If these arguments contain spaces
or other characters special to the shell, then they should be quoted (but note
that the quotes will be removed by the shell). The arguments in B<arg> start
at 0, which contains the string 'I<script>'. The arguments given in the
command line before I<script>, including the name of the interpreter, are
available in negative indices in B<arg>.

At the very start, before even handling the command line, B<lua> executes
the contents of the environment variable B<LUA_INIT>, if it is defined.
If the value of B<LUA_INIT> is of the form '@I<filename>', then I<filename>
is executed. Otherwise, the string is assumed to be a Lua statement and is
executed.

Options start with B<'-'> and are described below. You can use B<'--'> to
signal the end of options.

If no arguments are given, then B<"-v -i"> is assumed when the standard input
is a terminal; otherwise, B<"-"> is assumed.

In interactive mode, B<lua> prompts the user, reads lines from the standard
input, and executes them as they are read. If a line does not contain a
complete statement, then a secondary prompt is displayed and lines are read
until a complete statement is formed or a syntax error is found. So, one way
to interrupt the reading of an incomplete statement is to force a syntax
error: adding a B<';'> in the middle of a statement is a sure way of forcing
a syntax error (except inside multiline strings and comments; these must be
closed explicitly). If a line starts with B<'='>, then B<lua> displays the
values of all the expressions in the remainder of the line. The expressions
must be separated by commas. The primary prompt is the value of the global
variable B<_PROMPT>, if this value is a string; otherwise, the default prompt
is used. Similarly, the secondary prompt is the value of the global variable
B<_PROMPT2>. So, to change the prompts, set the corresponding variable to a
string of your choice. You can do that after calling the interpreter or on the
command line (but in this case you have to be careful with quotes if the
prompt string contains a space; otherwise you may confuse the shell.) The
default prompts are "> " and ">> ".

=head1 OPTIONS

=over 4

=item B<->

load and execute the standard input as a file, that is, not interactively, even when the standard input is a terminal.

=item B<-e> I<stat>

execute statement I<stat>. You need to quote I<stat> if it contains spaces,
quotes, or other characters special to the shell.

=item B<-i>

enter interactive mode after I<script> is executed.

=item B<-l> I<name>

call B<require>('I<name>') before executing I<script>.
Typically used to load libraries.

=item B<-v>

show version information.

=back

=cut

.sub '__gcstop' :anon :load :init
    sweepoff  # stop collector during initialization
.end

.include 'languages/lua/src/lua51.pir'
.include 'languages/lua/src/lib/luaregex.pir'


.HLL 'lua'
.loadlib 'lua_group'

.sub 'main' :anon :main
    .param pmc args
    lua_openlibs()
    .local int status
    status = handle_luainit()
    if status goto L1
    .local int script, has_i, has_v, has_e
    (script, has_i, has_v, has_e) = collectargs(args)
    unless script < 0 goto L2 # invalid args?
    print_usage()
    status = 1
    goto L1
  L2:
    unless has_v goto L3
    print_version()
  L3:
    unless script > 0 goto L4
    $I0 = script
    goto L5
  L4:
    $I0 = elements args
  L5:
    status = runargs(args, $I0)
    if status goto L1
    unless script goto L6
    status = handle_script(args, script)
    if status goto L1
  L6:
    unless has_i goto L7
    dotty()
    goto L1
  L7:
    if script goto L1
    if has_v goto L1
    if has_e goto L1
    $P0 = getstdin
    $I0 = $P0.'isatty'()
    unless $I0 goto L8
    print_version()
    dotty()
    goto L1
  L8:
    status = dofile('')    # executes stdin as a file
  L1:
    exit status
.end


.sub 'handle_luainit' :anon
    $I0 = 0
    new $P0, 'Env'
    $S0 = $P0['LUA_INIT']
    if $S0 goto L1
    .return (0)
  L1:
    $S1 = substr $S0, 0, 1
    unless $S1 == '@' goto L2
    $S0 = substr $S0, 1
    .tailcall dofile($S0)
  L2:
    .tailcall dostring($S0, '=LUA_INIT')
.end


.sub 'collectargs' :anon
    .param pmc args
    .local int has_i, has_v, has_e, i, len
    has_i = 0
    has_v = 0
    has_e = 0
    i = 1
  L1:
    .local string arg
    arg = args[i]
    unless arg goto L2
    $S0 = substr arg, 0, 1
    if $S0 == '-' goto L3 # not an option?
    .return (i, has_i, has_v, has_e)
  L3:
    len =  length arg
    if len > 0 goto L4
    .return (i, has_i, has_v, has_e)
  L4:
    $S0 = substr arg, 1, 1
    unless $S0 == '-' goto L5
    if len == 2 goto L6
    .return (-1)
  L6:
    inc i
    $S0 = args[i]
    if null $S0 goto L7
    .return (i, has_i, has_v, has_e)
  L7:
    .return (0, has_i, has_v, has_e)
  L5:
    unless $S0 == 'i' goto L8
    if len == 2 goto L9
    .return (-1)
  L9:
    has_i = 1
    goto L10
  L8:
    unless $S0 == 'v' goto L11
    if len == 2 goto L10
    .return (-1)
  L10:
    has_v = 1
    goto L12
  L11:
    unless $S0 == 'e' goto L13
    has_e = 1
    goto L14
  L13:
    unless $S0 == 'l' goto L15
  L14:
    unless len == 2 goto L16
    inc i
    $S0 = args[i]
    unless null $S0 goto L16
    .return (-1)
  L16:
    goto L12
  L15:
    .return (-1)  # invalid option
  L12:
    inc i
    goto L1
  L2:
    .return (0, has_i, has_v, has_e)
.end


.sub 'runargs' :anon
    .param pmc args
    .param int n
    .local int i
    i = 1
  L1:
    unless i < n goto L2
    .local string arg
    arg = args[i]
    $I0 = index arg, '-e'
    unless $I0 == 0 goto L3
    .local string chunk
    chunk = substr arg, 2
    if chunk goto L4
    inc i
    chunk = args[i]
  L4:
    $I0 = dostring(chunk, '(command line)')
    if $I0 == 0 goto L6
    .return (1)
  L3:
    $I0 = index arg, '-l'
    unless $I0 == 0 goto L6
    .local string filename
    filename = substr arg, 2
    if filename goto L7
    inc i
    filename = args[i]
  L7:
    $I0 = dolibrary(filename)
    if $I0 == 0 goto L6
    .return (1)
  L6:
    inc i
    goto L1
  L2:
    .return (0)
.end


.sub 'handle_script' :anon
    .param pmc args
    .param int n
    .local int narg
    (narg, $P0) = getargs(args, n)  # collect arguments
    .local pmc env
    env = get_hll_global '_G'
    .const 'LuaString' k_arg = 'arg'
    env.'rawset'(k_arg, $P0)
    .local string fname
    fname = args[n]
    unless fname == '-' goto L1
    $I0 = n - 1
    $S0 = args[$I0]
    if $S0 == '--' goto L1
    fname = ''  # stdin
  L1:
    ($P0, $S0) = lua_loadfile(fname)
    if null $P0 goto L2
    .local pmc vararg
    new vararg, 'FixedPMCArray'
    set vararg, narg
    $I0 = 0
  L3:
    unless $I0 < narg goto L4
    inc n
    $S0 = args[n]
    new $P1, 'LuaString'
    set $P1, $S0
    vararg[$I0] = $P1
    inc $I0
    goto L3
  L4:
    ($P0 :slurpy) = docall($P0, vararg :flat)
    .tailcall report($P0 :flat)
  L2:
    .tailcall report(1, $S0)
.end


.sub 'getargs' :anon
    .param pmc args
    .param int n
    .local int narg     # number of arguments to the script
    .local int argc     # count total number of arguments
    argc = elements args
    narg = argc - n
    dec narg
    .local pmc iter, t, i
    new iter, 'Iterator', args
    new t, 'LuaTable'
    new i, 'LuaNumber'
    $I0 = neg n
    set i, $I0
  L1:
    unless iter goto L2
    $S0 = shift iter
    new $P0, 'LuaString'
    set $P0, $S0
    t[i] = $P0
    inc i
    goto L1
  L2:
    .return (narg, t)
.end


.sub 'dofile' :anon
    .param string name
    ($P0, $S0) = lua_loadfile(name)
    if null $P0 goto L1
    ($P0 :slurpy) = docall($P0)
    .tailcall report($P0 :flat)
  L1:
    .tailcall report(1, $S0)
.end


.sub 'dostring' :anon
    .param string buf
    .param string name
    ($P0, $S0) = lua_loadbuffer(buf, name)
    if null $P0 goto L1
    ($P0 :slurpy) = docall($P0)
    .tailcall report($P0 :flat)
  L1:
    .tailcall report(1, $S0)
.end


.sub 'dolibrary' :anon
    .param string name
    .local pmc env
    env = get_hll_global '_G'
    .const 'LuaString' k_require = 'require'
    $P0 = env.'rawget'(k_require)
    new $P1, 'LuaString'
    set $P1, name
    ($P0 :slurpy) = docall($P0, $P1)
    .tailcall report($P0 :flat)
.end


.sub 'dotty' :anon
    .local pmc env
    env = get_hll_global '_G'
    .const 'LuaString' k_print = 'print'
    .local int has_readline
    .local pmc stdin
    stdin = getstdin
    has_readline = stdin.'set_readline_interactive'(1)
  L1:
    .local pmc code
    code = get_line (stdin, has_readline, 1)
    if null code goto L2    # no input
    unless code goto L2     # empty
    ($P0, $S0) = lua_loadbuffer(code, '=stdin')
    unless null $P0 goto L3
  L4:
    $I0 = index $S0, "'eof' expected"
    if $I0 < 0 goto L5
    .local pmc code2
    code2 = get_line (stdin, has_readline, 0)
    if null code2 goto L5   # no input
    unless code2 goto L5    # empty
    code = concat code2
    ($P0, $S0) = lua_loadbuffer(code, '=stdin')
    if null $P0 goto L4
  L3:
    ($I0, $P0) = docall($P0)
    if $I0 goto L6
    $I0 = elements $P0
    unless $I0 goto L1
    $P1 = env.'rawget'(k_print)
    $P1($P0 :flat)
    goto L1
  L6:
    $S0 = $P0
  L5:
    l_message('', $S0)
    goto L1
  L2:
.end


.sub 'get_line' :anon
    .param pmc stdin
    .param int has_readline
    .param int firstline
    .local string prmt
    prmt = get_prompt(firstline)
    printerr prmt
    .local pmc code
    if has_readline < 0 goto L1
    code = stdin.'readline'('')
    if null code goto L2        # no input
    code .= "\n"
    goto L3
  L1:
    $S0 = readline stdin
    new code, 'String'
    code = $S0
  L3:
    unless firstline goto L2
    $S0 = code
    $S1 = substr $S0, 0, 1
    unless $S1 == '=' goto L2
    $S0 = substr $S0, 1         # first line starts with `='
    $S0 = 'return ' . $S0
    set code, $S0               # change it to `return'
  L2:
    .return (code)
.end


.sub 'get_prompt' :anon
    .param int firstline
    .local pmc env
    env = get_hll_global '_G'
    $S0 = '_PROMPT'
    $S1 = '> '
    if firstline goto L1
    $S0 = '_PROMPT2'
    $S1 = '>> '
  L1:
    new $P0, 'LuaString'
    set $P0, $S0
    $P0 = env.'rawget'($P0)
    $I0 = isa $P0, 'LuaNil'
    if $I0 goto L2
    $S1 = $P0
  L2:
    .return ($S1)
.end


.sub 'report' :anon
    .param int status
    .param pmc msg
    unless status goto L1
    l_message('lua.pbc', msg)
  L1:
    .return (status)
.end


.sub 'print_version' :anon
    l_message('', "Lua 5.1 on Parrot  Copyright (C) 2005-2008, The Perl Foundation.")
.end


.sub 'l_message' :anon
    .param string pname
    .param string msg
    unless pname goto L1
    printerr pname
    printerr ': '
  L1:
    printerr msg
    printerr "\n"
.end


.sub 'print_usage' :anon
    printerr <<'USAGE'
usage: lua.pbc [options] [script [args]].
Available options are:
  -e stat  execute string 'stat'
  -l name  require library 'name'
  -i       enter interactive mode after executing 'script'
  -v       show version information
  --       stop handling options
  -        execute stdin and stop handling options
USAGE
.end


.include 'languages/lua/src/lib/luaaux.pir'
.include 'languages/lua/src/lib/luastring.pir'
.include 'languages/lua/src/lib/luabasic.pir'
.include 'languages/lua/src/lib/luacoroutine.pir'
.include 'languages/lua/src/lib/luapackage.pir'
.include 'languages/lua/src/lib/luatable.pir'
.include 'languages/lua/src/lib/luamath.pir'
.include 'languages/lua/src/lib/luaio.pir'
.include 'languages/lua/src/lib/luafile.pir'
.include 'languages/lua/src/lib/luaos.pir'
.include 'languages/lua/src/lib/luadebug.pir'
.include 'languages/lua/src/lib/luabytecode.pir'


=head1 SEE ALSO

F<languages/lua/doc/status.pod>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
