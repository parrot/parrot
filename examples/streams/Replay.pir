# Copyright (C) 2004-2009, Parrot Foundation.

.sub _main :main
    .local pmc stream

    load_bytecode 'Stream/Writer.pbc'
    load_bytecode 'Stream/Replay.pbc'

    stream = new ['Stream'; 'Writer']
    $P0 = get_global "_reader"
    assign stream, $P0

    stream."write"( "1" )
    stream."write"( "2" )
    stream."write"( "A" )
    stream."write"( "B" )
    stream."write"( "4" )
    stream."write"( "5" )
    stream."write"( "*" )
    stream."close"()
    end
.end

.sub _reader :method
    .local pmc stream1
    .local pmc stream2
    .local pmc stream3
    .local string str

    stream1 = new ['Stream'; 'Replay']
    assign stream1, self

    print "reader start\n"

    print "1:'"
    str = stream1."read"()
    print str
    str = stream1."read"()
    print str
    print "'\n"

    stream2 = clone stream1
    stream3 = clone stream1

    print "2:'"
    str = stream2."read"()
    print str
    str = stream2."read"()
    print str
    stream2."close"()
    print "'\n1:'"

    str = stream1."read"()
    print str
    str = stream1."read"()
    print str

    str = stream1."read"()
    print str
    str = stream1."read"()
    print str

    print "\n3:'"

    str = stream3."read"()
    print str
    str = stream3."read"()
    print str
    str = stream3."read"()
    print str
    str = stream3."read"()
    print str

    str = stream3."read"()
    print str

    print "'\n"

    print "reader done\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
