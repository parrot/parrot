$testnum = 1

def plan(num)
    print '1..',num,"\n"
end

def ok(cond)
    proclaim(cond, '')
end

def is(got,expected)
    proclaim(got == expected, '')
end

def proclaim(cond,desc)
    if cond then
        print "ok "
    else
        print "nok "
    end
    puts $testnum
    $testnum += 1
end
