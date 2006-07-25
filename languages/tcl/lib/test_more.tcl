#
# Analog to perl's Test::More
#
# At the moment, this is *much* weaker testing harness than the one that
# comes with tcl. However, it's very good for partcl in the short term.

# XXX put this in a namespace to avoid global pollution

# XXX TODO: skip_all

set very_bad_global_variable_test_num   0

proc plan {number} {
    if {$number eq "no_plan"} {
        puts 1..0
    } {
        puts 1..$number
    }
}

# The special argument, if passed, should be a two element list, e.g.
# {TODO "message"}
proc is {value expected {description ""} {special {}}}  {
    global very_bad_global_variable_test_num
    incr   very_bad_global_variable_test_num

    if {[llength $special] == 2} {
        set description " # $special"
    } else {
        if  {$description ne ""} {
            set description " - $description"
        }
    } 

    if {$value eq $expected} {
        puts "ok $very_bad_global_variable_test_num$description"
        return 1
    } {
        puts "not ok $very_bad_global_variable_test_num$description"

        # XXX escape strings.
        puts "#      got : '$value'"
        puts "# expected : '$expected'"
        return 0
    }
}

# XXX Need to handle the case where we expect an exception.
proc eval_is {code expected {description ""} {special {}}}  {
    # The one case where skip actually means "don't do that"
    if {[llength $special] == 2} {
        set special_type [lindex $special 1]
        if {$special_type eq "SKIP"} {
            puts "ok $very_bad_global_variable_test_num $special"
            return 1
        }
    }
    # Ignore exceptions for the moment
    catch {eval $code} actual
    is $actual $expected $description $special
}

proc ok {value {description ""} {special {}}}  {
    is $value 1 $description $special
}

proc not_ok {value {description ""} {special {}}} {
    set value [expr !$value]
    ok $value $description $special
}


# NOTE: This doesn't work in tcl-current, because we can't parse:
# XXX : expr {"[eval {set a "aok"}]" ne "bork"}
proc isnt {code expected {description ""} {special {}}}  {
    set code     "\"\[eval {$code}\]\""
    set expected "\"$expected\""

    cmp_ok $code ne $expected $description $special
}

proc cmp_ok {left op right {description ""} {special {}}} {
    ok "expr {$left $op $right}" $description $special
}

proc diag {diagnostic} {
  puts "# $diagnostic"
}

# XXX hacks to help avoid translating the actual tcl tests, until we actuall
# support tcltest.

# A placeholder that simulates the real tcltest's exported test proc.
proc test {num description code output} {
    eval_is $code $output "$num: $description"
}

# A very big hack placeholder to avoid transform
namespace eval ::Tcltest { proc cleanupTests {args} {} }
