# $Id$

=head1 NAME

library/Getopt/Obj.pir - parse long and short command line options

=head1 SYNOPSIS

  .sub main :main
    .param pmc argv

    .local string prog_name
    prog_name = shift argv
    load_bytecode "Getopt/Obj.pbc"
    .local pmc getopts
    getopts = new ['Getopt';'Obj']
    getopts."notOptStop"(1)

     # these two are identical, with the exception of the call to name

     push getopts, "foo|f:s"

     $P0 = getopts."add"()
     $P0."name"("FooBar")
     $P0."long"("foo")
     $P0."short"("f")
     $P0."optarg"(1)
     $P0."type"('String')

     # these two are identical

     push getopts, "bar|b=s"

     $P0 = getopts."add"()
     $P0."long"("bar")
     $P0."short"("b")
     $P0."type"('String')

     .local pmc opts
     opts = getopts."get_options"(argv)
     .local string foo
     foo = opts["Foobar"]
  .end

=head1 DESCRIPTION

This library parses options from the command line.  Options may take
and of these forms, currently:

 --foo=bar         Set foo to bar
 -f bar            Set f to bar (with conditions)
 -fthis=that       If f is a Hash, set key 'this' to 'that'
 -f this=that      If f is a Hash, set key 'this' to 'that'
 -f                Set f (if it's Boolean or has an optional argument)
 -fbar             Set f to bar if it's not a Boolean
 -abc              If -a -b and -c are all Booleans, set them all
 --foo=this=that   If foo is a Hash, set key 'this' to 'that'
                   Both equal signs are required
 --                Stop processing args, -- is removed from argv

=head1 SUBROUTINES

=over 4

=item C<__load()>

States that Getopt::Obj and Getopt::Obj::Spec are classes to use and defines
the attributes they'll use.

=cut

.sub __load :anon :load
    .local pmc obj, spec, pns, ns
    obj = newclass ['Getopt';'Obj']
    addattribute obj, "Specs"
    addattribute obj, "notOptStop"

    spec = newclass ['Getopt';'Obj';'Spec']
    addattribute spec, "name"
    addattribute spec, "long"
    addattribute spec, "short"
    addattribute spec, "type"
    addattribute spec, "optarg"

    ns = get_hll_namespace ['Getopt';'Obj']
    $P0 = get_hll_namespace
    pns = $P0.'make_namespace'('Getopt')
    pns.'add_namespace'('Obj', ns)
    ns = get_hll_namespace ['Getopt';'Obj';'Spec']
    pns = get_hll_namespace ['Getopt';'Obj']
    pns.'add_namespace'('Spec', ns)
.end

=back

=head2 Class Getopt::Obj

Our nice little module.

=over 4

=cut

.namespace ['Getopt';'Obj']

=item C<init()>

Creates the Specs and notOptStop attribute, internal stuff.

=cut

.sub init :vtable :method
    $P0 = new 'ResizablePMCArray'
    setattribute self, "Specs", $P0
    $P0 = new 'Boolean'
    setattribute self, "notOptStop", $P0
.end

=item C<HASH get_options(ARRAY ARGV)>

Parses ARGV, modifying it inplace, and returns a hash with the keys and values
wanted.

=cut

.sub get_options :method
    .param pmc argv

    .local pmc return, spec
    .local int i, j, argc
    .local string name, long, short, arg, key, val
    return = new 'Hash'

    i = 0
beginfor:
    argc = argv
    key = ''
    val = ''
    name = ''
    unless i < argc goto endfor
    arg = argv[i]
    if arg == '-' goto redofor # lonesome dash
    unless arg == '--' goto endif_0 # no more args, done
    delete argv[i]
    goto endfor
endif_0:
    $S0 = substr arg, 0, 1
    unless $S0 != '-' goto endif_1
    # This will work for if the option does not start with a hyphen
    $I0 = self."notOptStop"()
    if $I0 goto endfor
    goto redofor # not an arg for us, next!
endif_1:

    # ok now, we know we've got an arg to process, maybe long
    # maybe short, maybe with its own argument.
    $S0 = substr arg, 0, 2
    unless $S0 == '--' goto shortarg

    ################  LONG  ############################

    # TODO type and optarg not checked
    $I0 = index arg, '='
    if $I0 == -1 goto else_2
    $I0 -= 2
    key = substr arg, 2, $I0
    $I0 += 3
    val = substr arg, $I0
    # XXX use this or not?
    # return undef for --foo=
    $I0 = length val
    if $I0 goto endif_3
    null val
endif_3:
    goto endif_2
else_2:
    # most likely a boolean
    key = substr arg, 2
    null val
endif_2:
    (name, spec) = self."getNameForKey"(key)
    if null name goto redofor
    long = spec."long"()
    $I0 = length $S0
    unless long == key goto beginstore_1
    $I0 = spec."optarg"()
    .local string type
    type = spec."type"()
    unless type == 'Boolean' goto endif_4
    val = 1
    goto beginstore_1

endif_4:
    # just a --foo type, do the optarg check here
    $I0 = spec."optarg"()
    if $I0 goto beginstore_1
    $I0 = index arg, '='
    if $I0 != -1 goto else_4
    delete argv[i]
    argc = argv
    unless i < argc goto error_1
#    # XXX/TODO doesn't yet check the value of argv[i]
#    #          to see if it's a possible argument
#    # argv[i] gets deleted before going to the next arg
    val = argv[i]
    goto beginstore

else_4:
    if_null val, error_0
    goto beginstore_1
error_0:
    MissingRequired(long)

    ################  SHORT  ###########################

shortarg:

    # get the first char
    key = substr arg, 1, 1
    # and the others...
    val = substr arg, 2

    (name, spec) = self."getNameForKey"(key)
    if null name goto redofor

    key = name

    type = spec."type"()
    $I2 = length val

    unless type == 'Boolean' goto else_6
    if $I2 == 0 goto beginstore
    # ok, boolean and bundled
    .local string keys
    keys = substr arg, 1
    .local int jkl, mno
    jkl = 0
    mno = length keys
beginfor_0:
    unless jkl < mno goto endfor_0
    key = substr keys, jkl, 1

    (name, spec) = self."getNameForKey"(key)
    if null name goto redofor
    type = spec."type"()
    unless type == 'Boolean' goto error_2

    $P0 = new 'Boolean'
    $P0 = 1
    return[name] = $P0
    inc jkl
    goto beginfor_0
endfor_0:

    # this should probably a next, I think, maybe, it works, so maybe not.
    goto beginstore
else_6:
    # Not a boolean...
    # If a -Ifoo type...
    if $I2 != 0 goto beginstore
    # just a -f type, do the optarg check here
    $I0 = spec."optarg"()
    if $I0 goto beginstore
    delete argv[i]
    argc = argv
    unless i < argc goto error_1
    # XXX/TODO doesn't yet check the value of argv[i]
    #          to see if it's a possible argument
    # argv[i] gets deleted before going to the next arg
    val = argv[i]
    goto beginstore
error_1:
    MissingRequired(name)
error_2:
    $P0 = new 'Exception'
    $P0 = "Not using only boolean arguments in a bundled argument"
    throw $P0

    ################  STORE  ###########################
beginstore:

    (name, spec) = self."getNameForKey"(key)
    if null name goto redofor

beginstore_1:
    # Store the value...
    type = spec."type"()
    if_null val, undef
    if type == 'String' goto str
    if type == 'Array' goto array
    if type == 'Hash' goto hash
    if type == 'Integer' goto integer
    if type == 'Float' goto flt
    if type == 'Boolean' goto bool
    # XXX default to boolean?
    # And are pmc's necessary?
    goto bool
undef:
    $I0 = spec."optarg"()
    unless $I0 goto optelse
    $P0 = new 'Undef'
    goto endifelse
optelse:
    MissingRequired(name)
    goto endifelse
array:
    $P0 = return[name]
    if null $P0 goto not_set
    type = typeof $P0
    unless type != 'ResizableStringArray' goto endif_5
not_set:
    $P0 = new 'ResizableStringArray'
endif_5:
    push $P0, val
    goto endifelse
hash:
    $P0 = return[name]
    if null $P0 goto not_set_hash
    type = typeof $P0
    unless type != 'Hash' goto endif_7
not_set_hash:
    $P0 = new 'Hash'
endif_7:
    $I0 = index val, '='
    unless $I0 == -1 goto else_8
    $P0[val] = 1
    goto endifelse
else_8:
    $S0 = substr val, 0, $I0
    inc $I0
    $S1 = substr val, $I0
    $P0[$S0] = $S1
    goto endifelse
str:
    $P0 = new 'String'
    $P0 = val
    goto endifelse
integer:
    $P0 = new 'Integer'
    $I0 = val
    $P0 = $I0
    goto endifelse
flt:
    $P0 = new 'Float'
    $N0 = val
    $P0 = $N0
    goto endifelse
bool:
    $P0 = new 'Boolean'
    $P0 = 1
endifelse:
    return[name] = $P0

nextfor:
    delete argv[i]
    goto beginfor
redofor:
    inc i
    goto beginfor
endfor:

    goto finish
endif_6:
    $I0 = self."notOptStop"()
    if $I0 goto finish
    inc i
    goto beginfor

finish:
    .return(return)
.end

=item C<push_string(STRING format)>

A vtable, invoked by e.g. C<push getopts, "foo|f=s">.  The format is:

=over 4

=item "foo|f"

A long option of "foo" and a short option of "f" is set to C<Boolean>.

=item "foo"

A long option of "foo" is set to C<Boolean>.

=item "f"

A short option of "f" is set to C<Boolean>.

=item "f=s"

A short option of "f" is set to C<String>.  Use C<i> for C<Integer>, C<f> for
C<Float>, C<@> for an C<Array>, and C<%> for a C<Hash>.

=item "foo:s"

A long option of "foo" is set to C<String>, with "optarg" set to a true value.

=back

=cut

.sub "push_string" :vtable :method
    .param string format
    .local string key, type, long, short
    $P0 = self."add"()

    $I0 = index format, ':'
    if $I0 == -1 goto else_0
    $P0."optarg"(1)
    goto check
else_0:
    key = format
    $I0 = index format, '='
    # Boolean is the default
    if $I0 == -1 goto endcase
check:
    key = substr format, 0, $I0
    inc $I0
    # get type
    type = substr format, $I0

    if type == 's' goto str
    if type == '@' goto array
    if type == '%' goto hash
    if type == 'i' goto integer
    if type == 'f' goto flt
    $P0 = new 'Exception'
    $S0 = "Unknown specs option '"
    $S0 = $S0 . type
    $S0 = $S0 . "'"
    $P0 = $S0
    throw $P0

str:
    $P0."type"('String')
    goto endcase
array:
    $P0."type"('Array')
    goto endcase
hash:
    $P0."type"('Hash')
    goto endcase
integer:
    $P0."type"('Integer')
    goto endcase
flt:
    $P0."type"('Float')
endcase:
    $I0 = index key, '|'
    unless $I0 == -1 goto endif_2
    # only short or long
    $I0 = length key
    unless $I0 == 1 goto else_3
    $P0."short"(key)
    .return()
else_3:
    $P0."long"(key)
    .return()
endif_2:
    # short and long
    $I0 = index key, '|'
    long = substr key, 0, $I0
    inc $I0
    short = substr key, $I0
    $P0."long"(long)
    $P0."short"(short)
.end

=item C<Getopt::Obj::Spec add()>

Adds a new option to the parsing.  You don't need to know what class it is
(internal data), just that you get an object to invoke methods on.

=cut

.sub "add" :method
    .local pmc spec, specs
    spec = new ['Getopt';'Obj';'Spec']
    specs = getattribute self, "Specs"
    push specs, spec
    .return(spec)
.end

=item C<STRING getNameForKey(STRING key)>

Given a key, maybe long or short, or when storing, the name itself perhaps,
return the name for the key.

=cut

.sub "getNameForKey" :method
    .param string key

    .local int j, specslen
    .local pmc specs, spec
    .local string name, long, short
    specs = getattribute self, "Specs"
    specslen = specs
    j = 0
beginfor:
    unless j < specslen goto endfor
    spec = specs[j]
    name = spec."name"()
    if key == name goto return
    long = spec."long"()
    if key == long goto return
    short = spec."short"()
    if key == short goto return
    goto nextfor
return:
    .return(name, spec)

nextfor:
    inc j
    goto beginfor
endfor:
    # Don't return anything, easier to catch an exception...
    $I0 = self."notOptStop"()
    if $I0 goto finish
    $P0 = new 'Exception'
    $S0 = "Option '"
    $S0 = $S0 . key
    $S0 = $S0 . "' not in specs"
    $P0 = $S0
    throw $P0
finish:
    null $S0
    null $P0

    .return ($S0, $P0)
.end

=item C<INT self."notOptStop"()>

=item C<INT self."notOptStop"(INT val)>

Boolean method, so setting it to 2 is no different than setting it to 1.  If
notOptStop is set to a true value, then get_options will stop after it reaches
an argument not specified by the program.  This is either an unrecognized
option, such as a mistyped argument, or an argument means to be passed on again
later.  Or of course, it's not an argument at all and perhaps a filename.

=cut

.sub "notOptStop" :method
    .param int val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "notOptStop"
    unless opt goto else_0
    # Setting
    $P0 = val
    goto endif_0
else_0:
    # Getting
    val = $P0
endif_0:

    .return(val)
.end

=item C<MissingRequired(STRING arg)>

When a required argument is missing, throws an exception with the message
"Missing a required argument for option 'foo'".

=cut

.sub MissingRequired
    .param string arg

    $P0 = new 'Exception'
    $S0 = "Missing a required argument for option '"
    $S0 = $S0 . arg
    $S0 = $S0 . "'"
    $P0 = $S0
    throw $P0
.end

=back

=head2 Class Getopt::Obj::Spec

Internal use only, at least don't do any C<new ['Getopt';'Obj';'Spec'> yourself...
This makes an easy holder for each possible match.

=over 4

=cut

.namespace ['Getopt';'Obj';'Spec']

=item C<init()>

Set the defaults to all our attributes, more internal stuff.  Sets the default
"type" to C<Boolean>.

=cut

.sub init :vtable :method
    $P0 = new 'String'
    $P0 = ''
    setattribute self, "name", $P0
    # TODO? These next two will be ResizablePMCArray's
    # to allow the whole --height --length type thing
    $P0 = new 'String'
    $P0 = ''
    setattribute self, "long", $P0
    $P0 = new 'String'
    $P0 = ''
    setattribute self, "short", $P0
    $P0 = new 'Boolean'
    $P0 = 0
    setattribute self, "optarg", $P0
    $P0 = new 'String'
    $P0 = 'Boolean'
    setattribute self, "type", $P0
.end

=item C<STRING self."name"()>

=item C<STRING self."name"(STRING val)>

If val is given, set the name to that.  If val is not given, return either
name, long, or short, in that order.  Used for the return key.  So if you
define only a short option, but want a long name returned, set this.  The
partial intent of the method is to easily allow having an option have multiple
long/short arguments instead of one of each.

=cut

.sub name :method
    .param string val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "name"
    unless opt goto else
    # Setting
    $P0 = val
    goto endif
else:
    # Getting
    val = $P0
    if val != '' goto endif
    $P0 = getattribute self, "long"
    val = $P0
    if val != '' goto endif
    $P0 = getattribute self, "short"
    val = $P0
endif:

    .return(val)
.end

=item C<STRING self."long"()>

=item C<STRING self."long"(STRING val)>

If val is given, set the long value to that.  If val is not given, return the
string set as the long.

=cut

.sub "long" :method
    .param string val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "long"
    unless opt goto else_0
    # Setting
    $P0 = val
    goto endif_0
else_0:
    # Getting
    val = $P0
endif_0:

    .return(val)
.end

=item C<STRING self."short"()>

=item C<STRING self."short"(STRING val)>

If val is given, set the short value to that.  If val is not given, return the
string set as the short.

NOTE: There is no checking to ensure that short is only one character.

=cut

.sub "short" :method
    .param string val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "short"
    unless opt goto else_0
    # Setting
    $P0 = val
    goto endif_0
else_0:
    # Getting
    val = $P0
endif_0:

    .return(val)
.end

=item C<INT self."type"()>

=item C<INT self."type"(INT val)>

If val is given, set the type to that.  If val is not given, return the int set
as the type.

NOTE: It doesn't verify it's a correct type.

=over 4

=item C<Boolean>

A true/false value, the default.

For a short argument, it's simply C<-f>.  Groups of C<Boolean>'s tied
together, such as C<-foobar>, if C<-f>, C<-o>, C<-b>, C<-a>, and C<-r> are all
C<Boolean> values, then each will be set.  If C<-f> is a C<Boolean> but one
of the others is not, an exception is thrown.

For a long argument, it takes the form C<--foo>.  Usage such as C<--foo=this>
or C<--foo=> are allowed, but it just sets it to true, so no difference.

=item C<String>

A string.  This can take the form of C<--foo=bar>, C<-f bar>, or C<-fbar>.

=item C<Integer>

An integer, --foo=3.14 is stored as 3.  Type conversions are done by Parrot.
Same forms as for C<String>.

=item C<Float>

A float.  Same forms apply here as well.

=item C<Array>

An array, done via multiple arguments.  For something such as
C<-I./include -I./src/include> for example, C<I> will be an array of
C<./include> and C<./src/include>.  If only used once, it's a one sized array.

=item C<Hash>

A hash, such as defines.  For a short argument, the form is C<-Dfoo=bar>,
C<-Dfoo>, and C<--define=foo=bar>(both equal signs required).

=back

Do not hard code the integer values in, for the same reason as the rest of your
code.  There's no guarantees they won't be reassigned.

=cut

.sub "type" :method
    .param string val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "type"
    unless opt goto else_0
    # Setting
    $P0 = val
    goto endif_0
else_0:
    # Getting
    val = $P0
endif_0:

    .return(val)
.end

=item C<INT self."optarg"()>

=item C<INT self."optarg"(INT val)>

Boolean method, with explicit setting.  If optarg is set to a true value, then
the argument, e.g. C<bar> in C<--foo=bar>, is not mandatory.  In
C<-fbar>, C<-f> is set to C<bar>.  In C<-f bar> it is NOT set.

=cut

.sub "optarg" :method
    .param int val :optional
    .param int opt :opt_flag

    $P0 = getattribute self, "optarg"
    unless opt goto else_0
    # Setting
    $P0 = val
    goto endif_0
else_0:
    # Getting
    val = $P0
endif_0:


    .return(val)
.end

=back

=head1 TODO

=over 4

=item *

Actually check what's being passed instead of using type conversions?

=item *

Sub type, call a sub for a given argument, with C<argv> and C<return>.

=item *

How to handle an unknown arg, currently kept in argv.

=item *

Should a lonesome hyphen be a permitted value as not an option.  Currently kept
in argv in case the program wants it, such as indicating stdin or stdout.

=item *

For an arg to a short arg, e.g. -C -d, will put -d as the value for -C so long
as -C is not a C<Boolean>.  Should it be an error?

=back

=head1 BUGS

=over 4

=item *

If an option is considered optional, then with the short name, the next value
is not checked for at all.  If it's not optional, it's checked and all's well,
as described for C<obj."type"()>.

Not positive this is a bug...  And relates to the -f -b issue where if the
argument to -f is required, it will be given '-b'.

=item *

Bundling of options will only work for C<Boolean> options.  So my little "perl
pie" annoyance isn't handled, C<perl -pie "code">, although perl doesn't handle
it in a DWIM manner...

And it doesn't have good error correction....

=back

=head1 AUTHOR

Joshua Isom - C<loneowl@ritalin.shout.net>

=head1 SEE ALSO

The F<library/Getopt/Long.pir> Parrot library.

F<t/library/getopt_obj.t>

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
