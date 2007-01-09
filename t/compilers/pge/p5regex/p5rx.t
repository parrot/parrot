#!./parrot -G
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/compilers/pge/p5regex/p5rx.t - Perl 5 Regular Expression tests

=head1 DESCRIPTION

These tests are ripped from the Perl 5.9.2 distribution. The test harness
has been modified to feed them to PGE's P5Regex compiler. The tests are
in a separate file in the same directory, named 're_tests'.

This test harness honors a special environment variable called C<TEST_P5RX>.
If set to a number, that test will be run alone and unconditionally--even
if it's designated as SKIP or TODO by the harness. This is quite helpful
in debugging tests that cause parrot to spiral out of control. {{ XXX }}

B<NOTE:> Don't add new tests to C<re_tests>. That file is strictly for 
Perl 5's tests.

The Perl 5 equivalent file provides the following description of the test
format. There are 5-6 columns, separated by tabs.

Column 1 contains the pattern, optionally enclosed in C<''>.
Modifiers can be put after the closing C<'>.

Column 2 contains the string to be matched.

Column 3 contains the expected result:
    y    expect a match
    n    expect no match 
    c    expect an error 
    B    test exposes a known bug in Perl, should be skipped
    b    test exposes a known bug in Perl, should be skipped if noamp

Columns 4 and 5 are used only if column 3 contains C<y> or C<c>.

Column 4 contains a string, usually C<$&>.

Column 5 contains the expected result of double-quote
interpolating that string after the match, or start of error message.

Column 6, if present, contains a description of what is being tested.

\n in the tests are interpolated, as are variables of the form ${\w+}.

=head1 SYNOPSIS

    % prove t/compilers/pge/p5regex/p5rx.t

=cut

.const int TESTS = 960

.sub main :main
   load_bytecode 'Test/Builder.pir'
   load_bytecode 'PGE.pbc'
   load_bytecode 'PGE/Dumper.pbc'
   .include 'iglobals.pasm'

   # Variable declarations, initializations
   .local pmc test       # the test harness object.
              test = new 'Test::Builder'

   .local pmc todo_tests # keys indicate test file; values test number.
              todo_tests = new 'Hash'

   .local pmc skip_tests # keys indicate tests ID; values reasons.
              skip_tests = new 'Hash'

   .local string test_dir # the directory containing tests
                 test_dir = 't/compilers/pge/p5regex/'

   .local pmc test_files # values are test file names to run.
              test_files = new 'ResizablePMCArray'

   # populate the list of test files
   push test_files, 're_tests'

   .local pmc file_iterator # iterate over list of files..
              file_iterator = new 'Iterator', test_files

   .local int test_number   # the number of the test we're running
              test_number = 0

   # these vars are in the loops below
   .local pmc file_handle   # currently open file.
   .local string test_file  # name of the current test file
   .local string test_line  # one line of one test file, a single test
   .local int ok            # is this a passing test?

   # for any given test:
   .local pmc regex          # the regex
   .local pmc match          # the match
   .local string pattern     # the regex
   .local string target      # this string to match against the regex
   .local string result      # expected result of this test. (y/n/...)
   .local string testvar     # the value to test against expected results
   .local string expected    # the expected result of the match, or the error
   .local string description # user-facing description of the test.

   todo_tests = 'set_todo_info'()
   skip_tests = 'set_skip_info'()

   # how many tests to run?
   # XXX: this should be summed automatically from test_files data
   #      until then, we use the constant above
   test.'plan'(TESTS)


 outer_loop:
   unless file_iterator goto end_outer_loop
   .local string test_name
                 test_name = shift file_iterator
   # local test number in test file
   .local int local_test_number
              local_test_number = 0

   # append the test directory and filename
   test_file = test_dir . test_name

   # Open the test file
   file_handle = open test_file, '<'
   $S0 = typeof file_handle
   if $S0 == 'Undef' goto bad_file

   # loop over the file, one at a time.

 loop:
   # read in the file one line at a time...
   $I0 = file_handle.'eof'()
   if $I0 goto end_loop
if local_test_number >= TESTS goto end_loop ## TODO

   test_line = readline file_handle

   # skip lines without tabs
   $I0 = index test_line, "\t"
   if $I0 == -1 goto loop
   inc test_number
   inc local_test_number

 parse_data:
   push_eh eh_bad_line
     ( pattern, target, result, testvar, expected, description ) = 'parse_data'( test_line )
   clear_eh

   # prepend test filename and line number to description
   description = 'build_test_desc'( description, test_name, local_test_number )

   if target != "''" goto got_target
   target = ''

 got_target:
   target = 'backslash_escape'( target )
   result = 'backslash_escape'( result )

   # Should this test be skipped?
   $I0 = exists skip_tests[test_name]
   unless $I0 goto not_skip
   $P0 = skip_tests[test_name]
   $I0 = exists $P0[local_test_number]
   unless $I0 goto not_skip
   test.'skip'(1, description)
   goto loop

 not_skip:
   push_eh thrown
   match = 'match_p5regex'( pattern, target )
   clear_eh

   if match goto matched

   if result == 'n' goto is_ok
   if result == 'y' goto is_nok
   goto check_dump

 matched:
   if result == 'y' goto is_ok
   if result == 'n' goto is_nok
   # goto check_dump

 check_dump:
   $S1 = match.'dump_str'('mob', ' ', '')

   # remove /'s
#    $S0 = substr result, 0, 1
#    if $S0 != "/" goto bad_line
#    substr result, 0, 1, ''
#    substr result, -1, 1, ''

   $I0 = index $S1, result
   if $I0 == -1 goto is_nok
   # goto is_ok

 is_ok:
   ok = 1
   goto emit_test
 is_nok:
   ok = 0

 emit_test:
   $I0 = exists todo_tests[test_name]
   unless $I0 goto not_todo
   $P0 = todo_tests[test_name]
   $I0 = exists $P0[local_test_number]
   unless $I0 goto not_todo
   test.'todo'(ok,description)
   goto loop
 not_todo:
   test.'ok'(ok,description)

   goto loop
 end_loop:
   close file_handle
   goto outer_loop
 end_outer_loop:

   test.'finish'()
   end

 bad_file:
   print "Unable to open '"
   print test_file
   print "'\n"

 thrown:
   .sym pmc exception
   .sym string message
   get_results '(0,0)', exception, message
   # remove /'s
   $S0 = substr result, 0, 1
   if $S0 != '/' goto bad_error
   substr result, 0, 1, ''
   substr result, -1, 1, ''
   $I0 = index message, result
   if $I0 == -1 goto bad_error
   ok = 1
   goto emit_test
 bad_error:
   ok = 0
   goto emit_test
 bad_line:
   $S0 = 'Test not formatted properly!'
   test.'ok'(0, $S0)
   goto loop
 eh_bad_line:
   $S0 = 'Test not formatted properly!'
   test.'ok'(0, $S0)
   goto loop
.end


# set todo information
.sub 'set_todo_info'
   .local pmc todo_tests # keys indicate test file; values are just defined
              todo_tests = new 'Hash'

   .local pmc todo_info
              todo_info = new 'Hash'

   .local string test_file

    test_file = 're_tests'
    bsr reset_todo_info

    # TODO: unknown

    todo_info[99] = 1
    todo_info[100] = 1
    todo_info[142] = 1
    todo_info[172] = 1
    todo_info[184] = 1
    todo_info[223] = 1
    todo_info[232] = 1
    todo_info[233] = 1
    todo_info[234] = 1
    todo_info[236] = 1
    todo_info[241] = 1
    todo_info[243] = 1
    todo_info[244] = 1
    todo_info[246] = 1
    todo_info[247] = 1
    todo_info[253] = 1
    todo_info[254] = 1
    todo_info[256] = 1
    todo_info[257] = 1
    todo_info[260] = 1
    todo_info[261] = 1
    todo_info[381] = 1
    todo_info[382] = 1
    todo_info[396] = 1
    todo_info[397] = 1
    todo_info[398] = 1
    todo_info[419] = 1
    todo_info[422] = 1
    todo_info[428] = 1
    todo_info[429] = 1
    todo_info[432] = 1
    todo_info[435] = 1
    todo_info[439] = 1
    todo_info[440] = 1
    todo_info[444] = 1
    todo_info[445] = 1
    todo_info[446] = 1
    todo_info[447] = 1
    todo_info[448] = 1
    todo_info[449] = 1
    todo_info[452] = 1
    todo_info[453] = 1
    todo_info[454] = 1
    todo_info[455] = 1
    todo_info[485] = 1
    todo_info[495] = 1
    todo_info[498] = 1
    todo_info[500] = 1
    todo_info[501] = 1
    todo_info[503] = 1
    todo_info[504] = 1
    todo_info[505] = 1
    todo_info[506] = 1
    todo_info[507] = 1
    todo_info[508] = 1
    todo_info[509] = 1
    todo_info[510] = 1
    todo_info[511] = 1
    todo_info[512] = 1
    todo_info[515] = 1
    todo_info[522] = 1
    todo_info[523] = 1
    todo_info[524] = 1
    todo_info[527] = 1
    todo_info[528] = 1
    todo_info[536] = 1
    todo_info[540] = 1
    todo_info[541] = 1
    todo_info[543] = 1
    todo_info[544] = 1
    todo_info[545] = 1
    todo_info[548] = 1
    todo_info[549] = 1
    todo_info[553] = 1
    todo_info[554] = 1
    todo_info[595] = 1
    todo_info[596] = 1
    todo_info[600] = 1
    todo_info[601] = 1
    todo_info[602] = 1
    todo_info[603] = 1
    todo_info[604] = 1
    todo_info[605] = 1
    todo_info[606] = 1
    todo_info[607] = 1
    todo_info[621] = 1
    todo_info[623] = 1
    todo_info[624] = 1
    todo_info[625] = 1
    todo_info[639] = 1
    todo_info[641] = 1
    todo_info[642] = 1
    todo_info[643] = 1
    todo_info[693] = 1
    todo_info[695] = 1
    todo_info[696] = 1
    todo_info[697] = 1
    todo_info[747] = 1
    todo_info[749] = 1
    todo_info[750] = 1
    todo_info[751] = 1
    todo_info[801] = 1
    todo_info[832] = 1
    todo_info[833] = 1
    todo_info[840] = 1
    todo_info[859] = 1
    todo_info[860] = 1
    todo_info[861] = 1
    todo_info[862] = 1
    todo_info[863] = 1
    todo_info[865] = 1
    todo_info[866] = 1
    todo_info[871] = 1
    todo_info[874] = 1
    todo_info[875] = 1
    todo_info[876] = 1
    todo_info[882] = 1
    todo_info[887] = 1
    todo_info[888] = 1
    todo_info[890] = 1
    todo_info[891] = 1
    todo_info[893] = 1
    todo_info[894] = 1
    todo_info[895] = 1
    todo_info[896] = 1
    todo_info[897] = 1
    todo_info[898] = 1
    todo_info[899] = 1
    todo_info[900] = 1

    # TODO: reuse captured group
    todo_info[928] = 1
    todo_info[929] = 1
    todo_info[930] = 1
    todo_info[931] = 1
    todo_info[932] = 1
    todo_info[933] = 1
    todo_info[934] = 1
    todo_info[935] = 1
    todo_info[936] = 1
    todo_info[937] = 1
    todo_info[938] = 1
    todo_info[939] = 1
    todo_info[940] = 1
    todo_info[941] = 1
    todo_info[942] = 1

    # TODO: non-greedy/lookbehind
    todo_info[915] = 1
    todo_info[916] = 1
    todo_info[918] = 1
    todo_info[919] = 1
    todo_info[920] = 1
    todo_info[921] = 1
    todo_info[922] = 1

    # TODO: greediness/lookbehind
    todo_info[901] = 1
    todo_info[902] = 1
    todo_info[902] = 1
    todo_info[903] = 1
    todo_info[904] = 1
    todo_info[905] = 1

    # TODO: non-greedy/zero-width assertion
    todo_info[907] = 1
    todo_info[908] = 1
    todo_info[909] = 1
    todo_info[910] = 1
    todo_info[912] = 1
    todo_info[913] = 1
    todo_info[914] = 1
    todo_info[960] = 1

    # TODO: \d in character class
    todo_info[825] = 1
    todo_info[826] = 1
    todo_info[827] = 1

    # TODO: [ID 20010803.016]
    todo_info[884] = 1

    # TODO: [perl #34195]
    todo_info[959] = 1

    # TODO: undef [perl #16773]
    todo_info[925] = 1

    # TODO: unmatched bracket
    todo_info[923] = 1

    # TODO: 16 tests for [perl #23171]
    todo_info[927] = 1

    todo_tests[test_file] = todo_info

   .return (todo_tests)

 reset_todo_info:
   todo_info = new .Hash
   ret

 set_todo_loop: # for developer testing. not used normally
   if $I0 > $I1 goto end_loop
   todo_info[$I0] = 1
   $I0 += 1
   goto set_todo_loop
 end_loop:
   ret
.end


# set skip information
.sub 'set_skip_info'
   .local pmc skip_tests # keys indicate test file; values are just defined
              skip_tests = new 'Hash'

   .local pmc skip_info
              skip_info = new 'Hash'

   .local string test_file

   test_file = 're_tests'
   bsr reset_skip_info

   # TODO: trailing modifiers
    skip_info[264] = 1
    skip_info[265] = 1
    skip_info[266] = 1
    skip_info[267] = 1
    skip_info[268] = 1
    skip_info[269] = 1
    skip_info[270] = 1
    skip_info[271] = 1
    skip_info[272] = 1
    skip_info[273] = 1
    skip_info[274] = 1
    skip_info[275] = 1
    skip_info[276] = 1
    skip_info[277] = 1
    skip_info[278] = 1
    skip_info[279] = 1
    skip_info[280] = 1
    skip_info[281] = 1
    skip_info[282] = 1
    skip_info[283] = 1
    skip_info[284] = 1
    skip_info[285] = 1
    skip_info[286] = 1
    skip_info[287] = 1
    skip_info[288] = 1
    skip_info[289] = 1
    skip_info[290] = 1
    skip_info[291] = 1
    skip_info[292] = 1
    skip_info[293] = 1
    skip_info[294] = 1
    skip_info[295] = 1
    skip_info[296] = 1
    skip_info[297] = 1
    skip_info[298] = 1
    skip_info[299] = 1
    skip_info[300] = 1
    skip_info[301] = 1
    skip_info[302] = 1
    skip_info[303] = 1
    skip_info[304] = 1
    skip_info[305] = 1
    skip_info[306] = 1
    skip_info[307] = 1
    skip_info[308] = 1
    skip_info[309] = 1
    skip_info[310] = 1
    skip_info[311] = 1
    skip_info[312] = 1
    skip_info[313] = 1
    skip_info[314] = 1
    skip_info[315] = 1
    skip_info[316] = 1
    skip_info[317] = 1
    skip_info[318] = 1
    skip_info[319] = 1
    skip_info[320] = 1
    skip_info[321] = 1
    skip_info[322] = 1
    skip_info[323] = 1
    skip_info[324] = 1
    skip_info[325] = 1
    skip_info[326] = 1
    skip_info[327] = 1
    skip_info[328] = 1
    skip_info[329] = 1
    skip_info[330] = 1
    skip_info[331] = 1
    skip_info[332] = 1
    skip_info[333] = 1
    skip_info[334] = 1
    skip_info[335] = 1
    skip_info[336] = 1
    skip_info[337] = 1
    skip_info[338] = 1
    skip_info[339] = 1
    skip_info[340] = 1
    skip_info[341] = 1
    skip_info[342] = 1
    skip_info[343] = 1
    skip_info[344] = 1
    skip_info[345] = 1
    skip_info[346] = 1
    skip_info[347] = 1
    skip_info[348] = 1
    skip_info[349] = 1
    skip_info[350] = 1
    skip_info[351] = 1
    skip_info[352] = 1
    skip_info[353] = 1
    skip_info[354] = 1
    skip_info[355] = 1
    skip_info[356] = 1
    skip_info[357] = 1
    skip_info[358] = 1
    skip_info[359] = 1
    skip_info[360] = 1
    skip_info[361] = 1
    skip_info[362] = 1
    skip_info[363] = 1
    skip_info[364] = 1
    skip_info[365] = 1
    skip_info[366] = 1
    skip_info[367] = 1
    skip_info[368] = 1
    skip_info[369] = 1
    skip_info[370] = 1
    skip_info[371] = 1
    skip_info[372] = 1
    skip_info[373] = 1
    skip_info[374] = 1
    skip_info[375] = 1
    skip_info[376] = 1
    skip_info[377] = 1
    skip_info[378] = 1
    skip_info[379] = 1
    skip_info[380] = 1
    skip_info[381] = 1
    skip_info[382] = 1
    skip_info[383] = 1
    skip_info[384] = 1
    skip_info[385] = 1
    skip_info[386] = 1
    skip_info[387] = 1
    skip_info[388] = 1
    skip_info[389] = 1
    skip_info[390] = 1
    skip_info[391] = 1
    skip_info[392] = 1
    skip_info[393] = 1
    skip_info[394] = 1
    skip_info[395] = 1
    skip_info[458] = 1
    skip_info[459] = 1
    skip_info[460] = 1
    skip_info[461] = 1
    skip_info[462] = 1
    skip_info[463] = 1
    skip_info[464] = 1
    skip_info[465] = 1
    skip_info[466] = 1
    skip_info[467] = 1
    skip_info[468] = 1
    skip_info[469] = 1
    skip_info[470] = 1
    skip_info[471] = 1
    skip_info[472] = 1
    skip_info[473] = 1
    skip_info[474] = 1
    skip_info[475] = 1
    skip_info[476] = 1
    skip_info[477] = 1
    skip_info[478] = 1
    skip_info[479] = 1
    skip_info[480] = 1
    skip_info[483] = 1
    skip_info[484] = 1
    skip_info[496] = 1
    skip_info[609] = 1
    skip_info[610] = 1
    skip_info[611] = 1
    skip_info[612] = 1
    skip_info[613] = 1
    skip_info[614] = 1
    skip_info[615] = 1
    skip_info[616] = 1
    skip_info[617] = 1
    skip_info[627] = 1
    skip_info[628] = 1
    skip_info[629] = 1
    skip_info[630] = 1
    skip_info[631] = 1
    skip_info[632] = 1
    skip_info[633] = 1
    skip_info[634] = 1
    skip_info[635] = 1
    skip_info[645] = 1
    skip_info[646] = 1
    skip_info[647] = 1
    skip_info[648] = 1
    skip_info[649] = 1
    skip_info[650] = 1
    skip_info[651] = 1
    skip_info[652] = 1
    skip_info[653] = 1
    skip_info[663] = 1
    skip_info[664] = 1
    skip_info[665] = 1
    skip_info[666] = 1
    skip_info[667] = 1
    skip_info[668] = 1
    skip_info[669] = 1
    skip_info[670] = 1
    skip_info[671] = 1
    skip_info[681] = 1
    skip_info[682] = 1
    skip_info[683] = 1
    skip_info[684] = 1
    skip_info[685] = 1
    skip_info[686] = 1
    skip_info[687] = 1
    skip_info[688] = 1
    skip_info[689] = 1
    skip_info[699] = 1
    skip_info[700] = 1
    skip_info[701] = 1
    skip_info[702] = 1
    skip_info[703] = 1
    skip_info[704] = 1
    skip_info[705] = 1
    skip_info[706] = 1
    skip_info[707] = 1
    skip_info[717] = 1
    skip_info[718] = 1
    skip_info[719] = 1
    skip_info[720] = 1
    skip_info[721] = 1
    skip_info[722] = 1
    skip_info[723] = 1
    skip_info[724] = 1
    skip_info[725] = 1
    skip_info[735] = 1
    skip_info[736] = 1
    skip_info[737] = 1
    skip_info[738] = 1
    skip_info[739] = 1
    skip_info[740] = 1
    skip_info[741] = 1
    skip_info[742] = 1
    skip_info[743] = 1
    skip_info[753] = 1
    skip_info[754] = 1
    skip_info[755] = 1
    skip_info[756] = 1
    skip_info[757] = 1
    skip_info[758] = 1
    skip_info[759] = 1
    skip_info[760] = 1
    skip_info[761] = 1
    skip_info[771] = 1
    skip_info[772] = 1
    skip_info[773] = 1
    skip_info[774] = 1
    skip_info[775] = 1
    skip_info[776] = 1
    skip_info[777] = 1
    skip_info[778] = 1
    skip_info[779] = 1
    skip_info[789] = 1
    skip_info[790] = 1
    skip_info[791] = 1
    skip_info[792] = 1
    skip_info[793] = 1
    skip_info[794] = 1
    skip_info[795] = 1
    skip_info[796] = 1
    skip_info[797] = 1
    skip_info[802] = 1
    skip_info[803] = 1
    skip_info[805] = 1
    skip_info[834] = 1
    skip_info[835] = 1
    skip_info[836] = 1
    skip_info[838] = 1
    skip_info[859] = 1
    skip_info[862] = 1
    skip_info[877] = 1
    skip_info[886] = 1

    # TODO: bug or error
    skip_info[143] = 1
    skip_info[144] = 1
    skip_info[148] = 1
    skip_info[149] = 1
    skip_info[155] = 1
    skip_info[167] = 1
    skip_info[248] = 1
    skip_info[249] = 1
    skip_info[252] = 1
    skip_info[308] = 1
    skip_info[309] = 1
    skip_info[310] = 1
    skip_info[322] = 1
    skip_info[323] = 1
    skip_info[325] = 1
    skip_info[330] = 1
    skip_info[331] = 1
    skip_info[336] = 1
    skip_info[347] = 1
    skip_info[408] = 1
    skip_info[436] = 1
    skip_info[487] = 1
    skip_info[488] = 1
    skip_info[489] = 1
    skip_info[490] = 1
    skip_info[492] = 1
    skip_info[531] = 1
    skip_info[532] = 1
    skip_info[563] = 1
    skip_info[564] = 1
    skip_info[566] = 1
    skip_info[593] = 1
    skip_info[594] = 1
    skip_info[598] = 1
    skip_info[599] = 1
    skip_info[944] = 1
    skip_info[945] = 1

    # TODO: broken col 4?
    skip_info[139] = 1

    # TODO: kills a parrot
    skip_info[491] = 1
    skip_info[493] = 1
    skip_info[556] = 1
    skip_info[557] = 1
    skip_info[568] = 1
    skip_info[569] = 1
    skip_info[570] = 1
    skip_info[571] = 1
    skip_info[572] = 1
    skip_info[573] = 1
    skip_info[574] = 1
    skip_info[575] = 1
    skip_info[576] = 1
    skip_info[577] = 1
    skip_info[578] = 1
    skip_info[579] = 1
    skip_info[580] = 1
    skip_info[581] = 1
    skip_info[582] = 1
    skip_info[583] = 1
    skip_info[584] = 1
    skip_info[585] = 1
    skip_info[586] = 1
    skip_info[587] = 1
    skip_info[588] = 1
    skip_info[589] = 1
    skip_info[590] = 1
    skip_info[591] = 1
    skip_info[592] = 1
    skip_info[800] = 1
    skip_info[828] = 1
    skip_info[829] = 1
    skip_info[830] = 1
    skip_info[957] = 1
    skip_info[958] = 1

    # TODO: hangs a parrot
    skip_info[806] = 1
    skip_info[807] = 1
    skip_info[808] = 1
    skip_info[809] = 1
    skip_info[810] = 1
    skip_info[811] = 1
    skip_info[812] = 1
    skip_info[813] = 1
    skip_info[814] = 1
    skip_info[815] = 1
    skip_info[816] = 1
    skip_info[817] = 1
    skip_info[818] = 1
    skip_info[819] = 1
    skip_info[820] = 1
    skip_info[821] = 1
    skip_info[822] = 1
    skip_info[823] = 1
    skip_info[924] = 1

    # TODO: unknown
    skip_info[502] = 1
    skip_info[597] = 1
    skip_info[944] = 1
    skip_info[945] = 1

    # TODO: [ID 20010811.006]
    skip_info[879] = 1
 
    # TODO: [perl #18019]
    skip_info[926] = 1

   skip_tests[test_file] = skip_info

   .return (skip_tests)

 reset_skip_info:
   skip_info = new .Hash
   ret

 set_skip_loop: # for developer testing. not used normally
   if $I0 > $I1 goto end_loop
   if $S0 != '' goto set_skip_info
   $S0 = 'unknown reason'
 set_skip_info:
   skip_info[$I0] = $S0
   $I0 += 1
   goto set_skip_loop
 end_loop:
   $S0 = ''
   ret
.end


.sub 'parse_data'
   .param string test_line   # the data record

   .local pmc regex          # the regex matching object
   .local pmc match          # the match
   .local string pattern     # the regex
   .local string target      # this string to match against the regex
   .local string result      # expected result of this test. (y/n/...)
   .local string testvar     # the value to test against expected results
   .local string expected    # the expected result of the match, or the error
   .local string description # user-facing description of the test.

   # NOTE: there can be multiple tabs between entries, so skip until
   # we have something.
   # remove the trailing newline from record
   chopn test_line, 1

   $P1 = split "\t", test_line
   $I0 = elements $P1 # length of array
   .local int tab_number
              tab_number = 0
 get_pattern:
   if tab_number >= $I0 goto bad_line
   pattern     = $P1[tab_number]
   inc tab_number
   if pattern == '' goto get_pattern
   # XXX strip containing 's
   # XXX set modifier and return it.

 get_target:
   if tab_number >= $I0 goto bad_line
   target      = $P1[tab_number]
   inc tab_number
   if target == '' goto get_target
 get_result:
   if tab_number >= $I0 goto bad_line
   result      = $P1[tab_number]
   inc tab_number
   if result == '' goto get_result
 get_testvar:
   if tab_number >= $I0 goto bad_line
   testvar     = $P1[tab_number]
   inc tab_number
   if result == '' goto get_testvar
 get_expected:
   if tab_number >= $I0 goto bad_line
   expected    = $P1[tab_number]
   inc tab_number
   if result == '' goto get_expected
   
  # XXX Whoa. apparently there might sometimes be a description?
  description = 'no description'

 return:
   .return ( pattern, target, result, testvar, expected, description ) 

 bad_line:
     $P1 = new 'Exception'
     $P1[0] = 'invalid data format'
     throw $P1
.end


.sub 'build_test_desc'
   .param string desc
   .param string test_name
   .param string local_test_number

   $S0  = '['
   $S0 .= test_name
   $S0 .= ':'
   $S0 .= local_test_number
   $S0 .= '] '
   $S0 .= desc

   .return ($S0)
.end


.sub 'match_p5regex'
   .param string pattern
   .param string target

   .local pmc match

   .local pmc p5regex     # the perl5 regex compiler
              p5regex = compreg 'PGE::P5Regex'

   .local pmc regex
              regex = p5regex(pattern)

   unless_null regex, match_it
   $P1 = new 'Exception'
   $P1[0] = 'regex error'
   throw $P1
 match_it:
   match = regex(target)

   .return (match)
.end


# given a 2 digit string, convert to appropriate chr() value.
.sub hex_chr
   .param string hex

   $S0 = substr hex, 0, 1
   $S1 = substr hex, 1, 1

   $I0 = hex_val($S0)
   $I1 = hex_val($S1)

   $I0 *=16
   $I0 += $I1

   $S2 = chr $I0

   .return ($S2)
.end


# given a single digit hex value, return it's int value.
.sub hex_val
 .param string digit

 $I0 = ord digit
 if $I0 < 48 goto bad_digit
 if $I0 > 57 goto non_numeric
 $I0 -=48
 .return ($I0)
non_numeric:
 if $I0 < 65 goto bad_digit
 if $I0 > 70 goto not_capital
 $I0 -= 55 # A is ascii 65, so reset to zero, add 10 for hex..
 .return ($I0)
not_capital:
 if $I0 < 97 goto  bad_digit
 if $I0 > 102 goto bad_digit
 $I0 -= 87 # a is ascii 97, so reset to zero, add 10 for hex..
 .return ($I0)

bad_digit:
 $P1 = new 'Exception'
 $P1[0] = 'invalid hex digit'
 throw $P1
.end


.sub backslash_escape
   .param string target

   .local int x_pos         # position in string of last \x escape..
              x_pos = 0

 target1:
   $I0 = index target, '\n'
   if $I0 == -1 goto target2
   substr target, $I0, 2, "\n"
   goto target1
 target2:
   $I0 = index target, '\r'
   if $I0 == -1 goto target3
   substr target, $I0, 2, "\r"
   goto target2
 target3:
   $I0 = index target, '\e'
   if $I0 == -1 goto target4
   substr target, $I0, 2, "\e"
   goto target3
 target4:
   $I0 = index target, '\t'
   if $I0 == -1 goto target5
   substr target, $I0, 2, "\t"
   goto target4
 target5:
   $I0 = index target, '\f'
   if $I0 == -1 goto target6
   substr target, $I0, 2, "\f"
   goto target5
 target6:
   # handle \xHH, hex escape.

   $I0 = index target, '\x', x_pos
   if $I0 == -1 goto target7

   $I1 = length target
   $I2 = $I0 + 2

   if $I2 > $I1 goto target7
   $S0 = substr target, $I2, 2
   $S1 = hex_chr($S0)
   substr target, $I0, 4, $S1

   inc x_pos
   goto target6
 target7:
   .return (target)
.end

=head1 BUGS AND LIMITATIONS

Note that while our job would be easier if we could use regular expressions
in here, but we want to avoid any dependency on the thing we're testing.

Need to add in test ids, to avoid the precarious line numbering.

=cut
