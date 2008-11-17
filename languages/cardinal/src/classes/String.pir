## $Id$

=head1 TITLE

CardinalString - Cardinal String class and related functions

=head1 DESCRIPTION

This file sets up the C<CardinalString> type.

Stolen from Rakudo

=head1 Methods

=over 4

=cut

.namespace ['CardinalString']

.include 'cclass.pasm'

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta, strproto
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    strproto = cardinalmeta.'new_class'('CardinalString', 'parent'=>'String CardinalObject')
    cardinalmeta.'register'('String', 'parent'=>'CardinalObject', 'protoobject'=>strproto)
.end

.sub 'new' :method :multi(_)
    $P0 = new 'CardinalString'
    .return ($P0)
.end

.sub 'new' :method :multi(_,_)
    .param pmc a
    $P0 = new 'CardinalString'
    $P0 = a
    .return ($P0)
.end

.sub 'ACCEPTS' :method
    .param string topic
    .tailcall 'infix:eq'(topic, self)
.end

=item chars()

Returns the number of characters in C<self>

=cut

.sub 'chars' :method
    .local pmc retv

    retv = new 'CardinalInteger'
    $S0  = self
    $I0  = length $S0
    retv = $I0

    .return (retv)
.end


=item size()

=cut

.sub 'size' :method
    .local pmc retv

    retv = new 'CardinalInteger'
    $S0  = self
    $I0  = length $S0
    retv = $I0

    .return (retv)
.end


=item concat()

Adds given object to C<self>. Returns self

=cut

.sub 'concat' :method
    .param pmc item
    concat self, item
    .return(self)
.end

=item reverse()

Returns a new CardinalString with the characters of C<self> in reverse order.

=cut

.sub 'reverse' :method
    .local pmc res
    .local int i

    res = new 'CardinalString'

    .local pmc iterator, item
    iterator = new 'Iterator', self
  each_loop:
    unless iterator goto each_loop_done
    item = shift iterator
    res = concat item, res
    goto each_loop
  each_loop_done:
    .return(res)
.end

=item reverse!()

Returns the characters in C<self> in reverse order. Destructive update.

=cut

.sub 'reverse!' :method
    $S0 = self.'reverse'()
    self = $S0
    .return(self)
.end

.sub 'split' :method :multi('CardinalString',_)
    .param string delim
    .local string objst
    .local pmc pieces
    .local pmc tmps
    .local pmc retv
    .local int len
    .local int i

    retv = new 'CardinalArray'

    objst = self
    split pieces, delim, objst

    len = pieces
    i = 0
  loop:
    if i == len goto done

    tmps = new 'CardinalString'
    tmps = pieces[i]

    retv.'push'(tmps)

    inc i
    goto loop
  done:
    .return(retv)
.end

.sub 'each' :method :multi('CardinalString',_)
    .param pmc delim
    .param pmc block :named('!BLOCK')
    .local pmc list
    list = self.'split'(delim)
    list.'each'(block)
.end

.sub lc :method
    .local string tmps
    .local pmc retv

    tmps = self
    downcase tmps

    retv = new 'CardinalString'
    retv = tmps

    .return(retv)
.end

=item downcase()

Returns a copy of C<self> with all upper case letters converted to lower case

=cut

.sub downcase :method
    .local pmc s
    s = new 'CardinalString'
    s = self
    .tailcall s.'lc'()
.end

=item upcase()

Returns a copy of C<self> with all lower case letters converted to upper case

=cut

.sub upcase :method
    .local pmc s
    s = new 'CardinalString'
    s = self
    .tailcall s.'uc'()
.end

.sub uc :method
    .local string tmps
    .local pmc retv

    tmps = self
    upcase tmps

    retv = new 'CardinalString'
    retv = tmps

    .return(retv)
.end

.sub lcfirst :method
    .local string tmps
    .local string fchr
    .local pmc retv
    .local int len

    retv = new 'CardinalString'
    tmps = self

    len = length tmps
    if len == 0 goto done

    substr fchr, tmps, 0, 1
    downcase fchr

    concat retv, fchr
    substr tmps, tmps, 1
    concat retv, tmps

  done:
    .return(retv)
.end

.sub ucfirst :method
    .local string tmps
    .local string fchr
    .local pmc retv
    .local int len

    retv = new 'CardinalString'
    tmps = self

    len = length tmps
    if len == 0 goto done

    substr fchr, tmps, 0, 1
    upcase fchr

    concat retv, fchr
    substr tmps, tmps, 1
    concat retv, tmps

  done:
    .return(retv)
.end

=item capitalize()

    Returns a copy of C<self> with the first character converted to uppercase and the remainder to lowercase.

=cut

.sub capitalize :method
    .local string tmps
    .local string fchr
    .local pmc retv
    .local int len

    retv = new 'CardinalString'
    tmps = self

    len = length tmps
    if len == 0 goto done

    downcase tmps

    .local int pos, is_ws, is_lc
    pos = 0
    goto first_char
  #next_grapheme:
  #  if pos == len goto done
  #  is_ws = is_cclass .CCLASS_WHITESPACE, tmps, pos
  #  if is_ws goto ws
  #advance:
  #  pos += 1
  #  goto next_grapheme
  #ws:
  #  pos += 1
  first_char:
    is_lc = is_cclass .CCLASS_LOWERCASE, tmps, pos
    #unless is_lc goto advance
    unless is_lc goto done
    $S1 = substr tmps, pos, 1
    upcase $S1
    substr tmps, pos, 1, $S1
    ## the length may have changed after replacement, so measure it again
    len = length tmps
    #goto advance
  done:
    retv = tmps
    .return (retv)
.end

=item
  TODO: Read from the global record separator
=cut
.sub 'chomp' :method
    .param string splitby :optional
    .param int custom_split :opt_flag
    .local string tmps
    .local pmc retv
    if custom_split goto have_split
    splitby = "\n"
  have_split:

    retv = new 'CardinalString'
    $I0 = self.'chars'()
    if $I0 == 0 goto done
    $I1 = length splitby
    $I0 = $I0 - $I1
    $S0 = substr self, $I0, $I1
    if $S0 == splitby goto chop
    tmps = self
    goto done
  chop:
    tmps = substr self, 0, $I0
    goto done
  done:
    retv = tmps
    .return(retv)
.end

=item
  TODO: Read from the global record separator
=cut
.sub 'chomp!' :method
    .param string splitby :optional
    .param int custom_split :opt_flag
    .local string tmps
    if custom_split goto have_split
    splitby = "\n"
  have_split:

    $I0 = self.'chars'()
    if $I0 == 0 goto done
    $I1 = length splitby
    $I0 = $I0 - $I1
    $S0 = substr self, $I0, $I1
    if $S0 == splitby goto chop
    tmps = self
    goto done
  chop:
    tmps = substr self, 0, $I0
    goto done
  done:
    self = tmps
    .return(self)
.end

.sub 'chop' :method
    .local string tmps
    .local pmc retv
    .local int len

    retv = new 'CardinalString'
    tmps = self
    chopn tmps, 1
    retv = tmps
    .return(retv)
.end

.sub 'chop!' :method
    .local string tmps
    .local int len

    tmps = self
    chopn tmps, 1
    self = tmps
    .return(self)
.end

=item length()

 Return the number of characters in C<self>

=cut

.sub 'length' :method
     $I0 = self.'chars'()
     .return($I0)
.end

=item '[]'

 subscript operator. Accepts [(-)? int], [(-)?int, (-)?int]

=cut

.sub '[]' :method :vtable('get_pmc_keyed')
    .param int start
    .param int stop :optional
    .local string tmp
    .local int len

    if stop <= 0 goto init_stop
    process:
        tmp = self
        len = length tmp
        if start >= len goto oob
        if start >= 0 goto pos_access
        if start < 0 goto neg_access
        goto oob
    neg_access:
        substr $S0, tmp, start, stop
        .return($S0)
    pos_access:
        substr $S0, tmp, start, stop
        .return($S0)
    oob:
        # out of bounds, return nil
        $P0 = new 'NilClass'
        .return($P0)
    init_stop:
        stop = 1
        goto process
.end

=item '[]='

Warning: Partial implementation. Look for TODO

=cut

.sub '[]=' :method :vtable('set_pmc_keyed')
    .param int start
    .param string replace_with
    .local string tmp
    .local int len
    .local int stop

    tmp = self
    len = length tmp
    stop = length replace_with

    if start > len goto oob
    if start >= len goto oob
    if start >= 0 goto pos_access
    if start < 0 goto neg_access
    goto oob
    neg_access:
        substr $S0, tmp, start, stop, replace_with
        self = tmp
        .return()
    pos_access:
        substr $S0, tmp, start, stop, replace_with
        self = tmp
        .return()
    oob:
        say "oob, IndexException"
        # TODO out of bounds, throw IndexException
        .return()
.end

.sub 'each_byte' :method
    .param pmc block :named('!BLOCK')
    .local pmc iterator, item
    iterator = new 'Iterator', self
  each_loop:
    unless iterator goto each_loop_done
    item = shift iterator
    block(item)
    goto each_loop
  each_loop_done:
.end

=item perl()

Returns a Perl representation of the Str.

=cut

.sub 'perl' :method
    $S0 = "\""
    $S1 = self
    $S1 = escape $S1
    concat $S0, $S1
    concat $S0, "\""
    .return ($S0)
.end

=item to_s()

Returns self

=cut

.sub 'to_s' :method
    $P0 = new 'CardinalString'
    $P0 = self
    .return ($P0)
.end

=back

=head1 Functions

=over 4

=cut

.namespace []

.include 'cclass.pasm'



=item lc()

 our Str multi Str::lc ( Str $string )

Returns the input string after converting each character to its lowercase
form, if uppercase.

=cut

.sub 'lc'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'lc'()
.end


=item lcfirst()

 our Str multi Str::lcfirst ( Str $string )

Like C<lc>, but only affects the first character.

=cut

.sub 'lcfirst'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'lcfirst'()
.end


=item uc

 our Str multi Str::uc ( Str $string )

Returns the input string after converting each character to its uppercase
form, if lowercase. This is not a Unicode "titlecase" operation, but a
full "uppercase".

=cut

.sub 'uc'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'uc'()
.end


=item ucfirst

 our Str multi Str::ucfirst ( Str $string )

Performs a Unicode "titlecase" operation on the first character of the string.

=cut

.sub 'ucfirst'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'ucfirst'()
.end


=item capitalize

 our Str multi Str::capitalize ( Str $string )

Has the effect of first doing an C<lc> on the entire string, then performing a
C<s:g/(\w+)/{ucfirst $1}/> on it.

=cut

.sub 'capitalize'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'capitalize'()
.end


=item split

 our CardinalArray multi Str::split ( Str $delimiter ,  Str $input = $+_, Int $limit = inf )
 our CardinalArray multi Str::split ( Rule $delimiter = /\s+/,  Str $input = $+_, Int $limit = inf )
 our CardinalArray multi Str::split ( Str $input :  Str $delimiter          , Int $limit = inf )
 our CardinalArray multi Str::split ( Str $input : Rule $delimiter          , Int $limit = inf )

String delimiters must not be treated as rules but as constants.  The
default is no longer S<' '> since that would be interpreted as a constant.
P5's C<< split('S< >') >> will translate to C<.words> or some such.  Null trailing fields
are no longer trimmed by default.  We might add some kind of :trim flag or
introduce a trimlist function of some sort.

B<Note:> partial implementation only

=cut

.sub 'split'
    .param string sep
    .param string target
    .local pmc a, b

    a = new 'CardinalString'
    b = new 'CardinalString'

    a = target
    b = sep

    .tailcall a.'split'(b)
.end

=item join

B<Note:> partial implementation only

=cut

.sub 'join'
    .param pmc args            :slurpy
    .local pmc flatargs
    .local string sep

    flatargs = new 'CardinalArray'
    sep = ''
    unless args goto have_flatargs
    $P0 = args[0]
    $I0 = isa $P0, 'CardinalArray'
    if $I0 goto have_sep
    $P0 = shift args
    sep = $P0
  have_sep:
  arg_loop:
    unless args goto have_flatargs
    $P0 = shift args
    $I0 = isa $P0, 'CardinalArray'
    if $I0 goto arg_array
    push flatargs, $P0
    goto arg_loop
  arg_array:
    $I0 = elements flatargs
    splice flatargs, $P0, $I0, 0
    goto arg_loop
  have_flatargs:
    $S0 = join sep, flatargs
    .return ($S0)
.end


=item substr

 multi substr (Str $s, StrPos $start  : StrPos $end,      $replace)
 multi substr (Str $s, StrPos $start,   StrLen $length  : $replace)
 multi substr (Str $s, StrLen $offset : StrLen $length,   $replace)

B<Note:> partial implementation only

=cut

.sub 'substr'
    .param string x
    .param int start
    .param int len     :optional
    .param int has_len :opt_flag
    .local pmc s

    if has_len goto end
    s = new 'CardinalString'
    s = x
    len = s.'chars'()

  end:
    $S0 = substr x, start, len
    .return ($S0)
.end

=item chop

 our Str method Str::chop ( Str  $string: )

Returns string with one Char removed from the end.

=cut

.sub 'chop'
    .param string a
    .local pmc s
    s = new 'CardinalString'
    s = a
    .tailcall s.'chop'()
.end

=back

=head2 TODO Functions

=over 4

=item p5chop

 our Char multi P5emul::Str::p5chop ( Str  $string is rw )
 our Char multi P5emul::Str::p5chop ( Str *@strings = ($+_) is rw )

Trims the last character from C<$string>, and returns it. Called with a
list, it chops each item in turn, and returns the last character
chopped.

=item p5chomp

 our Int multi P5emul::Str::p5chomp ( Str  $string is rw )
 our Int multi P5emul::Str::p5chomp ( Str *@strings = ($+_) is rw )

Related to C<p5chop>, only removes trailing chars that match C</\n/>. In
either case, it returns the number of chars removed.

=item chomp

 our Str method Str::chomp ( Str $string: )

Returns string with newline removed from the end.  An arbitrary
terminator can be removed if the input filehandle has marked the
string for where the "newline" begins.  (Presumably this is stored
as a property of the string.)  Otherwise a standard newline is removed.

Note: Most users should just let their I/O handles autochomp instead.
(Autochomping is the default.)

=item index

Needs to be in terms of StrPos, not Int.

=item pack

=item pos

=item quotemeta

=item rindex

Needs to be in terms of StrPos, not Int.

=item sprintf

=item unpack

=item vec

Should replace vec with declared arrays of bit, uint2, uint4, etc.

=item words

 our CardinalArray multi Str::words ( Rule $matcher = /\S+/,  Str $input = $+_, Int $limit = inf )
 our CardinalArray multi Str::words ( Str $input : Rule $matcher = /\S+/, Int $limit = inf )

=cut

.sub 'infix:<<' :multi('CardinalString',_)
    .param pmc s
    .param pmc item
    concat s, item
    .return(s)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
