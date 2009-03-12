
# this is the test program for the forth implementation targeting parrot.
# this script can be passed the names of any number of test files. each test is
# a series of input/output pairs, with optional comments that start with #s.
#
# the first non-blank, non-comment line is considered the first input. the line
# immediately following that is the first output line. the output can be either
# the stack (where the elements are joined by a space) or the message of a
# thrown exception.

.sub main :main
    .param pmc args
    .local int argc
    $P0  = shift args
    argc = elements args

    load_bytecode 'languages/forth/forth.pir'

    .local pmc iter
    iter = new 'Iterator', args
next_file:
    unless iter goto done
    $S0 = shift iter
    test($S0)
    goto next_file
done:
    end
.end

#
#   test(filename)
#
# Test a particular filename: read it, parse it, compare the input/output.
#
.sub test
    .param string filename

    .local pmc file
    file = open filename

    .local string line, input, expected
    .local int num_of_tests
    num_of_tests = 0
next_test:
    bsr next_line
    if null line goto done
    if line == "" goto next_test
    input = line

    bsr next_line
    if null line goto missing_output
    expected = line

    inc num_of_tests
    is(input, expected, num_of_tests)
    goto next_test

next_line:
    line = readline file
    if line == '' goto end_of_file
    $S0 = substr line, 0, 1
    if $S0 == "#"  goto next_line
    chopn line, 1
    ret
end_of_file:
    null line
    ret

done:
    print "1.."
    print num_of_tests
    print "\n"
    close file
    .return()

missing_output:
    print "Missing test output for test #"
    inc num_of_tests
    print num_of_tests
    print "\n"
    exit 1
.end

#
#   is(forth code, expected output, test number)
#
# An individual test. Execute the forth code and compare one of the following:
#   1) the first line of stdout
#   2) the stack
#   3) the exception message
#
.sub is
    .param string input
    .param string expected
    .param int    test_num

    .local pmc forth
    forth = compreg 'forth'

    .local pmc    stack, stdout
    .local string output
    stdout = getstdout
    push stdout, "string"
    push_eh exception
      $P0   = forth(input)
      stack = $P0()
    pop_eh
    output = readline stdout
    $S0 = pop stdout
    if output != "" goto compare
    output = join " ", stack
    goto compare

exception:
    .local pmc except
    .get_results (except)
    output = except

compare:
    if output == expected goto ok
    print "not ok "
    print test_num
    print "\n"

    print "#     Failed test\n"
    print "#          got: '"
    print output
    print "'\n"
    print "#     expected: '"
    print expected
    print "'\n"
    .return()

ok:
    print "ok "
    print test_num
    print "\n"
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
