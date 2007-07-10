# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

src/lua51.pir -- The compiler for Lua 5.1

=head1 DESCRIPTION

This compiler extends C<HLLCompiler>
(see F<runtime/parrot/library/Parrot/HLLCompiler.pir>)

This compiler defines the following stages:

=over 4

=item * parse F<languages/lua/src/lua51.pg>

=item * PAST  F<languages/lua/src/PASTGrammar.tg>

=item * POST  F<languages/lua/src/POSTGrammar.tg>

=back

Used by F<languages/lua/lua.pir>.

=cut

.namespace [ 'Lua' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'

    $P0 = subclass 'HLLCompiler', 'Lua::Compiler'
    $P0 = new [ 'Lua::Compiler' ]
    $P0.'language'('Lua')
    $P0.'parsegrammar'('Lua::Grammar')
    $P0.'astgrammar'('Lua::PAST::Grammar')
    $P0.'ostgrammar'('Lua::POST::Grammar')

    $S0 = "Lua 5.1 on Parrot  Copyright (C) 2005-2007, The Perl Foundation.\n"
    $P0.'commandline_banner'($S0)
    $P0.'commandline_prompt'('> ')
.end


.namespace [ 'Lua::Grammar' ]

=head2 Functions

Some grammar routines are handly written in PIR.

See "Lua 5.1 Reference Manual", section 2.1 "Lexical Conventions",
L<http://www.lua.org/manual/5.1/manual.html#2.1>.

=over 4

=item C<syntaxerror (match, [message])>

=cut

.sub 'syntaxerror'
    .param pmc mob
    .param string message :optional
    .param pmc adv :slurpy :named
    unless null message goto L1
    message = 'syntax error'
  L1:
    lexerror(mob, message)
.end


.sub 'lexerror' :anon
    .param pmc mob
    .param string message
    .local int lineno
    $S0 = 'lua: '
#    .local pmc infile
#    infile = get_hll_global ['TGE::Compiler'], '$!infile'
#    $S0 = infile
#    $S0 .= ':'
    $S0 .= '_._:'
    $P0 = get_hll_global ['PGE::Util'], 'line_number'
    lineno = mob.$P0()
    inc lineno
    $S1 = lineno
    $S0 .= $S1
    $S0 .= ': '
    $S0 .= message
    $S1 = mob.'text'()
    if $S1 == '' goto L1
    $S0 .= " near '"
    $S0 .= $S1
    $S0 .= "'"
  L1:
    .local pmc ex
    ex = new .Exception
    ex['_message'] = $S0
    throw ex
.end


=item C<name>

I<Names> (also called I<identifiers>) in Lua can be any string of letters,
digits, and underscores, not beginning with a digit. This coincides with the
definition of names in most languages. (The definition of letter depends on
the current locale: any character considered alphabetic by the current locale
can be used in an identifier.) Identifiers are used to name variables and
table fields.

The following keywords are reserved and cannot be used as names:

     and       break     do        else      elseif
     end       false     for       function  if
     in        local     nil       not       or
     repeat    return    then      true      until     while

Lua is a case-sensitive language: C<and> is a reserved word, but C<And> and
C<AND> are two different, valid names. As a convention, names starting with
an underscore followed by uppercase letters (such as C<_VERSION>) are reserved
for internal global variables used by Lua.

=cut

.include 'cclass.pasm'

.sub 'name'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos

    $P0 = get_hll_global ['PGE::Match'], 'newfrom'
    (mob, target, mfrom, mpos) = $P0(mob)

    pos = mfrom
    lastpos = length target
    $S0 = substr target, pos, 1
    if $S0 == '_' goto L1
    $I0 = is_cclass .CCLASS_ALPHABETIC, target, pos
    if $I0 == 0 goto L2
  L1:
    $I0 = pos
    pos = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    .local pmc kw
    kw = get_hll_global 'keyword'
    unless null kw goto L3
    kw = _const_keyword()
    set_hll_global 'keyword', kw
  L3:
    $I0 = exists kw[$S0]
    if $I0 goto L2
    mpos = pos
  L2:
    .return (mob)
.end

.sub _const_keyword :anon
    .local pmc kw
    new kw, .Hash
    kw['and'] = 1
    kw['break'] = 1
    kw['do'] = 1
    kw['else'] = 1
    kw['elseif'] = 1
    kw['end'] = 1
    kw['false'] = 1
    kw['for'] = 1
    kw['function'] = 1
    kw['if'] = 1
    kw['in'] = 1
    kw['local'] = 1
    kw['nil'] = 1
    kw['not'] = 1
    kw['or'] = 1
    kw['repeat'] = 1
    kw['return'] = 1
    kw['then'] = 1
    kw['true'] = 1
    kw['until'] = 1
    kw['while'] = 1
    .return (kw)
.end


=item C<number>

A I<numerical constant> may be written with an optional decimal part and an
optional decimal exponent. Lua also accepts integer hexadecimal constants,
by prefixing them with C<0x>. Examples of valid numerical constants are

     3   3.0   3.1416   314.16e-2   0.31416E1   0xff   0x56

=cut

.sub 'number'
    .param pmc mob
    .param pmc params :slurpy

    mob = read_numeral(mob)
    unless mob goto L1

    .local string target
    .local int pos, lastpos

    target = mob.'text'()
    lastpos = length target
  L_alt1:     #   0 [Xx] <xdigit>+
    pos = 0
    $S0 = substr target, pos, 1
    unless $S0 == '0' goto L_alt2
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index 'Xx', $S0
    if $I0 < 0 goto L_alt2
    inc pos
    $I0 = is_cclass .CCLASS_HEXADECIMAL, target, pos
    if $I0 == 0 goto L_alt2
    pos = find_not_cclass .CCLASS_HEXADECIMAL, target, pos, lastpos
    goto L_end
  L_alt2:     #   <digit>+ [\.]?
    pos = 0
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 == 0 goto L_alt3
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    $S0 = substr target, pos, 1
    unless $S0 == '.' goto L_opt2
    inc pos
    goto L_opt1
  L_alt3:     #   \. <digit>
    pos = 0
    $S0 = substr target, pos, 1
    unless $S0 == '.' goto L_end
    inc pos
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 == 0 goto L_end
  L_opt1:     #   <digit>*
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
  L_opt2:     #   [Ee] [+\-]? <digit>+
    .local int pos2
    pos2 = pos
    $S0 = substr target, pos2, 1
    $I0 = index 'Ee', $S0
    if $I0 < 0 goto L_end
    inc pos2
    $S0 = substr target, pos2, 1
    $I0 = index '+-', $S0
    if $I0 < 0 goto L_opt3
    inc pos2
  L_opt3:
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos2
    if $I0 == 0 goto L_end
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos2, lastpos
  L_end:
    if pos == lastpos goto L1
    lexerror(mob, 'malformed number')
  L1:
    .return (mob)
.end


.sub 'read_numeral' :anon
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos

    $P0 = get_hll_global ['PGE::Match'], 'newfrom'
    (mob, target, mfrom, mpos) = $P0(mob)

    pos = mfrom
    lastpos = length target
    $S0 = substr target, pos, 1
    unless $S0 == '.' goto L1
    inc pos
  L1:
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 == 0 goto L2
    inc pos
  L3:
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 == 0 goto L4
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    $S0 = substr target, pos, 1
    unless $S0 == '.' goto L5
    inc pos
    goto L3
  L4:
    $S0 = substr target, pos, 1
    unless $S0 == '.' goto L5
    inc pos
    goto L3
  L5:
    $S0 = substr target, pos, 1
    $I0 = index 'Ee', $S0
    if $I0 < 0 goto L6
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index '+-', $S0
    if $I0 < 0 goto L6
    inc pos
  L6:
    $I0 = .CCLASS_NUMERIC | .CCLASS_WORD
    pos = find_not_cclass $I0, target, pos, lastpos
    mpos = pos
  L2:
    .return (mob)
.end


=item C<quoted_literal>

I<Literal strings> can be delimited by matching single or double quotes,
and can contain the following C-like escape sequences: C<'\a'> (bell),
C<'\b'> (backspace), C<'\f'> (form feed), C<'\n'> (newline), C<'\r'>
(carriage return), C<'\t'> (horizontal tab), C<'\v'> (vertical tab),
C<'\\'> (backslash), C<'\"'> (quotation mark [double quote]),
and C<'\''> (apostrophe [single quote]). Moreover, a backslash followed by
a real newline results in a newline in the string. A character in a string
may also be specified by its numerical value using the escape sequence C<\ddd>,
where I<ddd> is a sequence of up to three decimal digits. (Note that if a
numerical escape is to be followed by a digit, it must be expressed using
exactly three digits.) Strings in Lua may contain any 8-bit value, including
embedded zeros, which can be specified as C<'\0'>.

To put a double (single) quote, a newline, a backslash, or an embedded zero
inside a literal string enclosed by double (single) quotes you must use an
escape sequence. Any other character may be directly inserted into the literal.
(Some control characters may cause problems for the file system, but Lua has
no problem with them.)

=cut

.sub 'quoted_literal'
    .param pmc mob
    .param string delim
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local string literal
    literal = ''
  LOOP:
    if pos < lastpos goto L1
    mpos = pos
    lexerror(mob, "unfinished string")
  L1:
    $S0 = substr target, pos, 1
    if $S0 != delim goto L2
    mob.'result_object'(literal)
    mpos = pos
    .return (mob)
  L2:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L3
    mpos = pos
    lexerror(mob, "unfinished string")
  L3:
    if $S0 != "\\" goto CONCAT
    inc pos
    if pos == lastpos goto LOOP # error
    $S0 = substr target, pos, 1
    $I0 = index 'abfnrtv', $S0
    if $I0 < 0 goto L4
    $S0 = substr "\a\b\f\n\r\t\x0b", $I0, 1
    goto CONCAT
  L4:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L5
    $S0 = "\n"
    goto CONCAT
  L5:
    $I0 = index '0123456789', $S0
    if $I0 < 0 goto CONCAT
    inc pos
    $S0 = substr target, pos, 1
    $I1 = index '0123456789', $S0
    if $I1 < 0 goto L6
    $I0 *= 10
    $I0 += $I1
    inc pos
    $S0 = substr target, pos, 1
    $I1 = index '0123456789', $S0
    if $I1 < 0 goto L6
    $I0 *= 10
    $I0 += $I1
    goto L7
  L6:
    dec pos
  L7:
    if $I0 < 256 goto L8
    mpos = pos
    lexerror(mob, "escape sequence too large")
  L8:
    $S0 = chr $I0

  CONCAT:
    concat literal, $S0
    inc pos
    goto LOOP
.end


=item C<long_string>

Literal strings can also be defined using a long format enclosed by
I<long brackets>. We define an I<opening long bracket of level n> as an
opening square bracket followed by I<n> equal signs followed by another
opening square bracket. So, an opening long bracket of level 0 is written
as C<[[>, an opening long bracket of level 1 is written as C<[=[>, and so on.
A I<closing long bracket> is defined similarly; for instance, a closing long
bracket of level 4 is written as C<]====]>. A long string starts with an
opening long bracket of any level and ends at the first closing long bracket
of the same level. Literals in this bracketed form may run for several lines,
do not interpret any escape sequences, and ignore long brackets of any other
level. They may contain anything except a closing bracket of the proper level.

For convenience, when the opening long bracket is immediately followed by
a newline, the newline is not included in the string. As an example, in
a system using ASCII (in which C<'a'> is coded as 97, newline is coded as 10,
and C<'1'> is coded as 49), the five literals below denote the same string:

     a = 'alo\n123"'
     a = "alo\n123\""
     a = '\97lo\10\04923"'
     a = [[alo
     123"]]
     a = [==[
     alo
     123"]==]

=cut

.sub 'long_string'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep >= 0 goto L1
    if sep == -1 goto END
    mpos = pos
    lexerror(mob, "invalid long string delimiter")
  L1:
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L2
    inc pos
  L2:

    .local string literal
    literal = ''
  LOOP:
    if pos < lastpos goto L3
    lexerror(mob, "unfinished long string")
  L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    inc pos
    mpos = pos
    lexerror(mob, "nesting of [[...]] is deprecated")
  L5:
    dec pos
    goto CONCAT
  L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
    mob.'result_object'(literal)
    mpos = pos
    goto END
  L7:
    dec pos
    goto CONCAT
  L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
    $S0 = "\n"
    goto CONCAT
  L8:

  CONCAT:
    concat literal, $S0
    inc pos
    goto LOOP

  END:
    .return (mob)
.end


=item C<long_comment>

A I<comment> starts with a double hyphen (C<-->) anywhere outside a string.
If the text immediately after C<--> is not an opening long bracket,
the comment is a I<short comment>, which runs until the end of the line.
Otherwise, it is a I<long comment>, which runs until the corresponding closing
long bracket. Long comments are frequently used to disable code temporarily.

=cut

.sub 'long_comment'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep < 0 goto END
    inc pos
#    $S0 = substr target, pos, 1
#    $I0 = index "\n\r", $S0
#    if $I0 < 0 goto L2
#    inc pos
#  L2:

#    .local string literal
#    literal = ''
  LOOP:
    if pos < lastpos goto L3
    lexerror(mob, "unfinished long comment")
  L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    inc pos
    mpos = pos
    lexerror(mob, "nesting of [[...]] is deprecated")
  L5:
    dec pos
    goto CONCAT
  L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
#    mob.'result_object'(literal)
    mpos = pos
    goto END
  L7:
    dec pos
    goto CONCAT
  L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
#    $S0 = "\n"
    goto CONCAT
  L8:

  CONCAT:
#    concat literal, $S0
    inc pos
    goto LOOP

  END:
    .return (mob)
.end

.sub '_skip_sep' :anon
    .param string target
    .param int pos
    .param string delim
    .local int count
    count = 0
  L1:
    $S0 = substr target, pos, 1
    if $S0 != '=' goto L2
    inc count
    inc pos
    goto L1
  L2:
    if $S0 == delim goto L3
    neg count
    dec count
  L3:
    .return (pos, count)
.end


.namespace [ 'Lua::PAST::Grammar' ]

=item C<internal_error>

used in F<languages/lua/src/PASTGrammar.tg>

=cut

.sub internal_error
    .param string msg
    $S0 = "ERROR_INTERNAL (PAST): " . msg
    $S0 .= "\n"
    printerr $S0
    exit 1
.end


.namespace [ 'Lua::POST::Grammar' ]

=item C<internal_error>

used in F<languages/lua/src/POSTGrammar.tg>

=cut

.sub internal_error
    .param string msg
    $S0 = "ERROR_INTERNAL (POST): " . msg
    $S0 .= "\n"
    printerr $S0
    exit 1
.end


.namespace [ "Lua::POST::Chunk" ]

.sub '__onload' :load :init
    $P0 = subclass 'POST::Sub', 'Lua::POST::Chunk'
.end

.sub 'prologue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('prologue', value, has_value)
.end

.sub 'pir' :method
    self.'cpir'()
    $S0 = self.'prologue'()
    if $S0 == '' goto L1
    .local pmc code
    new code, 'PGE::CodeString'
    code.'emit'($S0)
    $P0 = get_hll_global ['POST'], '$!subpir'
    code .= $P0
    set_hll_global ['POST'], '$!subpir', code
  L1:
.end


.namespace [ 'PAST::Node' ]

.sub 'clone' :vtable :method
    .local pmc res
    $S0 = classname self
    $I0 = find_type $S0
    res = new $I0
    .local pmc iter
    iter = self.'iterator'()
  L1:
    unless iter goto L2
    $P0 = shift iter
    $P1 = clone $P0
    res.'push'($P1)
    goto L1
  L2:
    iter = new .Iterator, self
  L3:
    unless iter goto L4
    $S0 = shift iter
    $P0 = iter[$S0]
    res[$S0] = $P0
    goto L3
  L4:
    .return (res)
.end


.namespace [ 'POST::Node' ]

.sub 'pop' :method
    $P0 = self.'get_array'()
    $P1 = pop $P0
    .return ($P1)
.end


.namespace [ 'POST::Sub' ]

.sub 'storage' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('storage', value, has_value)
.end


.namespace [ "Lua::Symbtab" ]

.sub '__onload' :load :init
    $P0 = subclass 'ResizablePMCArray', 'Lua::Symbtab'
    new $P0, .Integer
    set $P0, 0
    set_global '$nb', $P0
.end

.sub 'insert' :method
    .param string name
    $P0 = self[0]
    $I0 = exists $P0[name]
    if $I0 goto L1
    $S0 = name . '_'
    $P1 = get_global '$nb'
    $S1 = $P1
    $S0 .= $S1
    $P0[name] = $S0
  L1:
    $S0 = $P0[name]
    .return ($S0)
.end

.sub 'lookup' :method
    .param string name
    .local pmc iter
    new iter, .Iterator, self
  L1:
    unless iter goto L2
    $P0 = shift iter
    $I0 = exists $P0[name]
    unless $I0 goto L1
    $S0 = $P0[name]
    .return (1, $S0)
  L2:
    .return (0)
.end

.sub 'push_scope' :method
    new $P0, .Hash
    unshift self, $P0
    $P1 = get_global '$nb'
    inc $P1
.end

.sub 'pop_scope' :method
    $P0 = shift self
.end

.include 'languages/lua/src/lua51_gen.pir'
.include 'languages/lua/src/PASTGrammar_gen.pir'
.include 'languages/lua/src/POSTGrammar_gen.pir'

=back

=head1 AUTHORS

Klaas-Jan Stol <parrotcode@gmail.com>

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
