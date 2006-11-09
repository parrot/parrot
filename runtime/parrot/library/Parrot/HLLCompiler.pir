=head1 NAME

HLLCompiler - base class for HLL compiler objects

=head1 DESCRIPTION

This file implements a C<HLLCompiler> class of objects used for
creating HLL compilers.  It provides the standard methods required
for all compilers, as well as some standard scaffolding for
running compilers from a command line.

=cut

.namespace [ 'HLLCompiler' ]

.sub '__onload' :load :init
    $P0 = newclass [ 'HLLCompiler' ]
    addattribute $P0, '$!compsub'
.end

=head2 Methods 

=item C<register(string name, pmc compsub)>

Registers this compiler object as C<name> and using C<compsub>
as the subroutine to call for performing compilation.

=cut

.sub 'register' :method
    .param string name
    .param pmc compsub

    setattribute self, '$!compsub', compsub
    compreg name, self
    .return ()
.end


=item C<compile(PMC source, PMC adverbs :slurpy :named)>

Compile C<source> according to any options given by
C<adverbs>.  If no compiler has been registered
via C<compsub> above, then simply return C<source>.

=cut

.sub 'compile' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local pmc compsub

    compsub = getattribute self, '$!compsub'
    if null compsub goto default
    .return compsub(source, adverbs :flat :named)
  default:
    .return (source)
.end


=item C<parse_name(STRING name)>

Split C<name> into its component namespace parts.  The
default is simply to split based on double-colons.

=cut

.sub 'parse_name' :method
    .param string name
    $P0 = split '::', name
    .return ($P0)
.end
    

=item C<command_line(PMC args)>

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
    push getopts, 'trace|t'
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
    ifh = new .ParrotIO
    unless encoding goto single_1
    push ifh, encoding
  single_1:
    code = ifh.'slurp'(iname)
    bsr evalcode
    goto save_output
    
    ## combine all input file(s) and process the result
  combine:
    code = ''
    iter = new .Iterator, args
  combine_loop:
    unless iter goto combine_end
    iname = shift iter
    ifh = new .ParrotIO
    unless encoding goto combine_1
    push ifh, encoding
  combine_1:
    $S0 = ifh.'slurp'(iname)
    code .= $S0
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
    $P0()
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

  err_output:
    $P0 = new .Exception
    $S0 = 'Error: file cannot be written: '
    $S0 .= output
    $S0 .= "\n"
    $P0['_message'] = $S0
    throw $P0
    .return ()
.end

