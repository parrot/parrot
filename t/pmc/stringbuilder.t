#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/stringbuilder.t - StringBuilder

=head1 SYNOPSIS

    % prove t/pmc/stringbuilder.t

=head1 DESCRIPTION

Tests the C<StringBuilder> PMC.

=cut


.sub 'main' :main
    .include 'test_more.pir'

    test_create()               # 2 tests
    test_push_string()
    test_push_pmc()             # 4 tests
    test_push_string_unicode()  # 1 test
    test_i_concatenate()        # 1 test
    test_set_string_native()    # 4 tests
    test_set_string_native_with_hash()    # 2 tests
    test_set_pmc()
    test_substr()

    emit_with_pos_args()
    emit_with_percent_args()
    emit_with_named_args()
    emit_with_pos_and_named_args()

    test_unicode_conversion_tt1665()

    done_testing()

    # END_OF_TESTS
.end

.sub 'test_create'
    .local pmc sb
    sb = new ['StringBuilder']

    $I0 = isnull sb
    not $I0
    ok( $I0, 'StringBuilder created' )

    $S0 = sb
    is( $S0, '', '... with empty content')

.end

.sub 'test_push_string'
    .local pmc sb
    sb = new ["StringBuilder"]

    push sb, "foo"
    $S0 = sb
    is( $S0, "foo", "First string pushed")

    push sb, "bar"
    $S1 = sb
    is( $S1, "foobar", "Second string pushed")

    is( $S0, "foo", "... without clobbering first string")

    $I0 = sb
    is( $I0, 128, "... and capacity still 128" )

    $I0 = sb.'get_string_length'()
    is( $I0, 6,   "... and string length is correct")

    # Push large string which will cause reallocate
    $S99 = repeat "x", 128
    push sb, $S99

    $S0 = concat "foobar", $S99
    $S1 = sb
    is( $S0, $S1, "Push 128 chars string works")

    $I0 = sb
    is( $I0, 256, "... and capacity increased" )

    $S99 = repeat "x", 1000
    push sb, $S99

    $S0 = concat $S0, $S99
    $S1 = sb
    is( $S0, $S1, "Push 1000 chars string works")

    $I0 = sb
    is( $I0, 2048, "... and capacity increased" )

    $S99 = repeat "x", 12000
    push sb, $S99

    $S0 = concat $S0, $S99
    $S1 = sb
    is( $S0, $S1, "Push 10000 chars string works")

    $I0 = sb
    is( $I0, 16384, "... and capacity increased" )

    null $S0
    push sb, $S0
    $I0 = sb
    is( $I0, 16384, "push a null string does nothing" )

.end

.sub 'test_push_pmc'
    .local pmc sb
    sb = new ["StringBuilder"]

    box $P0, "foo"
    push sb, $P0
    $S0 = sb
    is( $S0, "foo", "First string pushed")

    box $P0, "bar"
    push sb, $P0
    $S1 = sb
    is( $S1, "foobar", "Second string pushed")

    is( $S0, "foo", "... without clobbering first string")

    $I0 = sb
    is( $I0, 128, "... and capacity still 128" )
.end

.sub 'test_push_string_unicode'
    .local pmc sb
    sb = new ["StringBuilder"]

    push sb, "le"
    push sb, unicode:"o "
    push sb, iso-8859-1:"tötsch"

    $S0 = sb
    is( $S0, iso-8859-1:"leo tötsch", "Unicode strings appened")
.end

.sub 'test_i_concatenate'
    .local pmc sb
    sb = new ["StringBuilder"]

    concat sb, "foo"

    $P0 = new ["String"]
    $P0 = "bar"
    concat sb, $P0

    sb .= "baz"

    $S0 = sb
    is( $S0, "foobarbaz", "StringBuilder handles concat properly")
.end

.sub 'test_set_string_native'
    .local pmc sb
    sb = new ["StringBuilder"]

    $S99 = "foo"
    sb   = $S99

    $S0  = sb
    is( $S0, "foo", "Assignment works")

    sb .= "bar"
    $S0  = sb
    is( $S0, "foobar", "... with appending string after")
    is( $S99, "foo", "... without touching of original string")

    # Assumed that the previous operations does not reach initial
    # capacity of the buffer, the next test should cause a
    # reallocation, ensuring full coverage of the set_string_native
    # vtable function.
    $S1 = repeat 'x', 4096
    sb = $S1
    $I0 = sb.'get_string_length'()
    is( $I0, 4096, "... with a big size change")
.end

.sub 'test_set_string_native_with_hash'
    .local pmc sb, hash
    sb   = new ["StringBuilder"]
    hash = new ['Hash']

    $S0 = "foo"
    hash[$S0] = "foo"
    sb   = $S0
    # Used later
    $S0  = sb

    sb .= "bar"
    $S1  = sb
    hash[$S1] = $S1

    $S99 = hash[$S0]
    is ( $S99, "foo", "First string stored in hash" )

    $S99 = hash[$S1]
    is ( $S99, "foobar", "Second string stored in hash" )

.end

.sub 'test_set_pmc'
    .local pmc sb, i
    sb = new ["StringBuilder"]
    i  = new ["Integer"], 17
    assign sb, i
    $S0 = sb
    $I0 = iseq $S0, '17'
    is( $I0, 1, "set_pmc gives the pmc string value")
.end

.sub test_substr
    .local pmc sb
    sb = new ["StringBuilder"]
    sb = 'foobar'
    $S0 = substr sb, 2, 3
    is( $S0, 'oba', "substr result is correct")
.end

.sub emit_with_pos_args
    .local pmc code
    code = new ["StringBuilder"]
    code."append_format"("label_%0:\n",          1234)
    code."append_format"("    say '%0, %1'\n",   "Hello", "World")
    code."append_format"("    %0 = %2\n", "$I0", 24, 48)
    is(code, <<'CODE', "code string with positional args looks fine")
label_1234:
    say 'Hello, World'
    $I0 = 48
CODE
.end

.sub emit_with_percent_args
    .local pmc code
    code = new ['StringBuilder']
    code."append_format"("label_%0:\n",    1234)
    code."append_format"("    say '%,'\n", "Hello")
    code."append_format"("    say '%,'\n", "Hello", "World", "of", "Parrot")
    code."append_format"("    say '%%0'\n")
    is(code, <<'CODE', "code string with % args looks fine")
label_1234:
    say 'Hello'
    say 'Hello, World, of, Parrot'
    say '%0'
CODE
.end

.sub emit_with_named_args
    .local pmc code
    code = new ['StringBuilder']
    code."append_format"("label_%a:\n",         "a"=>1234)
    code."append_format"("    say '%b, %c'\n",  "b"=>"Hello", "c"=>"World")
    code."append_format"("    say '%d'\n",      "b"=>"Hello", "c"=>"World")
    is(code, <<'CODE', "emit with named args looks fine")
label_1234:
    say 'Hello, World'
    say '%d'
CODE
.end

.sub emit_with_pos_and_named_args
    .local pmc code
    code = new ['StringBuilder']
    code."append_format"("label_%a:\n", "a"=>1234)
    code."append_format"("    %0 '%b, %c'\n", "say", "print", "b"=>"H", "c"=>"W")
    code."append_format"("    say '%,, %c'\n", "alpha", "beta", "b"=>"H", "c"=>"W")
    is(code, <<'CODE', "emit with pos + named args")
label_1234:
    say 'H, W'
    say 'alpha, beta, W'
CODE
.end

.sub "test_unicode_conversion_tt1665"
    .local pmc list
    list = new 'ResizablePMCArray'
    push list, 195
    push list, 182

    .local pmc iterator
    iterator = iter list
    .local pmc sb
    sb = new 'StringBuilder'
    sb = unicode:""
    loop:
      unless iterator goto done
      $P1 = shift iterator
      $I1 = $P1
      $S1 = chr $I1
      sb .= $S1
      goto loop
    done:
      $S0 = sb

    ok( $S0, "Pushing unicode strings doesn't kill StringBuilder")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

