=head1 NAME

HLLCompiler - base class for compiler objects

=head1 DESCRIPTION

This file implements a C<HLLCompiler> class of objects used for
creating HLL compilers.  It provides the standard methods required
for all compilers, as well as some standard scaffolding for
running compilers from a command line.

=cut

.namespace

.sub '__onload' :load :init
    $P0 = newclass [ 'HLLCompiler' ]
    addattribute $P0, '$parsegrammar'
    addattribute $P0, '$astgrammar'
    addattribute $P0, '$ostgrammar'
    addattribute $P0, '@stages'
    addattribute $P0, '$!compsub'

    # the commandline_banner is the welcome message for interactive mode
    addattribute $P0, '$commandline_banner'
    # the commandline_prompt is the prompt to show for input
    addattribute $P0, '$commandline_prompt'
.end

=head2 Methods

=over 4

=item attr(string attrname, pmc value, int has_value)

Helper method for accessors -- gets/sets an attribute given
by C<attrname> based on C<has_value>.

=cut

.namespace [ 'HLLCompiler' ]

.include 'cclass.pasm'

.sub 'init' :vtable :method
    $P0 = split ' ', 'parse past post pir run'
    setattribute self, '@stages', $P0
.end

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    if has_value goto set_value
    value = getattribute self, attrname
    unless null value goto end
    value = new .Undef
    goto end
  set_value:
    setattribute self, attrname, value
  end:
    .return (value)
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


=item parsegrammar([string grammar])

Accessor for the C<parsegrammar> attribute.

=item astgrammar([string grammar])

Accessor for the C<astgrammar> attribute.

=item ostgrammar([string grammar])

Accessor for the 'ostgrammar' attribute.

=cut

.sub 'parsegrammar' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .return self.'attr'('$parsegrammar', value, has_value)
.end


.sub 'astgrammar' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .return self.'attr'('$astgrammar', value, has_value)
.end

.sub 'ostgrammar' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .return self.'attr'('$ostgrammar', value, has_value)
.end

.sub 'commandline_banner' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .return self.'attr'('$commandline_banner', value, has_value)
.end

.sub 'commandline_prompt' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .return self.'attr'('$commandline_prompt', value, has_value)
.end

=item removestage(string stagename)

Delete a stage from the compilation process queue.

=cut

.sub 'removestage' :method
    .param string stagename

    .local pmc stages, iter, newstages
    stages = getattribute self, '@stages'
    newstages = new .ResizableStringArray

    iter = new .Iterator, stages
  iter_loop:
    unless iter goto iter_end
    .local pmc current
    current = shift iter
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
    .local pmc iter, newstages
    newstages = new .ResizableStringArray

    iter = new .Iterator, stages
  iter_loop:
    unless iter goto iter_end
    .local pmc current
    current = shift iter
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

Compile C<source> (possibly modified by any provided options).
If a compsub has been registered for this compiler, use it,
otherwise use the C<parsegrammar> and C<astgrammar> attributes
to get to an AST and compile it, otherwise throw an exception.

=cut

.sub 'compile' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local pmc compsub

    #   $!compsub is deprecated
    compsub = getattribute self, '$!compsub'
    if null compsub goto default
    .return compsub(source, adverbs :flat :named)
  default:
    .local string target
    target = adverbs['target']
    target = downcase target

    .local pmc stages, result, iter
    result = source
    stages = getattribute self, '@stages'
    iter = new .Iterator, stages
  iter_loop:
    unless iter goto iter_end
    .local string stagename
    stagename = shift iter
    result = self.stagename(result, adverbs :flat :named)
    if target == stagename goto have_result
    goto iter_loop
  iter_end:

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
    .local pmc parsegrammar_name, top

    parsegrammar_name = self.'parsegrammar'()
    unless parsegrammar_name goto err_no_parsegrammar
    top = get_hll_global parsegrammar_name, 'TOP'
    unless null top goto have_top                      # FIXME: deprecated
    top = get_hll_global parsegrammar_name, 'apply'    # FIXME: deprecated
  have_top:                                            # FIXME: deprecated
    .local pmc match
    match = top(source, 'grammar' => parsegrammar_name)
    unless match goto err_failedparse
    .return (match)

  err_no_parsegrammar:
    $P0 = new .Exception
    $P0['_message'] = 'Missing parsegrammar in compiler'
    throw $P0
  err_failedparse:
    $P0 = new .Exception
    $P0['_message'] = 'Failed to parse source'
    throw $P0
.end


=item ast(source [, "option" => value, ...])

Transform C<source> into an AST using the compiler's
C<astgrammar> according to any options, and return the
resulting ast.

=cut

.sub 'past' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local string astgrammar_name
    .local pmc astgrammar, astbuilder
    astgrammar_name = self.'astgrammar'()
    unless astgrammar_name goto err_no_astgrammar
    $I0 = find_type astgrammar_name
    astgrammar = new $I0
    astbuilder = astgrammar.'apply'(source)
    .return astbuilder.'get'('past')

  err_no_astgrammar:
    $P0 = new .Exception
    $P0['_message'] = 'Missing astgrammar in compiler'
    throw $P0
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
    args = new .ResizablePMCArray
  have_args:
    unless null adverbs goto have_adverbs
    adverbs = new .Hash
  have_adverbs:

    $P0 = self.'compile'(code, adverbs :flat :named)
    $I0 = isa $P0, 'String'
    if $I0 goto end
    .local string target
    target = adverbs['target']
    if target != '' goto end
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
    printerr $P0

    .local pmc stdin
    .local int has_readline
    stdin = getstdin
    has_readline = stdin.'set_readline_interactive'(1)
    encoding = adverbs['encoding']
    unless encoding goto interactive_loop
    push stdin, encoding
  interactive_loop:
    .local pmc code
    unless stdin goto interactive_end
    ##  FIXME:  we have to avoid stdin.'readline'() when readline
    ##  libraries aren't present (RT #41103)

    # for each input line, print the prompt
    $P0 = self.'commandline_prompt'()
    printerr $P0

    if has_readline < 0 goto no_readline
    code = stdin.'readline'('> ')
    if null code goto interactive_end
    concat code, "\n"
    goto have_code
  no_readline:
    $S0 = readline stdin
    code = new .String
    code = $S0
  have_code:
    unless code goto interactive_loop
    push_eh interactive_trap
    $P0 = self.'eval'(code, adverbs :flat :named)
    clear_eh
    if null $P0 goto interactive_loop
    unless target goto interactive_loop
    if target == 'pir' goto target_pir
    '_dumper'($P0, target)
    goto interactive_loop
  target_pir:
    say $P0
    goto interactive_loop
  interactive_trap:
    get_results '(0,0)', $P0, $S0
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
    adverbs = new .Hash
  have_adverbs:
    .local string target
    target = adverbs['target']
    target = downcase target
    .local string encoding
    encoding = adverbs['encoding']
    $I0 = does files, 'array'
    if $I0 goto have_files_array
    $P0 = new .ResizablePMCArray
    push $P0, files
    files = $P0
  have_files_array:
    .local string code
    code = ''
    .local pmc iter
    iter = new .Iterator, files
  iter_loop:
    unless iter goto iter_end
    .local string iname
    .local pmc ifh
    iname = shift iter
    ifh = open iname, '<'
    unless ifh goto err_infile
    unless encoding goto iter_loop_1
    push ifh, encoding
  iter_loop_1:
    $S0 = ifh.'slurp'('')
    code .= $S0
    close ifh
    goto iter_loop
  iter_end:
    $P0 = self.'eval'(code, adverbs :flat :named)
    if target == '' goto end
    if target == 'pir' goto end
    '_dumper'($P0, target)
  end:
    .return ($P0)

  err_infile:
    $P0 = new .Exception
    $S0 = 'Error: file cannot be read: '
    $S0 .= iname
    $S0 .= "\n"
    $P0['_message'] = $S0
    throw $P0
    .return ()
.end


=item command_line(PMC args)

Generic method for compilers invoked from a shell command line.

=cut

.sub 'command_line' :method
    .param pmc args
    .param pmc adverbs         :slurpy :named

    load_bytecode 'Getopt/Obj.pbc'
    load_bytecode 'dumper.pbc'

    ##   perform option processing of command-line args
    .local string arg0
    arg0 = shift args
    .local pmc getopts, opts
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)
    push getopts, 'target=s'
    push getopts, 'trace|t=s'
    push getopts, 'encoding|e=s'
    push getopts, 'output|o=s'
    push getopts, 'combine'
    push getopts, 'each'
    opts = getopts.'get_options'(args)

    ##   merge command-line args with defaults passed in from caller
    .local pmc iter
    iter = new .Iterator, opts
  mergeopts_loop:
    unless iter goto mergeopts_end
    $S0 = shift iter
    $P0 = opts[$S0]
    adverbs[$S0] = $P0
    goto mergeopts_loop
  mergeopts_end:

    .local pmc result
    result = new .String
    result = ''
    unless args goto interactive
    $I0 = adverbs['combine']
    if $I0 goto combine
    $S0 = shift args
    result = self.'evalfiles'($S0, args :flat, adverbs :flat :named)
    goto save_output
  combine:
    result = self.'evalfiles'(args, adverbs :flat :named)
    goto save_output
  interactive:
    self.'interactive'(args :flat, adverbs :flat :named)

  save_output:
    if null result goto end
    unless result goto end
    .local string target
    target = adverbs['target']
    target = downcase target
    if target != 'pir' goto end
    .local string output
    .local pmc ofh
    ofh = getstdout
    output = adverbs['output']
    if output == '' goto save_output_1
    if output == '-' goto save_output_1
    ofh = open output, '>'
    unless ofh goto err_output
  save_output_1:
    print ofh, result
    close ofh
  end:
    .return ()

  err_output:
    $P0 = new .Exception
    $S0 = 'Error: file cannot be written: '
    $S0 .= output
    $S0 .= "\n"
    $P0['_message'] = $S0
    throw $P0
    .return ()
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

=item ost(source [, adverbs :slurpy :named])

Transform C<source> using the compiler's C<ostgrammar>
according to any options given by C<adverbs>, and return the
resulting ost.

=cut

.sub 'post' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local string ostgrammar_name
    .local pmc ostgrammar, ostbuilder
    ostgrammar_name = self.'ostgrammar'()
    unless ostgrammar_name goto default_ostgrammar
    $I0 = find_type ostgrammar_name
    ostgrammar = new $I0
    ostbuilder = ostgrammar.'apply'(source)
    .return ostbuilder.'get'('post')

  default_ostgrammar:
    $P0 = compreg 'PAST'
    .return $P0.'compile'(source, adverbs :flat :named)
.end

.sub 'pir' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'POST'
    $P1 = $P0.'compile'(source, adverbs :flat :named)
    .return ($P1)
.end

.sub 'run' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'PIR'
    $P1 = $P0(source)
    .return ($P1)
.end


=item register(string name, pmc compsub)  # DEPRECATED

(Deprecated.) Registers this compiler object as C<name> and
using C<compsub> as the subroutine to call for performing compilation.

=cut

.sub 'register' :method
    .param string name
    .param pmc compsub

    setattribute self, '$!compsub', compsub
    compreg name, self
    .return ()
.end


=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
