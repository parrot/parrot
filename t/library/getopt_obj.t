#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/getopt_obj.t - testing the PIR module Getopt::Obj

=head1 SYNOPSIS

    % prove t/library/getopt_obj.t

=head1 DESCRIPTION

This test program tries to handle command line arguments with the
module F<runtime/parrot/library/Getopt/Obj.pir>.

=cut

.sub main :main
    .include 'test_more.pir'
    load_bytecode "Getopt/Obj.pbc"
    plan(48)

    test_basic_long_options()
    test_basic_short_options()
    test_simple_array()
    test_mixing_long_and_short_with_array()
    test_hash()
    test_bundling_short_options()
    test_ignored_options()
    test_double_dash_stop()
    test_notOptStop()
    test_optarg()
    test_pass_through()
    test_lone_dash()
    test_push_interface()
    test_missing_spec()
    test_missing_argument()
.end

# 1
.sub test_basic_long_options
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo=bar'
        push argv, '--bar=3.14'
        push argv, '--bax=3'
        push argv, '--baz'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0."type"('String')

        $P0 = getopts."add"()
        $P0."long"("bar")
        $P0."type"('Float')

        $P0 = getopts."add"()
        $P0."long"("bax")
        $P0."type"('Integer')

        $P0 = getopts."add"()
        $P0."long"("baz")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 'bar', 'basic long options')

        $S0 = $P1["bar"]
        is($S0, 3.14, 'basic long options')

        $S0 = $P1["bax"]
        is($S0, 3, 'basic long options')

        $S0 = $P1["baz"]
        is($S0, 1, 'basic long options')
.end

# 2
.sub test_basic_short_options
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '-f'
        push argv, 'bar'
        push argv, '-Abc'
        push argv, '-c'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."short"("f")
        $P0."type"('String')

        $P0 = getopts."add"()
        $P0."short"("A")
        $P0."type"('String')

        $P0 = getopts."add"()
        $P0."short"("c")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["f"]
        is($S0, 'bar', 'basic short options')

        $S0 = $P1["A"]
        is($S0, 'bc', 'basic short options')

        $S0 = $P1["c"]
        is($S0, '1', 'basic short options')
.end

# 3
.sub test_simple_array
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '-Iinca'
        push argv, '-Iincb'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."short"("I")
        $P0."type"('Array')

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["I";0]
        is($S0, 'inca', 'simple array')

        $S0 = $P1["I";1]
        is($S0, 'incb', 'simple array')

.end

# 4
.sub test_mixing_long_and_short_with_array
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '-Iinca'
        push argv, '--include=incb'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("include")
        $P0."short"("I")
        $P0."type"('Array')

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["include";0]
        is($S0, 'inca', 'mixing long and short with array')

        $S0 = $P1["include";1]
        is($S0, 'incb', 'mixing long and short with array')

.end

# 5
.sub test_hash
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '-Dfoo=bar'
        push argv, '--define=bax=baz'
        push argv, '-Dfoobar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("define")
        $P0."short"("D")
        $P0."type"('Hash')

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["define";"foo"]
        is($S0, 'bar', 'hash')

        $S0 = $P1["define";"bax"]
        is($S0, 'baz', 'hash')

        $S0 = $P1["define";"foobar"]
        is($S0, 1, 'hash')

.end

# 6
.sub test_bundling_short_options
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '-abc'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."short"("a")
        $P0 = getopts."add"()
        $P0."short"("b")
        $P0 = getopts."add"()
        $P0."short"("c")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["a"]
        is($S0, 1, 'bundling short options')

        $S0 = $P1["b"]
        is($S0, 1, 'bundling short options')

        $S0 = $P1["c"]
        is($S0, 1, 'bundling short options')

.end

# 7
.sub test_ignored_options
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--ignore'
        push argv, '--foo'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']
        getopts."notOptStop"(1)

        $P0 = getopts."add"()
        $P0."long"("foo")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, '1', 'ignored options')

        $S0 = argv[0]
        is($S0, '--ignore', 'ignored options')

.end

# 8
.sub test_double_dash_stop
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo'
        push argv, '--'
        push argv, '--bar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0 = getopts."add"()
        $P0."long"("bar")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 1, 'double dash stop')

        # Hash sets an nonexistant value to ''
        $S0 = $P1["bar"]
        is($S0, '', 'double dash stop')

        $S0 = argv[0]
        is($S0, '--bar', 'double dash stop')

.end

# 9
.sub test_notOptStop
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo'
        push argv, 'foo'
        push argv, '--bar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']
        getopts."notOptStop"(1)

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0 = getopts."add"()
        $P0."long"("bar")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 1, 'notOptStop')

        $S0 = $P1["bar"]
        is($S0, '', 'notOptStop')

        $S0 = argv[0]
        is($S0, 'foo', 'notOptStop')

        $S0 = argv[1]
        is($S0, '--bar', 'notOptStop')

.end

# 10
.sub test_optarg
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo'
        push argv, '-f'
        push argv, '-bbar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']
        getopts."notOptStop"(1)

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0."optarg"(1)
        $P0."type"('String')

        $P0 = getopts."add"()
        $P0."short"("f")
        $P0."optarg"(1)
        $P0."type"('String')

        $P0 = getopts."add"()
        $P0."short"("b")
        $P0."optarg"(1)
        $P0."type"('String')

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, '', 'optarg')

        $S0 = $P1["f"]
        is($S0, '', 'optarg')

        $S0 = $P1["b"]
        is($S0, 'bar', 'optarg')

.end

# 11
.sub test_pass_through
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo'
        push argv, 'foo'
        push argv, '--bar'
        push argv, 'bar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0 = getopts."add"()
        $P0."long"("bar")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 1, 'pass through')

        $S0 = $P1["bar"]
        is($S0, 1, 'pass through')

        $S0 = argv[0]
        is($S0, 'foo', 'pass through')

        $S0 = argv[1]
        is($S0, 'bar', 'pass through')

.end

# 12
.sub test_lone_dash
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo'
        push argv, '-'
        push argv, '--bar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        $P0 = getopts."add"()
        $P0."long"("foo")
        $P0 = getopts."add"()
        $P0."long"("bar")

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 1, 'lone dash')

        $S0 = $P1["bar"]
        is($S0, 1, 'lone dash')

        $S0 = argv[0]
        is($S0, '-', 'lone dash')

.end

# 13
.sub test_push_interface
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo=file'
        push argv, '-bfile.txt'
        push argv, '-x'
        push argv, 'file.t'
        push argv, '-z'
        push argv, 'text'
        push argv, '-I'
        push argv, 'texta'
        push argv, '-I'
        push argv, 'textb'
        push argv, '-Dfoo=bar'
        push argv, '--define=bax=baz'
        push argv, '-Dfoobar'

        .local pmc getopts
        getopts = new ['Getopt';'Obj']

        push getopts, 'foo=s'
        push getopts, 'bar|b=s'
        push getopts, 'bax|x=s'
        push getopts, 'baz|z:s'
        push getopts, 'I=@'
        push getopts, 'define|D:%'

        $P1 = getopts."get_options"(argv)

        $S0 = $P1["foo"]
        is($S0, 'file', 'push interface')

        $S0 = $P1["bar"]
        is($S0, 'file.txt', 'push interface')

        $S0 = $P1["bax"]
        is($S0, 'file.t', 'push interface')

        $S0 = $P1["baz"]
        is($S0, '', 'push interface')

        $S0 = $P1["I";0]
        is($S0, 'texta', 'push interface')

        $S0 = $P1["I";1]
        is($S0, 'textb', 'push interface')

        $S0 = $P1["define";"foo"]
        is($S0, 'bar', 'push interface')

        $S0 = $P1["define";"bax"]
        is($S0, 'baz', 'push interface')

        $S0 = $P1["define";"foobar"]
        is($S0, 1, 'push interface')

        $S0 = argv[0]
        is($S0, 'text', 'push interface')

.end

# 14
.sub test_missing_spec
    dies_ok(<<'CODE', 'missing_spec')
.sub main :main
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo=file'
        load_bytecode "Getopt/Obj.pbc"
        .local pmc getopts
        getopts = new ['Getopt';'Obj']
        $P1 = getopts."get_options"(argv)
        $S0 = $P1["foo"]
        print "foo is "
        print $S0
        print "\n"
        $S0 = argv[0]
        print "argv[0] is "
        print $S0
        print "\n"
.end
CODE
.end

# 15
.sub test_missing_argument
  dies_ok(<<'CODE', "missing argument")
.sub main :main
        .local pmc argv
        argv = new 'ResizablePMCArray'
        push argv, '--foo=file'
        push argv, '--bar'
        load_bytecode "Getopt/Obj.pbc"
        .local pmc getopts
        getopts = new ['Getopt';'Obj']
        push getopts, 'foo=s'
        push getopts, 'bar=s'
        $P1 = getopts."get_options"(argv)
        $S0 = $P1["foo"]
        print "foo is "
        print $S0
        print "\n"
        $S0 = argv[0]
        print "argv[0] is "
        print $S0
        print "\n"
.end
CODE
.end

=head1 AUTHOR

Joshua Isom - C<loneowl@ritalin.shout.net>

=head1 SEE ALSO

F<runtime/parrot/library/Getopt/Obj.pir>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
