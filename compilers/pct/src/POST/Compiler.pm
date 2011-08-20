class POST::Compiler is PCT::HLLCompiler;

=begin NAME

POST::Compiler - Compiler for POST trees

=end NAME

=begin DESCRIPTION

POST::Compiler defines a compiler that converts a POST tree into
PIR, PBC or an Eval PMC (bytecode).

=end DESCRIPTION

has $?HLL;
has $?NAMESPACE;

INIT {
    POST::Compiler.language('POST');
    POST::Compiler.stages(<pir evalpmc>);
    #$?HLL := '';
    Q:PIR {
        %r = new ['String']
        set_global '$?HLL', %r
    }
}


=item C<escape(string str)>
Returns an escaped value of C<str> suitable for including in PIR.
If the string contains any non-ASCII characters, then it's
prefixed with 'unicode:'.  (This method just delegates to
PAST::Compiler.escape, which does the same thing.)

method escape($str) {
    PAST::Compiler.escape($str);
}

=item C<key_pir( string name1 [, string name2, ...] )>
Constructs a PIR key using the strings passed as arguments.
For example, C<key('Foo', 'Bar')> returns C<["Foo";"Bar"]>.

method key_pir(*@args) {
    #'[' ~ join(';', map(-> $_ { self.escape($_) }, @args)) ~ ']';
    Q:PIR {
    .local pmc args
    find_lex args, '@args'

    .local string out, sep
    out = '['
    sep = ''
  args_loop:
    unless args goto args_done
    $P0 = shift args
    if null $P0 goto args_loop
    $I0 = does $P0, 'array'
    if $I0 goto args_array
  args_string:
    $S0 = self.'escape'($P0)
    out = concat out, sep
    out = concat out, $S0
    sep = ';'
    goto args_loop
  args_array:
    splice args, $P0, 0, 0
    goto args_loop
  args_done:
    out = concat out, ']'
    .return (out)
    }
}

method to_pir($post, *%adverbs) {
    my $newself := POST::Compiler.new;
    my $CODE    := pir::new('StringBuilder');
    my $LINE    := 0;

    unless $post.isa(POST::Sub) {
        $post := POST::Sub.new($post, :name<anon>);
    }
    $newself.pir($post);
    $CODE;
}

=item pir_children(node)
Return generated PIR for C<node> and all of its children.

method pir_children($node) {
    Q:PIR {
    .local pmc node
    find_lex node, '$node'

    .local pmc line
    line = find_caller_lex '$LINE'
    .lex '$LINE', line

    .local pmc iter
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpost, pos, source
    cpost = shift iter
    pos = cpost['pos']
    if null pos goto done_subline
    source = cpost['source']
    if null source goto done_subline
    line = self.'lineof'(source, pos, 'cache'=>1)
    inc line
  done_subline:
    self.'pir'(cpost)
    goto iter_loop
  iter_end:
    }
}

=item pir(Any node)
Return generated pir for any POST::Node.  Returns
the generated pir of C<node>'s children.

multi method pir($node) {
    self.pir_children($node);
}


=item pir(POST::Op node)
Return pir for an operation node.

our %pirop_handlers := foo => 'bar', baz => 'bang';

multi method pir(POST::Op $node) {
    ##  determine the type of operation
    my $pirop  := $node.pirop;
    ##  determine if we're storing result
    my $result := ~$node.result;
    $result := $result ~ ' = ' if $result;

    ##  get list of arguments to operation
    my @arglist := $node.list();

    ##  get format and arguments based on pirop
    my $fmt;
    my $name;
    my $invocant;

    if $pirop eq 'call' {
        $fmt        := "    %r%n(%,)\n";
        $name       := @arglist.shift;
    }
    elsif $pirop eq 'callmethod' {
        $fmt        := "    %r%i.%n(%,)\n";
        $name       := @arglist.shift;
        $invocant   := @arglist.shift;
    }
    elsif $pirop eq 'return' {
        $fmt        := "    .return (%,)\n";
    }
    elsif $pirop eq 'yield' {
        $fmt        := "    .yield (%,)\n";
    }
    elsif $pirop eq 'tailcall' {
        $name       := @arglist.shift;
        $fmt        := "    .tailcall %n(%,)\n";
    }
    elsif $pirop eq 'inline' {
        $fmt        := $node.inline ~ "\n";
        $result     := $node.result;
    }
    else {
        $fmt   := "    %n %,\n";
        $name  := $pirop;
    }

    my $subpir  := pir::find_caller_lex__PS('$SUBPIR');
    my $subline := pir::find_caller_lex__PS('$SUBLINE');
    my $line    := pir::find_caller_lex__PS('$LINE');

    if $subline != $line {
        $subpir.append_format(".annotate 'line', %0\n", ~$line);
        pir::assign__vPP($subline, $line);
    }

    $subpir.append_format($fmt, |@arglist, :r($result), :n($name), :i($invocant), :t($result));
}


=item pir(POST::Label node)
Generate a label.

multi method pir(POST::Label $node) {
    my $subpir := pir::find_caller_lex__PS('$SUBPIR');
    $subpir.append_format("  %0:\n", $node.result());
}


=item pir(POST::Sub node)
Generate PIR for C<node>, storing the result into the compiler's
C<$!code> attribute and returning any code needed to look up
the sub.

multi method pir(POST::Sub $node) {
    Q:PIR {
    .local pmc node
    find_lex node, '$node'

    .local pmc subpir, subline, innerpir
    subpir = new 'StringBuilder'
    .lex '$SUBPIR', subpir
    subline = box -1
    .lex '$SUBLINE', subline
    innerpir = new 'StringBuilder'
    .lex '$CODE', innerpir

    .local string name, pirflags
    name = node.'name'()
    pirflags = node.'pirflags'()

  pirflags_subid:
    $I0 = index pirflags, ':subid('
    if $I0 >= 0 goto pirflags_subid_done
    .local string subid
    subid = node.'subid'()
    pirflags = concat pirflags, ' :subid("'
    pirflags .= subid
    pirflags .= '")'
  pirflags_subid_done:

  pirflags_method:
    $I0 = index pirflags, ':method'
    if $I0 >= 0 goto pirflags_method_done
    $S0 = node.'blocktype'()
    if $S0 != 'method' goto pirflags_method_done
    pirflags = concat pirflags, ' :method'
  pirflags_method_done:

    .local pmc outerpost, outername
    outername = new 'Undef'
    outerpost = node.'outer'()
    if null outerpost goto pirflags_done
    unless outerpost goto pirflags_done
    outername = outerpost.'subid'()
    $S0 = self.'escape'(outername)
    pirflags = concat pirflags, ' :outer('
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  pirflags_done:

    .local pmc outerhll, hll
    outerhll = get_global '$?HLL'
    hll = node.'hll'()
    if hll goto have_hll
    hll = outerhll
  have_hll:
    set_global '$?HLL', hll

    .local pmc outerns, ns, nskey
    outerns = get_global '$?NAMESPACE'
    ns = outerns
    $P0 = node.'namespace'()
    unless $P0 goto have_ns
    ns = $P0
  have_ns:
    set_global '$?NAMESPACE', ns
    nskey = self.'key_pir'(ns)

    .local pmc multi
    multi = node.'multi'()
    unless multi goto no_multi

    .local pmc parts, m_iter
    parts  = new ['ResizableStringArray']
    m_iter = iter multi
  multi_iter:
    unless m_iter goto multi_iter_done
    $P0 = shift m_iter
    $S0 = $P0
    if $S0 == "_" goto push_part
    $S0 = self.'key_pir'($P0)
  push_part:
    push parts, $S0
    goto multi_iter

  multi_iter_done:
    pirflags = concat pirflags, ' :multi('
    $S0 = join ',', parts
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  no_multi:

  subpir_start:
    $P0 = node['loadinit']
    if null $P0 goto loadinit_done
    self.'pir'($P0)
  loadinit_done:

    $P0 = node.'compiler'()
    unless $P0 goto subpir_post
  subpir_compiler:
    $P0 = node.'compiler_args'()
    if $P0 goto have_compiler_args
    $P0 = new 'Hash'
  have_compiler_args:
    $P0 = self.'hll_pir'(node, 'name'=>name, 'namespace'=>ns, 'pirflags'=>pirflags, $P0 :named :flat)
    subpir .= $P0
    goto subpir_done

  subpir_post:
    unless hll goto subpir_loadlibs
    $P0 = self.'escape'(hll)
    subpir.'append_format'("\n.HLL %%0\n", $P0)
  subpir_loadlibs:
    $P0 = node.'loadlibs'()
    if null $P0 goto subpir_ns
    unless $P0 goto subpir_ns
    $P1 = iter $P0
  subpir_loadlibs_loop:
    unless $P1 goto subpir_ns
    $P2 = shift $P1
    $P2 = self.'escape'($P2)
    subpir.'append_format'("\n.loadlib %%0\n", $P2)
    goto subpir_loadlibs_loop
  subpir_ns:
    subpir.'append_format'("\n.namespace %%0\n", nskey)
  subpir_directives:
    $S0 = node['directives']
    unless $S0 goto subpir_decl
    subpir.'append_format'("%%0", $S0)
  subpir_decl:
    $S0 = self.'escape'(name)
    subpir.'append_format'(".sub %%0 %%1\n", $S0, pirflags)
    .local pmc paramlist
    paramlist = node['paramlist']
    if null paramlist goto paramlist_done
    .local pmc it
    it = iter paramlist
  param_loop:
    unless it goto paramlist_done
    $P0 = shift it
    if null $P0 goto param_loop
    subpir .= $P0
    goto param_loop
  paramlist_done:

    ## Add a file annotation
    .local pmc files
    files = find_caller_lex '$?FILES'
    if null files goto no_files
    unless files goto no_files
    $S0 = self.'escape'(files)
    # %% needed in Q:PIR so that it doesn't get eaten by StringBuilder
    subpir.'append_format'(".annotate 'file', %%0\n", $S0)
  no_files:

    self.'pir_children'(node)
    subpir.'append_format'(".end\n\n")

  subpir_done:
    .local pmc outerpir
    outerpir = find_caller_lex '$CODE'
    outerpir .= subpir
    outerpir .= innerpir

    set_global '$?NAMESPACE', outerns
    set_global '$?HLL', outerhll
    }
}

method hll_pir($node, *%options) {
    %options<target> := 'pir';
    %options<subid>  := $node.subid;

    my $source   := $node[0];
    my $compiler := pir::compreg__PS($node.compiler);
    pir::isa($compiler, 'Sub')
        ?? $compiler($source, |%options)
        !! $compiler.compile($source, |%options);
}


INIT {
    #pir::load_bytecode('nqp-setting.pbc');
}

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
