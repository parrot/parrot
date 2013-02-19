# Copyright (C) 2006-2012, Parrot Foundation.

=head1 DESCRIPTION

High-level language macros make it easier to write readable and maintainable
PIR by preprocessing common HLL forms into their low level PIR forms. These
are B<not> actually high level constructs, but merely preprocessor directives.

=head2 Conditionals

When a conditional is labeled as a parameter, the valid syntax is limited.
Only code snippets such as C<$P0>, C<< $I0 <= 42 >>, C<null $P0>, are allowed.
Groupings such as C<< $I0 <= 42 || $I0 > 142 >> are not allowed, although it is
possible to write a macro that contains two parameters representing
conditionals. It's important to avoid the { } delimiter on the conditionals
since a newline in the conditional renders the generated PIR invalid.

=head2 Code blocks

The macro preprocessor is very simple.  But it allows using braces to delimit
code that contains commas or right parenthesis, C<)>, without causing an error.
This allows for nesting macros to near infinite depths.  And macro parameter
that uses a comma or right parenthesis must be enclosed in braces.

=head1 MACROS

=over 4

=item C<.NL()>

This is the most simple of macros.  Because PIR statements are delimited by
newlines, putting multiple statements, no matter how simple or short, is not
allowed.  Sometimes for readability you wish to have two on the same line.
Using C<.NL()> in a line will insert a linebreak.

=cut


.macro NL()
.endm


=item C<.If(conditional, code)>

Runs the code in C<code> if C<conditional> is true.

=cut

.macro If(conditional, code)
    unless .conditional goto .$endif
    .code
.label $endif:
.endm


=item C<.Unless(conditional, code)>

Runs the code in C<code> if C<conditional> is false.

=cut

.macro Unless(conditional, code)
    if .conditional goto .$endif
    .code
.label $endif:
.endm


=item C<.IfElse(conditional, true, false)>

Runs the code in C<true> if C<conditional> is true, otherwise runs the code in
C<false>.

=cut

.macro IfElse(conditional, true, false)
    unless .conditional goto .$else
    .true
    goto .$endif
.label $else:
    .false
.label $endif:
.endm


=item C<.While(conditional, code)>

Runs the code in C<code> as long as C<conditional> is true.

=cut

.macro While(conditional, code)
.label $beginwhile:
    unless .conditional goto .$endwhile
    .code
    goto .$beginwhile
.label $endwhile:
.endm


=item C<.DoWhile(code, conditional)>

Runs the code in C<code> once, and then as long as C<conditional> is true.

=cut

.macro DoWhile(code, conditional)
.label $beginwhile:
    .code
    if .conditional goto .$beginwhile
.endm

=item C<.Loop(code)>

Runs the code in C<code> forever.

=cut

.macro Loop(code)
.label $beginloop:
    .code
    goto .$beginloop
.endm

=item C<.For(start, conditional, continue, code)>

First C<start> is executed, such as C<i = 0>, and then if the C<conditional> is
true, runs C<code>, and then the C<continue> code, such as C<inc i>.

=cut

.macro For(start, conditional, cont, code)
    .start
.label $beginfor:
    unless .conditional goto .$endfor
    .code
    .cont
    goto .$beginfor
.label $endfor:
.endm


=item C<.Foreach(name, array, code)>

A simple foreach loop.  Given the aggregate C<array>, which B<must> be a
register, it iterates through the array, putting each value into C<name> to
work with in C<code>.

=cut

# GH #174 - the unlikely to conflict variable names here must be
# replaced with the .macro_local syntax.
.macro Foreach(name, array, code)
    .local int __Foreach__local__i
    .local int __Foreach__local__k
    __Foreach__local__i = 0
    __Foreach__local__k = .array
.label $beginforeach:
    unless __Foreach__local__i < __Foreach__local__k goto .$endforeach
    .name = .array[__Foreach__local__i]
    .code
    inc __Foreach__local__i
    goto .$beginforeach
.label $endforeach:
.endm


=back

=head1 Examples

=head2 Good morning!

"Hello, world!" is so mundane, make it more fun.

    .include "tm.pasm"
    .include "hllmacros.pir"
    .sub main :main
        $I0 = time
        $P0 = decodelocaltime $I0
        $I0 = $P0[.TM_HOUR]
        .IfElse($I0 < 12,{
            print "Good morning!\n"
        },{
            .IfElse($I0 > 18,{
                print "Good night!\n"
            },{
                print "Good evening!\n"
            })
        })
    .end

=head2 Simple looping

A simple demonstration of the For loop.

    .include "hllmacros.pir"
    .sub main :main
        print "For\n"
        .For(i = 0 , i < 5, inc i,
            print "\t"
            print i
            print "\n"
        )
    .end

A simple demonstration of the Foreach loop.

    .include "hllmacros.pir"
    .sub main :main
        print "Foreach\n"
        .local pmc array, letter
        array = new 'ResizablePMCArray'
        push array, "a"
        push array, "b"
        push array, "c"
        .Foreach(letter, array, {
            print "\t"
            print letter
            print " "
            .IfElse(letter == 'b',
                print "is b\n"
            ,
                print "isn't b\n"
            )
        })
    .end

Using C<.NL()>

    .local int i, j
    .For({i = 0 .NL() j = 11}, i < j, {inc i .NL() dec j }, {
        print i
        print "\t"
        print j
        print "\n"
    })


=head1 CAVEATS

The .Foreach macro is not nestable within itself currently.  You can use other macros inside a .Foreach loop, and the .Foreach loop can be nested inside other macros.

    .Foreach(foo, bar, {
        .Foreach(foobar, foo, {
            print foobar
        })
    })

Will not run as you would expect.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
