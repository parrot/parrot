#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/string.t - Parrot Strings

=head1 SYNOPSIS

     % prove t/op/string.t

=head1 DESCRIPTION

Tests Parrot string registers and operations.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(339)

    set_s_s_sc()
    test_clone()
    clone_null()
    test_length_i_s()
    zero_length_substr()
    chopn_with_clone()
    chopn_oob_values()
    three_argument_chopn()
    three_argument_chopn__oob_values()
    substr_tests()
    neg_substr_offset()
    exception_substr_oob()
    exception_substr_oob()
    len_greater_than_strlen()
    len_greater_than_strlen_neg_offset()
    replace_w_rep_eq_length()
    replace_w_replacement_gt_length()
    replace_w_replacement_lt_length()
    replace_vs_hash()
    replace__offset_at_end_of_string()
    exception_replace__offset_past_end_of_string()
    replace_neg_offset_repl_eq_length()
    replace_neg_offset_repl_gt_length()
    replace_neg_offset_repl_lt_length()
    exception_replace_neg_offset_out_of_string()
    replace_length_gt_strlen()
    replace_length_gt_strlen_neg_offset()
    replace_only_substr()
    three_arg_substr()
    exception_substr__pos_offset_zero_length_string()
    substr_offset_zero_zero_length_string()
    exception_substr_offset_one_zero_length_string()
    exception_substr_neg_offset_zero_length_string()
    zero_length_substr_zero_length_string()
    zero_length_substr_zero_length_string()
    three_arg_substr_zero_length_string()
    replace_zero_length_string()
    four_arg_substr_replace_zero_length_string()
    concat_s_s_sc_null_onto_null()
    concat_s_sc_repeated_two_arg_concats()
    concat_s_s_sc_foo_one_onto_null()
    test_concat_s_s_sc()
    concat_s_s_sc_s_sc()
    concat_ensure_copy_is_made()

    same_constant_twice_bug()
    exception_two_param_ord_empty_string()
    exception_two_param_ord_empty_string_register()
    exception_three_param_ord_empty_string()
    exception_three_param_ord_empty_string_register()
    two_param_ord_one_character_string()
    two_param_ord_multi_character_string()
    two_param_ord_one_character_string_register()
    three_param_ord_one_character_string()
    three_param_ord_one_character_string_register()
    three_param_ord_multi_character_string()
    three_param_ord_multi_character_string_register()
    exception_three_param_ord_multi_character_string()
    exception_three_param_ord_multi_character_string()
    three_param_ord_one_character_string_from_end()
    three_param_ord_one_character_string_register_from_end()
    three_param_ord_multi_character_string_from_end()
    three_param_ord_multi_character_string_register_from_end()
    exception_three_param_ord_multi_character_string_register_from_end_oob()
    chr_of_thirty_two_is_space_in_ascii()
    chr_of_sixty_five_is_a_in_ascii()
    chr_of_one_hundred_and_twenty_two_is_z_in_ascii()
    test_if_s_ic()
    repeat_s_s_sc_i_ic()
    exception_repeat_oob()
    exception_repeat_oob_repeat_p_p_p()
    exception_repeat_oob_repeate_p_p_i()
    encodingname_oob()
    index_three_arg_form()
    index_four_arg_form()
    index_four_arg_form_bug_twenty_two_thousand_seven_hundred_and_eighteen()
    index_trac_1482()
    index_null_strings()
    index_embedded_nulls()
    index_big_strings()
    index_big_hard_to_match_strings()
    index_with_different_charsets()
    negative_index_bug_35959()
    index_multibyte_matching()
    index_multibyte_matching_two()
    num_to_string()
    string_to_int()
    concat_or_substr_cow()
    constant_to_cstring()
    cow_with_chopn_leaving_original_untouched()
    check_that_bug_bug_16874_was_fixed()
    stress_concat()
    ord_and_substring_see_bug_17035()

    test_sprintf()
    other_form_of_sprintf_op()
    sprintf_left_justify()
    correct_precision_for_sprintf_x()
    test_find_encoding()
    test_assign()
    assign_and_globber()
    bands_null_string()
    bands_2()
    bands_3()
    bands_cow()
    bors_null_string()
    bors_2()
    bors_3()
    bors_cow()
    bxors_null_string()
    bxors_2()
    bxors_3()
    bxors_cow()
    bnots_null_string()
    bnots_2()
    bnots_cow()
    split_on_empty_string()
    split_on_non_empty_string()
    test_join()
    eq_addr_or_ne_addr()
    test_if_null_s_ic()
    test_upcase()
    test_downcase()
    test_titlecase()
    three_param_ord_one_character_string_register_i()
    three_param_ord_multi_character_string_i()
    three_param_ord_multi_character_string_register_i()
    exception_three_param_ord_multi_character_string_i()
    exception_three_param_ord_multi_character_string_i()
    three_param_ord_one_character_string_from_end_i()
    three_param_ord_one_character_string_register_from_end_i()
    three_param_ord_multi_character_string_from_end_i()
    three_param_ord_multi_character_string_register_from_end_i()
    exception_three_param_ord_multi_character_string_register_from_end_oob_i()
    more_string_to_int()
    constant_string_and_modify_in_situ_op_rt_bug_60030()
    corner_cases_of_numification()
    non_canonical_nan_and_inf()
    split_hll_mapped()
    # END_OF_TESTS
    join_get_string_returns_a_null_string()

.end

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub set_s_s_sc
    set $S4, "JAPH"
    set $S5, $S4

    is( $S4, "JAPH", '' )
    is( $S5, "JAPH", '' )
.end

.sub test_clone
    set   $S0, "Foo1"
    clone $S1, $S0

    is( $S0, "Foo1", '' )
    is( $S1, "Foo1", '' )

    clone $S1, "Bar1"
    is( $S1, "Bar1", '' )
.end

.sub clone_null
    null $S0
    clone $S1, $S0
    is( $S1, $S0, '' )
.end

.sub test_length_i_s
    set $I4, 0
    set $S4, "JAPH"
    length  $I4, $S4
    is( $I4, "4", '' )
.end

.sub zero_length_substr
    set $I4, 0
    set $S4, "JAPH"
    substr  $S3, $S4, 1, 0
    length  $I4, $S3
    is( $I4, "0", '' )
.end

.sub chopn_with_clone
    set $S4, "JAPHxyzw"
    set $S5, "japhXYZW"
    clone $S3, $S4
    set $I1, 4
    $S4 = chopn $S4, 3
    $S4 = chopn $S4, 1
    $S5 = chopn $S5, $I1

    is( $S4, "JAPH", '' )
    is( $S5, "japh", '' )
    is( $S3, "JAPHxyzw", '' )
.end

.sub chopn_oob_values
    set $S1, "A string of length 21"
    $S1 = chopn $S1, 0
    is( $S1, "A string of length 21", '' )

    $S1 = chopn $S1, 4
    is( $S1, "A string of lengt", '' )

    # -length cuts now
    $S1 = chopn $S1, -4
    is( $S1, "A st", '' )

    $S1 = chopn $S1, 1000
    is( $S1, "", '' )
.end

.sub three_argument_chopn
    set $S1, "Parrot"
    chopn   $S2, $S1, 0
    is( $S1, "Parrot", '' )
    is( $S2, "Parrot", '' )

    chopn   $S2, $S1, 1
    is( $S1, "Parrot", '' )
    is( $S2, "Parro", '' )

    set     $I0, 2
    chopn   $S2, $S1, $I0
    is( $S1, "Parrot", '' )
    is( $S2, "Parr", '' )

    chopn   $S2, "Parrot", 3
    is( $S2, "Par", '' )

    chopn   $S1, $S1, 5
    is( $S1, "P", '' )

    set     $S1, "Parrot"
    set     $S3, $S1
    chopn   $S2, $S1, 3
    is( $S3, "Parrot", '' )
.end
#
.sub three_argument_chopn__oob_values
    set $S1, "Parrot"
    chopn   $S2, $S1, 7
    is( $S1, "Parrot", '' )
    is( $S2, "", '' )

    chopn   $S2, $S1, -1
    is( $S1, "Parrot", '' )
    is( $S2, "P", '' )
.end

.sub substr_tests
    set $S4, "12345JAPH01"
    set $I4, 5
    set $I5, 4

    substr  $S5, $S4, $I4, $I5
    is( $S5, "JAPH", '' )

    substr $S5, $S4, $I4, 4
    is( $S5, "JAPH", '' )

    substr $S5, $S4, 5, $I5
    is( $S5, "JAPH", '' )

    substr $S5, $S4, 5, 4
    is( $S5, "JAPH", '' )

    substr $S5, "12345JAPH01", $I4, $I5
    is( $S5, "JAPH", '' )

    substr $S5, "12345JAPH01", $I4, 4
    is( $S5, "JAPH", '' )

    substr $S5, "12345JAPH01", 5, $I5
    is( $S5, "JAPH", '' )

    substr $S5, "12345JAPH01", 5, 4
    is( $S5, "JAPH", '' )
.end

# negative offsets
.sub neg_substr_offset
    set $S0, "A string of length 21"
    set $I0, -9
    set $I1, 6
    substr $S1, $S0, $I0, $I1
    is( $S0, "A string of length 21", '' )
    is( $S1, "length", '' )
.end

# This asks for substring that shouldn't be allowed...
.sub exception_substr_oob
    set $S0, "A string of length 21"
    set $I0, -99
    set $I1, 6
    push_eh handler
        substr $S1, $S0, $I0, $I1
handler:
    .exception_is( "Cannot take substr outside string" )
.end

# This asks for substring that shouldn't be allowed...
.sub exception_substr_oob
    set $S0, "A string of length 21"
    set $I0, 99
    set $I1, 6
    push_eh handler
        substr $S1, $S0, $I0, $I1
handler:
    .exception_is( "Cannot take substr outside string" )
.end

# This asks for substring much greater than length of original string
.sub len_greater_than_strlen
    set $S0, "A string of length 21"
    set $I0, 12
    set $I1, 1000
    substr $S1, $S0, $I0, $I1
    is( $S0, "A string of length 21", '' )
    is( $S1, "length 21", '' )
.end

# The same, with a negative offset
.sub len_greater_than_strlen_neg_offset
    set $S0, "A string of length 21"
    set $I0, -9
    set $I1, 1000
    substr $S1, $S0, $I0, $I1
    is( $S0, "A string of length 21", '' )
    is( $S1, "length 21", '' )
.end

.sub replace_w_rep_eq_length
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    replace $S2, $S0, 4, 3, $S1
    is( $S2, "abcdxyzhijk", '' )
.end

.sub replace_w_replacement_gt_length
    set $S0, "abcdefghijk"
    set $S1, "xyz0123"
    $S2 = replace $S0, 4, 3, $S1
    is( $S2, "abcdxyz0123hijk", '' )
.end

.sub replace_w_replacement_lt_length
    set $S0, "abcdefghijk"
    set $S1, "x"
    $S2 = replace $S0, 4, 3, $S1
    is( $S2, "abcdxhijk", '' )
.end

.sub replace__offset_at_end_of_string
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, 11, 3, $S1
    is( $S2, "abcdefghijkxyz", '' )
.end

.sub replace_vs_hash
    # Check that string hashval properly updated.
    .local pmc hash
    hash = new ['Hash']
    $S0 = "fooo"
    hash[$S0]   = 1
    hash["foo"] = 42
    $S0 = replace $S0, 1, 1, ''
    $S1 = hash[$S0]
    is( $S1, '42', 'replace behave it self')
.end

.sub exception_replace__offset_past_end_of_string
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    push_eh handler
    $S2 = replace $S0, 12, 3, $S1
    ok(0,"no exception")
handler:
    .exception_is( "Can only replace inside string or index after end of string" )
.end

.sub replace_neg_offset_repl_eq_length
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, -3, 3, $S1
    is( $S2, "abcdefghxyz", '' )
.end

.sub replace_neg_offset_repl_gt_length
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, -6, 2, $S1
    is( $S2, "abcdexyzhijk", '' )
.end

.sub replace_neg_offset_repl_lt_length
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, -6, 4, $S1
    is( $S2, "abcdexyzjk", '' )
.end

.sub exception_replace_neg_offset_out_of_string
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    push_eh handler
    $S2 = replace $S0, -12, 4, $S1
    ok(0,"no exception")
handler:
    .exception_is( "Can only replace inside string or index after end of string" )
.end

.sub replace_length_gt_strlen
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, 3, 11, $S1
    is( $S2, "abcxyz", '' )
.end

.sub replace_length_gt_strlen_neg_offset
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, -3, 11, $S1
    is( $S2, "abcdefghxyz", '' )
.end

.sub replace_only_substr
    set $S0, "abcdefghijk"
    set $S1, "xyz"
    $S2 = replace $S0, 3, 3, $S1
    is( $S2, "abcxyzghijk", '' )
.end

.sub three_arg_substr
    set $S0, "JAPH"
    substr $S1, $S0, 2
    is( $S1, "PH", '' )
.end

.sub exception_substr__pos_offset_zero_length_string
    set $S0, ""
    push_eh handler
    substr $S1, $S0, 10, 3
    ok(0,"no exception")
handler:
    .exception_is( "Cannot take substr outside string" )
.end

.sub substr_offset_zero_zero_length_string
    set $S0, ""
    substr $S1, $S0, 0, 1
    is( $S1, "", '' )
.end

.sub exception_substr_offset_one_zero_length_string
    set $S0, ""
    push_eh handler
    substr $S1, $S0, -1, 1
    ok(0,"no exception")
handler:
    .exception_is( "Cannot take substr outside string" )
.end

.sub exception_substr_neg_offset_zero_length_string
    set $S0, ""
    push_eh handler
    substr $S1, $S0, -10, 5
handler:
    .exception_is( "Cannot take substr outside string" )
.end

.sub zero_length_substr_zero_length_string
    set $S0, ""
    substr $S1, $S0, 10, 0
    is( $S1, "", '' )
.end

.sub zero_length_substr_zero_length_string
    set $S0, ""
    substr $S1, $S0, -10, 0
    is( $S1, "", '' )
.end

.sub three_arg_substr_zero_length_string
    set $S0, ""
    substr $S1, $S0, 2
    is( $S1, "", '' )
.end

.sub replace_zero_length_string
    set $S0, ""
    set $S1, "xyz"
    $S2 = replace $S0, 0, 3, $S1
    is( $S2, "xyz", '' )

    set $S3, ""
    set $S4, "abcde"
    $S5 = replace $S3, 0, 0, $S4
    is( $S5, "abcde", '' )
.end

.sub four_arg_substr_replace_zero_length_string
    set $S0, ""
    set $S1, "xyz"
    $S0 = replace $S0, 0, 3, $S1
    is( $S0, "xyz", '' )

    set $S2, ""
    set $S3, "abcde"
    $S2 = replace $S2, 0, 0, $S3
    is( $S2, "abcde", '' )
.end

.sub concat_s_s_sc_null_onto_null
    concat $S0, $S0
    is( $S0, "", '' )
    concat $S1, ""
    is( $S1, "", '' )
.end

.sub concat_s_sc_repeated_two_arg_concats
    set $S12, ""
    set $I0, 0
WHILE:
    concat $S12, "hi"
    add $I0, 1
    lt $I0, 10, WHILE
    is( $S12, "hihihihihihihihihihi", '' )
.end

.sub concat_s_s_sc_foo_one_onto_null
    concat $S0, "foo1"
    set $S1, "foo2"
    concat $S2, $S1
    is( $S0, "foo1", '' )
    is( $S2, "foo2", '' )
.end

.sub test_concat_s_s_sc
    set $S1, "fish"
    set $S2, "bone"
    concat $S1, $S2
    is( $S1, "fishbone", '' )
.end

.sub concat_s_s_sc_s_sc
    set $S1, "japh"
    set $S2, "JAPH"
    concat $S0, "japh", "JAPH"
    is( $S0, "japhJAPH", '' )

    concat $S0, $S1, "JAPH"
    is( $S0, "japhJAPH", '' )

    concat $S0, "japh", $S2
    is( $S0, "japhJAPH", '' )

    concat $S0, $S1, $S2
    is( $S0, "japhJAPH", '' )
.end

.sub concat_ensure_copy_is_made
    set $S2, "JAPH"
    concat $S0, $S2, ""
    concat $S1, "", $S2
    $S0 = chopn $S0, 1
    $S1 = chopn $S1, 1
    is( $S2, "JAPH", '' )
.end

.sub same_constant_twice_bug
   set     $S0, ""
   set     $S1, ""
   set     $S2, "foo"
   concat  $S1,$S1,$S2
   is( $S1, "foo", 'same constant twice bug' )
   is( $S0, "", 'same constant twice bug' )
.end

.sub exception_two_param_ord_empty_string
   push_eh handler
   ord $I0,""
   ok(0, 'no exception: 2-param ord, empty string' )
  handler:
   .exception_is( 'Cannot get character of empty string' )
.end

.sub exception_two_param_ord_empty_string_register
   push_eh handler
   ord $I0,$S0
   ok( 0, 'no exception: 2-param ord, empty string register' )
 handler:
   .exception_is( 'Cannot get character of NULL string' )
.end

.sub exception_three_param_ord_empty_string
   push_eh handler
   ord $I0,"",0
   ok(0, 'no exception: 3-param ord, empty string' )
 handler:
   .exception_is( 'Cannot get character of empty string' )
.end

.sub exception_three_param_ord_empty_string_register
   push_eh handler
   ord $I0,$S0,0
   ok( 0, 'no exception: 3-param ord, empty string register' )
 handler:
   .exception_is( 'Cannot get character of NULL string' )
.end

.sub two_param_ord_one_character_string
   ord $I0,"a"
   is( $I0, "97", '2-param ord, one-character string' )
.end

.sub two_param_ord_multi_character_string
   ord $I0,"abc"
   is( $I0, "97", '2-param ord, multi-character string' )
.end

.sub two_param_ord_one_character_string_register
   set $S0,"a"
   ord $I0,$S0
   is( $I0, "97", '2-param ord, one-character string register' )
.end

.sub three_param_ord_one_character_string
   ord $I0,"a",0
   is( $I0, "97", '3-param ord, one-character string' )
.end

.sub three_param_ord_one_character_string_register
   set $S0,"a"
   ord $I0,$S0,0
   is( $I0, "97", '3-param ord, one-character string register' )
.end

.sub three_param_ord_multi_character_string
   ord $I0,"ab",1
   is( $I0, "98", '3-param ord, multi-character string' )
.end

.sub three_param_ord_multi_character_string_register
   set $S0,"ab"
   ord $I0,$S0,1
   is( $I0, "98", '3-param ord, multi-character string register' )
.end

.sub exception_three_param_ord_multi_character_string
   push_eh handler
   ord $I0,"ab",2
   ok( 0, 'no exception: 3-param ord, multi-character string' )
 handler:
   .exception_is( 'Cannot get character past end of string' )
.end

.sub exception_three_param_ord_multi_character_string
   push_eh handler
   set $S0,"ab"
   ord $I0,$S0,2
   ok( 0, 'no exception: 3-param ord, multi-character string' )
 handler:
   .exception_is( 'Cannot get character past end of string' )
.end

.sub three_param_ord_one_character_string_from_end
   ord $I0,"a",-1
   is( $I0, "97", '3-param ord, one-character string, from end' )
.end

.sub three_param_ord_one_character_string_register_from_end
   set $S0,"a"
   ord $I0,$S0,-1
   is( $I0, "97", '3-param ord, one-character string register, from end' )
.end

.sub three_param_ord_multi_character_string_from_end
   ord $I0,"ab",-1
   is( $I0, "98", '3-param ord, multi-character string, from end' )
.end

.sub three_param_ord_multi_character_string_register_from_end
    set $S0,"ab"
    ord $I0,$S0,-1
    is( $I0, "98", '3-param ord, multi-character string register, from end' )
.end

.sub exception_three_param_ord_multi_character_string_register_from_end_oob
    push_eh handler
    set $S0,"ab"
    ord $I0,$S0,-3
    ok( 0, 'no exception: 3-param ord, multi-character string register, from end, OOB' )
  handler:
    .exception_is( 'Cannot get character before beginning of string' )
.end

.sub chr_of_thirty_two_is_space_in_ascii
    chr $S0, 32
    is( $S0, " ", 'chr of 32 is space in ASCII' )
.end

.sub chr_of_sixty_five_is_a_in_ascii
    chr $S0, 65
    is( $S0, "A", 'chr of 65 is A in ASCII' )
.end

.sub chr_of_one_hundred_and_twenty_two_is_z_in_ascii
    chr $S0, 122
    is( $S0, "z", 'chr of 122 is z in ASCII' )
.end

.sub test_if_s_ic
    set $S0, "I've told you once, I've told you twice..."
    ok( $S0, 'normal strings are true' )

    set $S0, "0.0"
    ok( $S0, '0.0 is true' )

    set $S0, ""
    nok( $S0, 'empty string is false' )

    set $S0, "0"
    nok( $S0, '"0" string is false' )

    set $S0, "0e0"
    ok( $S0, 'string "0e0" is true' )

    set $S0, "x"
    ok( $S0, 'string "x" is true' )

    set $S0, "\\x0"
    ok( $S0, 'string "\\x0" is true' )

    set $S0, "\n"
    ok( $S0, 'string "\n" is true' )

    set $S0, " "
    ok( $S0, 'string " " is true' )

    # An empty register should be false...
    nok( $S1, 'empty register is false' )
.end

.sub repeat_s_s_sc_i_ic
    set $S0, "x"
    repeat $S1, $S0, 12
    is( $S0, "x", 'repeat_s_s|sc_i|ic' )
    is( $S1, "xxxxxxxxxxxx", 'repeat_s_s|sc_i|ic' )

    set $I0, 12
    set $S2, "X"
    repeat $S3, $S2, $I0
    is( $S2, "X", 'repeat_s_s|sc_i|ic' )
    is( $S3, "XXXXXXXXXXXX", 'repeat_s_s|sc_i|ic' )

    repeat $S4, "~", 12
    is( $S4, "~~~~~~~~~~~~", 'repeat_s_s|sc_i|ic' )

    repeat $S5, "~", $I0
    is( $S5, "~~~~~~~~~~~~", 'repeat_s_s|sc_i|ic' )


    repeat $S6, "***", 0
    is( $S6, "", 'repeat_s_s|sc_i|ic' )
.end

.sub exception_repeat_oob
    push_eh handler
    repeat $S0, "japh", -1
  handler:
    .exception_is( 'Cannot repeat with negative arg' )
.end

.sub exception_repeat_oob_repeat_p_p_p
    push_eh handler
    $P0 = new ['String']
    $P1 = new ['String']
    $P2 = new ['Integer']
    $P2 = -1
    repeat $P1, $P0, $P2
  handler:
    .exception_is( 'Cannot repeat with negative arg' )
.end

.sub exception_repeat_oob_repeate_p_p_i
    push_eh handler
    $P0 = new ['String']
    $P1 = new ['String']
    repeat $P1, $P0, -1
  handler:
    .exception_is( 'Cannot repeat with negative arg' )
.end

.sub encodingname_oob
    $I0 = -1
    $S0 = encodingname -1
    $S0 = encodingname $I0
    ok( 1, "no exceptions in encodingname_oob" )
.end

.sub index_three_arg_form
    set $S0, "Parrot"
    set $S1, "Par"
    index $I1, $S0, $S1
    is( $I1, "0", 'index, 3-arg form' )

    set $S1, "rot"
    index $I1, $S0, $S1
    is( $I1, "3", 'index, 3-arg form' )

    set $S1, "bar"
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, 3-arg form' )

    # Ascii - Non-ascii, same content
    set $S0, "hello"
    set $S1, unicode:"hello"
    index $I1, $S0, $S1
    is( $I1, "0", 'index, 3-arg form' )
    index $I1, $S1, $S0
    is( $I1, "0", 'index, 3-arg form' )

    # Non-ascii, source shorter than searched
    set $S0, unicode:"-o"
    set $S1, unicode:"@INC"
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, 3-arg form' )
.end

.sub index_four_arg_form
    set $S0, "Barbarian"
    set $S1, "ar"
    index $I1, $S0, $S1, 0
    is( $I1, "1", 'index, 4-arg form' )

    index $I1, $S0, $S1, 2
    is( $I1, "4", 'index, 4-arg form' )

    set $S1, "qwx"
    index $I1, $S0, $S1, 0
    is( $I1, "-1", 'index, 4-arg form' )

    # Ascii - Non-ascii, same content
    set $S0, "hello"
    set $S1, unicode:"hello"
    index $I1, $S0, $S1, 0
    is( $I1, "0", 'index, 4-arg form' )
    index $I1, $S1, $S0, 0
    is( $I1, "0", 'index, 4-arg form' )
.end

.sub index_four_arg_form_bug_twenty_two_thousand_seven_hundred_and_eighteen
    set $S1, "This is not quite right"
    set $S0, " is "
    index $I0, $S1, $S0, 0
    is( $I0, "4", 'index, 4-arg form, bug 22718' )

    set $S0, "is"
    index $I0, $S1, $S0, 0
    is( $I0, "2", 'index, 4-arg form, bug 22718' )
.end

.sub index_trac_1482
    $S0 = unicode:"bubuc"
    $S1 = unicode:"buc"

    $I0 = index $S0, $S1, 0
    is ($I0, 2, 'index, 4-arg, partial-match causes failure: TT #1482')
.end

.sub index_null_strings
    set $S0, "Parrot"
    set $S1, ""
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, null strings' )

    index $I1, $S0, $S1, 0
    is( $I1, "-1", 'index, null strings' )

    index $I1, $S0, $S1, 5
    is( $I1, "-1", 'index, null strings' )

    index $I1, $S0, $S1, 6
    is( $I1, "-1", 'index, null strings' )

    set $S0, ""
    set $S1, "a"
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, null strings' )

    index $I1, $S0, $S1, 0
    is( $I1, "-1", 'index, null strings' )

    set $S0, "Parrot"
    null $S1
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, null strings' )

    null $S0
    null $S1
    index $I1, $S0, $S1
    is( $I1, "-1", 'index, null strings' )
.end

.sub index_embedded_nulls
    set $S0, "Par\0\0rot"
    set $S1, "\0"
    index $I1, $S0, $S1
    is( $I1, "3", 'index, embedded nulls' )

    index $I1, $S0, $S1, 4
    is( $I1, "4", 'index, embedded nulls' )
.end

.sub index_big_strings
    set $S0, "a"
    repeat $S0, $S0, 10000
    set $S1, "a"
    repeat $S1, $S1, 500
    index $I1, $S0, $S1
    is( $I1, "0", 'index, big strings' )

    index $I1, $S0, $S1, 1234
    is( $I1, "1234", 'index, big strings' )

    index $I1, $S0, $S1, 9501
    is( $I1, "-1", 'index, big strings' )
.end

# Builds a 24th iteration fibonacci string (approx. 100K)
.sub index_big_hard_to_match_strings
    set $S1, "a"
    set $S2, "b"
    set $I0, 0
  LOOP:
    set $S3, $S1
    concat $S1, $S2, $S3
    set $S2, $S3
    inc $I0
    lt $I0, 24, LOOP
    index $I1, $S1, $S2
    is( $I1, "46368", 'index, big, hard to match strings' )
    index $I1, $S1, $S2, 50000
    is( $I1, "-1", 'index, big, hard to match strings' )
.end

.sub index_with_different_charsets
    set $S0, "Parrot"
    set $S1, "rot"
    index $I1, $S0, $S1
    is( $I1, "3", 'default - default' )

    set $S0, ascii:"Parrot"
    set $S1, ascii:"rot"
    index $I1, $S0, $S1
    is( $I1, "3", 'ascii - ascii')

    set $S0, "Parrot"
    set $S1, ascii:"rot"
    index $I1, $S0, $S1
    is( $I1, "3", 'default - ascii' )

    set $S0, ascii:"Parrot"
    set $S1, "rot"
    index $I1, $S0, $S1
    is( $I1, "3", 'ascii - default' )

    set $S0, binary:"Parrot"
    set $S1, binary:"rot"
    index $I1, $S0, $S1
    is( $I1, "-1", 'binary - binary' )
.end

.sub negative_index_bug_35959
    index $I1, "u", "t", -123456
    is( $I1, "-1", 'negative index #35959' )

    index $I1, "u", "t", -123456789
    is( $I1, "-1", 'negative index #35959' )
.end

.sub index_multibyte_matching
    skip( 3, "Pending rework of creating non-ascii literals" )

    # set $S0, "\xAB"
    # find_chartype $I0, "8859-1"
    # set_chartype $S0, $I0
    # find_encoding $I0, "singlebyte"
    # set_encoding $S0, $I0
    # find_encoding $I0, "utf8"
    # find_chartype $I1, "unicode"
    # transcode $S1, $S0, $I0, $I1
    # is( $S0, $S1, 'equal' );

    # index $I0, $S0, $S1
    # is( $I0, "0", 'index, multibyte matching' )

    # index $I0, $S1, $S0
    # is( $I0, "0", 'index, multibyte matching' )
.end

.sub index_multibyte_matching_two
    skip( 2, "Pending rework of creating non-ascii literals" )
    # set $S0, "\xAB\xBA"
    # set $S1, "foo\xAB\xAB\xBAbar"
    # find_chartype $I0, "8859-1"
    # set_chartype $S0, $I0
    # find_encoding $I0, "singlebyte"
    # set_encoding $S0, $I0
    # find_chartype $I0, "unicode"
    # find_encoding $I1, "utf8"
    # transcode $S1, $S1, $I1, $I0
    # index $I0, $S0, $S1
    # is( $I0, "-1", 'index, multibyte matching 2' )
    # index $I0, $S1, $S0
    # is( $I0, "4", 'index, multibyte matching 2' )
.end

.sub num_to_string
    set $N0, 80.43
    set $S0, $N0
    is( $S0, "80.43", 'num to string' )

    set $N0, -1.111111
    set $S0, $N0
    is( $S0, "-1.111111", 'num to string' )
.end

.sub string_to_int
    set $S0, "123"
    set $I0, $S0
    is( $I0, "123", 'string to int' )

    set $S0, " 1"
    set $I0, $S0
    is( $I0, "1", 'string to int' )

    set $S0, "-1"
    set $I0, $S0
    is( $I0, "-1", 'string to int' )

    set     $S0, "Not a number"
    set $I0, $S0
    is( $I0, "0", 'string to int' )

    set $S0, ""
    set $I0, $S0
    is( $I0, "0", 'string to int' )
.end

.sub concat_or_substr_cow
    set $S0, "<JA"
    set $S1, "PH>"
    set $S2, ""
    concat $S2, $S2, $S0
    concat $S2, $S2, $S1
    is( $S2, "<JAPH>", 'concat/substr (COW)' )

    substr $S0, $S2, 1, 4
    is( $S0, "JAPH", 'concat/substr (COW)' )
.end

.sub constant_to_cstring
    stringinfo $I0, "\n", 2
    stringinfo $I1, "\n", 2
    is( $I1, $I0, 'constant to cstring' )

    stringinfo $I2, "\n", 2
    is( $I2, $I0, 'constant to cstring' )
.end

.sub cow_with_chopn_leaving_original_untouched
    set $S0, "ABCD"
    clone $S1, $S0
    $S0 = chopn $S0, 1
    is( $S0, "ABC", 'COW with chopn leaving original untouched' )
    is( $S1, "ABCD", 'COW with chopn leaving original untouched' )
.end

.sub check_that_bug_bug_16874_was_fixed
    set $S0,  "foo     "
    set $S1,  "bar     "
    set $S2,  "quux    "
    set $S15, ""
    concat $S15, $S0
    concat $S15, $S1
    concat $S15, $S2
    is( $S15, "foo     bar     quux    ", 'Check that bug #16874 was fixed' )
.end

.sub stress_concat
    set $I0, 1000
    set $S0, "michael"
  LOOP:
    set $S2, $I0
    concat $S1, $S0, $S2
    concat $S3, "mic", "hael"
    concat $S3, $S3, $S2
    eq $S1, $S3, BOTTOM
    ok(0, 'failed stress concat test')
    end

  BOTTOM:
    sub $I0, $I0, 1
    ne $I0, 0, LOOP
    ok(1, 'stress concat test')
.end

.sub ord_and_substring_see_bug_17035
    set $S0, "abcdef"
    substr $S1, $S0, 2, 3
    ord $I0, $S0, 2
    ord $I1, $S1, 0
    ne $I0, $I1, fail
    ord $I0, $S0, 3
    ord $I1, $S1, 1
    ne $I0, $I1, fail
    ord $I0, $S0, 4
    ord $I1, $S1, 2
    ne $I0, $I1, fail
    ok(1, 'ord and substring #17035')
    goto end
  fail:
    ok(0, 'failed: ord and substring #17035')
  end:
.end

.sub test_sprintf
    branch MAIN
  NEWARYP:
    new $P1, 'ResizablePMCArray'
    set $P1[0], $P0
    local_return $P4
  NEWARYS:
    new $P1, 'ResizablePMCArray'
    set $P1[0], $S0
    local_return $P4
  NEWARYI:
    new $P1, 'ResizablePMCArray'
    set $P1[0], $I0
    local_return $P4
  NEWARYN:
    new $P1, 'ResizablePMCArray'
    set $P1[0], $N0
    local_return $P4
  PRINTF:
    sprintf $S2, $S1, $P1
    is( $S2, $S99, $S1 )
    local_return $P4

  MAIN:
    new $P4, 'ResizableIntegerArray'
    set $S1, "Hello, %s"
    set $S0, "Parrot!"
    set $S99, "Hello, Parrot!"
    local_branch $P4, NEWARYS
    local_branch $P4, PRINTF

    set $S1, "Hash[0x%x]"
    set $I0, 256
    set $S99, "Hash[0x100]"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "Hash[0x%lx]"
    set $I0, 256
    set $S99, "Hash[0x100]"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "Hello, %.2s!"
    set $S0, "Parrot"
    set $S99, "Hello, Pa!"
    local_branch $P4, NEWARYS
    local_branch $P4, PRINTF

    set $S1, "Hello, %Ss"
    set $S0, $S2
    set $S99, "Hello, Hello, Pa!"
    local_branch $P4, NEWARYS
    local_branch $P4, PRINTF

    set $S1, "1 == %Pd"
    new $P0, 'Integer'
    set $P0, 1
    set $S99, "1 == 1"
    local_branch $P4, NEWARYP
    local_branch $P4, PRINTF

    set $S1, "-255 == %vd"
    set $I0, -255
    set $S99, "-255 == -255"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "+123 == %+vd"
    set $I0, 123
    set $S99, "+123 == +123"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "256 == %vu"
    set $I0, 256
    set $S99, "256 == 256"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "1 == %+vu"
    set $I0, 1
    set $S99, "1 == 1"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "001 == %0.3u"
    set $I0, 1
    set $S99, "001 == 001"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "001 == %+0.3u"
    set $I0, 1
    set $S99, "001 == 001"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "0.500000 == %f"
    set $N0, 0.5
    set $S99, "0.500000 == 0.500000"
    local_branch $P4, NEWARYN
    local_branch $P4, PRINTF

    set $S1, "0.500 == %5.3f"
    set $N0, 0.5
    set $S99, "0.500 == 0.500"
    local_branch $P4, NEWARYN
    local_branch $P4, PRINTF

    set $S1, "0.001 == %g"
    set $N0, 0.001
    set $S99, "0.001 == 0.001"
    local_branch $P4, NEWARYN
    local_branch $P4, PRINTF

    set $S1, "1e+06 == %g"
    set $N0, 1.0e6
    set $S99, "1e+06 == 1e+06"
    local_branch $P4, NEWARYN
    local_branch $P4, PRINTF

    set $S1, "0.5 == %3.3g"
    set $N0, 0.5
    set $S99, "0.5 == 0.5"
    local_branch $P4, NEWARYN
    local_branch $P4, PRINTF

    set $S1, "%% == %%"
    set $I0, 0
    set $S99, "% == %"
    local_branch $P4, NEWARYI
    local_branch $P4, PRINTF

    set $S1, "That's all, %s"
    set $S0, "folks!"
    set $S99, "That's all, folks!"
    local_branch $P4, NEWARYS
    local_branch $P4, PRINTF
.end

.sub other_form_of_sprintf_op
    new $P4, 'ResizableIntegerArray'
    new $P3, 'String'
    new $P2, 'String'
    set $P2, "15 is %b"
    new $P1, 'ResizablePMCArray'
    set $P1[0], 15
    sprintf $P3, $P2, $P1
    is( $P3, "15 is 1111", 'other form of sprintf op' )

    new $P2, 'String'
    set $P2, "128 is %o"
    new $P1, 'ResizablePMCArray'
    set $P1[0], 128
    sprintf $P3, $P2, $P1
    is( $P3, "128 is 200", 'other form of sprintf op' )
.end

.sub sprintf_left_justify
    $P0 = new 'ResizablePMCArray'
    $P1 = new 'Integer'
    $P1 = 10
    $P0[0] = $P1
    $P1 = new 'String'
    $P1 = "foo"
    $P0[1] = $P1
    $P1 = new 'String'
    $P1 = "bar"
    $P0[2] = $P1
    $S0 = sprintf "%-*s - %s", $P0
    is( $S0, "foo        - bar", 'sprintf - left justify' )
.end


.sub correct_precision_for_sprintf_x
    .include "iglobals.pasm"

    # Create the string via concat
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int intvalsize
    intvalsize = config['intvalsize']

    $S0 = ''
    $I0 = 1
    $I1 = intvalsize * 2
  loop:
    concat $S0, 'f'
    inc $I0
    le $I0, $I1, loop
  padding_loop:
    concat $S0, ' '
    inc $I0
    le $I0, 20, padding_loop

    # Now see what sprintf comes up with
    $P0 = new 'ResizablePMCArray'
    $P0[0] = -1
    $S1 = sprintf "%-20x", $P0
    is( $S1, $S0, 'Correct precision for %x' )
.end

.sub test_find_encoding
    skip( 4, "Pending reimplementation of find_encoding" )
    # find_encoding $I0, "singlebyte"
    # is( $I0, "0", 'find_encoding' )
    # find_encoding $I0, "utf8"
    # is( $I0, "1", 'find_encoding' )
    # find_encoding $I0, "utf16"
    # is( $I0, "2", 'find_encoding' )
    # find_encoding $I0, "utf32"
    # is( $I0, "3", 'find_encoding' )
.end

.sub test_assign
    set $S4, "JAPH"
    assign  $S5, $S4
    is( $S4, "JAPH", 'assign' )
    is( $S5, "JAPH", 'assign' )
.end

.sub assign_and_globber
    set $S4, "JAPH"
    assign  $S5, $S4
    assign  $S4, "Parrot"
    is( $S4, "Parrot", 'assign & globber' )
    is( $S5, "JAPH", 'assign & globber' )
.end

.sub bands_null_string
    null $S1
    set $S2, "abc"
    $S1 = bands $S1, $S2
    null $S3
    is( $S1, $S3, 'ok1' )

    set $S1, ""
    $S1 = bands $S1, $S2
    nok( $S1, 'ok2' )

    null $S2
    set $S1, "abc"
    $S1 = bands $S1, $S2
    null $S3
    is( $S1, $S3, 'ok3' )

    set $S2, ""
    $S1 = bands $S1, $S2
    nok( $S1, 'ok4' )
.end

.sub bands_2
    set $S1, "abc"
    set $S2, "EE"
    $S1 = bands $S1, $S2
    is( $S1, "A@", 'bands 2' )
    is( $S2, "EE", 'bands 2' )
.end

.sub bands_3
    set $S1, "abc"
    set $S2, "EE"
    bands $S0, $S1, $S2
    is( $S0, "A@", 'bands 3' )
    is( $S1, "abc", 'bands 3' )
    is( $S2, "EE", 'bands 3' )
.end

.sub bands_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bands $S1, "bar"
    is( $S2, "foo", 'bands COW' )
.end

.sub bors_null_string
    null $S1
    null $S2
    $S1 = bors $S1, $S2
    null $S3
    is( $S1, $S3, 'bors NULL string' )

    null $S1
    set $S2, ""
    $S1 = bors $S1, $S2
    null $S3
    is( $S1, $S3, 'bors NULL string' )

    $S2 = bors $S2, $S1
    is( $S2, $S3, 'bors NULL string' )

    null $S1
    set $S2, "def"
    $S1 = bors $S1, $S2
    is( $S1, "def", 'bors NULL string' )

    null $S2
    $S1 = bors $S1, $S2
    is( $S1, "def", 'bors NULL string' )

    null $S1
    null $S2
    bors $S3, $S1, $S2
    null $S4
    is( $S3, $S4, 'bors NULL string' )

    set $S1, ""
    bors $S3, $S1, $S2
    is( $S3, $S4, 'bors NULL string' )

    bors $S3, $S2, $S1
    is( $S3, $S4, 'bors NULL string' )

    set $S1, "def"
    bors $S3, $S1, $S2
    is( $S3, "def", 'bors NULL string' )

    bors $S3, $S2, $S1
    is( $S3, "def", 'bors NULL string' )
.end

.sub bors_2
    set $S1, "abc"
    set $S2, "EE"
    $S1 = bors $S1, $S2
    is( $S1, "egc", 'bors 2' )
    is( $S2, "EE", 'bors 2' )
.end

.sub bors_3
    set $S1, "abc"
    set $S2, "EE"
    bors $S0, $S1, $S2
    is( $S0, "egc", 'bors 3' )
    is( $S1, "abc", 'bors 3' )
    is( $S2, "EE", 'bors 3' )
.end

.sub bors_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bors $S1, "bar"
    is( $S2, "foo", 'bors COW' )
.end

.sub bxors_null_string
    null $S1
    null $S2
    $S1 = bxors $S1, $S2
    null $S3
    is( $S1, $S3, 'bxors NULL string' )

    null $S1
    set $S2, ""
    $S1 = bxors $S1, $S2
    null $S3
    is( $S1, $S3, 'bxors NULL string' )

    $S2 = bxors $S2, $S1
    is( $S2, $S3, 'bxors NULL string' )

    null $S1
    set $S2, "abc"
    $S1 = bxors $S1, $S2
    is( $S1, "abc", 'bxors NULL string' )

    null $S2
    $S1 = bxors $S1, $S2
    is( $S1, "abc", 'bxors NULL string' )

    null $S1
    null $S2
    bxors $S3, $S1, $S2
    null $S4
    is( $S3, $S4, 'bxors NULL string' )

    set $S1, ""
    bxors $S3, $S1, $S2
    is( $S3, $S4, 'bxors NULL string' )

    bxors $S3, $S2, $S1
    is( $S3, $S4, 'bxors NULL string' )

    set $S1, "abc"
    bxors $S3, $S1, $S2
    is( $S3, "abc", 'bxors NULL string' )

    bxors $S3, $S2, $S1
    is( $S3, "abc", 'bxors NULL string' )
.end

.sub bxors_2
    set $S1, "a2c"
    set $S2, "Dw"
    $S1 = bxors $S1, $S2
    is( $S1, "%Ec", 'bxors 2' )
    is( $S2, "Dw", 'bxors 2' )

    set $S1, "abc"
    set $S2, "   X"
    $S1 = bxors $S1, $S2
    is( $S1, "ABCX", 'bxors 2' )
    is( $S2, "   X", 'bxors 2' )
.end

.sub bxors_3
    set $S1, "a2c"
    set $S2, "Dw"
    bxors $S0, $S1, $S2
    is( $S0, "%Ec", 'bxors 3' )
    is( $S1, "a2c", 'bxors 3' )
    is( $S2, "Dw", 'bxors 3' )

    set $S1, "abc"
    set $S2, "   Y"
    bxors $S0, $S1, $S2
    is( $S0, "ABCY", 'bxors 3' )
    is( $S1, "abc", 'bxors 3' )
    is( $S2, "   Y", 'bxors 3' )
.end

.sub bxors_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    $S1 = bxors $S1, "bar"
    is( $S2, "foo", 'bxors COW' )
.end

.sub bnots_null_string
    null $S1
    null $S2
    bnots $S1, $S2
    null $S3
    is( $S1, $S3, 'bnots NULL string' )

    null $S1
    set $S2, ""
    bnots $S1, $S2
    null $S3
    is( $S1, $S3, 'bnots NULL string' )

    bnots $S2, $S1
    is( $S2, $S3, 'bnots NULL string' )
.end

# This was the previous test used for t/native_pbc/string.t
.sub bnots_2
    skip( 4, "No unicode yet" )
    # getstdout $P0
    # push $P0, "utf8"
    # set $S1, "a2c"
    # bnots $S2, $S1
    # is( $S1, "a2c", 'bnots 2' )
    # is( $S2, "\xC2\x9E\xC3\x8D\xC2\x9C", 'bnots 2' )
    #
    # bnots $S1, $S1
    # is( $S1, "\xC2\x9E\xC3\x8D\xC2\x9C", 'bnots 2' )
    #
    # bnots $S1, $S1
    # is( $S1, "a2c", 'bnots 2' )
.end

.sub bnots_cow
    set $S1, "foo"
    substr $S2, $S1, 0, 3
    bnots $S1, $S1
    is( $S2, "foo", 'bnots COW' )
.end

.sub split_on_empty_string
    split $P1, "", ""
    set $I1, $P1
    is( $I1, "0", 'split on empty string' )

    split $P0, "", "ab"
    set $I0, $P0
    is( $I0, "2", 'split on empty string' )

    set $S0, $P0[0]
    is( $S0, "a", 'split on empty string' )

    set $S0, $P0[1]
    is( $S0, "b", 'split on empty string' )
.end

.sub split_on_non_empty_string
    split $P0, "a", "afooabara"
    set $I0, $P0
    is( $I0, "5", 'split on non-empty string' )

    set $S0, $P0[0]
    is( $S0, "", 'split on non-empty string' )
    set $S0, $P0[1]
    is( $S0, "foo", 'split on non-empty string' )
    set $S0, $P0[2]
    is( $S0, "b", 'split on non-empty string' )
    set $S0, $P0[3]
    is( $S0, "r", 'split on non-empty string' )
    set $S0, $P0[4]
    is( $S0, "", 'split on non-empty string' )
.end

.sub test_join
    new $P0, 'ResizablePMCArray'
    join $S0, "--", $P0
    is( $S0, "", 'join' )

    push $P0, "a"
    join $S0, "--", $P0
    is( $S0, "a", 'join' )

    new $P0, 'ResizablePMCArray'
    push $P0, "a"
    push $P0, "b"
    join $S0, "--", $P0
    is( $S0, "a--b", 'join' )
.end

# join: get_string returns a null string --------
.namespace ["Foo5"]
    .sub get_string :vtable :method
        .local string ret
        null ret
        .begin_return
        .set_return ret
        .end_return
    .end
.namespace []   # revert to root for next test
.sub join_get_string_returns_a_null_string
    newclass $P0, "Foo5"
    new $P0, 'ResizablePMCArray'
    $P1 = new "Foo5"
    push $P0, $P1
    join $S0, "", $P0
    is( $S0, "", 'join: get_string returns a null string' )
.end

.sub eq_addr_or_ne_addr
    set $S0, "Test"
    set $S1, $S0

    set $I99, 1
    eq_addr $S1, $S0, OK1
      set $I99, 0
  OK1:
    ok($I99, 'eq_addr/ne_addr')

    set $S0, $S1
    set $I99, 0
    ne_addr $S1, $S0, BAD4
      set $I99, 1
  BAD4:
    ok($I99, 'eq_addr/ne_addr')
.end

.sub test_if_null_s_ic
    set $S0, "foo"
    $I99 = 0
    if_null $S0, ERROR
      $I99 = 1
  ERROR:
    ok($I99, 'if_null s_ic' )

    null $S0
    $I99 = 1
    if_null $S0, OK
        $I99 = 0
  OK:
    ok($I99, 'if_null s_ic' )
.end

.sub test_upcase
    set $S0, "abCD012yz"
    upcase $S1, $S0
    is( $S1, "ABCD012YZ", 'upcase' )

    push_eh catch1
    null $S9
    null $S0
    upcase $S1, $S0
    pop_eh
    goto null1
catch1:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null1:
    is ($S9, "Can't upcase NULL string", 'upcase null')

    push_eh catch2
    null $S9
    null $S0
    $S0 = upcase $S0
    pop_eh
    goto null2
catch2:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null2:
    is ($S9, "Can't upcase NULL string", 'upcase inplace null')
.end

.sub test_downcase
    set $S0, "ABcd012YZ"
    downcase $S1, $S0
    is( $S1, "abcd012yz", 'downcase' )

    push_eh catch1
    null $S9
    null $S0
    downcase $S1, $S0
    pop_eh
    goto null1
catch1:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null1:
    is ($S9, "Can't downcase NULL string", 'downcase null')

    push_eh catch2
    null $S9
    null $S0
    $S0 = downcase $S0
    pop_eh
    goto null2
catch2:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null2:
    is ($S9, "Can't downcase NULL string", 'downcase inplace null')
.end

.sub test_titlecase
    set $S0, "aBcd012YZ"
    titlecase $S1, $S0
    is( $S1, "Abcd012yz", 'titlecase' )

    push_eh catch1
    null $S9
    null $S0
    titlecase $S1, $S0
    pop_eh
    goto null1
catch1:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null1:
    is ($S9, "Can't titlecase NULL string", 'titlecase null')

    push_eh catch2
    null $S9
    null $S0
    $S0 = titlecase $S0
    pop_eh
    goto null2
catch2:
    .get_results($P9)
    $S9 = $P9['message']
    pop_eh
null2:
    is ($S9, "Can't titlecase NULL string", 'titlecase inplace null')
.end

.sub three_param_ord_one_character_string_register_i
    set $S0,"a"
    set $I1, 0
    ord $I0,$S0,$I1
    is( $I0, "97", '3-param ord, one-character string register, I' )
.end

.sub three_param_ord_multi_character_string_i
    set $I1, 1
    ord $I0,"ab",$I1
    is( $I0, "98", '3-param ord, multi-character string, I' )
.end

.sub three_param_ord_multi_character_string_register_i
    set $I1, 1
    set $S0,"ab"
    ord $I0,$S0,$I1
    is( $I0, "98", '3-param ord, multi-character string register, I' )
.end

.sub exception_three_param_ord_multi_character_string_i
    push_eh handler
    set $I1, 2
    ord $I0,"ab",$I1
    ok( 0, 'no exception: 3-param ord, multi-character string, I' )
  handler:
    .exception_is( 'Cannot get character past end of string' )
.end

.sub exception_three_param_ord_multi_character_string_i
    push_eh handler
    set $I1, 2
    set $S0,"ab"
    ord $I0,$S0,$I1
    ok( 0, 'no exception: 3-param ord, multi-character string, I' )
  handler:
    .exception_is( 'Cannot get character past end of string' )
.end

.sub three_param_ord_one_character_string_from_end_i
    set $I1, -1
    ord $I0,"a",$I1
    is( $I0, "97", '3-param ord, one-character string, from end, I' )
.end

.sub three_param_ord_one_character_string_register_from_end_i
    set $I1, -1
    set $S0,"a"
    ord $I0,$S0,$I1
    is( $I0, "97", '3-param ord, one-character string register, from end, I' )
.end

.sub three_param_ord_multi_character_string_from_end_i
    set $I1, -1
    ord $I0,"ab",$I1
    is( $I0, "98", '3-param ord, multi-character string, from end, I' )
.end

.sub three_param_ord_multi_character_string_register_from_end_i
    set $I1, -1
    set $S0,"ab"
    ord $I0,$S0,$I1
    is( $I0, "98", '3-param ord, multi-character string register, from end, I' )
.end

.sub exception_three_param_ord_multi_character_string_register_from_end_oob_i
    push_eh handler
    set $I1, -3
    set $S0,"ab"
    ord $I0,$S0,$I1
    ok( 0, 'no exception: 3-param ord, multi-character string register, from end, OOB, I' )
  handler:
    .exception_is( 'Cannot get character before beginning of string' )
.end

# Utility method for more_string_to_int
.sub 'print_as_integer'
    .param string s
    .param string answer
    $I0 = s
    concat $S99, 'string to int: ', s
    is( $I0, answer, $S99 )
.end

.sub more_string_to_int
    print_as_integer('-4', "-4")
    print_as_integer('X-4',"0")
    print_as_integer('--4',"0")
    print_as_integer('+',"0")
    print_as_integer('++',"0")
    print_as_integer('+2',"2")
    print_as_integer(' +3',"3")
    print_as_integer('++4',"0")
    print_as_integer('+ 5',"0")
    print_as_integer('-',"0")
    print_as_integer('--56',"0")
    print_as_integer('  -+67',"0")
    print_as_integer('+-78',"0")
    print_as_integer('  -089xyz',"-89")
    print_as_integer('- 89',"0")
.end

# Utility sub for constant_string_and_modify_in_situ_op_rt_bug_60030
.sub doit_sub_for_but_60030
    .param string s
    $I0 = index s, '::'
    is( s, "Foo::Bar", 'bug 60030' )
    s = replace s, $I0, 2, "/"
    is( s, "Foo/Bar", 'bug 60030' )
    collect
    is( s, "Foo/Bar", 'bug 60030' )
.end
.sub constant_string_and_modify_in_situ_op_rt_bug_60030

    doit_sub_for_but_60030('Foo::Bar')
    # repeat to prove that the constant 'Foo4::Bar4' remains unchanged
    doit_sub_for_but_60030('Foo::Bar')
.end

.sub corner_cases_of_numification
    is( 2147483647.0, "2147483647", 'corner cases of numification' )
    is( -2147483648.0, "-2147483648", 'corner cases of numification' )
.end

.sub non_canonical_nan_and_inf
    $N0 = 'nan'
    is( $N0, "NaN", 'Non canonical nan and inf' )

    $N0 = 'iNf'
    is( $N0, "Inf", 'Non canonical nan and inf' )

    $N0 = 'INFINITY'
    is( $N0, "Inf", 'Non canonical nan and inf' )

    $N0 = '-INF'
    is( $N0, "-Inf", 'Non canonical nan and inf' )

    $N0 = '-Infinity'
    is( $N0, "-Inf", 'Non canonical nan and inf' )
.end

.HLL 'foohll'
.sub split_hll_mapped
    .include 'test_more.pir'

    .local pmc RSA, fooRSA
    RSA = get_class ['ResizableStringArray']
    fooRSA = subclass ['ResizableStringArray'], 'fooRSA'

    .local pmc interp
    interp = getinterp
    interp.'hll_map'(RSA, fooRSA)

    .local pmc a
    split a, "a", "afooabara"

    .local string t
    t = typeof a
    is( t, 'fooRSA', 'split - hll mapped' )

    .local int n, i
    n = a
    is( n, '5', 'split - hll mapped' )

    .local string s
    s = a[0]
    is( s, '', 'split - hll mapped' )
    s = a[1]
    is( s, 'foo', 'split - hll mapped' )
    s = a[2]
    is( s, 'b', 'split - hll mapped' )
    s = a[3]
    is( s, 'r', 'split - hll mapped' )
    s = a[4]
    is( s, '', 'split - hll mapped' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
