.sub _main :main
    .local pmc stream
    
    load_bytecode "library/Stream/Writer.imc"
    load_bytecode "library/Stream/Replay.imc"
    
    find_type $I0, "Stream::Writer"
    new stream, $I0
    $P0 = global "_reader"
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

.sub _reader method
    .local pmc stream1
    .local pmc stream2
    .local pmc stream3
    .local string str

    find_type $I0, "Stream::Replay"
    new stream1, $I0
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
