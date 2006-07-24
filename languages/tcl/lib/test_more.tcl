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

# XXX Need to handle the case where we expect an exception.
proc is {code expected args}  {
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

    } {
        puts "ok $very_bad_global_variable_test_num $description"
    }
}

proc ok {code args}  {
    is $code 1 $args
}

proc not_ok {code args} {
    set test_code "expr ! \[eval {$code}\]"
    ok $test_code $args
}


# NOTE: This doesn't work in tcl-current, because we can't parse:
# XXX : expr {"[eval {set a "aok"}]" ne "bork"}
proc isnt {code expected args}  {
    set code     "\"\[eval {$code}\]\""
    set expected "\"$expected\""

    cmp_ok $code ne $expected $args
}

proc cmp_ok {left op right args} {
  ok "expr {$left $op $right}" $args
}

proc diag {diagnostic} {
  puts "# $diagnostic"
}
