INIT { pir::load_bytecode('PCT/HLLCompiler.pbc'); }
class PAST::Compiler is PCT::HLLCompiler;

=NAME PAST::Compiler - PAST Compiler

=begin DESCRIPTION
PAST::Compiler implements a basic compiler for PAST nodes.
By default PAST::Compiler transforms a PAST tree into POST.

=head2 Signature Flags

Throughout the compiler PAST uses a number of 1-character
"flags" to indicate allowable register types and conversions.
This helps the compiler generate more efficient code and know
what sorts of conversions are allowed (or desired).  The
basic flags are:

    P,S,I,N   PMC, string, int, or num register
    Q         keyed PMC, next flag indicates type of key
    s         string register or constant
    i         int register or constant
    n         num register or constant
    r         any register result
    v         void (no result)
    *         any result type except void
    +         PMC, int register, num register, or numeric constant
    ~         PMC, string register, or string constant
    :         argument (same as '*'), possibly with :named or :flat
    0-9       use the nth input operand as the output result of this operation

These flags are used to describe signatures and desired return
types for various operations.  For example, if an opcode is
specified with a signature of C<I~P*>, then the opcode places
its result in an int register, its first child is coerced into
some sort of string value, its second child is coerced into a
PMC register, and the third and subsequent children can return
any value type.

=end DESCRIPTION

has %!symtable;

our %piropsig;
our %valflags;
our %controltypes;
our $serno;

# XXX: These are supposed to be constant
our $TEMPREG_BASE;
our $UNIQUE_BASE;


INIT {
    PAST::Compiler.language('PAST');
    PAST::Compiler.stages(<post pir evalpmc>);

    ##  %piropsig is a table of common opcode signatures
    %piropsig<add>        := 'PP+';
    %piropsig<band>       := 'PPP';
    %piropsig<bxor>       := 'PPP';
    %piropsig<bnot>       := 'PP';
    %piropsig<bor>        := 'PPP';
    %piropsig<can>        := 'IPs';
    %piropsig<chr>        := 'Si';
    %piropsig<clone>      := 'PP';
    %piropsig<concat>     := 'PP~';
    %piropsig<copy>       := '0PP';
    %piropsig<defined>    := 'IP';
    %piropsig<delete>     := 'vQ*';
    %piropsig<die>        := 'v~';
    %piropsig<div>        := 'PP+';
    %piropsig<does>       := 'IPs';
    %piropsig<downcase>   := 'Ss';
    %piropsig<elements>   := 'IP';
    %piropsig<exists>     := 'IQ*';
    %piropsig<exit>       := 'vi';
    %piropsig<fdiv>       := 'PP+';
    %piropsig<find_codepoint>   := 'Is';
    %piropsig<find_dynamic_lex> := 'Ps';
    %piropsig<find_name>  := 'Ps';
    %piropsig<getinterp>  := 'P';
    %piropsig<getprop>    := 'P~P';
    %piropsig<getstderr>  := 'P';
    %piropsig<getstdin>   := 'P';
    %piropsig<getstdout>  := 'P';
    %piropsig<index>      := 'Issi';
    %piropsig<isa>        := 'IP~';
    %piropsig<isfalse>    := 'IP';
    %piropsig<isnull>     := 'IP';
    %piropsig<issame>     := 'IPP';
    %piropsig<istrue>     := 'IP';
    %piropsig<join>       := 'SsP';
    %piropsig<length>     := 'Is';
    %piropsig<load_bytecode> := 'vs';
    %piropsig<load_language> := 'vs';
    %piropsig<loadlib>    := 'P~';
    %piropsig<mod>        := 'PP+';
    %piropsig<mul>        := 'PP+';
    %piropsig<neg>        := 'PP';
    %piropsig<new>        := 'P~';
    %piropsig<newclosure> := 'PP';
    %piropsig<not>        := 'PP';
    %piropsig<ord>        := 'Isi';
    %piropsig<pop>        := 'PP';
    %piropsig<pow>        := 'NN+';
    %piropsig<print>      := 'v*';
    %piropsig<printerr>   := 'v*';
    %piropsig<push>       := '0P*';
    %piropsig<repeat>     := 'Ssi';
    %piropsig<replace>    := 'Ssiis';
    %piropsig<say>        := 'v*';
    %piropsig<set>        := 'PP';
    %piropsig<setprop>    := '0P~P';
    %piropsig<setattribute> := '0P~P';
    %piropsig<shift>      := 'PP';
    %piropsig<shl>        := 'PP+';
    %piropsig<shr>        := 'PP+';
    %piropsig<sleep>      := 'v+';
    %piropsig<splice>     := '0PPii';
    %piropsig<split>      := 'Pss';
    %piropsig<sub>        := 'PP+';
    %piropsig<substr>     := 'Ssii';
    %piropsig<titlecase>  := 'Ss';
    %piropsig<trace>      := 'vi';
    %piropsig<typeof>     := 'SP';
    %piropsig<unshift>    := '0P*';
    %piropsig<upcase>     := 'Ss';

    ##  %valflags specifies when PAST::Val nodes are allowed to
    ##  be used as a constant.  The 'e' flag indicates that the
    ##  value must be quoted+escaped in PIR code.
    %valflags<String>   := 's~*:e';
    %valflags<Integer>  := 'i+*:';
    %valflags<Float>    := 'n+*:';
    %valflags<!macro_const>     := 'i+*:c';
    %valflags<!cclass>          := 'i+*:c';
    %valflags<!except_severity> := 'i+*:c';
    %valflags<!except_types>    := 'i+*:c';
    %valflags<!iterator>        := 'i+*:c';
    %valflags<!socket>          := 'i+*:c';

    ##  %controltypes holds the list of exception types for each
    ##  type of exception handler we support
    %controltypes<CONTROL>  := '.CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO';
    %controltypes<RETURN>   := '.CONTROL_RETURN';
    %controltypes<OK>       := '.CONTROL_OK';
    %controltypes<BREAK>    := '.CONTROL_BREAK';
    %controltypes<CONTINUE> := '.CONTROL_CONTINUE';
    %controltypes<ERROR>    := '.CONTROL_ERROR';
    %controltypes<GATHER>   := '.CONTROL_TAKE';
    %controltypes<LEAVE>    := '.CONTROL_LEAVE';
    %controltypes<EXIT>     := '.CONTROL_EXIT';
    %controltypes<NEXT>     := '.CONTROL_NEXT';
    %controltypes<LAST>     := '.CONTROL_LAST';
    %controltypes<REDO>     := '.CONTROL_REDO';

    # TEMPREG_BASE and UNIQUE_BASE identify the base location for
    # the temporary register set and unique registers
    # XXX: These are supposed to be constants.
    $TEMPREG_BASE := 100;
    $UNIQUE_BASE  := 1000;

    # XXX: clone protects the "constant" from the var incrementing
    $serno := pir::clone($UNIQUE_BASE);
}

=head2 Compiler methods

=item to_post(node [, 'option'=>option, ...])
Compile the abstract syntax tree given by C<past> into POST.

our @?BLOCK;

method to_post($past, *%options) {
    %!symtable := {};

    unless pir::defined(@?BLOCK) {
        @?BLOCK := [];
    }

    my @*BLOCKPAST := @?BLOCK;
    my $*SUB;
    my %tempregs := pir::find_dynamic_lex('%*TEMPREGS');

    {
        my %*TEMPREGS;
        if pir::defined(%tempregs) {
            %*TEMPREGS := %tempregs;
        }
        else {
            %*TEMPREGS := self.tempreg_frame();
        }

        self.as_post($past, rtype => 'v');
    }
}

=item escape(str)
Return C<str> as a PIR constant string.

method escape($str) {
    my $estr := pir::escape__SS($str);
    if pir::index($estr, '\x') >= 0 || pir::index($estr, '\u') > 0 {
        $estr := 'unicode:"' ~ $estr;
    }
    else {
        $estr := '"' ~ $estr;
    }
    $estr := $estr ~ '"';
}

=item unique([STR fmt])
Generate a unique number that can be used as an identifier.
If C<fmt> is provided, then it will be used as a prefix to the
unique number.

method unique($fmt?) {
    $fmt := '' unless pir::defined($fmt);
    $fmt := $fmt ~ $serno++;
}

=item uniquereg(rtype)
Generate a unique register based on C<rtype>, where C<rtype>
is one of the signature flags described above.

method uniquereg($rtype) {
    self.panic('rtype not set') unless $rtype;

    return '' if $rtype eq 'v';

    my $i := pir::index('Ss~Nn+Ii', $rtype);
    $rtype := 'P';
    $rtype := pir::substr('SSSNNNII', $i, 1) unless $i < 0;
    $rtype := '$' ~ $rtype ;

    self.unique($rtype);
}

=item tempreg_frame()
Create a new temporary register frame, using register
identifiers TEMPREG_BASE up to UNIQUE_BASE.

method tempreg_frame() {
    my %tempregs;
    # pir::clone protects the "constant" from getting incremented
    %tempregs<I> := pir::clone($TEMPREG_BASE);
    %tempregs<N> := pir::clone($TEMPREG_BASE);
    %tempregs<S> := pir::clone($TEMPREG_BASE);
    %tempregs<P> := pir::clone($TEMPREG_BASE);

    %tempregs;
}

=begin item
tempreg(rtype)

Generate a unique register by allocating from the temporary
register pool frame in %*TEMPREGS.  %*TEMPREGS is a hash that
has the next register identifier to be used for I, N, S, and
P registers.  It also contains the names of any registers
that have been "reserved" in the current frame (e.g. because
they hold the return value from a PAST::Stmt node).

If there are no temporary registers available, allocate and
return a permanent one instead (similar to C<uniquereg> above).
=end item

method tempreg($rtype) {
    self.panic('rtype not set') unless $rtype;

    return '' if $rtype eq 'v';

    my $I0 := pir::index('Ss~Nn+Ii', $rtype);
    $rtype := 'P';
    $rtype := pir::substr('SSSNNNII', $I0, 1) unless $I0 < 0;

    # if we don't have a temporary register pool, just make a unique one
    return self.unique('$' ~ $rtype) unless %*TEMPREGS;

    my $reg;
    my $rnum := %*TEMPREGS{$rtype};
    repeat while %*TEMPREGS{$reg} {
        # if we've run out of temporary registers, just make a unique one
        return self.unique('$' ~ $rtype) if $rnum >= $UNIQUE_BASE;

        my $S0 := ~$rnum;
        $rnum++;
        %*TEMPREGS{$rtype} := $rnum;
        $reg := '$' ~ $rtype ~ $S0;
    }

    $reg;
}

=item coerce(post, rtype)
Return a POST tree that coerces the result of C<post> to have a
return value compatible with C<rtype>.  C<rtype> can also be
a specific register, in which case the result of C<post> is
forced into that register (with conversions as needed).

method coerce($post, $rtype) {
    Q:PIR {
        .local pmc post
        post = find_lex '$post'
        .local pmc prtype
        .local string rtype
        prtype = find_lex '$rtype'
        rtype = prtype

        unless rtype goto err_nortype

        .local string pmctype, result, rrtype
        null pmctype
        null result

        ##  if rtype is a register, then set result and use the register
        ##  type as rtype
        $S0 = substr rtype, 0, 1
        unless $S0 == '$' goto have_rtype
        result = rtype
        rtype = substr result, 1, 1
      have_rtype:

        ##  these rtypes allow any return value, so no coercion needed.
        $I0 = index 'v*:', rtype
        if $I0 >= 0 goto end

        ##  figure out what type of result we already have
        .local string source
        source = post.'result'()
        $S0 = substr source, 0, 1
        if $S0 == '$' goto source_reg
        if $S0 == '"' goto source_str
        if $S0 == '.' goto source_int_num_or_const
        if $S0 == '-' goto source_int_or_num
        $I0 = is_cclass 8, source, 0 # 8 = CCLASS_NUMERIC
        if $I0 goto source_int_or_num
        $S0 = substr source, 0, 8
        if $S0 == 'unicode:' goto source_str
        ##  assume that whatever is left acts like a PMC
        goto source_pmc

      source_reg:
        ##  source is some sort of register
        ##  if a register is all we need, we're done
        if rtype == 'r' goto end
        $S0 = substr source, 1, 1
        ##  if we have the correct register type already, we're done
        if $S0 != rtype goto source_reg_1
        unless result goto end
        goto coerce_reg
      source_reg_1:
        $S0 = downcase $S0
        if $S0 == rtype goto end
        ##  figure it out based on the register type
        if $S0 == 's' goto source_str
        if rtype == '+' goto end
        if $S0 == 'i' goto source_int
        if $S0 == 'n' goto source_num
      source_pmc:
        $I0 = index 'SINsin', rtype
        if $I0 < 0 goto end
        goto coerce_reg

      source_str:
        if rtype == '~' goto end
        if rtype == 's' goto end
        rrtype = 'S'
        pmctype = "'String'"
        goto coerce_reg

      source_int_num_or_const:
        $I0 = is_cclass 4, source, 1 # 4 = CCLASS_ALPHABETIC
        unless $I0 goto source_int_or_num
        $I0 = index 'ins+~', rtype
        if $I0 >= 0 goto end
        rrtype = 'P'
        goto coerce_reg

      source_int_or_num:
        if rtype == '+' goto end
        ##  existence of an 'e' or '.' implies num
        $I0 = index source, '.'
        if $I0 >= 0 goto source_num
        $I0 = index source, 'E'
        if $I0 >= 0 goto source_num

      source_int:
        if rtype == 'i' goto end
        rrtype = 'I'
        pmctype = "'Integer'"
        goto coerce_reg

      source_num:
        if rtype == 'n' goto end
        rrtype = 'N'
        pmctype = "'Float'"

      coerce_reg:
        ##  okay, we know we have to do a coercion.
        ##  If we just need the value in a register (rtype == 'r'),
        ##  then create result based on the preferred register type (rrtype).
        if rtype != 'r' goto coerce_reg_1
        result = self.'tempreg'(rrtype)
      coerce_reg_1:
        ##  if we haven't set the result target yet, then generate one
        ##  based on rtype.  (The case of rtype == 'r' was handled above.)
        if result goto coerce_reg_2
        result = self.'tempreg'(rtype)
      coerce_reg_2:
        ##  create a new ops node to hold the coercion, put C<post> in it.
        $P0 = get_hll_global ['POST'], 'Ops'
        post = $P0.'new'(post, 'result'=>result)
        ##  if we need a new pmc (rtype == 'P' && pmctype defined), create it
        if rtype != 'P' goto have_result
        unless pmctype goto have_result
        post.'push_pirop'('new', result, pmctype)
      have_result:
        ##  store the value into the target register
        post.'push_pirop'('set', result, source)

      end:
        .return (post)

      err_nortype:
        self.'panic'('rtype not set')
    }
}


=item post_children(node [, 'signature'=>signature] )
Return the POST representation of evaluating all of C<node>'s
children in sequence.  The C<signature> option is a string of
flags as described in "Signature Flags" above.  Since we're
just evaluating children nodes, the first character of
C<signature> (return value type) is ignored.  Thus a C<signature>
of C<v~P*> says that the first child needs to be something
in string context, the second child should be a PMC, and the
third and subsequent children can be any value they wish.

method post_children($node, *%options) {
    my $ops := POST::Ops.new(:node($node));

    my $pushop := $node.childorder() eq 'right' ?? 'unshift' !! 'push';

    ## get any conversion types
    my $signature := %options<signature> || '**';
    my $sigmax := pir::length($signature) - 1;

    ##  if the signature contains a ':', then we're doing
    ##  flagged arguments (:flat, :named) '
    my @posargs;
    my @namedargs;

    my $sigidx := 1;
    my $rtype  := pir::substr($signature, $sigidx, 1);
    my $iter   := $node.iterator();
    while $iter {
        if $rtype ne 'Q' {
            my $cpast  := pir::shift($iter);
            my $cpost  := self.as_post($cpast, :rtype($rtype));
            $cpost     := self.coerce($cpost, $rtype);

            if $cpast ~~ PAST::Node {
                my $isflat := $cpast.flat();
                my $npast  := $cpast.named();
                my $npost;
                if $rtype eq ':' && $npast {
                    my $S0 := ~$cpost;
                    if $isflat {
                        $S0 := "$S0 :named :flat";
                    }
                    else {
                        $npost := self.as_post($npast, :rtype<~>);
                        $cpost := $ops.new($cpost);
                        $cpost.push($npost);
                        my $S1 := ~$npost;
                        $S0 := "$S0 :named($S1)";
                    }
                    $ops."$pushop"($cpost);
                    @namedargs.push($S0);
                }
                else {
                    if $isflat {
                        $ops."$pushop"($cpost);
                        @posargs.push(~$cpost ~ " :flat");
                    }
                    else {
                        $ops."$pushop"($cpost);
                        @posargs.push($cpost);
                    }
                }
            }
            else {
                $ops."$pushop"($cpost);
                @posargs.push($cpost);
            }
        }
        else {
            # rtype is 'Q', so construct a keyed pmc argument
            # first, get the base PMC
            my $cpast := pir::shift($iter);
            my $cpost := self.as_post($cpast, :rtype<P>);
            $cpost := self.coerce($cpost, 'P');
            # now process the key arg
            if $iter {
                my $kpast := pir::shift($iter);
                $sigidx++;
                $rtype := pir::substr($signature, $sigidx, 1);
                my $kpost := self.as_post($kpast, :rtype($rtype));
                $kpost := self.coerce($kpost, $rtype);
                # now construct the keyed PMC
                my $S0 := ~$cpost ~ '[' ~ ~$kpost ~ ']';
                $kpost := $ops.new($kpost);
                $kpost.push($cpost);
                $ops."$pushop"($kpost);
                @posargs.push($S0);
            }
        }
        if $sigidx < $sigmax {
            $sigidx++;
            $rtype := pir::substr($signature, $sigidx, 1);
        }
    }

    Q:PIR {
        .local pmc ops, posargs, namedargs
        ops = find_lex '$ops'
        posargs = find_lex '@posargs'
        namedargs = find_lex '@namedargs'

        .return (ops, posargs, namedargs)
    }
}

=head2 Methods on C<PAST::Node> arguments
The methods below are used to transform PAST nodes into their
POST equivalents.

=head3 Defaults

=item as_post(node) (General)
Return a POST representation of C<node>.  Note that C<post> is
a multimethod based on the type of its first argument, this is
the method that is called when no other methods match.

=item as_post(Any)
This is the "fallback" method for any unrecognized node types.
We use this to throw a more useful exception in case any non-PAST
nodes make it into the tree.

multi method as_post($node, *%options) {
    my $what;

    if pir::isnull($node) {
        $what := 'a null node';
    }
    else {
        $what := 'node of type ' ~ pir::typeof($node);
    }

    self.panic("PAST::Compiler can't compile " ~ $what);
}

=item as_post(Undef)
Return an empty POST node that can be used to hold a (PMC) result.

multi method as_post(Undef $node, *%options) {
    POST::Ops.new(result => self.tempreg('P'));
}


=item as_post(Integer)
=item as_post(Float)
=item as_post(String)
Handle Integer, Float, and String nodes in the PAST tree, by
generating a constant or an appropriate register setting.

multi method as_post(Integer $node, *%options) {
    self.coerce(POST::Ops.new(result => $node), %options<rtype>);
}

multi method as_post(Float $node, *%options) {
    self.coerce(POST::Ops.new(result => $node), %options<rtype>);
}

multi method as_post(String $node, *%options) {
    my $value := self.escape($node);
    self.coerce(POST::Ops.new(result => $value), %options<rtype>);
}


=item as_vivipost(String class)
Generate POST to create a new object of type C<class>.  This
is typically invoked by the various vivification methods below
(e.g., in a PAST::Var node to default a variable to a given type).

multi method as_vivipost(String $node, *%options) {
    my $result := self.tempreg('P');
    my $s := self.escape($node);
    POST::Op.new($result, $s, pirop => 'new', result => $result);
}

=item as_vivipost(PAST::Node node)

multi method as_vivipost($node, *%options) {
    self.as_post($node, |%options);
}

=begin item
as_post(PAST::Node node)

Return the POST representation of executing C<node>'s children in
sequence.  The result of the final child is used as the result
of this node.

N.B.:  This method is also the one that is invoked for converting
nodes of type C<PAST::Stmts>.

=end item

multi method as_post(PAST::Node $node, *%options) {
    self.node_as_post($node, %options);
}

# Origionally used via :subid('Node.as_post');
method node_as_post($node, %options) {
    my $rtype := %options<rtype>;

    my $signature := pir::repeat('v', +$node.list());
    $signature := $signature ~ $rtype;

    my $ops := self.post_children($node, signature => $signature);
    $ops.result($ops[-1]);

    my $eh := $node.handlers();
    $ops := self.wrap_handlers($ops, $eh, rtype => $rtype) if $eh;

    $ops;
}

=head3 C<PAST::Stmt>

=item as_post(PAST::Stmt node)
Return the POST representation of a C<PAST::Stmt>.  This is
essentially the same as for C<PAST::Node> above, but also
defines the boundaries of temporary register allocations.

multi method as_post(PAST::Stmt $node, *%options) {
    my %outerregs := %*TEMPREGS;
    my $post;

    {
        my %*TEMPREGS;
        %*TEMPREGS := pir::clone(%outerregs) if %outerregs;
        $post := self.node_as_post($node, %options);
    }

    my $result := $post.result();
    if %outerregs
        && %options<rtype> ne 'v'
        && pir::substr($result, 0, 1) eq '$'
    {
        %outerregs{$result} := 1
    }

    $post;
}


=head3 C<PAST::Control>

=item as_post(PAST::Control node)
Return the POST representation of a C<PAST::Control>.

multi method as_post(PAST::Control $node, *%options) {
    # Probably not safe to use tempregs in an exception handler
    my %*TEMPREGS;

    my  $ishandled := POST::Label.new(result=>self.unique(   'handled_'));
    my $nothandled := POST::Label.new(result=>self.unique('nothandled_'));

    my $ops := POST::Ops.new(node=>$node);

    my $signature := pir::repeat('v', +$node.list());
    $signature := $signature ~ %options<rtype>;

    $ops.push_pirop('.local pmc exception');
    $ops.push_pirop('.get_results (exception)');
    my $children := self.post_children($node, signature => $signature);
    $ops.push($children);
    my $handled := self.uniquereg('I');

    $ops.push_pirop('set', $handled, 'exception["handled"]');
    $ops.push_pirop('ne',  $handled, 1, $nothandled);
    $ops.push($ishandled);
    $ops.push_pirop('return', 'exception');
    $ops.push($nothandled);
    $ops.push_pirop('rethrow', 'exception');
    $ops;
}

method wrap_handlers($child, $ehs, *%options) {
    my $rtype := %options<rtype>;

    # Probably not safe to use tempregs in an exception handler
    my %*TEMPREGS;

    my $ops  := POST::Ops.new();
    my $pops := POST::Ops.new();
    my $tail := POST::Ops.new();
    my $skip := POST::Label.new(result => self.unique('skip_handler_'));

    for $ehs {
        my $node := $_;
        my $label   := POST::Label.new(result=>self.unique('control_'));
        my $ehreg   := self.uniquereg('P');

        $ops.push_pirop('new', $ehreg, "'ExceptionHandler'");
        $ops.push_pirop('set_label', $ehreg, $label);

        my $type := $node.handle_types();
        if $type && ($type := %controltypes{$type}) {
            my @types := pir::split(',', $type);
            $ops.push_pirop('callmethod', '"handle_types"', $ehreg, |@types);
            $*SUB.add_directive('.include "except_types.pasm"');
        }

        $type := $node.handle_types_except();
        if $type && ($type := %controltypes{$type}) {
            my @types := pir::split(',', $type);
            $ops.push_pirop('callmethod', '"handle_types_except"',
                $ehreg, |@types);
            $*SUB.add_directive('.include "except_types.pasm"');
        }

        $ops.push_pirop('push_eh', $ehreg);

        # Add one pop_eh for every handler we push_eh
        $pops.push_pirop('pop_eh');

        # Push the handler itself
        $tail.push($label);
        $tail.push(self.as_post($node, rtype => $rtype));
    }

    $ops.push($child);

    $ops.push($pops);
    $ops.push_pirop('goto', $skip);
    $ops.push($tail);
    $ops.push($skip);

    $ops;
}

=head3 C<PAST::Block>

=item as_post(PAST::Block node)
Return the POST representation of a C<PAST::Block>.

multi method as_post(PAST::Block $node, *%options) {
    ##  add current block node to @*BLOCKPAST
    pir::unshift(@*BLOCKPAST, $node);

    my $name      := $node.name();
    my $pirflags  := $node.pirflags();
    my $blocktype := $node.blocktype();
    my $nsentry   := $node.nsentry();
    my $subid     := $node.subid();
    my $ns        := $node.namespace();
    my $hll       := $node.hll();
    my $multi     := $node.multi();
    my $loadlibs  := $node.loadlibs();

    # We want '' or null, not undef
    $name      := '' unless pir::defined($name);
    $pirflags  := '' unless pir::defined($pirflags);
    $blocktype := '' unless pir::defined($blocktype);

    ##  handle nsentry attribute
    if pir::defined($nsentry) {
        if $nsentry {
            $pirflags := $pirflags
                ~ ' :nsentry(' ~ self.escape($nsentry) ~ ')';
        }
        else {
            $pirflags := $pirflags ~ ' :anon';
        }
    }

    ##  handle anonymous blocks
    unless $name {
        $name := self.unique('_block');
        $pirflags := $pirflags ~ ' :anon' unless $ns || $nsentry;
    }

    ##  create a POST::Sub node for this block
    my $bpost := POST::Sub.new(
        :node($node),    :name($name), :blocktype($blocktype),
        :namespace($ns), :hll($hll),   :subid($subid),
        :multi($multi),  :loadlibs($loadlibs)
    );
    $bpost.pirflags($pirflags) if $pirflags;

    ##  pir-encode name and namespace
    my $blockreg := self.uniquereg('P');
    my $blockref := ".const 'Sub' $blockreg = " ~ self.escape($bpost.subid());

    ##  determine the outer POST::Sub for the new one
    # It would be easier to use $*CALLER::SUB and skip the big block below,
    # but that doesn't work in NQP, so a big block is what we get.
    my $outerpost := $*SUB;
    {
        my $*SUB := $bpost;

        my $islexical := $node.lexical();
        if $islexical {
            $bpost.outer($outerpost);

            ##  add block setup code (cpost) to outer block if needed
            if pir::defined($outerpost) {
                my $cpost := POST::Ops.new(:result($blockreg));
                $cpost.push_pirop($blockref);
                $cpost.push_pirop('capture_lex', $blockreg);
                $outerpost.unshift($cpost);
            }
        }

        ##  merge the node's symtable with the master
        my %outersym := %!symtable;
        my %symtable := %outersym;
        ##  if the Block doesn't have a symtable, re-use the existing one
        if $node.symtable() {
            ##  if the Block has a default ('') entry, use the Block's
            ##  symtable as-is
            %symtable := $node.symtable();
            unless pir::defined(%symtable<>) {
                ##  merge the Block's symtable with outersym
                %symtable := shallow_clone_hash(%symtable);
                for %outersym {
                    next if pir::exists(%symtable, $_);
                    %symtable{$_} := %outersym{$_};
                }
            }
        }
        %!symtable := %symtable;

        # For tempregs flag
        my %outerregs := %*TEMPREGS;

        my $compiler := $node.compiler();
        if $compiler {
            ##  set the compiler to use for the POST::Sub node, pass on
            ##  and compiler arguments and add this block's child to it.
            $bpost.compiler($compiler);
            $bpost.compiler_args($node.compiler_args());
            $bpost.push($node[0]);
        }
        else {
            # if tempregs flag is set, then create a new bank
            # of temporary registers
            my %*TEMPREGS;
            if $node.tempregs() {
                %*TEMPREGS := self.tempreg_frame();
            }
            else {
                %*TEMPREGS := %outerregs;
            }

            ##  control exception handler
            my $ctrlpast := $node.control();
            my $ctrllabel;

            if $ctrlpast {
                $ctrllabel := POST::Label.new(:result(self.unique('control_')));
                my $reg := self.uniquereg('P');
                $bpost.push_pirop('new', $reg, "['ExceptionHandler']",
                    '.CONTROL_RETURN');
                $bpost.push_pirop('set_label', $reg, $ctrllabel);
                $bpost.push_pirop('push_eh', $reg);
                $bpost.add_directive('.include "except_types.pasm"');
            }

            ##  all children but last are void context, last returns anything
            my $sig := pir::repeat('v', pir::elements($node.list())) ~ '*';
            ##  convert children to post
            my $ops := self.post_children($node, :signature($sig));
            ##  result of last child is return from block
            my $retval := $ops[-1];
            ##  wrap the child with appropriate exception handlers, if any
            my $eh := $node.handlers();
            if $eh {
                $ops := self.wrap_handlers($ops, $eh, :rtype(%options<rtype>));
            }
            $bpost.push($ops);
            if +@($ops) > 0 {
                ## Don't bother adding an explicit return for an empty block
                $bpost.push_pirop('return', $retval);
            }

            if $ctrlpast {
                $bpost.push($ctrllabel);
                $bpost.push_pirop('.local pmc exception');
                $bpost.push_pirop('.get_results (exception)');
                if $ctrlpast eq 'return_pir' {
                    ##  handle 'return' exceptions
                    my $reg := self.tempreg('P');
                    $bpost.push_pirop('getattribute', $reg,
                        'exception', '"payload"');
                    $bpost.push_pirop('return', $reg);
                }
                elsif $ctrlpast.isa(PAST::Node) {
                    $bpost.push(self.as_post($ctrlpast, :rtype('*')));
                }
                else {
                    self.panic("Unrecognized control handler '$ctrlpast'");
                }
            }
        }

        ##  generate any loadinit code for the sub
        if pir::exists($node, 'loadinit') {
            my $lisub := POST::Sub.new(:outer($bpost), :pirflags(':load :init'));
            $lisub.push_pirop($blockref);
            $lisub.push_pirop('.local pmc', 'block');
            $lisub.push_pirop('set', 'block', $blockreg);
            $lisub.push(self.as_post($node.loadinit(), :rtype('v')));
            $bpost<loadinit> := $lisub;
        }

        ##  restore previous outer scope and symtable
        %!symtable := %outersym;

        ##  return block or block result
        my $rtype := %options<rtype>;

        if $blocktype eq 'immediate' {
            my @arglist := %options<arglist>;
            @arglist := [] unless pir::defined(@arglist);
            my $result := self.tempreg($rtype);
            $bpost := POST::Ops.new($bpost, :node($node), :result($result));
            $bpost.push_pirop($blockref);
            $bpost.push_pirop('capture_lex', $blockreg) if $islexical;
            $bpost.push_pirop('call', $blockreg, |@arglist, :result($result));
        }
        elsif $rtype ne 'v' {
            $bpost := POST::Ops.new($bpost, :node($node), :result($blockreg));
            $bpost.push_pirop($blockref, :result($blockreg));
            if $islexical {
                if $node.closure() {
                    ##  return a reference to a clone of the block with
                    ##  captured outer context
                    my $result := self.uniquereg('P');
                    $bpost.push_pirop('newclosure', $result, $blockreg);
                    $bpost.result($result);
                }
                else {
                    $bpost.push_pirop('capture_lex', $blockreg);
                }
            }
        }
    } # Restore old $*SUB

    ##  remove current block from @*BLOCKPAST
    pir::shift(@*BLOCKPAST);
    $bpost;
}

sub shallow_clone_hash(%to_clone) {
    my %ret;
    for %to_clone {
        %ret{$_} := %to_clone{$_};
    }

    %ret;
}


=head3 C<PAST::Op>

=item as_post(PAST::Op node)
Return the POST representation of a C<PAST::Op> node.  Normally
this is handled by redispatching to a method corresponding to
the node's "pasttype" attribute.

multi method as_post(PAST::Op $node, *%options) {
    ## see if we set first child's lvalue
    my $lvalue := $node.lvalue();
    my $child := $node[0];
    if $lvalue && pir::defined($child) && !pir::exists($child, 'lvalue') {
        $child.lvalue($lvalue);
    }

    my $pasttype := $node.pasttype();
    if $pasttype {
        return self."$pasttype"($node, |%options);
    }

    my $pirop := $node.pirop();
    if $pirop {
        return self.pirop($node, |%options);
    }

    my $inline := $node.inline();
    if $inline {
        return self.inline($node, |%options);
    }

    self.call($node, |%options);
}


=item pirop(PAST::Op node)
Return the POST representation of a C<PAST::Op> node with
a 'pasttype' of 'pirop'.

multi method pirop(PAST::Op $node, *%options) {
    my $pirop := $node.pirop();
    my $signature;
    my $I0;
    if ($I0 := pir::index($pirop, ' ')) >= 0 {
        ##  pirop is of form "pirop signature"
        $signature := pir::substr($pirop, $I0 + 1);
        $pirop := pir::substr($pirop, 0, $I0);
    }
    elsif ($I0 := pir::index($pirop, '__')) >= 0 {
        ##  pirop is of form "pirop__signature"
        $signature := pir::substr($pirop, $I0 + 2);
        $pirop := pir::substr($pirop, 0, $I0);
    }
    else {
        $signature := %piropsig{$pirop};
        $signature := 'vP' unless $signature;
    }

    my $ops;
    my @posargs;
    # ($ops, @posargs) := self.post_children($node, :signature($signature));
    Q:PIR {
        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    };

    my @arglist := $ops.list();

    my $S0 := pir::substr($signature, 0, 1);
    if $S0 eq 'v' {
        $ops.push_pirop($pirop, |@posargs);
        return $ops;
    }
    $I0 := pir::index('0123456789', $S0);
    if $I0 >= 0 {
        $ops.result(@arglist[$I0]);
        $ops.push_pirop($pirop, |@posargs);
        return $ops;
    }
    my $result := self.tempreg($S0);
    $ops.result($result);
    $ops.push_pirop($pirop, $result, |@posargs);
    return $ops;
}


=item call(PAST::Op node)
Return the POST representation of a C<PAST::Op> node
for calling a sub.

multi method call(PAST::Op $node, *%options) {
    my $pasttype := $node.pasttype();
    $pasttype := 'call' unless $pasttype;

    my $signature := 'v:';
    ## for callmethod, the invocant (child) must be a PMC
    $signature := 'vP:' if $pasttype eq 'callmethod';

    my $name := $node.name();
    my $ops;
    my @posargs;
    my %namedargs;
    ##  our first child is the thing to be invoked, so make sure it's a PMC
    $signature := pir::replace($signature, 1, 0, 'P') unless $name;
    # ($ops, @posargs, %namedargs) := self.'post_children'($node, :signature($signature));
    Q:PIR {
        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%%namedargs', $P2
    };
    if $name {
        if pir::isa($name, 'P6object') && $name.isa(PAST::Node) {
            my $name_post := self.as_post($name, :rtype('s'));
            $name_post := self.coerce($name_post, 's');
            $ops.push($name_post);
            pir::unshift(@posargs, $name_post);
        }
        else {
            pir::unshift(@posargs, self.escape($name));
        }
    }

    ##  generate the call itself
    my $rtype := %options<rtype>;
    my $result := self.tempreg($rtype);
    $ops.push_pirop($pasttype, |@posargs, |%namedargs, :result($result));
    $ops.result($result);
    $ops;
}


=item callmethod(PAST::Op node)
Return the POST representation of a C<PAST::Op> node
to invoke a method on a PMC.

multi method callmethod(PAST::Op $node, *%options) {
    self.call($node, |%options);
}


=item if(PAST::Op node)
=item unless(PAST::Op node)
Return the POST representation of C<PAST::Op> nodes with
a 'pasttype' of if/unless.

multi method if(PAST::Op $node, *%options) {
    my $ops := POST::Ops.new(:node($node));

    my $rtype := %options<rtype>;
    my $result := self.tempreg($rtype);
    $ops.result($result);

    my $pasttype := $node.pasttype();

    my $exprpast := $node[0];
    my $thenpast := $node[1];
    my $elsepast := $node[2];

    my $S0 := self.unique($pasttype ~ '_');
    my $thenlabel := POST::Label.new(:result($S0));
    my $endlabel :=  POST::Label.new(:result($S0 ~ '_end'));

    my $exprrtype := 'r';
    $exprrtype := '*' if $rtype eq 'v';
    my $childrtype := $rtype;
    $childrtype := 'P' if pir::index('*:', $rtype) >= 0;

    my $exprpost := self.as_post($exprpast, :rtype($exprrtype));

    my $thenpost := make_childpost($thenpast);
    my $elsepost := make_childpost($elsepast);

    if pir::defined($elsepost) {
        $ops.push($exprpost);
        $ops.push_pirop($pasttype, $exprpost, $thenlabel);
        $ops.push($elsepost) if pir::defined($elsepost);
        $ops.push_pirop('goto', $endlabel);
        $ops.push($thenlabel);
        $ops.push($thenpost) if pir::defined($thenpost);
        $ops.push($endlabel);
        return $ops;
    }
    else {
        my $S0 := 'if';
        $S0 := 'unless' if $pasttype eq $S0;
        $ops.push($exprpost);
        $ops.push_pirop($S0, $exprpost, $endlabel);
        $ops.push($thenpost) if pir::defined($thenpost);
        $ops.push($endlabel);
        return $ops;
    }

    sub make_childpost($childpast?) {
        my $childpost;
        if pir::defined($childpast) {
            my @arglist := [];
            pir::push(@arglist, $exprpost) if $childpast.arity() > 0;
            $childpost := self.as_post($childpast,
                :rtype($childrtype), :arglist(@arglist));
        }
        else {
            return $childpost if $rtype eq 'v';
            $childpost := POST::Ops.new(:result($exprpost));
        }
        $childpost := self.coerce($childpost, $result) if $result;
        $childpost;
    }
}

multi method unless(PAST::Op $node, *%options) {
    self.if($node, |%options);
}


=item loop_gen(...)
Generate a standard loop with NEXT/LAST/REDO exception handling.

method loop_gen(*%options) {
    my $loopname  := self.unique('loop');
    my $testlabel := POST::Label.new(:result($loopname ~ '_test'));
    my $redolabel := POST::Label.new(:result($loopname ~ '_redo'));
    my $nextlabel := POST::Label.new(:result($loopname ~ '_next'));
    my $donelabel := POST::Label.new(:result($loopname ~ '_done'));
    my $handlabel := POST::Label.new(:result($loopname ~ '_handler'));

    my $testop    := %options<testop>;
    my $testpost  := %options<test>;
    my $prepost   := %options<pre>;
    my $bodypost  := %options<body>;
    my $nextpost  := %options<next>;
    my $bodyfirst := %options<bodyfirst>;

    $testop := 'unless' unless $testop;

    my $ops := POST::Ops.new();

    $*SUB.add_directive('.include "except_types.pasm"');

    my $handreg := self.tempreg('P');
    $ops.push_pirop('new', $handreg, "'ExceptionHandler'");
    $ops.push_pirop('set_label', $handreg, $handlabel);
    $ops.push_pirop('callmethod', '"handle_types"', $handreg,
        '.CONTROL_LOOP_NEXT', '.CONTROL_LOOP_REDO', '.CONTROL_LOOP_LAST');
    $ops.push_pirop('push_eh', $handreg);

    $ops.push_pirop('goto', $redolabel) if $bodyfirst;
    $ops.push($testlabel);
    if $testpost {
        $ops.push($testpost);
        $ops.push_pirop($testop, $testpost, $donelabel);
    }
    $ops.push($prepost) if $prepost;
    $ops.push($redolabel);
    $ops.push($bodypost) if $bodypost;
    $ops.push($nextlabel);
    $ops.push($nextpost) if $nextpost;
    $ops.push_pirop('goto', $testlabel);
    $ops.push($handlabel);
    $ops.push_pirop('.local pmc exception');
    $ops.push_pirop('.get_results (exception)');
    my $S0 := self.tempreg('P');
    $ops.push_pirop('getattribute', $S0, 'exception', "'type'");
    $ops.push_pirop('eq', $S0, '.CONTROL_LOOP_NEXT', $nextlabel);
    $ops.push_pirop('eq', $S0, '.CONTROL_LOOP_REDO', $redolabel);
    $ops.push($donelabel);
    $ops.push_pirop('pop_eh');
    $ops;
}


=item while(PAST::Op node)
=item until(PAST::Op node)
=item repeat_while(PAST::Op node)
=item repeat_until(PAST::Op node)
Return the POST representation of a C<while> or C<until> loop.

multi method while(PAST::Op $node, *%options) {
    my $exprpast := $node[0];
    my $bodypast := $node[1];
    my $nextpast := $node[2];

    my $exprpost := self.as_post($exprpast, :rtype('r'));

    my @arglist := [];
    pir::push(@arglist, $exprpost) unless $bodypast.arity() < 1;
    my $bodypost := self.as_post($bodypast, :rtype('v'), :arglist(@arglist));

    my $nextpost := null__P;
    $nextpost := self.as_post($nextpast, :rtype('v')) if $nextpast;

    my $testop    := %options<testop>;
    my $bodyfirst := %options<bodyfirst>;

    my $ops := self.loop_gen(:testop($testop), :test($exprpost),
        :body($bodypost), :bodyfirst($bodyfirst), :next($nextpost));
    $ops.result($exprpost);
    $ops.node($node);
    $ops;
}

multi method until(PAST::Op $node, *%options) {
    self.while($node, |%options, testop => 'if');
}

multi method repeat_while(PAST::Op $node, *%options) {
    self.while($node, |%options, bodyfirst => 1);
}

multi method repeat_until(PAST::Op $node, *%options) {
    self.while($node, |%options, testop => 'if', bodyfirst => 1);
}


=item for(PAST::Op node)
Return the POST representation of the C<for> loop given
by C<node>.

multi method for(PAST::Op $node, *%options) {
    my $ops      := POST::Ops.new(:node($node));
    my $prepost  := POST::Ops.new();
    my $testpost := POST::Ops.new(:result(self.tempreg('P')));

    my $collpast := $node[0];
    my $bodypast := $node[1];

    my $collpost := self.as_post($collpast, :rtype('P'));
    $ops.push($collpost);

    ##  don't try to iterate undefined values
    my $undeflabel := POST::Label.new(:name('for_undef_'));
    my $S0 := self.tempreg('I');
    $ops.push_pirop('defined', $S0, $collpost);
    $ops.push_pirop('unless', $S0, $undeflabel);

    $ops.push_pirop('iter', $testpost, $collpost);

    ##  determine the arity of the loop.  We check arity of the 'for'
    ##  node itself, and if not set we use the arity of the body.
    my $arity := 1;
    if pir::defined($node.arity()) {
        $arity := $node.arity();
    }
    elsif pir::defined($bodypast.arity()) {
        $arity := $bodypast.arity();
    }

    ##  build the argument list to pass to the body
    my @arglist := [];
    repeat while $arity > 0 {
        my $nextarg := self.tempreg('P');
        $prepost.push_pirop('shift', $nextarg, $testpost);
        last if $arity < 1;
        pir::push(@arglist, $nextarg);
        $arity--;
    }

    ##  now build the body itself
    my $bodypost := self.as_post($bodypast, :rtype('v'), :arglist(@arglist));

    ##  generate the loop and return
    $ops.push(self.loop_gen(:test($testpost), :pre($prepost),
        :body($bodypost)));
    $ops.push($undeflabel);
    $ops.result($testpost);
    $ops;
}


=item list(PAST::Op node)
Build a list from the children.  The type of list constructed
is determined by the C<returns> attribute, which defaults
to C<ResizablePMCArray> if not set.

multi method list(PAST::Op $node, *%options) {
    # my ($ops, @posargs) := self.post_children($node, :signature('v*'));
    my $ops;
    my @posargs;
    Q:PIR {
        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    };

    my $returns := $node.returns();
    $returns := 'ResizablePMCArray' unless $returns;

    my $listpost := self.as_vivipost($returns, :rtype('P'));
    $ops.result($listpost);
    $ops.push($listpost);
    $ops.push_pirop('push', $listpost, $_) for @posargs;
    $ops;
}


=item stmts(PAST::Op node)
Treat the node like a PAST::Stmts node -- i.e., invoke all the
children and return the value of the last one.

multi method stmts(PAST::Op $node, *%options) {
    self.node_as_post($node, %options);
}


=item null(PAST::Op node)
A "no-op" node -- none of the children are processed, and
no statements are generated.

=cut

multi method null(PAST::Op $node, *%options) {
    POST::Ops.new(node => $node);
}


=item return(PAST::Op node)
Generate a return exception, using the first child (if any) as
a return value.

multi method return(PAST::Op $node, *%options) {
    my $ops := POST::Ops.new(:node($node));

    my $exreg := self.tempreg('P');
    my $extype := $exreg ~ "['type']";
    $ops.push_pirop('new', $exreg, '"Exception"');
    $ops.push_pirop('set', $extype, '.CONTROL_RETURN');
    $*SUB.add_directive('.include "except_types.pasm"');

    my $cpast := $node[0];
    if $cpast {
        my $cpost := self.as_post($cpast, :rtype('P'));
        $cpost := self.coerce($cpost, 'P');
        $ops.push($cpost);
        $ops.push_pirop('setattribute', $exreg, "'payload'", $cpost);
    }
    $ops.push_pirop('throw', $exreg);
    $ops;
}


=item try(PAST::Op node)
Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of bind.  The first child
is the code to be surrounded by an exception handler,
the second child (if any) is the code to process the
handler.

multi method try(PAST::Op $node, *%options) {
    my $ops := POST::Ops.new(:node($node));

    my $S0 := self.unique('catch_');
    my $catchlabel := POST::Label.new(:result($S0));
    my $endlabel   := POST::Lable.new(:result($S0 ~ '_end'));

    my $rtype := %options<rtype>;

    my $trypost := self.as_post($node[0], :rtype($rtype));
    $ops.push_pirop('push_eh', $catchlabel);
    $ops.push($trypost);
    $ops.push_pirop('pop_eh');
    my $elsepast := $node[2];
    if $elsepast {
        $ops.push(self.as_post($elsepast, :rtype('v')));
    }
    $ops.push_pirop('goto', $endlabel);
    $ops.push($catchlabel);
    my $catchpast := $node[1];
    if $catchpast {
        $ops.push(self.as_post($catchpast, :rtype('v')));
        $ops.push_pirop('pop_eh') # FIXME: should be before catchpost
    }
    $ops.push($endlabel);
    $ops.result($trypost);
    $ops;
}


=item chain(PAST::Op node)
A short-circuiting chain of operations.  In a sequence of nodes
with pasttype 'chain', the right operand of a node serves as
the left operand of its parent.  Each node is evaluated only
once, and the first false result short-circuits the chain.
In other words,  C<<  $x < $y < $z >>  is true only if
$x < $y and $y < $z, but $y only gets evaluated once.

multi method chain(PAST::Op $node, *%options) {
    ##  first, we build up the list of nodes in the chain
    my @clist := [];
    my $cpast := $node;
    while $cpast.isa(PAST::Op) {
        my $pasttype := $cpast.pasttype();
        last if $pasttype ne 'chain';
        pir::push(@clist, $cpast);
        $cpast := $cpast[0];
    }

    my $ops := POST::Ops.new(:node($node));
    $ops.result(self.unique('$P'));
    my $endlabel := POST::Label(:name('chain_end_'));

    $cpast := pir::pop(@clist);
    my $apost := self.as_post($cpast[0], :rtype('P'));
    $ops.push($apost);

    while 1 {
        my $bpost := self.as_post($cpast[1], :rtype('P'));
        $ops.push($bpost);
        my $name := self.escape($cpast.name());
        $ops.push_pirop('call', $name, $apost, $bpost, :result($ops));
        last unless @clist;
        $ops.push_pirop('unless', $ops, $endlabel);
        $cpast := pir::pop(@clist);
        $apost := $bpost;
    }
    $ops.push($endlabel);
    $ops;
}


=item def_or(PAST::Op node)
The short-circuiting default operator (e.g., Perl 6's C<< infix:<//> >>).
Returns its first child if its defined, otherwise it evaluates and returns
the second child.  (N.B.: This particular pasttype is a candidate for
being refactored out using thunks of some sort.)

multi method def_or(PAST::Op $node, *%options) {
    my $ops := POST::Ops.new(node => $node, result => self.unique('$P'));

    my $lpost := self.as_post($node[0], rtype => 'P');
    $ops.push($lpost);
    $ops.push_pirop('set', $ops, $lpost);

    my $endlabel := POST::Label.new(result => self.unique('default_'));

    my $reg := self.unique('$I');
    $ops.push_pirop('defined', $reg, $ops);
    $ops.push_pirop('if', $reg, $endlabel);
    my $rpost := self.as_post($node[1], rtype => 'P');
    $ops.push($rpost);
    $ops.push_pirop('set', $ops, $rpost);
    $ops.push($endlabel);
    $ops;
}


=item xor(PAST::Op node)
A short-circuiting exclusive-or operation.  Each child is evaluated,
if exactly one child evaluates to true then its value is returned,
otherwise return Undef.  Short-circuits with Undef as soon as
a second child is found that evaluates as true.

multi method xor(PAST::Op $node, *%options) {
    my $ops := POST::Ops.new(:node($node));
    $ops.result(self.unique('$P'));

    my $falselabel := POST::Label.new(:name('xor_false'));
    my $endlabel   := POST::Label.new(:name('xor_end'));

    my $i := self.unique('$I');
    my $t := self.unique('$i');
    my $u := self.unique('$i');
    my $iter := node.iterator();
    my $apost := self.as_post(pir::shift($iter), :rtype('P'));
    my $bpost;
    $ops.push($apost);
    $ops.push_pirop('set', $ops, $apost);
    $ops.push_pirop('istrue', $t, $apost);
    while 1 {
        $bpost := self.as_post(pir::shift($iter), :rtype('P'));
        $ops.push($bpost);
        $ops.push_pirop('istrue', $u, $bpost);
        $ops.push_pirop('and', $i, $t, $u);
        $ops.push_pirop('if', $i, $falselabel);
        last unless $iter;
        my $truelabel := POST::Label.new(:name('xor_true'));
        $ops.push_pirop('if', $t, $truelabel);
        $ops.push_pirop('set', $ops, $bpost);
        $ops.push_pirop('set', $t, $u);
        $ops.push($truelabel);
    }
    $ops.push_pirop('if', $t, $endlabel);
    $ops.push_pirop('set', $ops, $bpost);
    $ops.push_pirop('goto', $endlabel);
    $ops.push($falselabel);
    $ops.push_pirop('new', $ops, '"Undef"');
    $ops.push($endlabel);
    $ops;
}


=item bind(PAST::Op node)
Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of bind.

multi method bind(PAST::Op $node, *%options) {
    my $lpast := $node[0];
    my $rpast := $node[1];

    my $ops := POST::Ops.new(node => $node);
    my $rpost := self.as_post($rpast, rtype => 'P');
    $rpost := self.coerce($rpost, 'P');
    $ops.push($rpost);

    $lpast.lvalue(1);
    my $lpost := self.as_post($lpast, bindpost => $rpost);
    $ops.push($lpost);
    $ops.result($lpost);
    $ops;
}


=item copy(PAST::Op node)
Implement a 'copy' assignment (at least until we get the 'copy' opcode).

multi method copy(PAST::Op $node, *%options) {
    my $rpost := self.as_post($node[1], rtype => 'P');
    my $lpost := self.as_post($node[0], rtype => 'P');
    my $ops := POST::Ops.new($rpost, $lpost,
        node => $node, result => $lpost);
    $ops.push_pirop('copy', $lpost, $rpost);
    $ops;
}


=item inline(PAST::Op node)
Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of inline.

multi method inline(PAST::Op $node, *%options) {
    # TODO: Deal with %r and %t in a more complete way

    # This method replaces %r and %t even inside strings, which
    # broke the original PIR code for this function.
    my $ops := self.post_children($node, signature => 'vP');
    my $inline := $node.inline();
    $inline := pir::join("\n", $inline) if pir::does($inline, 'array');

    my $result := '';
    my $i := pir::index($inline, '%t');
    if $i >= 0 {
        $result := self.unique('$P');
        $ops.push_pirop('new', $result, "'Undef'");
        $ops.result($result);
    }
    else {
        $i := pir::index($inline, '%r');
        if $i >= 0 {
            $result := self.unique('$P');
            $ops.result($result);
        }
    }
    my @arglist := $ops.list();
    $ops.push_pirop('inline', |@arglist, inline => $inline, result => $result);
    my $s := %options<rtype>; # XXX Copied from original? Useless?
    $ops;
}


=head3 C<PAST::Var>

=item as_post(PAST::Var node)
Return the POST representation of a C<PAST::Var>.  Generally we
redispatch to an appropriate handler based on the node's 'scope'
attribute.

multi method as_post(PAST::Var $node, *%options) {
    ##  set 'bindpost'
    my $bindpost := %options<bindpost>;
    $bindpost := pir::new('Undef') unless $bindpost;

    ## determine the node's scope.  First, check the node itself
    my $scope := $node.scope();
    my $name  := $node.name();
    unless $scope {
        ## otherwise, check the current symbol table under the variable's name
        my $P0 := %!symtable{$name};
        $scope := $P0<scope> if $P0;
        unless $scope {
            ##  see if an outer block has set a default scope
            $P0 := %!symtable<>;
            scope_error() unless $P0;
            $scope := $P0<scope>;
            scope_error() unless $scope;
        }
    }

    try {
        return self."$scope"($node, $bindpost);
        CATCH { scope_error(); }
    }

    my sub scope_error() {
        $scope := " in '$scope' scope" if $scope;
        my $blockname := '';
        for @*BLOCKPAST {
            $blockname := $_.name();
            last if $blockname;
        }
        $blockname := '<anonymous>' unless $blockname;
        # Find the source location, if available
        my $sourceline := '';
        my $source := $node<source>;
        my $pos    := $node<pos>;
        my $files  := pir::find_caller_lex__Ps('$?FILES');
        unless $source && $files {
            $sourceline := ' (' ~ $files ~ ':' ~
            (self.lineof($source, $pos) + 1) ~ ')';
        }
        self.panic("Symbol '$name' not predeclared", $scope, " in ",
            $blockname, $sourceline);
    }
}


method vivify($node, $ops, $fetchop, $storeop) {
    my $viviself := $node.viviself();
    my $vivipost := self.as_vivipost($viviself, rtype => 'P');
    my $result   := $vivipost.result();
    $result := self.tempreg('P') if $result eq '';

    $ops.result($result);
    $ops.push($fetchop);
    if $viviself {
        my $vivilabel := POST::Label.new(name => 'vivify_');
        $ops.push_pirop('unless_null', $ops, $vivilabel);
        $ops.push($vivipost);
        $ops.push($storeop) if $node.lvalue();
        $ops.push($vivilabel);
    }
    $ops;
}


multi method parameter(PAST::Var $node, $bindpost) {
    ##  determine lexical, register, and parameter names
    my $name  := $node.name();
    my $named := $node.named();
    my $pname := self.unique('param_');

    ##  returned post node
    my $ops := POST::Ops.new(:node($node), :result($pname));

    my $viviself := $node.viviself();
    if $viviself {
        ##  handle optional params
        my $vivipost  := self.as_vivipost($viviself, :rtype('P'));
        my $vivilabel := POST::Label.new(:name('optparam_'));
        $*SUB.add_param($pname, :named($named), :optional(1));
        $ops.push_pirop('if', "has_$pname", $vivilabel);
        $ops.push($vivipost);
        $ops.push_pirop('set', $ops, $vivipost);
        $ops.push($vivilabel);
    }
    else {
        $*SUB.add_param($pname, :named($named),
            :slurpy($node.slurpy()), :call_sig($node.call_sig()));
    }

    if pir::defined($name) {
        $ops.push_pirop('.lex', self.escape($name), $ops);
    }

    $ops;
}


multi method package(PAST::Var $node, $bindpost) {
    my $ops  := POST::Ops.new(:node($node));
    my $name := self.escape($node.name());
    my $ns   := $node.namespace();

    my $fetchop := 'get_global';
    my $storeop := 'set_global';
    my @name    := [$name];

    if pir::defined($ns) {
        $fetchop := 'get_hll_global';
        $storeop := 'set_hll_global';

        if $ns {
            $ns   := POST::Compiler.key_pir($ns);
            @name.unshift($ns);
        }
    }

    if $bindpost {
        return POST::Op.new(|@name, $bindpost,
            :pirop($storeop), :result($bindpost));
    }

    $fetchop := POST::Op.new($ops, |@name, :pirop($fetchop));
    $storeop := POST::Op.new(|@name, $ops, :pirop($storeop));
    return self.vivify($node, $ops, $fetchop, $storeop);
}


multi method lexical(PAST::Var $node, $bindpost) {
    my $name   := self.escape($node.name());
    my $isdecl := $node.isdecl();

    if $isdecl {
        # lexical registers cannot be temporaries
        my $lexreg   := self.uniquereg('P');
        my $ops      := POST::Ops.new(node => $node);
        my $viviself := $node.viviself();

        if !$bindpost && $viviself {
            $bindpost := self.as_vivipost($viviself, rtype => 'P');
            $ops.push($bindpost);
        }

        $ops.push_pirop('set', $lexreg, $bindpost) if $bindpost;

        $ops.push_pirop('.lex', $name, $lexreg);
        $ops.result($lexreg);
        return $ops;
    }
    else {
        if $bindpost {
            return POST::Op.new($name, $bindpost,
                    :pirop('store_lex'), :result($bindpost));
        }

        my $ops     := POST::Ops.new(node => $node);
        my $fetchop := POST::Op.new($ops, $name, pirop => 'find_lex');
        my $storeop := POST::Op.new($name, $ops, pirop => 'store_lex');
        return self.vivify($node, $ops, $fetchop, $storeop);
    }
}


multi method contextual(PAST::Var $node, $bindpost) {
    # If we've requested a contextual in a block that
    # explicitly declares the variable as a different type,
    # treat it as that type.

    my $name := $node.name();

    my %symtable := @*BLOCKPAST[0].symtable();
    if pir::defined(%symtable) {
        %symtable := %symtable{$name};
        if pir::defined(%symtable) {
            my $scope := %symtable<scope>;
            if $scope && $scope ne 'contextual' {
                return self."$scope"($node, $bindpost);
            }
        }
    }

    # If this is a declaration, treat it like a normal lexical
    return self.lexical($node, $bindpost) if $node.isdecl();

    $name := self.escape($name);

    if $bindpost {
        return POST::Op.new($name, $bindpost,
            pirop  => 'store_dynamic_lex',
            result => $bindpost);
    }

    my $ops     := POST::Ops.new(node => $node);
    my $fetchop := POST::Op.new($ops, $name, pirop => 'find_dynamic_lex');
    my $storeop := POST::Op.new($name, $ops, pirop => 'store_dynamic_lex');
    self.vivify($node, $ops, $fetchop, $storeop);
}


multi method keyed(PAST::Var $node, $bindpost, $keyrtype?) {
    Q:PIR {
        .local pmc node
        node = find_lex '$node'
        .local pmc bindpost
        bindpost = find_lex '$bindpost'
        .local pmc pkeyrtype
        .local string keyrtype
        pkeyrtype = find_lex '$keyrtype'
        keyrtype = pkeyrtype
        .local int has_keyrtype
        has_keyrtype = defined pkeyrtype

        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)

        if has_keyrtype goto have_keyrtype
        keyrtype = '*'
      have_keyrtype:

        .local pmc keypast, keypost
        keypast = node[1]
        keypost = self.'as_post'(keypast, 'rtype'=>keyrtype)
        keypost = self.'coerce'(keypost, keyrtype)
        ops.'push'(keypost)

        .local pmc basepast, basepost
        basepast = node[0]

        $P0 = node.'vivibase'()
        unless $P0 goto have_vivibase
        $I0 = can basepast, 'viviself'
        unless $I0 goto have_vivibase
        $P1 = basepast.'viviself'()
        unless $P1 goto vivibase_1
        if $P1 != 'Undef' goto have_vivibase
      vivibase_1:
        basepast.'viviself'($P0)
      have_vivibase:

        #  if the keyed node is an lvalue, its base is an lvalue also
        $I0 = node.'lvalue'()
        unless $I0 goto have_lvalue
        basepast.'lvalue'($I0)
      have_lvalue:

        basepost = self.'as_post'(basepast, 'rtype'=>'P')
        ops.'push'(basepost)
        .local string name
        $S0 = basepost.'result'()
        name = concat $S0, '['
        $S0 = keypost.'result'()
        name = concat name, $S0
        name = concat name, ']'
        .local pmc fetchop, storeop
        $P0 = get_hll_global ['POST'], 'Op'
        if bindpost goto keyed_bind
        fetchop = $P0.'new'(ops, name, 'pirop'=>'set')
        storeop = $P0.'new'(name, ops, 'pirop'=>'set')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)
      keyed_bind:
        ops.'result'(bindpost)
        ops.'push_pirop'('set', name, ops)
        .return (ops)
    }
}


multi method keyed_int(PAST::Var $node, $bindpost) {
    self.keyed($node, $bindpost, 'i');
}


multi method attribute(PAST::Var $node, $bindpost) {
    my $ops  := POST::Ops.new(:node($node));
    my $name := self.escape($node.name());

    # We have three cases here.
    #   0 children = use self
    #   1 child    = object to look up on
    #   2 children = object to look up on + class handle
    # In the last case, we need to generate a different form of the op that
    # has the extra argument.
    my $call_on;
    my @attribute := [$name];
    my $elements := pir::elements($node);
    if $elements == 0 {
        $call_on := 'self';
    }
    else {
        $call_on := self.as_post($node[0], :rtype('P'));
        $ops.push($call_on);
        if $elements == 2 {
            my $handle := self.as_post($node[1], :rtype('P'));
            $ops.push($handle);
            @attribute.unshift($handle);
        }
    }
    @attribute.unshift($call_on);

    if $bindpost {
        $ops.push_pirop('setattribute', |@attribute, $bindpost);
        $ops.result($bindpost);
        return $ops;
    }

    my $fetchop := POST::Op.new($ops, |@attribute, :pirop('getattribute'));
    my $storeop := POST::Op.new(|@attribute, $ops, :pirop('setattribute'));
    self.vivify($node, $ops, $fetchop, $storeop);
}


multi method register(PAST::Var $node, $bindpost) {
    my $name := $node.name();

    unless $name {
        $name := self.uniquereg('P');
        $node.name($name);
    }

    my $ops := POST::Ops.new(result => $name, node => $node);

    $ops.push_pirop('.local pmc', $ops) if $node.isdecl();

    if $bindpost {
        $ops.push_pirop('set', $ops, $bindpost);
    }
    else {
        my $viviself := $node.viviself();
        if $viviself {
            my $vivipost := self.as_vivipost($viviself, rtype => 'P');
            $ops.push($vivipost);
            $ops.push_pirop('set', $ops, $vivipost);
        }
    }

    $ops;
}


=head3 C<PAST::Val>

=item as_post(PAST::Val node [, 'rtype'=>rtype])
Return the POST representation of the constant value given
by C<node>.  The C<rtype> parameter advises the method whether
the value may be returned directly as a PIR constant or needs
to have a PMC generated containing the constant value.

multi method as_post(PAST::Val $node, *%options) {
    my $ops := POST::Ops.new(:node($node));

    my $value := $node<value>;
    unless pir::defined($value) {
        self.panic('PAST::Val node missing :value attribute');
    }
    if $value ~~ PAST::Block {
        my $blockreg := self.uniquereg('P');
        my $blockref := ".const 'Sub' $blockreg = ";
        $blockref := $blockref ~ self.escape(~$value.subid());
        $ops.push_pirop($blockref);
        $ops.result($blockreg);
        return $ops;
    }

    my $returns := $node<returns>;
    $returns := pir::typeof($value) unless $returns;

    my $valflags := %valflags{$returns};
    $value := self.escape($value) if pir::index($valflags, 'e') >= 0;

    # See if this is a PASM constant type
    if pir::index($valflags, 'c') >= 0 {
        # Add the directive for the appropriate .include statement.
        if $returns ne '!macro_const' {
            $*SUB.add_directive(
                pir::replace($returns, 0, 1, '.include "') ~ '.pasm"'
            );
        }
        # Add a leading dot to the value if one isn't already there.
        $value := '.' ~ $value unless pir::substr($value, 0, 1) eq '.';
    }

    my $rtype := %options<rtype>;
    if pir::index($valflags, $rtype) >= 0 {
        $ops.result($value);
        return $ops;
    }

    # Handle int-to-num conversion here
    if $rtype eq 'n' && pir::index($valflags, 'i') >= 0 {
        $value := $value ~ '.0';
        $ops.result($value);
        return $ops;
    }

    my $result := self.tempreg('P');
    $returns := self.escape($returns);
    $ops.push_pirop('new', $result, $returns);
    $ops.push_pirop('assign', $result, $value);
    $ops.result($result);
    $ops;
}


=begin head1
AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=end head1

=begin head1
HISTORY

2011-05-26  Brian Gernhardt converted to NQP
2006-11-20  Patrick Michaud added first draft of POD documentation.
2006-11-27  Significant refactor into separate modules.

=end head1

=begin head1
COPYRIGHT

Copyright (C) 2006-2011, Parrot Foundation.

=end head1

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6

