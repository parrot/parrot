# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

PCT::HLLCompiler - base class for compiler objects

=head1 DESCRIPTION

This file implements a C<HLLCompiler> class of objects used for
creating HLL compilers.  It provides the standard methods required
for all compilers, as well as some standard scaffolding for
running compilers from a command line.

=cut

.sub 'onload' :anon :load :init
    load_bytecode 'P6object.pbc'
    load_bytecode 'Parrot/Exception.pbc'
    $P0 = new 'P6metaclass'
    $S0 = '@stages $parsegrammar $parseactions $astgrammar $commandline_banner $commandline_prompt @cmdoptions $usage $version'
    $P0.'new_class'('PCT::HLLCompiler', 'attr'=>$S0)
.end

.namespace [ 'PCT';'HLLCompiler' ]

.include 'cclass.pasm'
.include 'stdio.pasm'

.sub 'init' :vtable :method
    load_bytecode 'config.pir'

    $P0 = split ' ', 'parse past post pir evalpmc'
    setattribute self, '@stages', $P0

    $P0 = split ' ', 'e=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v stagestats'
    setattribute self, '@cmdoptions', $P0

    $P1 = box <<'    USAGE'
  This compiler is based on PCT::HLLCompiler.

  Options:
    USAGE

    .local pmc it
    it = iter $P0
  options_loop:
    unless it goto options_end
    $P3  = shift it
    $P1 .= "    "
    $P1 .= $P3
    $P1 .= "\n"
    goto options_loop
  options_end:
    setattribute self, '$usage', $P1

    $S0  = '???'
    push_eh _handler
    $P0  = _config()
    $S0  = $P0['revision']   # also $I0 = P0['installed'] could be used
  _handler:
    pop_eh
    $P2  = box 'This compiler is built with the Parrot Compiler Toolkit, parrot '
    if $S0 goto _revision_lab
    $P2 .= 'version '
    $S0 = $P0['VERSION']
    goto _is_version
  _revision_lab:
    $P2 .= 'revision '
  _is_version:
    $P2 .= $S0
    $P2 .= '.'
    setattribute self, '$version', $P2
.end


=head2 Methods

=over 4

=item attr(string attrname, pmc value, int has_value)

Helper method for accessors -- gets/sets an attribute given
by C<attrname> based on C<has_value>.

=cut

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    if has_value goto set_value
    value = getattribute self, attrname
    unless null value goto end
    value = new 'Undef'
    goto end
  set_value:
    setattribute self, attrname, value
  end:
    .return (value)
.end


=item panic(message :slurpy)

Helper method to throw an exception (with a message).

=cut

.sub 'panic' :method
    .param pmc args            :slurpy
    $S0 = join '', args
    die $S0
.end


=item language(string name)

Register this object as the compiler for C<name> using the
C<compreg> opcode.

=cut

.sub 'language' :method
    .param string name
    compreg name, self
    .return ()
.end

=item stages([stages])

Accessor for the C<stages> attribute.

=item parsegrammar([string grammar])

Accessor for the C<parsegrammar> attribute.

=item parseactions([actions])

Accessor for the C<parseactions> attribute.

=item astgrammar([grammar])

Accessor for the C<astgrammar> attribute.

=item commandline_banner([string value])

Set the command-line banner for this compiler to C<value>.
The banner is displayed at the beginning of interactive mode.

=item commandline_prompt([string value])

Set the command-line prompt for this compiler to C<value>.
The prompt is displayed in interactive mode at each point where
the compiler is ready for code to be compiled and executed.

=cut

.sub 'stages' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('@stages', value, has_value)
.end

.sub 'parsegrammar' :method
    .param pmc value        :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$parsegrammar', value, has_value)
.end

.sub 'parseactions' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$parseactions', value, has_value)
.end

.sub 'astgrammar' :method
    .param pmc value        :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$astgrammar', value, has_value)
.end

.sub 'commandline_banner' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$commandline_banner', value, has_value)
.end

.sub 'commandline_prompt' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$commandline_prompt', value, has_value)
.end

=item removestage(string stagename)

Delete a stage from the compilation process queue.

=cut

.sub 'removestage' :method
    .param string stagename

    .local pmc stages, it, newstages
    stages = getattribute self, '@stages'
    newstages = new 'ResizableStringArray'

    it = iter stages
  iter_loop:
    unless it goto iter_end
    .local pmc current
    current = shift it
    if current == stagename goto iter_loop
      push newstages, current
    goto iter_loop
  iter_end:
    setattribute self, '@stages', newstages
.end

=item addstage(string stagename [, "option" => value, ... ])

Add a stage to the compilation process queue. Takes either a "before" or
"after" named argument, which gives the relative ordering of the stage
to be added. If "before" and "after" aren't specified, the new stage is
inserted at the end of the queue.

It's possible to add multiple stages of the same name: for example, you
might repeat a stage like "optimize_tree" or "display_benchmarks" after
each transformation. If you have multiple stages of the same name, and
add a new stage before or after that repeated stage, the new stage will
be added at every instance of the repeated stage.

=cut

.sub 'addstage' :method
    .param string stagename
    .param pmc adverbs         :slurpy :named

    .local string position, target
    .local pmc stages
    stages = getattribute self, '@stages'

    $I0 = exists adverbs['before']
    unless $I0 goto next_test
      position = 'before'
      target = adverbs['before']
    goto positional_insert

  next_test:
    $I0 = exists adverbs['after']
    unless $I0 goto simple_insert
      position = 'after'
      target = adverbs['after']

  positional_insert:
    .local pmc it, newstages
    newstages = new 'ResizableStringArray'

    it = iter stages
  iter_loop:
    unless it goto iter_end
    .local pmc current
    current = shift it
    unless current == target goto no_insert_before
      unless position == 'before' goto no_insert_before
        push newstages, stagename
    no_insert_before:

    push newstages, current

    unless current == target goto no_insert_after
      unless position == 'after' goto no_insert_after
        push newstages, stagename
    no_insert_after:

    goto iter_loop
  iter_end:
    setattribute self, '@stages', newstages
    goto done

  simple_insert:
    push stages, stagename
  done:

.end

=item compile(pmc code [, "option" => value, ... ])

Compile C<source> (possibly modified by any provided options)
by iterating through any stages identified for this compiler.
If a C<target> option is provided, then halt the iteration
when the stage corresponding to target has been reached.

=cut

.sub 'compile' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local pmc compiling, options
    compiling = new ['Hash']
    .lex '%*COMPILING', compiling
    compiling['%?OPTIONS'] = adverbs

    .local string target
    target = adverbs['target']
    target = downcase target

    .local int stagestats
    stagestats = adverbs['stagestats']

    .local pmc stages, result, it
    result = source
    stages = getattribute self, '@stages'
    it = iter stages
    if stagestats goto stagestats_loop

  iter_loop:
    unless it goto have_result
    .local string stagename
    stagename = shift it
    result = self.stagename(result, adverbs :flat :named)
    if target == stagename goto have_result
    goto iter_loop

  stagestats_loop:
    unless it goto have_result
    stagename = shift it
    $N0 = time
    result = self.stagename(result, adverbs :flat :named)
    $N1 = time
    $N2 = $N1 - $N0
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
    $P1.'print'("Stage '")
    $P1.'print'(stagename)
    $P1.'print'("': ")
    $P1.'print'($N2)
    $P1.'print'(" sec\n")
    if target == stagename goto have_result
    goto stagestats_loop

  have_result:
    .return (result)
.end


=item parse(source [, "option" => value, ...])

Parse C<source> using the compiler's C<parsegrammar> according
to any options and return the resulting parse tree.

=cut

.sub 'parse' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local pmc parsegrammar, top

    .local string tcode
    tcode = adverbs['transcode']
    unless tcode goto transcode_done
    .local pmc tcode_it
    $P0 = split ' ', tcode
    tcode_it = iter $P0
  tcode_loop:
    unless tcode_it goto transcode_done
    tcode = shift tcode_it
    push_eh tcode_enc
    $I0 = find_charset tcode
    $S0 = source
    $S0 = trans_charset $S0, $I0
    assign source, $S0
    pop_eh
    goto transcode_done
  tcode_enc:
    pop_eh
    push_eh tcode_fail
    $I0 = find_encoding tcode
    $S0 = source
    $S0 = trans_encoding $S0, $I0
    assign source, $S0
    pop_eh
    goto transcode_done
  tcode_fail:
    pop_eh
    goto tcode_loop
  transcode_done:

    .local string target
    target = adverbs['target']
    target = downcase target

    parsegrammar = self.'parsegrammar'()
    $I0 = can parsegrammar, 'TOP'
    unless $I0 goto parsegrammar_string
    top = find_method parsegrammar, 'TOP'
    goto have_top
  parsegrammar_string:
    $S0 = typeof parsegrammar
    eq $S0, 'NameSpace', parsegrammar_ns
    $P0 = self.'parse_name'(parsegrammar)
    $S0 = pop $P0
    $P1 = get_hll_global $P0, $S0
    $I0 = can $P1, 'TOP'
    unless $I0 goto parsegrammar_ns_string
    top = find_method $P1, 'TOP'
    goto have_top
  parsegrammar_ns_string:
    $P0 = self.'parse_name'(parsegrammar)
    top = get_hll_global $P0, 'TOP'
    unless null top goto have_top
    goto err_notop
  parsegrammar_ns:
    top = parsegrammar['TOP']
    unless null top goto have_top
  err_notop:
    self.'panic'('Cannot find TOP regex in ', parsegrammar)
  have_top:
    .local pmc parseactions, action
    null action
    if target == 'parse' goto have_action
    parseactions = self.'parseactions'()
    $I0 = isa parseactions, ['Undef']
    if $I0 goto have_action
    ##  if parseactions is a protoobject, use it directly
    $I0 = isa parseactions, 'P6protoobject'
    if $I0 goto action_exact
    ##  if parseactions is a Class or array, make action directly from that
    $I0 = isa parseactions, 'Class'
    if $I0 goto action_make
    $I0 = isa parseactions, 'NameSpace'
    if $I0 goto action_namespace
    $I0 = does parseactions, 'array'
    if $I0 goto action_make
    ##  if parseactions is not a String, use it directly.
    $I0 = isa parseactions, 'String'
    if $I0 goto action_string
  action_exact:
    action = parseactions
    goto have_action
  action_namespace:
    $P0 = get_class parseactions
    action = new $P0
    goto have_action
  action_string:
    ##  Try the string itself, if that fails try splitting on '::'
    $P0 = get_class parseactions
    unless null $P0 goto action_make
    $S0 = parseactions
    parseactions = split '::', $S0
    push_eh err_bad_parseactions
    $P0 = get_class parseactions
    if null $P0 goto err_bad_parseactions
    pop_eh
  action_make:
    action = new parseactions
  have_action:
    .local pmc match
    match = top(source, 'grammar' => parsegrammar, 'action' => action)
    unless match goto err_failedparse
    .return (match)

  err_no_parsegrammar:
    self.'panic'('Missing parsegrammar in compiler')
    .return ()
  err_failedparse:
    self.'panic'('Failed to parse source')
    .return ()
  err_bad_parseactions:
    pop_eh
    $P0 = self.'parseactions'()
    self.'panic'('Unable to find action grammar ', $P0)
    .return ()
.end


=item past(source [, "option" => value, ...])

Transform C<source> into PAST using the compiler's
C<astgrammar> according to any options, and return the
resulting ast.

=cut

.sub 'past' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

  compile_astgrammar:
    .local pmc astgrammar_name
    astgrammar_name = self.'astgrammar'()
    $S0 = typeof astgrammar_name
    eq $S0, 'NameSpace', astgrammar_ns
    unless astgrammar_name goto compile_match

    .local pmc astgrammar_namelist
    .local pmc astgrammar, astbuilder
    astgrammar_namelist = self.'parse_name'(astgrammar_name)
    unless astgrammar_namelist goto err_past
    astgrammar = new astgrammar_namelist
    astbuilder = astgrammar.'apply'(source)
    .tailcall astbuilder.'get'('past')
  astgrammar_ns:
    $P0 = get_class astgrammar_name
    astgrammar = new $P0
    astbuilder = astgrammar.'apply'(source)
    .tailcall astbuilder.'get'('past')

  compile_match:
    #push_eh err_past
    .local pmc ast
    ast = source.'ast'()
    #pop_eh
    $I0 = isa ast, ['PAST';'Node']
    unless $I0 goto err_past
    .return (ast)

  err_past:
    #pop_eh
    $S0 = typeof source
    .tailcall self.'panic'('Unable to obtain PAST from ', $S0)
.end


=item post(source [, adverbs :slurpy :named])

Transform PAST C<source> into POST.

=cut

.sub 'post' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    $P0 = compreg 'PAST'
    .tailcall $P0.'to_post'(source, adverbs :flat :named)
.end


.sub 'pir' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'POST'
    .tailcall $P0.'to_pir'(source, adverbs :flat :named)
.end


.sub 'evalpmc' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'PIR'
    $P1 = $P0(source)
    .return ($P1)
.end



=item eval(code [, "option" => value, ...])

Compile and execute the given C<code> taking into account any
options provided.

=cut

.sub 'eval' :method
    .param pmc code
    .param pmc args            :slurpy
    .param pmc adverbs         :slurpy :named

    unless null args goto have_args
    args = new 'ResizablePMCArray'
  have_args:
    unless null adverbs goto have_adverbs
    adverbs = new 'Hash'
  have_adverbs:

    $P0 = self.'compile'(code, adverbs :flat :named)
    $I0 = isa $P0, 'String'
    if $I0 goto end
    .local string target
    target = adverbs['target']
    if target != '' goto end
    .local pmc outer_ctx, outer
    outer_ctx = adverbs['outer_ctx']
    if null outer_ctx goto outer_done
    outer = outer_ctx['current_sub']
    $P1 = $P0[0]
    $P1.'set_outer'(outer)
  outer_done:
    $I0 = adverbs['trace']
    trace $I0
    $P0 = $P0(args :flat)
    trace 0
  end:
    .return ($P0)
.end


=item interactive(["encoding" => encoding] [, "option" => value, ...])

Runs an interactive compilation session -- reads lines of input
from the standard input and evaluates each.  The C<encoding> option
specifies the encoding to use for the input (e.g., "utf8").

=cut

.sub 'interactive' :method
    .param pmc adverbs         :slurpy :named
    .local string target, encoding
    target = adverbs['target']
    target = downcase target

    # on startup show the welcome message
    $P0 = self.'commandline_banner'()
    $P1 = getinterp
    $P2 = $P1.'stdhandle'(.PIO_STDERR_FILENO)
    $P2.'print'($P0)

    .local pmc stdin
    .local int has_readline
    $P0 = getinterp
    stdin = $P0.'stdhandle'(.PIO_STDIN_FILENO)
    encoding = adverbs['encoding']
    if encoding == 'fixed_8' goto interactive_loop
    unless encoding goto interactive_loop
    stdin.'encoding'(encoding)
  interactive_loop:
    .local pmc code
    unless stdin goto interactive_end

    .local string prompt
    prompt = '> '
    $P0 = self.'commandline_prompt'()
    $I0 = defined $P0
    unless $I0 goto have_prompt
    prompt = $P0
  have_prompt:

    ##  display a prompt ourselves if readline isn't present
  interactive_read:
    code = stdin.'readline_interactive'(prompt)
    if null code goto interactive_end
    unless code goto interactive_loop
    concat code, "\n"
    push_eh interactive_trap
    $P0 = self.'eval'(code, adverbs :flat :named)
    pop_eh
    if null $P0 goto interactive_loop
    unless target goto interactive_loop
    if target == 'pir' goto target_pir
    self.'dumper'($P0, target, adverbs :flat :named)
    goto interactive_loop
  target_pir:
    say $P0
    goto interactive_loop
  interactive_trap:
    get_results '0', $P0
    pop_eh
    $S0 = $P0
    if $S0 == '' goto have_newline
    $S1 = substr $S0, -1, 1
    $I0 = is_cclass .CCLASS_NEWLINE, $S1, 0
    if $I0 goto have_newline
    $S0 = concat $S0, "\n"
  have_newline:
    print $S0
    goto interactive_loop
  interactive_end:
    .return ()
.end


=item EXPORTALL(source, destination)

Export all namespace entries from the default export namespace for source
(source::EXPORT::ALL) to the destination namespace.

=cut

.sub 'EXPORTALL' :method
    .param pmc source
    .param pmc dest
    .local pmc ns_iter, item, export_list

    source = source['EXPORT']
    unless source, no_namespace_error
    source = source['ALL']
    unless source, no_namespace_error

    ns_iter = iter source
    export_list = new 'ResizablePMCArray'
  export_loop:
    unless ns_iter, export_loop_end
    item = shift ns_iter
    push export_list, item
    goto export_loop
  export_loop_end:

    source.'export_to'(dest,export_list)
    .return ()

  no_namespace_error:
    $P0 = new 'Exception'
    $P0 = 'Missing EXPORT::ALL NameSpace'
    throw $P0
    .return ()
.end

=item evalfiles(files [, args] [, "encoding" => encoding] [, "option" => value, ...])

Compile and evaluate a file or files.  The C<files> argument may
be either a single filename or an array of files to be processed
as a single compilation unit.  The C<encoding> option specifies
the encoding to use when reading the files, and any remaining
options are passed to the evaluator.

=cut

.sub 'evalfiles' :method
    .param pmc files
    .param pmc args            :slurpy
    .param pmc adverbs         :slurpy :named

    unless null adverbs goto have_adverbs
    adverbs = new 'Hash'
  have_adverbs:
    .local string target
    target = adverbs['target']
    target = downcase target
    .local string encoding
    encoding = adverbs['encoding']
    $I0 = does files, 'array'
    if $I0 goto have_files_array
    $P0 = new 'ResizablePMCArray'
    push $P0, files
    files = $P0
  have_files_array:
    .local string code
    code = ''
    .local pmc it
    it = iter files
  iter_loop:
    unless it goto iter_end
    .local string iname
    .local pmc ifh
    iname = shift it
    ifh = new 'FileHandle'
    unless encoding == 'utf8' goto iter_loop_1
    ifh.'encoding'(encoding)
  iter_loop_1:
    $S0 = ifh.'readall'(iname)
    code .= $S0
    ifh.'close'()
    goto iter_loop
  iter_end:
    $S0 = join ' ', files
    $P1 = box $S0
    .lex '$?FILES', $P1
    $P0 = self.'eval'(code, args :flat, adverbs :flat :named)
    if target == '' goto end
    if target == 'pir' goto end
    self.'dumper'($P0, target, adverbs :flat :named)
  end:
    .return ($P0)

  err_infile:
    .tailcall self.'panic'('Error: file cannot be read: ', iname)
.end


=item process_args(PMC args)

Performs option processing of command-line args

=cut

.sub 'process_args' :method
    .param pmc args

    load_bytecode 'Getopt/Obj.pbc'

    .local string arg0
    arg0 = shift args
    .local pmc getopts
    getopts = new ['Getopt';'Obj']
    getopts.'notOptStop'(1)
    $P0 = getattribute self, '@cmdoptions'
    .local pmc it
    it = iter $P0
  getopts_loop:
    unless it goto getopts_end
    $S0 = shift it
    push getopts, $S0
    goto getopts_loop
  getopts_end:
    .tailcall getopts.'get_options'(args)
.end


=item command_line(PMC args)

Generic method for compilers invoked from a shell command line.

=cut

.include 'except_severity.pasm'
.sub 'command_line' :method
    .param pmc args
    .param pmc adverbs         :slurpy :named

    ## this bizarre piece of code causes the compiler to
    ## immediately abort if it looks like it's being run
    ## from Perl's Test::Harness.  (Test::Harness versions 2.64
    ## and earlier have a hardwired commandline option that is
    ## always passed to an initial run of the interpreter binary,
    ## whether you want it or not.)  We expect to remove this
    ## check eventually (or make it a lot smarter than it is here).
    $S0 = args[2]
    $I0 = index $S0, '@INC'
    if $I0 < 0 goto not_harness
    exit 0
  not_harness:

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    ##  get the name of the program
    .local string arg0
    arg0 = args[0]

    ##   perform option processing of command-line args
    .local pmc opts
    opts = self.'process_args'(args)

    ##   merge command-line args with defaults passed in from caller
    .local pmc it
    it = iter opts
  mergeopts_loop:
    unless it goto mergeopts_end
    $S0 = shift it
    $P0 = opts[$S0]
    adverbs[$S0] = $P0
    goto mergeopts_loop
  mergeopts_end:

    $I0 = adverbs['help']
    if $I0 goto usage

    $I0 = adverbs['version']
    if $I0 goto version

    .local int can_backtrace
    can_backtrace = can self, 'backtrace'
    unless can_backtrace goto no_push_eh
    push_eh uncaught_exception
  no_push_eh:

    $S0 = adverbs['e']
    $I0 = exists adverbs['e']
    if $I0 goto eval_line
    .local pmc result
    result = box ''
    unless args goto interactive
    $I0 = adverbs['combine']
    if $I0 goto combine
    $S0 = args[0]
    result = self.'evalfiles'($S0, args :flat, adverbs :flat :named)
    goto save_output
  combine:
    result = self.'evalfiles'(args, adverbs :flat :named)
    goto save_output
  interactive:
    self.'interactive'(args :flat, adverbs :flat :named)
    goto save_output
  eval_line:
    result = self.'eval'($S0, '-e', args :flat, adverbs :flat :named)

  save_output:
    unless can_backtrace goto no_pop_eh
    pop_eh
  no_pop_eh:
    if null result goto end
    $I0 = defined result
    unless $I0 goto end
    .local string target
    target = adverbs['target']
    target = downcase target
    if target != 'pir' goto end
    .local string output
    .local pmc ofh
    $P0 = getinterp
    ofh = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    output = adverbs['output']
    if output == '' goto save_output_1
    if output == '-' goto save_output_1
    ofh = new ['FileHandle']
    ofh.'open'(output, 'w')
    unless ofh goto err_output
  save_output_1:
    print ofh, result
    ofh.'close'()
  end:
    .return ()

  err_output:
    .tailcall self.'panic'('Error: file cannot be written: ', output)
  usage:
    self.'usage'(arg0)
    goto end
  version:
    self.'version'()
    goto end

    # If we get an uncaught exception in the program and the HLL provides
    # a backtrace method, we end up here. We pass it the exception object
    # so it can render a backtrace, unless the severity is exit or warning
    # in which case it needs special handling.
  uncaught_exception:
    .get_results ($P0)
    pop_eh
    $P1 = getinterp
    $P1 = $P1.'stdhandle'(.PIO_STDERR_FILENO)
    $I0 = $P0['severity']
    if $I0 == .EXCEPT_EXIT goto do_exit
    $S0 = self.'backtrace'($P0)
    print $P1, $S0
    if $I0 <= .EXCEPT_WARNING goto do_warning
    exit 1
  do_exit:
    $I0 = $P0['exit_code']
    exit $I0
  do_warning:
    $P0 = $P0["resume"]
    push_eh uncaught_exception # Otherwise we get errors about no handler to delete
    $P0()
.end


=item parse_name(string name)

Split C<name> into its component namespace parts, as
required by pdd21.  The default is simply to split the name
based on double-colon separators.

=cut

.sub 'parse_name' :method
    .param string name
    $P0 = split '::', name
    .return ($P0)
.end

=item dumper(obj, name, options)

Dump C<obj> with C<name> according to C<options>.

=cut

.sub 'dumper' :method
    .param pmc obj
    .param string name
    .param pmc options         :slurpy :named

    $S0 = options['dumper']
    if $S0 goto load_dumper
    .tailcall '_dumper'(obj, name)

  load_dumper:
    load_bytecode 'PCT/Dumper.pbc'
    $S0 = downcase $S0
    $P0 = get_hll_global ['PCT';'Dumper'], $S0
    .tailcall $P0(obj, name)
.end


=item usage()

A usage method.

=cut

.sub 'usage' :method
    .param string name     :optional
    .param int    has_name :opt_flag

    unless has_name goto no_name
    say name
  no_name:
    $P0 = getattribute self, '$usage'
    say $P0
    exit 0
.end


=item version()

Display compiler version information.

=cut

.sub 'version' :method
    $P0 = getattribute self, '$version'
    say $P0
    exit 0
.end


=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
