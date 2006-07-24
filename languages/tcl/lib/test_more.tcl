#
# Analog to perl's Test::More
#
# At the moment, this is *much* weaker testing harness than the one that
# comes with tcl. However, it's very good for partcl in the short term.

# XXX put this in a namespace to avoid global pollution

# XXX TODO: todo, skip, skip_all

set very_bad_global_variable_test_num   0

proc plan {number} {
    if {$number eq "no_plan"} {
        puts 1..0
    } {
        puts 1..$number
    }
}

proc is {value expected args}  {
    global very_bad_global_variable_test_num
    incr   very_bad_global_variable_test_num

    if {$args eq ""} {
      set description "- $args"
    } {
      set description {}
    }

    if {$value eq $expected} {
        puts "ok $very_bad_global_variable_test_num $description"
        return 1
    } {
        puts "not ok $very_bad_global_variable_test_num $description"

        # XXX escape strings.
        puts "#      got : '$value'"
        puts "# expected : '$expected'"
        return 0
    }
}

# XXX Need to handle the case where we expect an exception.
proc eval_is {code expected args}  {
    global very_bad_global_variable_test_num
    incr   very_bad_global_variable_test_num

    if {$args eq ""} {
      set description "- $args"
    } {
      set description ""
    }

    set result [catch {set actual [eval $code]} error]

    if {$result || $actual ne $expected} {
        puts "not ok $very_bad_global_variable_test_num $description"

        # XXX escape strings.
        puts "#      got : '$error'"
        puts "# expected : '$expected'"
        return 0 
    } {
        puts "ok $very_bad_global_variable_test_num $description"
        return 1
    }
}

proc ok {code args}  {
    is $code 1 $args
}

proc not_ok {code args} {
    set test_code "expr ! \[eval {$code}\]"
    return [ok $test_code $args]
}


# NOTE: This doesn't work in tcl-current, because we can't parse:
# XXX : expr {"[eval {set a "aok"}]" ne "bork"}
proc isnt {code expected args}  {
    set code     "\"\[eval {$code}\]\""
    set expected "\"$expected\""

    return [cmp_ok $code ne $expected $args]
}

proc cmp_ok {left op right args} {
  return [ok "expr {$left $op $right}" $args]
}

proc diag {diagnostic} {
  puts "# $diagnostic"
}

# XXX hacks to help avoid translating the actual tcl tests, until we actuall
# support tcltest.

# A placeholder that simulates the real tcltest's test proc.
proc test {num description code output} {
  return [eval_is $code $output "$num $description"]
}

# A very big hack placeholder to avoid transform
namespace eval ::Tcltest { proc cleanupTests {args} {} }
