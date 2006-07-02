=head1 NAME

CodeString - object to build (PIR) code segments

=head1 SYNOPSIS

    .local pmc code
    code = new 'CodeString'

    code.emit("   $P0 = %0 * %1", '$P21', '3')
    code.emit("  %l:", 'l' => 'label')

    print code

=head1 DESCRIPTION

C<CodeString> is a class intended to simplify the process of 
emitting code strings.  Ideally this will eventually
become a form of "CodeBuffer" that is more efficient
than string concatenation, but for now it works well
enough for me.

The primary method for C<CodeString> objects is C<emit>,
which appends a line (or lines) of code to the string
according to a format parameter.  The line can contain
substitution markers (ala printf) that indicate where
other parameters to the call should be placed.

Note that C<CodeString> is just a subclass of Parrot's
native C<String> class, so it's easy to combine CodeString
objects with other strings outside of the C<emit> method.

=head2 Functions

=over 4

=item C<_onload()>

Initializes the C<CodeString> class.

=cut

.include 'cclass.pasm'

.HLL 'parrot', ''
.namespace [ 'TclCodeString' ]

.sub '__onload' :load
    $P0 = getclass 'String'
    $P1 = subclass $P0, 'TclCodeString'

    $P0 = new .Integer
    $P0 = 10
    store_global '$!serno', $P0
    .return ()
.end


=item C<emit(string fmt [, pmc args ] [, pmc hash ])>

Add a line to a C<CodeString> object according to C<fmt>.
The C<fmt> string can contain any number of "%-replacements"
which are replaced by the corresponding values from C<args>
or C<hash> prior to being appended to the string.  (Here
C<args> is a slurpy array, and C<hash> is a slurpy hash.)

The currently defined replacements include:

    %0 %1 ... %9     the value from the args array at index 0..9
    %,               the values of the args array separated by commas
    %%               a percent sign

A percent-sign followed by any other character that is a hash
key receives the value of the hash element.

A newline is automatically added to the end of the fmt.

=cut


.sub 'emit' :method
    .param string fmt
    .param pmc args            :slurpy
    .param pmc hash            :slurpy :named
    .local int pos, replen
    .local string key, repl

    fmt = clone fmt
    pos = 0
  emit_loop:
    pos = index fmt, '%', pos
    if pos < 0 goto end
    $I1 = pos + 1
    key = substr fmt, $I1, 1
    $I0 = exists hash[key]
    if $I0 goto hash_arg
    $I0 = is_cclass .CCLASS_NUMERIC, fmt, $I1
    if $I0 goto args_arg
    if key == ',' goto comma_arg
    if key == '%' goto percent
    replen = 2
    goto emit_next
  comma_arg:
    repl = args[0]
    repl = clone repl
    $I1 = elements args
    $I0 = 1
  comma_arg_loop:
    if $I0 >= $I1 goto fmt_arg
    $S0 = args[$I0]
    concat repl, ', '
    concat repl, $S0
    inc $I0
    goto comma_arg_loop
  percent:
    repl = '%'
    goto fmt_arg
  hash_arg:
    repl = hash[key]
    goto fmt_arg
  args_arg:
    $I0 = key
    repl = args[$I0]
  fmt_arg:
    substr fmt, pos, 2, repl
    replen = length repl
  emit_next:
    pos += replen
    goto emit_loop
  end:
    self .= fmt
    $S0 = substr fmt, -1, 1
    if $S0 == "\n" goto end_1
    self .= "\n"
  end_1:
    .return ()
.end


=item C<unique([string fmt])>

Each call to C<unique> returns a unique number, or if a C<fmt>
parameter is given it returns a unique string beginning with
C<fmt>.  (This may eventually be generalized to allow 
uniqueness anywhere in the string.)  The function starts
counting at 10 (so that the values 0..9 can be considered "safe").

=cut

.sub 'unique' :method
    .param string fmt          :optional
    .param int has_fmt         :opt_flag

    if has_fmt goto unique_1
    fmt = ''
  unique_1:
    $P0 = find_global '$!serno'
    $S0 = $P0
    $S0 = concat fmt, $S0
    inc $P0
    .return ($S0)
.end


=item C<escape(string str)>

Returns an escaped value of C<str> suitable for including in PIR.
If the string contains any non-ASCII characters, then it's
prefixed with 'unicode:'.

=cut

.sub 'escape' :method
    .param string str
    str = escape str
    str = concat '"', str
    str = concat str, '"'
    $I0 = index str, '\x'
    if $I0 >= 0 goto unicode
    $I0 = index str, '\u'
    if $I0 >= 0 goto unicode
    .return (str)
  unicode:
    str = concat 'unicode:', str
    .return (str)
.end


=back

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author. Matt Diephouse 
(matt@diephouse.com) cargo-culted it into ParTcl from PGE.

=cut

