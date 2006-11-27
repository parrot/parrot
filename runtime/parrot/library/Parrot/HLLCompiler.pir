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
    addattribute $P0, '$!compsub'
.end

=head2 Methods

=over 4

=item attr(string attrname, pmc value, int has_value)

Helper method for accessors -- gets/sets an attribute given
by C<attrname> based on C<has_value>.

=cut

.namespace [ 'HLLCompiler' ]

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


=item 'language'(string name)

Register this object as the compiler for C<name> using the
C<compreg> opcode.

=cut

.sub 'language' :method
    .param string name
    compreg name, self
    .return ()
.end


=item parsegrammar([string grammar])

Accessor for the 'parsegrammar' attribute.

=item astgrammar([string grammar])

Accessor for the 'astgrammar' attribute.

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


=item compile(pmc code [, adverbs :slurpy :named])

Compile C<source> according to any options given by
C<adverbs>.  If a compsub has been registered for this
compiler, use it, otherwise use the C<parsegrammar> and
C<astgrammar> attributes, otherwise throw an exception.

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

    .local pmc result
    result = self.'parse'(source, adverbs :flat :named)
    if target == 'parse' goto have_result
    result = self.'ast'(result, adverbs :flat :named)
    if target == 'past' goto have_result
    $P0 = compreg 'PAST'
    result = $P0.'compile'(result, adverbs :flat :named)
  have_result:
    .return (result)
.end


=item parse(source [, adverbs :slurpy :named])

Parse C<source> using the compiler's C<parsegrammar> according
to any options given by C<adverbs>, and return the resulting
parse tree.

=cut

.sub 'parse' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local pmc parsegrammar_name, apply

    parsegrammar_name = self.'parsegrammar'()
    unless parsegrammar_name goto err_no_parsegrammar
    apply = get_hll_global parsegrammar_name, 'apply'
    .return apply(source, 'grammar' => parsegrammar_name)

  err_no_parsegrammar:
    $P0 = new .Exception
    $P0['_message'] = 'Missing parsegrammar in compiler'
    throw $P0
.end


=item ast(source [, adverbs :slurpy :named])

Transform C<source> using the compiler's C<astgrammar>
according to any options given by C<adverbs>, and return the
resulting ast.

=cut

.sub 'ast' :method
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

  setopts:
    .local string target, output, encoding
    .local string code
    .local pmc outputbuf
    target = adverbs['target']
    encoding = adverbs['encoding']
    output = adverbs['output']
    unless output goto setopts_end
    outputbuf = new .String
  setopts_end:

    $I0 = adverbs['combine']
    if $I0 goto combine
    unless args goto interactive

  single:
    .local string iname
    .local pmc ifh
    iname = args[0]
    ifh = open iname, '<'
    unless ifh goto err_infile
    unless encoding goto single_1
    push ifh, encoding
  single_1:
    code = ifh.'slurp'('')
    close ifh
    bsr evalcode
    goto save_output

    ## combine all input file(s) and process the result
  combine:
    code = ''
    iter = new .Iterator, args
  combine_loop:
    unless iter goto combine_end
    iname = shift iter
    ifh = open iname, '<'
    unless ifh goto err_infile
    unless encoding goto combine_1
    push ifh, encoding
  combine_1:
    $S0 = ifh.'slurp'('')
    code .= $S0
    close ifh
    goto combine_loop
  combine_end:
    bsr evalcode
    goto save_output

  interactive:
    .local pmc stdin
    stdin = getstdin
    $I0 = stdin.'set_readline_interactive'(1)
    unless encoding goto interactive_loop
    push stdin, encoding
  interactive_loop:
    .local string code
    unless stdin goto interactive_end
    code = stdin.'readline'('> ')
    unless code goto interactive_loop
    bsr evalcode
    goto interactive_loop
  interactive_end:
    goto save_output

  evalcode:
    $P0 = self.'compile'(code, adverbs :flat :named)
    $I0 = isa $P0, 'String'
    if $I0 goto evalcode_string
    if target != '' goto evalcode_dump
    $I0 = opts['trace']
    trace $I0
    $P0()
    trace 0
    ret
  evalcode_dump:
    '_dumper'($P0, target)
    ret
  evalcode_string:
    if output goto evalcode_output
    print $P0
    ret
  evalcode_output:
    outputbuf .= $P0
    ret

  save_output:
    unless output goto save_output_end
    .local pmc ofh
    ofh = getstdout
    if output == '-' goto save_output_1
    ofh = open output, '>'
    unless ofh goto err_output
  save_output_1:
    print ofh, outputbuf
    close ofh
  save_output_end:
    .return ()

  err_infile:
    $P0 = new .Exception
    $S0 = 'Error: file cannot be read: '
    $S0 .= iname
    $S0 .= "\n"
    $P0['_message'] = $S0
    throw $P0
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

=back
